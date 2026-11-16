Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22042.1794808945943172603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g2kPAi6/;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37f14feca60so866206eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808945; x=1795413745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62+fiBxg5d2KbI+OUMuG2D1+wOAOxj0eAg9jBFZ4cIw=;
        b=g2kPAi6/tIT8bLqnLz0jhYoJOXjUONGh3IeB9gv7lEUpgjgNIpFP79rWbQ+sphQNjH
         RJu49rH1aPxAiOyrJ3kh1ezyjH6bzUajczc5MweUMLwBVSIMsub3g/o2S1tOINSERAMY
         489vOiOC8c0aVktLV4YPqH26eOio3WxsNCAHbfB/JvdRcAN166hJAm/1sEFlYptvHUtr
         iz6eCMOO6Ga1cSpO2i2jsP5a2wMehDK3caVtwtdgAGJ2Uc44XFmnC56zEVxvUz7qgaEO
         8GY0nHZaq3AdKT7RWXOfs4osmxyXwJL+QgmIJ6V3SMBG2a2+unUF8WwV3FkOAiO+ZImM
         IDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808945; x=1795413745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=62+fiBxg5d2KbI+OUMuG2D1+wOAOxj0eAg9jBFZ4cIw=;
        b=ttrsnMENtLeqRSrOgDEa/+IvsJPai7v3GlxDil2Fg9Kpp2OYqHNSHxK1TeC9UZu1P6
         U+KSSJ/p7U4J/Vy6+Ioe71jnF7TNDjUyChBql5FJPf1M5tCx3V1ptX39qKaVE7hUmBvM
         Sf92eeYsg0LOU92U/ZpufoqMlEaCbvVx7nUzWSNOJKCWxwJxny7K/J4fr2kHsxdL1dVz
         9xIlirmtOLMJG2hl2vEJ1TkB+Fjgoqtio+YiaFJ4P3jA9dA5q0k4zvQu7Ur75W2qg4tr
         1Gp5iHeDqvwmWZGZPGmUtY2+pTDGYJ4g9aNwTvW+o1Lw1S0uWY+w5KK8y0/a4/PFUF/K
         tWRg==
X-Gm-Message-State: APuU4Z9mERpQnkoDPR7se9KXRKmGVEPVueBYn0ouQm8x2StvZBUW/nGE
	NDjuISBwWHcQKA9nn4heXToVpb1+5eGIapC2ISdGCt5p829xV6B4Z5LQ/Ew1KyCs
X-Gm-Gg: AYBFou2bjbuzsUaxlIZCX7KWzIJN/t7erPEcF3M+QJTIUxVL6jXg4ZFMEEZifdH+eYM
	MXFV3SvRJ0vqaMbVC+KjSUjcWySiRY15USstvQ03Hqczo0viFCK6dHxOfkFEK4MX8EXAgTzsT4+
	VXWHNHQXX9qiTdpT+GEcugqrpfEhZUg/7BFhGa5uq+H2MrDiX3ZcvB+1UyCbGvz7lr/6zLjVDlS
	K88DHfmjg7/LbkUfLkyFdyb+TTpmw8g87R8G0/wlcQm+8gvb2xhrEyBQL9Q0McUKCWqmOuqsPsg
	8I0xHSp58/S+2uEE3ONYN2P2PBsZoiVGFFWvXd5qSuDNwGNZSo6uP9BmBFgyhhf/hbViKmCaaOw
	Oq5DpEEmWxca9I44/0rtVbSHKdyjVnzAGQjhi2bg3XuU79rB1xbTM8mk23iQj9Ds02aYuQXbNzO
	/0P6Oh6fqcLw3GkTIEwe9ZrHnyWYG69Pn0dHbkLxFDfwf8b5ilZvDJ95vvD+4RsshNkp2tPFTI4
	L1zfxJaJDSVGhBIV3lRAmtsSdWrptviie7/6rR858UsBySIsuSoq+TJiOfnsKLuGHU/gdHDG/6e
	KdDliZtiGtay4apnbmRlXTNTzZeiTrVjw7YdNWy9SBHGQ4qKO+H7EAt7F48MSZzjmboe6zvjw7I
	2EHNcpOCv5kiqIhIxs7LbcyVhwenHz/E3gf///6bz8+wsR0faiFYABsZtKBsWRc649JMCkPFmtI
	4/N22TqOcnzo0OwWrYbu4tjRI/cJB+mwVRGJP5YTh1uED7rMs/al8yfxXU5tJ18PgusfEQAcPAF
	Pqu+ulfCu/EN5Wc8mR37pmW7aw/X4KDFIxsgzV34bPr8nqZ2ys1ldmWoYMs9bfWIwm2jY2U6880
	kaMF
X-Received: by 2002:a05:693c:864b:10b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-37960384530mr9720550eec.0.1794808945180;
        Sun, 15 Nov 2026 22:02:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 12/30] libio-compress-lzma-perl: upgrade 2.217 -> 2.225
Date: Sun, 15 Nov 2026 22:01:50 -0800
Message-ID: <20261116060209.2916444-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132410
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ess-lzma-perl_2.217.bb => libio-compress-lzma-perl_2.225.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.217.bb => libio-compress-lzma-perl_2.225.bb} (88%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.225.bb
similarity index 88%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.225.bb
index 5879680e73..5721509797 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.225.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aae
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "3462ecd1e67e85d5e4fa911bc6d8e38a884ba1d6e90a03535f0d28fe2ad0aacf"
+SRC_URI[sha256sum] = "bf3fb4b4b20a9cac8c1c85f3ae678a6117df16b59b62b8ffdd0ab2752ea3d4ba"
 
 S = "${UNPACKDIR}/IO-Compress-Lzma-${PV}"
 
