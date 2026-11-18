Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5761.1794975209403187567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jBLuyk3j;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so631900c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975209; x=1795580009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNn6b3v55L4LhmEzfLRnyybkH+u9QvSK7BbKJ784wro=;
        b=jBLuyk3jtsdc035UqAwRRGmdFkwMRiPsAisGw57HMHyO8BRcuWWXnHjkfcBrK87yJE
         IwQqVvzIyL/OeAcelNyZytNNHwVmVT+1ZA5kEE5ck8yH7W1MyOJn0NIQkdqR/qZHIGKj
         FW1Kk3KXQ7Ee7heIqyuv4Qudnl7/0I6gPLPnYC+W6hPgBiKZ37f6gBO7CAllA6gb5gzB
         0xUlxILMBI1IgZVdp+nAlkylu2QOyUkV3c7+0hbEZ6SlOi7kvLgxi8YDxBxMRr62HuFH
         e61B49ltthAgqs1gl8Abu7q4yPG0XOKlDVN9TPSiKXzTR8sttTXVPFYy4jqd7R8t0rUF
         1zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975209; x=1795580009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNn6b3v55L4LhmEzfLRnyybkH+u9QvSK7BbKJ784wro=;
        b=SS5XbUz8DP9Gmu8SSyKuOLn4X+raXOaLTWdLthkASum/u0ZfHWheRVQ4acXFrU2mFo
         rhRY5s/PCPnD+iRM704V2LH5wtXVPKV5ZdFsNkD2vpI9l/jBAq0EyQSkC89e2kLv9NIe
         Ksq7keRQOIwSaO7Z7vftbOR4DSggJz/lQY2CMskRTJ5F6hKioet+wysVtqI+6zS9r9jf
         ELEZ2jwjKM08/FO4v8L06qx8zpydVtHihTnwWY7eXVKmFLzKiOqKlNt2z71W3W8dEovg
         JTOK1BDVC3hvTWZVfwILsWTRdIEPYPddDYxRzTO6g4+iL+DMkISifl+JZCxtkX7/tzCW
         SUJg==
X-Gm-Message-State: APuU4Z8jIPPU6O7yO8fO4t2bMK/jXtYMVLJl3iZ+QVt+CkK4u+JIcI+S
	G20Ks+VlO+sc9rPRUm7/bx2m+5/ZaKFC3dJ9Upd6ZdfzTzukmjsXvjNodnEVApIb
X-Gm-Gg: AYBFou0gE3/viu1ulBCT/7B3Y1R9IUrTTQ/y4VaNV2Vm7evJdEOT80PCslWkLgmIBCS
	7SJb2Woal6Q0Ed1FzznsAUz2OXbbJ7pUG42AhnEDsatR7hBTZLwrabAV+2yoGGc8kHalX3TPZFF
	muau3GbapqT/UMSHJukVi+g6yzLmYpE6GGbbbp3Rh/mEI9hEsXlXRsIqXLFH8Wcqsg2SoMWTD2W
	9BwKGNjmVtSQLeYWjkFmiXCUy85Ru8HcHCROVnRbUjxu1T72CvrCG9tCFptQEBVqZFADLIvkDZD
	phYJXPWdl0dKmHbpmzucDAf1Mt259wKLjoHAkrOtMvNjhnNW6P+sayUBhbtzrROxQP3CGHEOp5w
	Fybz2yvy8rhM4uyOGOUPBem79hnIowMK9qzhHBf4NOEYX9wl1oNwqtmwUvEiyE6LDoV+JJQ3CJf
	nV/H5odKq2MkHPf3fDlmTwnyoQXMhJsUwfi4HQT+0kERd/x+c2RQWrhS0MowAnMWrZwAGCCMESN
	z0sRvMJJcOhzqwvn7uOcGBy5ZfY06JojM9AdnByCNuEBCF7BTypway1b3/H0/tUDOZ2WKAtxkXc
	+geN7CJgfWMkbvXP/UlCIqBUrhKQv37FUhdXoRW9oJ7wyLiXRQq5RXpaJCElrO02C5e8bk4yDRH
	ixZJ5pUb6hNvTVqdVf4GR9Q9J65hYZEByftZkmZFgyMs2+Go+E79OgJR4HHq7Ti5EGTqNAd1MJt
	Gv0XLY0ZKqdnh/5hsvoIdB988nUPzJyGmdhMNgyAARX3KmpgsvXtuHvPoP9/6MLYqXjQRG0nbUg
	0tACPOP/OuTwxUPva0+uvkCaQv/9oiFJzNPeZO916vFO6ECL2mc1fzhmIb7MVNUTqbbLlxz6djc
	bCj9
X-Received: by 2002:a05:7022:281:20b0:191:444:425 with SMTP id a92af1059eb24-1b543c12d1emr1356510c88.2.1794975208604;
        Tue, 17 Nov 2026 20:13:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/12] libesmtp: Fix LICENSE to LGPL-2.1-or-later
Date: Tue, 17 Nov 2026 20:13:13 -0800
Message-ID: <20261118041317.2287415-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132631
Content-Type: text/plain; charset="utf-8"

The library sources say LGPL version 2.1 or any later version and LICENSE
is the LGPL-2.1 text. Only the uninstalled mail-file example is GPL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index d1364a8948..a364249799 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LibESMTP is a library to manage posting \
 (or submission of) electronic mail using SMTP to a \
 preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
 HOMEPAGE = "https://libesmtp.github.io/"
-LICENSE = "LGPL-2.0-or-later"
+LICENSE = "LGPL-2.1-or-later"
 SECTION = "libs"

 DEPENDS = "openssl"
