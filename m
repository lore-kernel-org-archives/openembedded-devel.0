Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD2AEFCD92
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11132.1773052364603465881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hgGHMh2J;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-823c56765fdso5686922b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052364; x=1773657164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtmErZ5MliHAhbBZp0ccWv8RiqRd4p5EvsbKAGqOG3s=;
        b=hgGHMh2JtpHbVWrHyuwOZ16I8dTDJDJkv3BVyBjYVQiUwHXjjsDQWn3jVwy6FgqQ5f
         tugaEuBNQg2E0zqeW2ixpX66ssG+wCi9QMZj48vPYtcnewUBpOdqIL6Crqo3Z0POZcBK
         xcBRKXtUicDRtOw1knjQoQEapgw9zTALsE5D06ZftQH7bm/ur6R4b8NBGl1lOcowvr19
         qLo5K4rs9xYFq1ZrBZ4EYZNMnyRwlAl0ICcdF7btR66RScp3rgJUBpQY+tc4zLbEhXMy
         kRiGD+9f9MTln8Mqf48NtKezHxZVaqZDgS75xgmA/vLQHhmmID3Cs5iSaxUIDuCJSt7+
         A1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052364; x=1773657164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtmErZ5MliHAhbBZp0ccWv8RiqRd4p5EvsbKAGqOG3s=;
        b=EHa0/GBwGViYRGy0JgLSujW1oP9eRlLnzJ+WhWaLPZStAhQQVNPFPz8Wns0yK7kYJ6
         TBT9jXYOx/nVLBU/nBS4d0zM9kxjRbxBRWK10VpcyuA/EJE4PCDIsA4nVTWP39T3Vrgy
         ezs0GvJTRuT0gns6kgU+TbEcDnEFp7Hlux3S1pQrUNi62Yl2/BPOCVuHfcspmaeogGtE
         pWYK5r8Y2TdUKokBBgjsjr5vuFMQdso5iQKSw1G0FcpHpcfHEhgTXctLmixkR4g426+D
         q1BNvfUEZyNb1r25gRPA4gvaxCHYC1NG5whWn3PRSSOA2kwLrn3ZZGNbE42QX/DIZiOh
         QKtw==
X-Gm-Message-State: AOJu0YwQwd9CIQW76c/E1DTK/1gieWQTO+mEkqzZquS6zCPa/kbX2afr
	dMQnCw/g0sJK43Vyd/VI5vN1cWO2QTgu50neN7FPIX+VXyZuM/DSntRoKnfMtw==
X-Gm-Gg: ATEYQzztCEvMN7EfMQvv7xSNbZH64fB3aYr+jPedkAx4KsQdHMhwU9X15xEnM/05gPJ
	4h0bmIMQWU0KTZMcd2URILpg67pEC8/BitVBNZbOlzIKFAnxdMaDjGX8OuDDx81o1t66cYmPaDR
	tFgyth2n0qQXukl4e3TOt33kzlAimBkCBaJUUKh/shfDsWf50P5OJTM6Vi7UWEw6ck3RE+1dCMd
	ppQyuyWY8x2939DRubwCsCVBGRw0LFz7U8yE7rz04qa37xn/zJ53oTAiyasG+5oknF2l0xsT/2U
	qwA2hMWsT3S9lX420WLSVQ2FLaJvB+670gwwXzURfhalyyqYSI4YfAbxuXz2iUeTkO1xmeiHRHx
	KS1/P+i7UZjRjmR/P1e9OeGFUlMc0ugWCu8HN7j8zjQWsL36t2nKKTgu+RzbLyv4ZOyHZ9HwtBN
	J86p47taR09IWm3wDxFOg0wZh/qIqGfHx9A7Mto2QVmpz/DA==
X-Received: by 2002:a05:6a00:2d1e:b0:827:3845:921 with SMTP id d2e1a72fcca58-829a2e16119mr8290456b3a.27.1773052363812;
        Mon, 09 Mar 2026 03:32:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 8/8] postfix: upgrade 3.10.6 -> 3.10.8
Date: Mon,  9 Mar 2026 23:31:53 +1300
Message-ID: <20260309103153.536284-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124994

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 09cc9579d41843bcb74ab7f6f052517d282d6613)

Release Notes:
https://www.postfix.org/announcements/postfix-3.10.7.html
https://www.postfix.org/announcements/postfix-3.10.8.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.10.6.bb => postfix_3.10.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.6.bb => postfix_3.10.8.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
index 6c091d9c56..757e6efa8c 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "71b383f57d4cb363201be8a301bcbafe304aadbe7f38ebde41cd5b952248465b"
+SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

