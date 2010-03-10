Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpM4Y-0007nw-AE
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 14:35:43 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5efeQnpEPWrCZqJ0FZ68xK7Cc7WLknG@postini.com;
	Wed, 10 Mar 2010 05:32:43 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip09.e2k.ad.ge.com with ESMTP; 10 Mar 2010 05:28:22 -0500
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 05:28:22 -0500
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Mar 2010 10:31:34 +0000
Message-ID: <20100310103133.14548.62608.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.184
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Allow spectrum fw to build behind a proxy
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
X-List-Received-Date: Wed, 10 Mar 2010 13:35:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Spectrum-fw runs a script which uses curl, wget or ftp to pull an archive
rather than the archive being a part of the SRC_URI. Whilst it would
probably be preferable to pull this as part of the SRC_URI (incidentally,
if it was, the script wouldn't need to be modified), the "&" in the archive
name has foiled my attempts at doing that.

This patch modifies the script to at least use the "FETCHCMD_wget" variable
which can be provided to help when accessing through a proxy.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/orinoco/spectrum-fw.bb            |    1 +
 recipes/orinoco/spectrum-fw/get_symbol_fw |    9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes/orinoco/spectrum-fw.bb b/recipes/orinoco/spectrum-fw.bb
index cedb0e3..0128115 100644
--- a/recipes/orinoco/spectrum-fw.bb
+++ b/recipes/orinoco/spectrum-fw.bb
@@ -8,6 +8,7 @@ SRC_URI = "file://get_symbol_fw \
 S = "${WORKDIR}"
 
 do_configure() {
+	export FETCHCMD_wget="${FETCHCMD_wget}";
 	./get_symbol_fw
 }
 
diff --git a/recipes/orinoco/spectrum-fw/get_symbol_fw b/recipes/orinoco/spectrum-fw/get_symbol_fw
index e7b0bf2..b15a60c 100755
--- a/recipes/orinoco/spectrum-fw/get_symbol_fw
+++ b/recipes/orinoco/spectrum-fw/get_symbol_fw
@@ -23,8 +23,13 @@ DRIVER1=symbol1.drv
 DRIVER2=symbol2.drv
 
 get_file() {
+    if [ "${FETCHCMD_wget}" == "" ]
+    then
+        FETCHCMD_wget="wget --passive-ftp"
+    fi
+
     curl --remote-name "$1" || \
-    wget --passive-ftp "$1" || \
+    ${FETCHCMD_wget} "$1" || \
     wget "$1" || \
     ftp "$1" </dev/null || \
     exit 1
@@ -40,4 +45,4 @@ unzip -p $DRIVER1 "$DL_INT2" >$DRIVER2
 perl parse_symbol_fw $DRIVER2 spectrum_fw.h symbol_sp24t_prim_fw \
     symbol_sp24t_sec_fw
 			    
-rm -f $DRIVER1 $DRIVER2
\ No newline at end of file
+rm -f $DRIVER1 $DRIVER2


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


