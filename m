Return-Path: <prvs=41305a0675=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id CB35171A90
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 16:34:59 +0000 (UTC)
X-AuditID: 0a000213-f79eb6d000002ccd-f0-582f2db36ed9
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	5C.80.11469.3BD2F285; Fri, 18 Nov 2016 10:34:59 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 18 Nov 2016 10:34:59 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH] chromium: Fix ILL_ILLOPN signal in sandbox
Thread-Index: AQHSQbmzUjYjlAyelEWTF94/o4GWUA==
Date: Fri, 18 Nov 2016 16:34:58 +0000
Message-ID: <1479486866-19082-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.157]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRiBPQ3ezrn6EwbKt1hYXDy9ldmD0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8aak+dZC/YJVpw4e4qpgXERfxcjJ4eEgInErec/WSFsMYkL
	99azdTFycQgJnGCUOPF9DjtIQkhgFqNE0zQpEJtNwEji3PVNjCC2iECsxLxNM5lAbGYBA4l3
	mzeCDRIW8JT41TmTHaImQKLvyTFmCFtPYu2JfqBeDg4WAVWJ84tlQMK8QOULji9lAbEZgW74
	fmoN1EhxiVtP5jNB3CYgsWTPeWYIW1Ti5eN/UDfLSfz8sIgRol5P4sbUKWwQtrbEsoWvmSHm
	C0qcnPmEZQKjyCwkY2chaZmFpGUWkpYFjCyrGAVzEzNzDPVSi4vL8ktS9ZLzczcxAkOei4FJ
	eAfjnCm2hxgFOBiVeHgTNPQihFgTy4orcw8xSnOwKInzvngkECEkkJ5YkpqdmlqQWhRfVJqT
	WnyIkYmD8xCjBAeXlEhxal5KalFiaUlGPCiy4ouBsSXVwLhg0t4iFq+5FvURu+OmGSiwuT5+
	2fGqx8Ol5d+832W3q1uDU0/kLe0Wq286tGvhIYML+696ndQ1DzrgeXT3rx3XvnHP83zoVbe9
	IXjJydR1UgbX523N3L1ZtaeMrX3pyzkpazPK+fZPaHqeo/B5S/e/3UXTEhIXzlOcwh1wLffi
	3eOZ6ckuCpuUWIozEg21mIuKEwHSqS2pdQIAAA==
Subject: [meta-browser][PATCH] chromium: Fix ILL_ILLOPN signal in sandbox
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
X-List-Received-Date: Fri, 18 Nov 2016 16:35:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fix Aw Snap! error when running chromium 52 in Morty with sandbox enabled.

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

