Return-Path: <prvs=4277b21ae4=michael.davis@essvote.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Apr 2017 19:29:16 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 8D011601D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 19:29:16 +0000 (UTC)
X-AuditID: 0a000213-b95ff70000000cd7-ae-58f11f83b007
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	BD.FC.03287.38F11F85; Fri, 14 Apr 2017 14:14:14 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 14 Apr 2017 14:14:11 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH] chromium: Remove duplicate patch
Thread-Index: AQHStVNMusM97E7UNEuVfY1BYm3khQ==
Date: Fri, 14 Apr 2017 19:14:10 +0000
Message-ID: <20170414191406.25345-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.66]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsWyRiBPQ7dN/mOEwd3LBhYXDy9ldmD0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd0bLovCCTqGK9+cfszUwPuPvYuTkkBAwkTjXsY2li5GLQ0jg
	BKNEz4lrUM4sRonbN+Yxg1SxCRhJnLu+iRHEFhGIlZi3aSYTiM0sYCDxbvNGVhBbWMBe4tzS
	FcwQNS4Sx+5dhqrXk/gy/xkLiM0ioCpx7uNlsBpeATuJh19XsoHYjAJiEt9PrYGaKS5x68l8
	JojrBCSW7DnPDGGLSrx8/I8VwpaTWPfuJFS9nsSNqVPYIGxtiWULX0PNF5Q4OfMJywRG4VlI
	xs5C0jILScssJC0LGFlWMQrmJmbmGOqlFheX5Zek6iXn525iBAY3FwOT8A7GOVNsDzEKcDAq
	8fBeOP4hQog1say4MvcQozQHi5I471mO4AghgfTEktTs1NSC1KL4otKc1OJDjEwcnIcYJTi4
	pESKU/NSUosSS0sy4kExFF8MjCKpBsaUh1+nJnJ3bmbzduHzbHDjeHbAWlXHNYt7o1hy/9bH
	wht0l0tznGw7KKs4mVHYXDVh4gFnpUCXSxMnZMdNPj5nzv/p/Smxz2fZtC48q2UpeEOUT+jh
	jS0V50oqVN9qNjEePv/m+oTTs2K9u75qZkfXqt7i3Sy/fKL1+7fzV/F2OqWsPCe8crESS3FG
	oqEWc1FxIgDgg5l/agIAAA==
Subject: [meta-browser][PATCH] chromium: Remove duplicate patch
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
X-List-Received-Date: Fri, 14 Apr 2017 19:29:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

unset-madv-free.patch and Do-not-depend-on-Linux-4.5.patch apply the
same fix.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 .../chromium/chromium/chromium/unset-madv-free.patch      | 15 -----------=
----
 recipes-browser/chromium/chromium_54.0.2810.2.bb          |  1 -
 2 files changed, 16 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/chromium/unset-madv-f=
ree.patch

diff --git a/recipes-browser/chromium/chromium/chromium/unset-madv-free.pat=
ch b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
deleted file mode 100644
index 15d4982..0000000
--- a/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -Naur chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/P=
ageAllocator.cpp chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/alloc=
ator/PageAllocator.cpp
---- chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/PageAllo=
cator.cpp	2016-07-15 17:02:49.000000000 -0500
-+++ chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/allocator/PageAll=
ocator.cpp	2016-11-18 09:13:01.109731385 -0600
-@@ -41,6 +41,11 @@
- #include <errno.h>
- #include <sys/mman.h>
-=20
-+#if OS(LINUX) && defined(MADV_FREE)
-+// Added in Linux 4.5, but it breaks the sandbox.
-+#undef MADV_FREE
-+#endif
-+
- #ifndef MADV_FREE
- #define MADV_FREE MADV_DONTNEED
- #endif
diff --git a/recipes-browser/chromium/chromium_54.0.2810.2.bb b/recipes-bro=
wser/chromium/chromium_54.0.2810.2.bb
index 2af662c..94ce59b 100644
--- a/recipes-browser/chromium/chromium_54.0.2810.2.bb
+++ b/recipes-browser/chromium/chromium_54.0.2810.2.bb
@@ -11,7 +11,6 @@ SRC_URI +=3D "\
         file://0005-Override-root-filesystem-access-restriction.patch \
         file://chromium/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium/remove-Werror.patch \
-        file://chromium/unset-madv-free.patch \
         file://chromium/Do-not-depend-on-Linux-4.5.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://c=
omponent-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file=
://chromium/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '=
', d)} \
--=20
2.9.3

