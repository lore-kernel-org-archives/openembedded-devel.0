Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22469.1794808963432148550
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JaEWArLT;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4539070eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808963; x=1795413763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItM1wJvearBYu9BO7bacdSciAbOMq2VMOclJ9oljazI=;
        b=JaEWArLTcXkMESYzwwnoIL9RcGnj9AZ1yWHihZzsx7nuPmUHqMfKIy4wVzoK6yPNV9
         KBebwVZtIKYq/Iw0Tv8/uRF7LEBOyIwClBtvrtEH8OU02lBZPx+TP45oBczNibpezkhb
         bSuqcfjegVks88oJiRdt5egvm1AeeS62wpQbcMKYgkiiDj3QsNLFvEQcDqiYMLB+NVM2
         9K71GlZ8yvuOQQw108FuUQpfE/inFXSWFDNitPGY/kf6L1VGREcgxGNBZQoDjbnIyirP
         3tbIw2TWFh3XlCjQm7HINhDfhEpbkSu5W14T0vpw4iBcEfQRTKrM1HT6d6jvN6e2g271
         HgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808963; x=1795413763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItM1wJvearBYu9BO7bacdSciAbOMq2VMOclJ9oljazI=;
        b=tYtuE6ifBD60cFzETiMXtsyNUmBp7xo99mq26x1+kttFBDZPC30imVRsdK0w8awPn0
         o0SNkMSP6aqufbA3UlM8rrKk9mxYvbNueTi4XzYfm4DUP9T49XiQrYvSvMjv419qD7aF
         tS91WotaFkYd9Mx/8AxAFGhl1Ar+hEuRpxoQDbZ6CGLCczWEcukUIbiw/T2TmgQczCvF
         bfu5/grnKRNe7TnqMwpyuc47ewrElblp9uvI0zWoCI4B2UxeOxCgk9+/ZUIbOJndplBq
         9DG0DNbFw1cPgL1y8xx0o2uhsMBOLCduYM8tdKvuP2ydRV40FwAUK6rtj6WjAToGQObk
         k0OQ==
X-Gm-Message-State: APuU4Z8fzl199CuM80zGotMUlIAuG+KrK7soRpl6Am+MInvMbelFQQz7
	DItbe89pzOT5jMzeXiGW9vQqv34Uf/bI95eJ4732cJ8PFglJFtOLpLLHSXFhlcFF
X-Gm-Gg: AYBFou3GjTOgEvzVacB4Tz11WnjZO1ZMLUV9M6LBEKBZp72Hg3YOvu+rA1LyUdjikzM
	B0YlkOJD7iA3zEw+M3kr1x2YXxY9ezsuZFa5prgf1AIo/jhr3kRUMazQv5lyYmK09E8O3Cr/Br+
	rtlzLq0M1BM/GZn3qRFtM1j/g+Kfz3GhmzGmK6C0BKt5C+0GnpSGIZsiSuIbl9ErwreFvKTO9Ip
	gZx6+g62dFF6Ap6XapgtZ2BFpbwcWg4Ein271FUVUoasG5fnN9wTCOTBkbCoTCrkPxk0CLHplSj
	ry5gOsFdVIPj43ELKd5osFFM7DRSOwY/mySCeSWV+aPS0lgoHjZCZAmthIMjCxWq15X+PT/kEpm
	p3IXI3SB6A1sD+PjGtJpTXcBRtAsiNjZ/tCdNmLtOkQ59goqyqRER31DAiz3R3Pl0oqsvt2ufsk
	msc28GJVhMQQyC+6ogU6oRZE86x31LUsOPVkSSbPrucU5niQxozqQ9t80PjzD16BszmPEW2dHRX
	VYFwGUNAaUkF77AAe/CoRmT22g1ScpMRHhLn8+0vxYqTKs+ApyCVlbI6K539rwltnHBRq3AfUjA
	9IWx1a1NOEOL57O3pHTCcjcvF4wQy4KrjH8MygXg0853jB2CWzuTT7W5qXilVcMUcnhvyCf5d9x
	mlEK4eZS75PNDQnpWPBeDoe13hGpgOFWXbmzDccl3XWJfms/YUEtQdkfsxVpe5tTL2175rhoO0k
	se4ROXNcu273cm1UiDaxJNqyuzLUDqlqDUOMjGju+CoqxrWUFmxbJDtJzoxJhPQjQJoD165D2Yf
	fPZ7D/12pQ3h0XlHtQw36/pBbKQ29BdI8a862FNV0oGTcn30+EhW3CPMs4pt5w5c2S/HXFBh52M
	CZkXWQ==
X-Received: by 2002:a05:7300:c8c5:b0:379:e0a2:1a1 with SMTP id 5a478bee46e88-379e0a20687mr9435758eec.35.1794808962763;
        Sun, 15 Nov 2026 22:02:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 27/30] xfce4-settings: upgrade 4.21.2 -> 4.21.3
Date: Sun, 15 Nov 2026 22:02:05 -0800
Message-ID: <20261116060209.2916444-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132425
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{xfce4-settings_4.21.2.bb => xfce4-settings_4.21.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.21.2.bb => xfce4-settings_4.21.3.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.3.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.3.bb
index df60f8c40d..395ce97e0d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.3.bb
@@ -12,7 +12,7 @@ inherit xfce features_check mime-xdg

 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "064f72fb5ead25d9bd1724bea803f1017fc2287b32dc55eacf4f6e3d78e2b7e8"
+SRC_URI[sha256sum] = "2f620939359dc9737800adfcb88fa86cad89b02d83f182ad1704bbebcd86b609"

 PACKAGECONFIG ??= " \
     notify \
