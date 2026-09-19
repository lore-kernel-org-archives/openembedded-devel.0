Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8833C982E6
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:03 +0000 (UTC)
Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20627.1789856459003909472
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NVDYDDVO;
 spf=pass (domain: gmail.com, ip: 74.125.227.142, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso17984155ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856458; x=1790461258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JF5WAbMgWBtBC/moZq2+AELBiUAzVmX5/7VBIj43jWM=;
        b=NVDYDDVOCEGlPGRpelH2UWWIhY0O1aulbWd37GUK1NeU5JNn66Cn3M12KPKmwVfHE1
         LYlI9FSuQT9RyMaUUaBFTNKaQk09ToMpT1kMjlHCTE13QVqErLdNhFxISZlZetHSt0HP
         lfY9WuLKCC1OzT1BmfsmAz+SYsMqNTzemEsO/UcRimqJeR2R1OKS3ndbkKweEpo0PEVm
         CFXELeUkHHLxgtjQ0bgBcwEP40JP8HGi6+EtGTaKbD51nt0o7V+j6FwezGBYDZ9E3t0f
         GqnXH9M7A/QbV2CBum4zT2KHNZ0vhUXZHUQDJMFObQSobAgoF4lea5e6h7m0HipunEK4
         UNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856458; x=1790461258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JF5WAbMgWBtBC/moZq2+AELBiUAzVmX5/7VBIj43jWM=;
        b=LU5LfYswKwzzy2YCfMTP1ptbVhHY8ZtZHXDnsLWRZTPC5czG08eFEhya8NcjcwtP5X
         tSGVFaW0jhZP5qIKUtVRtBh+1RrJqvhWXY9BCpmVblwAOyOKsDAWWUXX8aHFdv0daPEF
         8r67yRvVALrsIRvbXHG8S07ZKA0e4wlJLy9G+gOCrYhcULMXURhuTaVtdwKayMLKzFmh
         UqHhhMRIeBbQHVrJQv61U/ut23hOj2KZHDeIxAmrDXmIR8+nYvpz0ev+rOE7USfl22o4
         oi89HcdscXY0oR6AVWZmEhapEJczhNFIvB9y+Ekfvt19eBAs2Bwxz03gt5XjOrmH93PT
         c5OQ==
X-Gm-Message-State: AFuF++m5gTToB5lWyXOfGFIEwUYrl0/Qvefz3LtfDvev1ZoyrLfZOxrk
	C6zKtjVy8AZ7ZR5hVzRDsyygal6ahgM5gqvcxwBfL8mL7DItST34+tqkaeRn7w==
X-Gm-Gg: AYBFou0ME5uttyo6Utlu8p8X1McNz/xsWc6zJ7s1vhCJunjO8npAi/vMinSDSc7dy1Y
	0C/iA6zibwHAEiJB79gNeNb4Qkzyb+DNx2VeNArlLrO4C5Gh4hcv8k4KYe/P9EBDvrAq9VSi21z
	7YA4mpnI9cGCgdEOt+ZwYJ0H5JBeHBY6tqmfigcu4mWTxrPebsRapQdVvqNGqNWSgX9pe52Kzy6
	VF+J9lkIXHfrbuNDtuh39d8Uc4Q/z+geI4qcjqJdeR3aSEtkUluxU+aitPTJS2PkPObo8hWUlO3
	0PATwjQVbGdEjmK8w37jcnCrrs/KSWpJHiBiCfcrjCUxHtNxTW38x2EMJMNI8HCaX94aQJ4flY2
	tZ2Gbw0FmauO+zTEUnwSqFFJBHzziFtUZfbSwZh2u4Oi5V02KkHr0+7R31B+KHo3CsVawmvjf8J
	gHYRV2donoKSBnzvMF0jrnsgzOtaTUb+fahmaZRMKn7rewdZO/P7gMblizAql/psi1UOJrFxR9c
	ikd3Nh7yfJlidj5H1sIxOGgSzEHx6wBYASne+waSjUpuVrQu+Y7TyRY8CIllHfg4OmyhYb7tbur
	J86JNvvYwpHxlvIrYfrM7os88osmG4NQPpwqHgewudzpS1f/TlpmKBrXgSL1Wp/tNCk6pr6L0Mf
	8wxc9Rkp0lDSmm0Tr50Sj13EnC77uKu8OE+vPUKqz/ujNT701SAEayIWj
X-Received: by 2002:a17:903:2f81:b0:2dc:e272:bf27 with SMTP id d9443c01a7336-2ddb1b21fd0mr115572235ad.13.1789856458353;
        Sat, 19 Sep 2026 15:20:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 7/7] libnet-ssleay-perl: fix client hello ptest with OpenSSL 4
