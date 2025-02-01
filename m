Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0764C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:04:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.46862.1738429451362323701
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sj/6ULzs;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38632b8ae71so2560247f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738429449; x=1739034249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIzJ/FkEBMFhFZ/HXZSUnZf67lJzkkOTlBmdxJs1FY0=;
        b=Sj/6ULzsBh7srH1YFrPnoYIQffcI7Rf0zhOp9aFQDryDDOzZGO906ipXsXVWZl7BGZ
         xco5v+gqdhvDhlAs0qryBzKzq6m1rhuprj5rgm9rSlbR1J0Wa9UP76bBUNFGR/n5+VhV
         GhWaWNGLOWWLEpKEzT7L+AZmasVt3tU94mAUlwxvn3yq0dPvDqYMBPzcb4jRR0SPvb4z
         qoYEYEyjlipzywqhDLU8HJbHiEbwk/NApauBYMzJgvDwPWPKDvZBTNUsajIG45Wpt89u
         NbLJWbxUq/yHW4mZVh285n+Lzl+jVvRsuMfZyRaUxP4feJ90ACHyS0TvKzyZOP+kFns7
         qFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738429449; x=1739034249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIzJ/FkEBMFhFZ/HXZSUnZf67lJzkkOTlBmdxJs1FY0=;
        b=BztWAf7OTUYMh4lt2TpYVFfdtEui5d9JDjdN5XEm+ktIr3x33kthZNHGxcb3YMxKTN
         IofnHqQVMQHOvd9naKZsVdZv2iQf9futbmMicBewXODTROf2kcFc5NEWh8EBd7VA6GzO
         Qwyx83tUpIPKeeZQNIhhQKewvXLxkygL/C++MfWAbmFK1lN1rcx7eRKHuCVdKmr0jNfE
         rIdGlBGPDknaEhKgoDqHyF/TfhXCUdHxqLdfRcA7owxstOIevEg540esfdv8GSMTwa4/
         8LH3lq6r65wxK2LjXRFJHrwbq5SjR48GSsdu/2BKGJpYbVkktl9KaRqDAA3FsMDonrox
         VvMw==
X-Gm-Message-State: AOJu0YyWWBi4V+7QBfxwcpvUiim9xLMt2BY4OuBQfEsf0UDBUjbsosoc
	ewXVCO3Ti0Iwh1/V1MVykKlWa93vtIjYBgiXExSS1VYRKlWcAohSE78ARzwf
X-Gm-Gg: ASbGncueyW+LTkxbqCCEJ1gwgNdZUGqBUSzxVvhUec2kpU6Z72ax9RMYdFVEvazfoUM
	/ne24ASn75iz0WFbgASzcmSOktQGrHSBLZBNQR3vrdsn0V7O/KgxW8/ZgoVYvNGtvwTH2UWKstg
	QUEK+Y0ofcfw2P4ABtMSNAM/JdsEWHKsty+/5RxhPVf2QD3Qhs0T3sjLBufXqXrMj/36sq+Nvru
	Fe4W1juKWqZMdqq1X30QVD2Tkzax6JGG4XjgDzBxxsHbjEisjHBXpAZdUlSxD6agOXh7vZrxga9
	dTSn5vhujNDdxJNV6B4Y/ym1oltWyD1f6bh+DI+xhtuFiId2M/aRB9s3WA==
X-Google-Smtp-Source: AGHT+IGeQUbROWJhJ24vlo9en7bQV7r4VB/wBH5wSMVsjzV7OR0NizrWktAct/bsS0/vzZF1AdkGCg==
X-Received: by 2002:a5d:64a1:0:b0:385:f00a:a45b with SMTP id ffacd0b85a97d-38c5196995emr15577664f8f.21.1738429448868;
        Sat, 01 Feb 2025 09:04:08 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122707sm7860204f8f.50.2025.02.01.09.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:04:08 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 3/3] mdns: Separate out mdns-libnss-mdns package
Date: Sat,  1 Feb 2025 17:02:44 +0000
Message-Id: <20250201170240.2880-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250201170240.2880-1-alex.kiernan@gmail.com>
References: <20250201170240.2880-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 17:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115215

Extract mdns-libnss-mdns from the main package so we can mark it as an
RPROVIDE for libnss-mdns (matching avahi-libnss-mdns) and then
RRECOMMEND this when building with glibc.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-protocols/mdns/mdns_2559.60.39.0.1.bb     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
index b860c34e881e..97d3597cffc0 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
@@ -112,7 +112,7 @@ do_install () {
 	install mdnsd.sh ${D}${INIT_D_DIR}/mdns
 }
 
-pkg_postinst:${PN} () {
+pkg_postinst:${PN}-libnss-mdns () {
 	if [ -r $D${sysconfdir}/nsswitch.conf ]; then
 		sed -e '/^hosts:/s/\s*\<mdns\>//' \
 			-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns\3\4\5/' \
@@ -120,7 +120,7 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-pkg_prerm:${PN} () {
+pkg_prerm:${PN}-libnss-mdns () {
 	if [ -r $D${sysconfdir}/nsswitch.conf ]; then
 		sed -e '/^hosts:/s/\s*\<mdns\>//' \
 			-e '/^hosts:/s/\s*mdns//' \
@@ -131,7 +131,12 @@ pkg_prerm:${PN} () {
 SYSTEMD_SERVICE:${PN} = "mdns.service"
 INITSCRIPT_NAME = "mdns"
 
+PACKAGE_BEFORE_PN = "${PN}-libnss-mdns"
+
+RRECOMMENDS:${PN}:append:libc-glibc = " ${PN}-libnss-mdns"
+
 FILES_SOLIBSDEV = "${libdir}/libdns_sd.so"
-FILES:${PN} += "${libdir}/libnss_mdns-0.2.so"
+FILES:${PN}-libnss-mdns = "${sysconfdir}/nss_mdns.conf ${libdir}/libnss_mdns*.so*"
+RPROVIDES:${PN}-libnss-mdns = "libnss-mdns"
 
 RPROVIDES:${PN} += "libdns-sd"
-- 
2.25.1


