Return-Path: <prvs=59745e9ebf=michael.davis@essvote.com>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jun 2016 14:56:47 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 85A9F601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:56:47 +0000 (UTC)
X-AuditID: 0a000213-f79116d0000013a5-41-5761692a29c7
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	21.34.05029.A2961675; Wed, 15 Jun 2016 09:41:46 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0235.001;
	Wed, 15 Jun 2016 09:41:46 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH] chromium: Fix build issue with i686
Thread-Index: AQHRxxQKz0WBlFnSzUOfKCVQz0j+Wg==
Date: Wed, 15 Jun 2016 14:41:45 +0000
Message-ID: <1466001648-12545-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWyRiBPQ1crMzHc4MN8fYt5qyYyW1z4fofd
	4uLhpcwW3StWsDqweMxY8oLR49zGFYweDf09jAHMUdw2SYklZcGZ6Xn6dgncGT+Xn2UteCha
	sWnJbOYGxpVCXYycHBICJhK3+u4xQthiEhfurWfrYuTiEBI4wSjxcc0WsISQwCxGiRNbnEBs
	NgEjiXPXN4HFRQRiJeZtmskE0sAssJVR4n1HHwtIQljASWLt07VsEEXuEjsXzWCHsPUkJjQf
	ZgKxWQRUJc4dewlm8wp4Ssx5vR1sKCPQFd9PrQGLMwuIS9x6Mp8J4joBiSV7zjND2KISLx//
	Y+1i5ACy5ST+b/GAKNeTuDF1ChuErS2xbOFrZojxghInZz5hmcAoMgvJ1FlIWmYhaZmFpGUB
	I8sqRsHcxMwcQ73U4uKy/JJUveT83E2MwDjhYmAS3sE4Z4rtIUYBDkYlHt6AgoRwIdbEsuLK
	3EOM0hwsSuK8KkJK4UIC6YklqdmpqQWpRfFFpTmpxYcYmTg4DzFKcHBJiRSn5qWkFiWWlmTE
	g2IrvhgYXVINjOwfeg0WbjhneeL/58Y8t2sZD28FNL12n39O0ZjFsu1zGZPAhjstdwX8GZPF
	BFN/ef/5bChiu/Z0idBSD+GaACPZwpYjfB9vnJsX/r9IaZLOrlez4uu1/722Zck726X01/vd
	7ImvX0sc1D3WGOd9/82/csGLwW9u8usbS7AFrs8u29V1MGHJCyWW4oxEQy3mouJEAHpvHLGP
	AgAA
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"eric@eukrea.com" <eric@eukrea.com>
Subject: [meta-browser][PATCH] chromium: Fix build issue with i686
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 14:56:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Previously a build of i686 would fail looking for include.gypi.
With this new directory it can be found by both i686 and i586 targetted
builds.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 recipes-browser/chromium/chromium/i586/include.gypi     |  5 -----
 recipes-browser/chromium/chromium/i586/oe-defaults.gypi | 15 -------------=
--
 recipes-browser/chromium/chromium/x86/include.gypi      |  5 +++++
 recipes-browser/chromium/chromium/x86/oe-defaults.gypi  | 15 +++++++++++++=
++
 4 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/i586/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium/i586/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium/x86/include.gypi
 create mode 100644 recipes-browser/chromium/chromium/x86/oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium/i586/include.gypi b/recipes-=
browser/chromium/chromium/i586/include.gypi
deleted file mode 100644
index 69f3a08..0000000
--- a/recipes-browser/chromium/chromium/i586/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'ia32',
-  }
-}
diff --git a/recipes-browser/chromium/chromium/i586/oe-defaults.gypi b/reci=
pes-browser/chromium/chromium/i586/oe-defaults.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium/x86/include.gypi b/recipes-b=
rowser/chromium/chromium/x86/include.gypi
new file mode 100644
index 0000000..69f3a08
--- /dev/null
+++ b/recipes-browser/chromium/chromium/x86/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'ia32',
+  }
+}
diff --git a/recipes-browser/chromium/chromium/x86/oe-defaults.gypi b/recip=
es-browser/chromium/chromium/x86/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium/x86/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 0,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 1,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0,
+  },=20
+}
--=20
2.5.5

