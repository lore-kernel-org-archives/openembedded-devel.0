Return-Path: <prvs=0130001338=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 77DA071AA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 19:38:51 +0000 (UTC)
X-AuditID: 0a00029b-f796c6d000002cd7-8d-582f58c6af2b
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	9B.57.11479.6C85F285; Fri, 18 Nov 2016 13:38:46 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 18 Nov 2016 13:38:46 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCHv2] chromium: Fix ILL_ILLOPN signal in
	sandbox
Thread-Index: AQHSQdNgKZ/MHOKOzk+edPOGukPIlw==
Date: Fri, 18 Nov 2016 19:38:45 +0000
Message-ID: <1479497893-21851-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.157]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWyRiBPQ/dYhH6Ewd+j+hYXDy9ldmD0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8aOlSuYCqYKV2zqn83awPhKoIuRk0NCwETidPM9FghbTOLC
	vfVsXYxcHEICRxklfr2azgzhzGKUeD7zKxtIFZuAkcS565sYQWwRgViJeZtmMoHYzAIGEu82
	b2QFsYUFvCX2nJ7BAlETJPH+2CMoW09ixc1/YDaLgKrEyXMPmUFsXgFPiTdvloH1MgJd8f3U
	GqiZ4hK3nsxngrhOQGLJnvPMELaoxMvH/1ghbDmJnx8WMULU60ncmDqFDcLWlli28DXUfEGJ
	kzOfsExgFJmFZOwsJC2zkLTMQtKygJFlFSNfrpFeanFxWX5Jql5yfu4mRmDAczEwzd7BuGeC
	wyFGAQ5GJR7eBA29CCHWxLLiytxDjNIcLErivC8eCUQICaQnlqRmp6YWpBbFF5XmpBYfYmTi
	4DzEKMHBJSVSnJqXklqUWFqSEQ+Kq/hiYGRJNTCmXIw637Prx2KbiCSvu42fp09+vyXqqxIH
	t6zj7fMzxY4ZHXxftf5Up2ZLcfHKfIFnX7WnNrfIHtVYsWHl9yWbijy122XKHZsr+/8c2mby
	nf3fEtaESR1cHzVS2TT4nNc63pAo3ask4ufTJyfuqlwre/OfrVBg4q3SRTG8JkVTNu9cvcmV
	SUCJpTgj0VCLuag4EQB2kGBEdAIAAA==
Subject: [meta-browser][PATCHv2] chromium: Fix ILL_ILLOPN signal in sandbox
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
X-List-Received-Date: Fri, 18 Nov 2016 19:38:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fix Aw Snap! error when running chromium 52 in Morty with sandbox enabled.

Based on upstream qtwebengine-chromium commit b12ffcd411d4776f7120ccecb3be3=
4344d930d2b
http://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?h=3D49-based&id=
=3Db12ffcd411d4776f7120ccecb3be34344d930d2b

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 .../chromium/chromium/chromium/unset-madv-free.patch      | 15 +++++++++++=
++++
 recipes-browser/chromium/chromium_52.0.2743.76.bb         |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium/unset-madv-f=
ree.patch

diff --git a/recipes-browser/chromium/chromium/chromium/unset-madv-free.pat=
ch b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
new file mode 100644
index 0000000..15d4982
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
@@ -0,0 +1,15 @@
+diff -Naur chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/P=
ageAllocator.cpp chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/alloc=
ator/PageAllocator.cpp
+--- chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/PageAllo=
cator.cpp	2016-07-15 17:02:49.000000000 -0500
++++ chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/allocator/PageAll=
ocator.cpp	2016-11-18 09:13:01.109731385 -0600
+@@ -41,6 +41,11 @@
+ #include <errno.h>
+ #include <sys/mman.h>
+=20
++#if OS(LINUX) && defined(MADV_FREE)
++// Added in Linux 4.5, but it breaks the sandbox.
++#undef MADV_FREE
++#endif
++
+ #ifndef MADV_FREE
+ #define MADV_FREE MADV_DONTNEED
+ #endif
diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-br=
owser/chromium/chromium_52.0.2743.76.bb
index 14b519c..5be3c32 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -9,6 +9,7 @@ SRC_URI +=3D "\
         file://0005-Override-root-filesystem-access-restriction.patch \
         file://chromium/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium/remove-Werror.patch \
+        file://chromium/unset-madv-free.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://c=
omponent-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file=
://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
 "
--=20
2.5.5

