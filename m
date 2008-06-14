Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1K7e2V-00030g-2B
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 00:16:03 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Sat, 14 Jun 2008 23:15:38 +0100
	id 00088045.4854430A.000059E5
Date: Sat, 14 Jun 2008 23:18:57 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@openembedded.org
Message-ID: <20080614221857.GB3428@cimmeria.hyboria>
Mime-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Packaged Staging Problems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 14 Jun 2008 22:16:03 -0000
X-Groupsio-MsgNum: 5373
Content-Type: multipart/mixed;
	boundary="=_xora.vm.bytemark.co.uk-23013-1213481738-0001-2"
Content-Disposition: inline

--=_xora.vm.bytemark.co.uk-23013-1213481738-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I get the problem in packaged staging that it repeatedly issues the
error.

NOTE: Checking if staging package installed
head: `-1' option is obsolete; use `-n 1'
Try `head --help' for more information.
sed: couldn't flush stdout: Broken pipe
NOTE: No. Manually removing any installed files

I suspect the attached patch is the fix for this. But this is scary core
stuff so I thought I would send it for review.

Graeme


--=_xora.vm.bytemark.co.uk-23013-1213481738-0001-2
Content-Type: text/x-diff; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="stage-manager.patch"

#
# old_revision [6ff295c2536e27dfcb4ab565a0592a3dc502d6aa]
#
# patch "packages/stage-manager/files/stage-manager-ipkg"
#  from [7593166519513f8e516b14d394e2d3576854f946]
#    to [039533c80c39c7ad92cf0d47b2a4df052ab060fa]
#
============================================================
--- packages/stage-manager/files/stage-manager-ipkg	7593166519513f8e516b14d394e2d3576854f946
+++ packages/stage-manager/files/stage-manager-ipkg	039533c80c39c7ad92cf0d47b2a4df052ab060fa
@@ -33,7 +33,7 @@ ipkg_src_byname() {
 
 ipkg_src_byname() {
 	local src="$1"
-	ipkg_srcs $src | head -1
+	ipkg_srcs $src | head -n1
 }
 
 ipkg_dests() {
@@ -58,16 +58,16 @@ ipkg_dest_default() {
 }
 
 ipkg_dest_default() {
-	ipkg_dests_all | head -1
+	ipkg_dests_all | head -n1
 }
 
 ipkg_dest_default_name() {
-	ipkg_dest_names | head -1
+	ipkg_dest_names | head -n1
 }
 
 ipkg_dest_byname() {
 	local dest="$1"
-	ipkg_dests $dest | head -1
+	ipkg_dests $dest | head -n1
 }
 
 ipkg_option() {
@@ -975,7 +975,7 @@ ipkg_upgrade_pkg() {
 
 ipkg_upgrade_pkg() {
 	local pkg="$1"
-	local avail_ver=`ipkg_info $pkg Version | ipkg_extract_value | head -1`
+	local avail_ver=`ipkg_info $pkg Version | ipkg_extract_value | head -n1`
 
 	is_installed=
 	for dest_name in `ipkg_dest_names`; do

--=_xora.vm.bytemark.co.uk-23013-1213481738-0001-2--
