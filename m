Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7531.1792575029262170938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G2QvpVzf;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so697904c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575029; x=1793179829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmMT3+kwVDfmorQ0rns4OJPGCirkRqhLdFl6MlSNsuQ=;
        b=G2QvpVzf24jiZpHG8kHO4b0KNICRhQDybPNRBtxWpVGclnmLRMq9CUP2sUgZiYjn/l
         ntmNZXufXeAq+AmkpJ6mS6hvlCgg+sOJkgGwFJyUQ0sW/vAA3O7Y3xl7FJxSn8UvV51y
         5dcyws9IIutW0S/R7XpeAy0UFabZlx0rje82ZUIUxPlNKB/T/8ZCYs1U55sQpkrItVAy
         EeENTZSwaOydwm6mhDk2sQTP8Puay8zWqLHC7gheNrPFgSofMwDGWRUNRdOgeVSXuTty
         Nkm+RsNAcBrUJLgrZbwurvcUiuxSFLrEoh3CPo0HcDa4k2JYuHwpJZ1IrjWqdZ/K6HCj
         sS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575029; x=1793179829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmMT3+kwVDfmorQ0rns4OJPGCirkRqhLdFl6MlSNsuQ=;
        b=yZqTLq9EBKkXh82PRoQ2p3Z4gjVld6HQh39y62CrGsjAE2F52sv/YuemXtj5xHQkoD
         C3lI+JDNkmklHy4uV0sG60XxaGWAxJfyUe3E6C7nkvdXwkz0ImOa8UqtLx+gLKCw23/G
         zykdLs6CmQMR30Cmv32OvbPpRvdDIemOu7/72mow0dmV8iLzWdOjYj7oRmd0B42xxg4r
         +jke1MFEoKSvhZEhvp60uwDBW02ogFUdftElEvbztM5hanY9LpwDETTSQ0Lk6mcPziUo
         kgeUMDRM9BpB+kL5r5Cq0H7L5Px1gmoloAzmNiVrvU44do+sXA4K55wiZvJDxsPkFhxh
         7vZg==
X-Gm-Message-State: AFq9FYIBQMnAOJnAH5f/Bl+RXE3U81OssSJWFApZpYvoGyd//Y9KQvhn
	R+KtFaNu3pQOHOyUxedFPO8wiYlGNpFmwp4H4HLQAqF9U6/Pdb7+ee43ljm+vQ==
X-Gm-Gg: AYBFou3Zg+chsiTXlKPTYcKiuRE3QI2MJqwFm1SOx1mCYmOZJm13f9PnJgUGq+D3drH
	RuTSszElM4glCN270hhC/7Zn/pb+W+Wwh22elRBq3pBX29d7Uun0HgYpILZDLk8Q3UogR5qDc+V
	g/z7RW4QqEYRr9i9r9DoE7Qh0aqSr1xXtDd/f+1/wK3rb7xKvW1p7Zj62yg0yyjnoav0+8KKe4M
	jNFaVgP2JYwAcIcLGGWvh6gZHU1NnCskL6VruuEXucPDDKcm+Xx8uXC5VwwxRzHx/6nMP2j5Qr1
	pIWBeZjZ3NWfzfEwCmd7kz4X/QM6EGHR5oSPnRqIFUwivZueUv93XYVB5RxIgtuYE+ENpGH3ELM
	MCKSsFoh3NBeaAHuLNUm6F2jaDRCGan441F1tMYgC0GMD/g+vE5tyO0S8QgyayeyW6jHYEj2Pel
	hM2BKd5XLVphO98hRqSyG8shoZYxkjjCtA40v2PaZu1wAPVWKn1ECVcNLyExiv2Q+Yq0KiM4RwB
	N86TIcsVK7LVtT1KyZ/RCHmr2CGdKqUMLi8/5br202oJeB/Bltxx3z3fVc9aW+MMh55K3oYkyld
	+WQWfuUQB1avgAf9MRzvH9Ud1O70Qy0=
X-Received: by 2002:a05:7022:7a9:b0:187:eb7f:b8f with SMTP id a92af1059eb24-190a50efe13mr2713446c88.13.1792575028475;
        Wed, 21 Oct 2026 02:30:28 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 36/44] nginx: upgrade 1.30.5 -> 1.30.6
Date: Wed, 21 Oct 2026 22:28:49 +1300
Message-ID: <20261021092857.3585453-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131223
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

2026-10-14 nginx-1.30.6 stable and nginx-1.31.7 mainline versions have
been released, with fixes for buffer overflow vulnerability when using
alias with rewrite (CVE-2026-15176), buffer overflow vulnerability when
evaluating string expressions with variables (CVE-2026-93479), request
body injection vulnerability in HTTP/3 (CVE-2026-95101), session forgery
vulnerability when using TLS session ticket key rotation
(CVE-2026-97629), and use-after-free vulnerability when using
ngx_http_ssi_module with AIO (CVE-2026-97205).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6cdd413248db5aed93c6cc138cbfe0f83ed81f56)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb} (81%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
similarity index 81%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 6b638cdd96..5d699e63ce 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11c4906d"
+SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8"
 
 inherit upstream-version-is-even
 
