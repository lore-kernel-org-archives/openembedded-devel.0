Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OQofc-0006Uc-0b
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 23:36:49 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OQobA-0001EC-Ll from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 14:32:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 21 Jun 2010 14:32:08 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Jun 2010 15:32:07 -0600
Message-ID: <4C1FDA55.6050705@mentor.com>
Date: Mon, 21 Jun 2010 14:32:05 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 21 Jun 2010 21:32:07.0695 (UTC)
	FILETIME=[332CB1F0:01CB1189]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Don't pipe ar/tar/gzip in stage-manager-ipkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jun 2010 21:36:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

As we've gone over before, gunzip/tar can have a broken pipe, and this 
is allowed.  In python code, we have things setup to ignore the problem. 
  stage-manager-ipkg is written in shell however and we can hit the 
problem there too.  There's two ways around this, one of which is to 
stop checking for problems with the extraction (and hide stderr) or we 
extract the archive, gunzip and then tar.  I've done the latter for this 
RFC.  Does anyone have a strong preference for the other way?

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/recipes/stage-manager/files/stage-manager-ipkg 
b/recipes/stage-manager/files/stage-manager-ipkg
index 2559fdb..e5ad6f6 100755
--- a/recipes/stage-manager/files/stage-manager-ipkg
+++ b/recipes/stage-manager/files/stage-manager-ipkg
@@ -732,11 +732,11 @@ ipkg_install_file_dest() {

  	local pkg=`ipkg_file_part $filename | sed 's/\([a-z0-9.+-]\+\)_.*/\1/'`
  	local ext=`echo $filename | sed 's/.*\.//'`
-	local pkg_extract_stdout
+	local pkg_extract
  	#if [ "$ext" = "ipk" ]; then
  	#	pkg_extract_stdout="tar -xzOf"
  	#elif [ "$ext" = "deb" ]; then
-		pkg_extract_stdout="ar p"
+		pkg_extract="ar x"
  	#else
  	#	echo "ipkg_install_file: ERROR: File $filename has unknown 
extension $ext (not .ipk or .deb)"
  	#	return 1
@@ -768,7 +768,7 @@ ipkg_install_file_dest() {
  	mkdir -p $IPKG_TMP/$pkg/data
  	mkdir -p $info_dir

-	if ! $pkg_extract_stdout $filename control.tar.gz | (cd 
$IPKG_TMP/$pkg/control; tar -xzf - ) ; then
+	if ! (cd $IPKG_TMP/$pkg/control ; $pkg_extract $filename 
control.tar.gz ; gunzip control.tar.gz ; tar xf control.tar ) ; then
  		echo "ipkg_install_file: ERROR unpacking control.tar.gz from $filename"
  		return 1
  	fi
@@ -798,10 +798,11 @@ Status: install ok pending" | 
ipkg_status_update_sd $sd $pkg
  	set -o noglob
  	rm -r $IPKG_TMP/$pkg/control

-	if ! $pkg_extract_stdout $filename ./data.tar.gz | (cd 
$IPKG_TMP/$pkg/data; tar -xzf - ) ; then
+	if ! (cd $IPKG_TMP/$pkg/data ; $pkg_extract $filename ./data.tar.gz ; 
gunzip data.tar.gz ; tar xf data.tar ) ; then
  		echo "ipkg_install_file: ERROR unpacking data.tar.gz from $filename"
  		return 1
  	fi
+	rm $IPKG_TMP/$pkg/data/data.tar
  	echo "Done."

  	echo -n "Configuring $pkg..."
@@ -869,7 +870,10 @@ diff -u $dest/$conffile $IPKG_TMP/$pkg/data/$conffile"
  	(cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; cd $dest; tar xf -))	
  	rm -rf $IPKG_TMP/$pkg/data
  	rmdir $IPKG_TMP/$pkg
-	$pkg_extract_stdout $filename ./data.tar.gz | tar tzf - | sed -e 
's/^\.//' > $info_dir/$pkg.list
+	$pkg_extract $filename ./data.tar.gz
+	gunzip data.tar
+	tar tf data.tar | sed -e 's/^\.//' > $info_dir/$pkg.list
+	rm data.tar

  	if [ -x "$info_dir/$pkg.postinst" ]; then
  		$info_dir/$pkg.postinst configure
diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb 
b/recipes/stage-manager/stagemanager-native_0.0.1.bb
index 733cc83..9eeac4b 100644
--- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
+++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
@@ -1,5 +1,5 @@
  DESCRIPTION = "Helper script for packaged-staging.bbclass"
-PR = "r12"
+PR = "r13"

  SRC_URI = "file://stage-manager \
             file://stage-manager-ipkg \

-- 
Tom Rini
Mentor Graphics Corporation


