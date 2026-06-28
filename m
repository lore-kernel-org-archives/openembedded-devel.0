Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5FC44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14719.1782634308264681382
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YAyIPGFB;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30e9eefa268so1601690eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634308; x=1783239108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZFwmrQk4ZZv6u2N/a7Y37GUSETI7qGFerYbthLfC/E=;
        b=YAyIPGFBj4mn/KPhavEKFrOHN/806UC7kbUqnWJZsyfLzU7wsCxYFk6cUigIOA+sf9
         hOkV94W3MW+68Uh1KFbBfY7F5XH2xM7M0Pre2Xdj6o/FsfpDHFhsvlVtf7Rl3yTPwsnS
         fwg9BOH6lT42HCvKDu5UkvWC0KDXDKa53i/NN+UGCWDZjkIJbMj8rzVtTDmKoDUeHXbA
         1oyWHXZSPhCp1Fkf1h1GxMqMI1pqFJpEwfLwafzUpEiZ8U1adPyWxeCm+OTg54AioC0d
         eUM/HsKIg5GwE0DzPfwS1tuAd6HOkH4XPY/c3p6bw8oOGnyh/imOTmmQrB+Wpt5ZqLaK
         fq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634308; x=1783239108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZFwmrQk4ZZv6u2N/a7Y37GUSETI7qGFerYbthLfC/E=;
        b=WcPUnIhhCm5urrapRvXRYaKC2ga/lGPN7qO+NwVQGGBo79FnGXPN3l8wv432dLQ5pX
         nKsaeP07n8FsU7HqHV4JEG63dKqPppGqjj4PJn9LQQJC6gGvNzpBnbszvESIBf2azGjn
         NtxIwCWpMV8JrKUCEJ2U73i0Wqb8/eQuVc7rmOhKwx5COs1KRAsC4W+6kIwdw5WUrYzR
         R/gWLeQhFh8AMljxavEeC9ecAQmPR9lMGU89/QP4qhxecsRKUyCWwQLQUncxXGMBwN2Y
         1oKelC6y2sSbzhBz3V34miqx1MIwNrTQE9hIHIW9FK2lGc09zAFYULzXxCoHuEpupmni
         aDVA==
X-Gm-Message-State: AOJu0YySCemj7AdVh1OGtvz9G/8U9RtJR0NRmpC9X04B6SNJI+lHh5gM
	TL5RQYM8nc2vL624+/g5aXW86pk9bo780b6G2XqGna+ZDDRIgoEskERwtRUVcSoyQ4gXng==
X-Gm-Gg: AfdE7cmnE8S/aJphKvdcO6C2ntRC7PANQQAtP2s6G8WTsl3HikJXKA9ROEa/EdANxcM
	DpAU205bRHEwwuQKYJHSEirPQcQ2UsiNfcIYmvGpz6+ujOq2rtCkpMXlX+mZlAFBD0Z5StEhop5
	O32jAk3B9d3YyJ2IbTNm9gTdUnxkibt8hLdOBvMv65mF/n5Y4aZjVY1mG4Kmyrm8ex2dQWNPlW6
	5F3YjrodQQQertqSXDONZ+AuTt+h/hKchgfEpMsEkM6UuE0RknDa+HUm4sEFwWK44/91SQqtcR1
	ww/G7QVlwU+jJIQpHri3iqayrgGU3qCE0JXBuSMHtt77lg57+BgN/FpitZ/J/JdWK82iFWTz66f
	7G8rwlJ8yGClXQB/KdRD6U0DY8HcnLiAEywRihYyDENj6WvfeoeES/N5fqZxq7b4PgvTC0LggyS
	KZ4xCJDMFEPJE/8yl0Mdk6ZXSang5Sa+u0ZtwMB/zOC9+nEqqxx8x9o+Li03mTA2oBXPtmUkBZi
	tSkOaIAhbLqsvcWzYIVQf6CjotdcbmUHZ340AmfqNAao+gU8pIKScFaMM2qZPHoqayM0oI7Wuwh
	p0YwwmObft38QpRLt7phZl8TdLUiaNp0Ta9TJlDa
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4d:da32 with SMTP id 5a478bee46e88-30cab4ddb8bmr5915177eec.36.1782634307572;
        Sun, 28 Jun 2026 01:11:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 024/128] fetchmail: upgrade 6.6.2 -> 6.6.4
Date: Sun, 28 Jun 2026 01:09:35 -0700
Message-ID: <20260628081122.178348-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127834

License-Update: copyright year bumped to 2026 and the SSL/TLS linking exception reworded (OpenSSL -> generic SSL/TLS, wolfSSL exception added)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fetchmail/{fetchmail_6.6.2.bb => fetchmail_6.6.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.6.2.bb => fetchmail_6.6.4.bb} (85%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
similarity index 85%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
index bf891e9464..cd9e8dcee1 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=61ae62fe6df00649035f6b096c24c0f1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d97f83179a23f8039e1de1420382e4d"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3"
+SRC_URI[sha256sum] = "efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 

