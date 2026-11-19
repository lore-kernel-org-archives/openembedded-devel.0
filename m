Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1849.1795113367412361003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Vblx/800;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so85038b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113367; x=1795718167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTsfLjydFqsZd2cyY2L1lkoBeEKLs1P48jfgme7NgVg=;
        b=Vblx/8004IAYDhOnGMOigOn4qNDRIIn2Da93zlqutg1w2pYAsf5N5oSZZB+o8Clz3A
         28rocigpcYvD2wiatoHf/gL9fNKWVk5JU8SObgLrRrITd2aUtkcE4BECSAwhSOtfQT8b
         vdjdB95wy3IjGl5MveYl4PuelCyizqo1UrLNcg+nhy1Ey2rHRprciOK/cZc8GC6p649X
         XaumksWJ/jvj71xD/tx2W/w+o9J62PYCfXwWRWuy2fgERQXgRWFHvgjFgY4LwiJnOecU
         GOrN/K3IUWQcyEC9b2qwBEb0DN2ejLuKFeSS1tN2DNkwHry/t2bMHecrAiZkA2r2+Nlc
         86ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113367; x=1795718167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTsfLjydFqsZd2cyY2L1lkoBeEKLs1P48jfgme7NgVg=;
        b=Qo4s41RwxagRc7axgr+INzoZczC2kaa8elwQc+gWb/YYEnUfVxfcz7T1AvcToD8VB/
         9FafqihPI+LWhf17vS+32jfTMqEvyJQej+gon/dY/uoH6eC59jGV89FokMY1F6w81GFg
         ygBGpv1s9YqMkurTDA2PGuQYS1fqeYo8Tdqa7vKD6XmUGpLL1zprx6O3AqTHEmZty1Rc
         OcYeAQRykDwRmDPQsXJMhfnzeRJ+QfJ/y96J+CaKd/uwknxcfmUhRD8WBfam2pB9hHi/
         nw6v4JGin/k1CRFZTfbAzZ/AhiOQ5q9CBpPOwvoQ4fNC3sQwyrNBwjqCLT9jrFqyVCaB
         xRKw==
X-Gm-Message-State: APuU4Z/wEJgL2dxPNOnY48/M/Fjs5OCs6+F77DoEzXmZuUaFvNKStTJL
	FKe+JCYUk8Yul4j6WuJ5Te7tWzi9v8Ao0CwSHAej/KNxcXcIG34rLR/YDSx3iQ==
X-Gm-Gg: AYBFou09LPSUfL7WjkTykTuKgdwSpOV2huiE2qzaJA6mOdZ1M5p9/vLBdJ4M2j6Qf25
	hwSRb2W24K0RNkHiJaeN7pBUuTLk2ZPJ5xAJ/SmK500vQfU497HLhul5zUMDeLu2rVOMCZGFT4P
	Zk/zeJTJdXeCYNjI3ZNxec8Gl6ghymhn3+vjHvGK6FtZPZEZA6V0jn+9qM+29SYfecIkUJEjzSA
	thxFYLcqopnTbAocH98MPlyEAjoQl12SLs2JLT56AIeqBh7RalukWuw044br/Xrnd+dD09lifqb
	1Wr62WQhyGbJZS4WPPe8ng7KMTEB9iPrN2ONWNjA9WbpYNnMnLY/CXwdLsbEDSpHnLc2i0PdVQC
	1qyydmlnssQc4su9LPxTlD1fT9nl11YTiNJSVX1xF8mGYihGuumge35v3txh9SUdrpd9t5/j3wX
	p9nDJkNLgezQRmLhnPAX8/3UyJZvLyp8Bm2ekj1dUQh+UoZQ3Tc0sQjjxMKnL4KRLLnyOkzXwnT
	dLDw19S1u7Ae9Gw81ILVg/ugDtWy+FwY9IBSnrWvxxHQeacWPIPwpu8f0TielQl1/+VzukyEbzy
	QaxhW0cOiOOxC7AOKPdYFm+FceVsQX+FxoZHnK2R+hLDUWn4xXpQ+BK9caIFAg==
X-Received: by 2002:a05:6a00:3d12:b0:89e:fc47:2c17 with SMTP id d2e1a72fcca58-8c87b4f3a5bmr490298b3a.19.1795113366861;
        Thu, 19 Nov 2026 10:36:06 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 05/64] weechat: Upgrade 4.10.0 -> 4.10.1
Date: Fri, 20 Nov 2026 07:32:33 +1300
Message-ID: <d58f8ca4a600bea89ab2d7dcd9e22a08e23d0219.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132695
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.10.1:

Bugfixes:

- irc: fix memory leak in SASL authentication with mechanism
  "ecdsa-nist256p-challenge"
- irc: reject an empty SASL challenge received with mechanism
  "ecdsa-nist256p-challenge"

Security:

- relay: limit size of data queued for sending to a client to
  prevent memory exhaustion
- relay: reject fragmented, compressed or oversized websocket
  control frames received from a client
- relay: limit size of partial message received from a client to
  prevent memory exhaustion
- script: reject script names containing path separators in the
  scripts repository file to prevent writing files outside the
  scripts directory
- xfer: fix comparison of status in search of transfers, preventing
  a remote peer from starting a file transfer that was not accepted
  by the user
- xfer: limit size of partial message received in DCC chat to
  prevent memory exhaustion
- xfer: remove path from filename received in DCC file transfer to
  prevent writing the file outside the download directory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 298e364a9e34a2019cbfc815dd50fca9283ff861)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../weechat/{weechat_4.10.0.bb => weechat_4.10.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.0.bb => weechat_4.10.1.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
index 286d474c83..00030452dc 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c3a7e7c6a5401dde9a46d0264fa44aa3032ca98aa86410c454d3de5c69505c54"
+SRC_URI[sha256sum] = "b8744c6f5dc5543062791f563e0516dbc96a36161e1a03c468b3b7dcc8be5aff"
 
 inherit cmake pkgconfig python3targetconfig
 
