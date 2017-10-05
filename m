Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id C76E577BB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4fDE3xR4PZzs42FaMEUlmYCtHswMS7YuqdGibZpb/Hg=; 
	b=iHVY7pa++AbwSRqBmWCGcoXMoPgANMMGaRvV4FjW5wGMktqG3Lk0krwSMC6Vij3xS2qelgI9ZX44DvItoF2kvda77bE4jf8Jwfv5R1dW9Gnp+6jnzar5v9HcsWvscWYJmbpJ5jsfg51vuwVJ0zzgIP3lcromsIPI74f8v/B9wIlLpcMEKuEn+2S95R/C3HLU+sJaehKq1P4QL7yaYH1Y70BuQk3Spx4CoU4C6Vv6+ZO+zeTwg4DrvySsHeIHPEQfJw2t3+vJ3a0AGGhh7xYGH5MlVcUpRr8yz/aFo1Qo5H0EP1/ub0ulcG14NQjSYXMQk1/XW1s3yJFKQStpOX28ng==;
Received: from [192.168.13.210] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1e082E-0001sb-19; Thu, 05 Oct 2017 17:26:02 +0200
To: Trevor Woerner <twoerner@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
Date: Thu, 5 Oct 2017 17:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Thu, 05 Oct 2017 15:26:03 -0000
X-Groupsio-MsgNum: 69141
Content-Type: multipart/mixed; boundary="------------5FAEA9A1CF7D8DDBDF31F1F0"
Content-Language: en-US

--------------5FAEA9A1CF7D8DDBDF31F1F0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi everyone,

I have several potential patches for Rafael's layer after having tried
several builds for different hardware. I'm sending individual mails to
discuss each of them.

The first one is pretty straightforward. It is just a backport of an
existing upstream chromium patch to fix a compilation error on some GCC
versions. I've reproduced the error with gcc-linaro-5.3 and gcc-5.4.0
toolchains, and the patch fixes it. GCC 6 seems not to have any problem
with the original code but I still think it makes no harm to include the
patch.

Find the patch attached.

Best,
-- 
Jacobo

--------------5FAEA9A1CF7D8DDBDF31F1F0
Content-Type: text/x-patch;
 name="0001-chromium-Backport-patch-to-fix-gcc-build-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-chromium-Backport-patch-to-fix-gcc-build-error.patch"

From 88a4375bbc5e9bfb81a0573f1f2ec902b8ce23e2 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
Date: Wed, 4 Oct 2017 13:17:40 +0200
Subject: [PATCH] chromium: Backport patch to fix gcc build error

This is a compilation error that doesn't seem to manifest on gcc6 or
clang toolchains, but it affects gcc5 which is used, for example, by
R-Car gen 3 devices.

Patch: https://chromium-review.googlesource.com/645549
---
 recipes-browser/chromium/chromium_61.0.3163.100.bb |  1 +
 ...rename-ArrayBufferContents-AllocationKind.patch | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 recipes-browser/chromium/files/rename-ArrayBufferContents-AllocationKind.patch

diff --git a/recipes-browser/chromium/chromium_61.0.3163.100.bb b/recipes-browser/chromium/chromium_61.0.3163.100.bb
index 87f6fdb..4bf1b0d 100644
--- a/recipes-browser/chromium/chromium_61.0.3163.100.bb
+++ b/recipes-browser/chromium/chromium_61.0.3163.100.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
         file://0001-Make-base-numerics-build-with-GCC.patch \
         file://0001-Fix-compilation-for-ATK-accessibility.patch \
         file://0001-Replace-remaining-references-to-struct-ucontext-with.patch \
+        file://rename-ArrayBufferContents-AllocationKind.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'root-profile', 'file://root-user-profile.patch', '', d)} \
         "
 
diff --git a/recipes-browser/chromium/files/rename-ArrayBufferContents-AllocationKind.patch b/recipes-browser/chromium/files/rename-ArrayBufferContents-AllocationKind.patch
new file mode 100644
index 0000000..f47b54e
--- /dev/null
+++ b/recipes-browser/chromium/files/rename-ArrayBufferContents-AllocationKind.patch
@@ -0,0 +1,35 @@
+From ec0d7abe5c1520464ff0ea2405b2c59d51b0b775 Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <ptworek@opera.com>
+Date: Fri, 1 Sep 2017 12:20:03 +0000
+Subject: [PATCH] Rename ArrayBufferContents::AllocationKind to
+ GetAllocationKind.
+
+Current name clashes with the name of the enum class the function is
+supposed to return. Clang does not care, but gcc fails to compile the
+code.
+
+Bug: 760070
+Change-Id: I935d91493a3fc7b289d03f776c14b6ec4f3f622a
+Reviewed-on: https://chromium-review.googlesource.com/645549
+Reviewed-by: Yuta Kitamura <yutak@chromium.org>
+Commit-Queue: Yuta Kitamura <yutak@chromium.org>
+Cr-Commit-Position: refs/heads/master@{#499171}
+---
+ .../WebKit/Source/platform/wtf/typed_arrays/ArrayBufferContents.h     | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/third_party/WebKit/Source/platform/wtf/typed_arrays/ArrayBufferContents.h b/third_party/WebKit/Source/platform/wtf/typed_arrays/ArrayBufferContents.h
+index 94bb9161ec85..0671c471cbe0 100644
+--- a/third_party/WebKit/Source/platform/wtf/typed_arrays/ArrayBufferContents.h
++++ b/third_party/WebKit/Source/platform/wtf/typed_arrays/ArrayBufferContents.h
+@@ -122,7 +122,9 @@ class WTF_EXPORT ArrayBufferContents {
+     void* Data() const { return data_; }
+     size_t DataLength() const { return data_length_; }
+ 
+-    ArrayBufferContents::AllocationKind AllocationKind() const { return kind_; }
++    ArrayBufferContents::AllocationKind GetAllocationKind() const {
++      return kind_;
++    }
+ 
+     operator bool() const { return allocation_base_; }
+ 
-- 
2.11.0


--------------5FAEA9A1CF7D8DDBDF31F1F0--
