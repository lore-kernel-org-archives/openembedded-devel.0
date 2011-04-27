Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QF8D2-00033a-5D for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 19:07:28 +0200
Received: from smtp05.msg.oleane.net (smtp05.mail.priv [172.17.20.114]) 
	by smtp-out06.msg.oleane.net with ESMTP id p3RFGwin014099
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 17:16:59 +0200
Received: from [192.168.1.148] (AMarseille-551-1-48-89.w80-9.abo.wanadoo.fr
	[80.9.223.89]) (authenticated)
	by smtp05.msg.oleane.net (MTA) with ESMTP id p3REu9Vt020628
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 16:56:20 +0200
X-Oleane-Rep: REPA
Message-ID: <4DB82E7C.9080206@cioinfoindus.fr>
Date: Wed, 27 Apr 2011 16:55:56 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.4.27.144517 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: [PATCH 1/2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Wed, 27 Apr 2011 17:07:28 -0000
X-Groupsio-MsgNum: 31497
Content-Type: multipart/mixed; boundary="------------030606080106040406090306"

--------------030606080106040406090306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi all,

this new recipe will build the painting soft mypaint.

In order to correctly run on the target, it is necessary to add new
recipes dependencies in python-numpy recipe.

Here are the two patches.

Hoping it will be valuable.




 From 0cc6d007fecb3ad7f5d09a9d4897d506a5c41d39 Mon Sep 17 00:00:00 2001
From: C. Charreyre<christian.charreyre@cioinfoindus.fr>
Date: Thu, 21 Apr 2011 16:40:54 +0200
Subject: [PATCH] mypaint: new recipe for version 0.9.1

Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
---
   recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
   recipes/mypaint/mypaint_0.9.1.bb        |   36
+++++++++++++++++++++++++++++++
   2 files changed, 56 insertions(+), 0 deletions(-)
   create mode 100644 recipes/mypaint/files/scons-adapt.patch
   create mode 100644 recipes/mypaint/mypaint_0.9.1.bb

diff --git a/recipes/mypaint/files/scons-adapt.patch
b/recipes/mypaint/files/scons-adapt.patch
new file mode 100644
index 0000000..dcad6db
--- /dev/null
+++ b/recipes/mypaint/files/scons-adapt.patch
@@ -0,0 +1,20 @@
+Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
+
+Adapt scons to OE
+Index: mypaint-0.9.1/lib/SConscript
+===================================================================
+--- mypaint-0.9.1.orig/lib/SConscript    2011-04-21 11:31:29.000000000
+0200
++++ mypaint-0.9.1/lib/SConscript    2011-04-21 11:35:30.000000000 +0200
+@@ -1,5 +1,11 @@
+ Import('env')
+-import sys
++import sys, os
++env.Replace(SHCXX = os.environ['CXX'])
++env.Replace(SHLINK = os.environ['CXX'])
++env.Replace(LDMODULEFLAGS = os.environ['TARGET_LDFLAGS'])
++env.Append(LDMODULEFLAGS = ['-Wl,--hash-style=gnu'])
++env.Append(LDMODULEFLAGS = ['-shared'])
++env.Replace(PATH = os.environ['PATH'])
+
+ # For the record: I know that scons supports swig. But it doesn't scan
for #include in the generated code.
+ #
diff --git a/recipes/mypaint/mypaint_0.9.1.bb
b/recipes/mypaint/mypaint_0.9.1.bb
new file mode 100644
index 0000000..a7e5077
--- /dev/null
+++ b/recipes/mypaint/mypaint_0.9.1.bb
@@ -0,0 +1,36 @@
+DESCRIPTION="fast and easy open-source graphics application for digital
painters"
+LICENSE="GPL"
+SECTION = "x11/applications"
+PRIORITY = "optional"
+HOMEPAGE = "http://mypaint.intilinux.com/"
+
+RDEPENDS_${PN} = "python-numpy python-image python-json"
+
+SRC_URI = "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
+    file://scons-adapt.patch \
+"
+
+inherit distutils scons
+
+do_compile() {
+    STAGING_INCDIR=${STAGING_INCDIR} \
+    STAGING_LIBDIR=${STAGING_LIBDIR} \
+    BUILD_SYS=${BUILD_SYS} \
+    HOST_SYS=${HOST_SYS} \
+    PATH=${PATH} scons_do_compile
+}
+
+do_install() {
+    BUILD_SYS=${BUILD_SYS} \
+    HOST_SYS=${HOST_SYS} \
+    scons_do_install
+}
+
+FILES_${PN} += "${datadir}"
+
+SRC_URI[md5sum] = "6249a16359a438d6dc658f5765b35515"
+SRC_URI[sha256sum] =
"407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7f73b9f0940aa7aed"
+
+INSANE_SKIP_${PN} = True
+
+
-- 
1.7.0.2





--------------030606080106040406090306
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"

begin:vcard
fn:Christian  Charreyre
n:Charreyre;Christian 
org:CIO Informatique Industrielle
adr;dom:;;11 Avenue Marigny;Marseille;;13014
email;internet:christian.charreyre@cioinfoindus.fr
tel;work:04 95 05 19 41
url:http://www.cioinfoindus.fr
version:2.1
end:vcard


--------------030606080106040406090306--