Date: Sat, 19 Sep 2026 15:20:44 -0700
Message-ID: <20260919222044.2143524-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130124

OpenSSL 4.0 removed support for SSLv2 ClientHello, so the canned SSLv2
ClientHello test no longer gets the expected alert:

  not ok 38 - Client: Alert from canned SSLv2 ClientHello
  FAIL: t/local/48_client_hello_callback

Backport the upstream test update for it.

meta-perl-image-ptest-libnet-ssleay-perl on qemux86-64 now passes
37 tests with none failing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-removal-of-SSLv2-Client-Hello-suppo.patch | 62 +++++++++++++++++++
 .../libnet/libnet-ssleay-perl_1.96.bb         |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0004-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0004-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0004-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
new file mode 100644
index 0000000000..fe7805798b
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0004-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
@@ -0,0 +1,62 @@
+From 1a5837fa489836f0dfc411d3a0c4d955ce8fab8c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 14:48:51 +0200
+Subject: [PATCH] Update tests for removal of SSLv2 Client Hello support in
+ OpenSSL 4.0.0
+
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssleay/commit/1a5837fa489836f0dfc411d3a0c4d955ce8fab8c]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ t/local/48_client_hello_callback.t | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/t/local/48_client_hello_callback.t b/t/local/48_client_hello_callback.t
+index d99122c8..110d769a 100644
+--- a/t/local/48_client_hello_callback.t
++++ b/t/local/48_client_hello_callback.t
+@@ -5,13 +5,15 @@ use Test::Net::SSLeay qw(
+     can_fork data_file_path initialise_libssl new_ctx tcp_socket
+ );
+ 
++my $has_sslv2_hello;
+ BEGIN {
+     if (not defined &Net::SSLeay::CTX_set_client_hello_cb) {
+         plan skip_all => "No SSL_CTX_set_client_hello_cb()";
+     } elsif (not can_fork()) {
+         plan skip_all => "fork() not supported on this system";
+     } else {
+-        plan tests => 41;
++        $has_sslv2_hello = Net::SSLeay::SSLeay() < 0x40000000;
++        plan tests => $has_sslv2_hello ? 41 : 30;
+     }
+ }
+ 
+@@ -172,7 +174,7 @@ my @cb_tests = (
+     # argument passed to the callback
+     # true if the callback function triggers croak()
+     # true if the client needs to test that ALPN alert (120) is received
+-    [ \&client_hello_cb_v2hello_detection, undef, 0 ],
++    ($has_sslv2_hello ? [ \&client_hello_cb_v2hello_detection, undef, 0 ] : ()),
+     [ \&client_hello_cb_getters, undef, 0 ],
+     [ \&client_hello_cb_value_passing, \$cb_test_arg, 0 ],
+     [ \&client_hello_cb_alert_alpn, undef, 0, 'alerts'],
+@@ -248,8 +250,8 @@ my @results;
+     };
+ 
+     # Start with SSLv2 ClientHello detection test. Send a canned SSLv2
+-    # ClientHello.
+-    {
++    # ClientHello. Removed in OpenSSL 4.0.0.
++    if ($has_sslv2_hello) {
+ 	my $s_clientv2 = $server->connect();
+ 	my $clientv2_hello = get_sslv2_hello();
+ 	syswrite($s_clientv2, $clientv2_hello, length $clientv2_hello);
+@@ -306,7 +308,7 @@ my @results;
+ waitpid $pid, 0;
+ push @results, [$? == 0, 'Client: server exited with 0'];
+ END {
+-  Test::More->builder->current_test(37);
++  Test::More->builder->current_test($has_sslv2_hello ? 37 : 27);
+   ok( $_->[0], $_->[1] ) for (@results);
+ }
+ 
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
index e5f8718f68..3ae4ce24af 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
@@ -28,6 +28,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/C/CH/CHRISN/Net-SSLeay-${PV}.tar.gz \
            file://0001-Fix-SSLv3-in-OpenSSL-4.0.0.patch \
            file://0002-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch \
            file://0003-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch \
+           file://0004-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch \
            "
 SRC_URI[sha256sum] = "ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753"
 

