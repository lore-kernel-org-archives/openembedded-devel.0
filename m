Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 811C271CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 01:10:49 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id k189so17817244pgk.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WtCZ6cpDq/1gSHIbasN3uMzdOamWMuPp6k5D7dKjM6c=;
	b=PtFG6w7JjxSL7CczXrmtOJmH5+OR7RcXxIfK4uxfvVVwh6yynMLnZZhGQTim9+5oUL
	fKDmJtIOOHwFHPoIDoq0O99EDCTGoTVPc2R2yTWGd9bnA6MKkIdKFW9jBkOTTEHIsRpS
	qcz5SYHQWU/Q0HA81vDh9THBTTrDHOaKuZ6n4fkcFmDjPNh0SpZRVI3iomihHxCBPAJ5
	YFnJxnxlW6tUyRU4WUj9T493Q/kxox4+8jthiblKDLXFRtndKplr+FKugf7uVl9qHQOy
	bhrXjKSkfMevv9w2jxckLQOwF+zFvTMrbRTMICJ7iYqjRwQ66ymQyroBNISBua1fI8/K
	nXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WtCZ6cpDq/1gSHIbasN3uMzdOamWMuPp6k5D7dKjM6c=;
	b=XL2nB9xcSLlBqeWE8yGqhNeAZztM2AQ4G8EagZKqWaf7tFwM4qtGzSkrFDCSK+qi+9
	+rtasztg7kOAvLdfh2RE7i0izYvUXFxQC3d4oHjQVcYfa9ANgSKQetUFzMj03txJXjEE
	X/WnIuTpvpgh+BUucy3v64HqdV8EKTbvxjh/lNvn+sPNm7QhiZIGKFK2OIkY68O6tizw
	GJ2tPQ7cwt68oce2gLL7ByBMMLufbVNeipGxDysT+s05/C950cmwjJyWed3D8csAPfY6
	deSFrkFRemu2FYUXlkHvxf9PDWS7LDmspZkE1EWvMOPbo6eV6kNCf2bWIEW1gWQWBVhk
	5Frw==
X-Gm-Message-State: APjAAAVX01UxiGa8QV3+y7PTxBheya7ED8eDe0k1IXENC5poFYeQiWvq
	xN9HEQkgpTazYQ6YUzKonPXJi9u/gvk=
X-Google-Smtp-Source: APXvYqz+gydO9K/OfXQOwg2XZ5qDNtph3ZbnvWS4zz9qMLeM0Z8xp04L9LBDQm4XRnfit5ndcFau5w==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
	t20mr7169503pjr.116.1564794650143; 
	Fri, 02 Aug 2019 18:10:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	22sm86976937pfu.179.2019.08.02.18.10.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 18:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 18:10:37 -0700
Message-Id: <20190803011037.41864-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190803011037.41864-1-raj.khem@gmail.com>
References: <20190803011037.41864-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 2/2] klcc-cross: Recognise --unwindlib clang option
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
X-List-Received-Date: Sat, 03 Aug 2019 01:10:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../klibc/files/klcc-cross-accept-clang-options.patch | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
index 07703aa536..3b7031e981 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
@@ -3,16 +3,17 @@ meta-clang passes this option to compiler defaults
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/klcc/klcc.in
-===================================================================
---- git.orig/klcc/klcc.in
-+++ git/klcc/klcc.in
-@@ -207,6 +207,9 @@ while ( defined($a = shift(@ARGV)) ) {
+--- a/klcc/klcc.in
++++ b/klcc/klcc.in
+@@ -207,6 +207,12 @@ while ( defined($a = shift(@ARGV)) ) {
      } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
  	# Override gcc encoded sysroot
  	push(@ccopt, $a);
 +    } elsif ( $a eq '-no-integrated-as' ) {
 +	# Allow clang options
++	push(@ccopt, $a);
++    } elsif ( $a =~ '--unwindlib=.*' ) {
++	# Allow clang options
 +	push(@ccopt, $a);
      } else {
  	die "$0: unknown option: $a\n";
-- 
2.22.0


