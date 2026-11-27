Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8124.1795739796849070155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ccbjAiBf;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0426a65e0so46220775ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739796; x=1796344596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jqyAD9CkiJFpEM0gzFzYBIFM2bx+9I4e1iuY5CtCdQ=;
        b=ccbjAiBfDV77gXQkSLA5iqztqZ3S12pSzejkCPgATlcvUWX9s8LGBjIMBLcGcwneQz
         rnToZyFi+gFQ0bkalp6+A3h33d4pFbZ75TY6SCGdtNiLCRyFzoA/OK1K7D+SZ3oGoVR8
         N7x9aC511ll1ZvcLMtLJQFCFrtYU7FjsPa1AXzWFruOToLgo+qwh966Fh+04FYITush8
         AsnqAcrdz8mSAW2RmTxERnSTW+uCHkM4EtWClNsWIvLsQ0PeHTp3S984yqOpxehKw2i5
         +WQvd3zJRuO+gM/HNAKp5AoOLiUwLUGUabTlMbStXWYicTgR23187rC424GXAiVno9Rc
         fb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739796; x=1796344596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jqyAD9CkiJFpEM0gzFzYBIFM2bx+9I4e1iuY5CtCdQ=;
        b=NvmDWeOI4R8E7yKIe1DOr9mA2gBlijD/3oFWphhMS7+45+jn/kwXL8S5Rl8ijsJw5K
         ZACOe1Ln1uzHPxjAEn2FHusT9Hz7wy7k0HQB2SjZC0A2SkAlbus+v7GFOCYxAg3b/MrR
         nC/TEF1vVMwHoDo1o+YqJ41jeQa8KW/U/qW+NyZYzOHj+NHz5UgfGa/qwSKKdGMTDM0e
         a6JHPq9KfzoaVOieRTCl7+oUmxJ4Rl6ylAVVuPctOhQeQCt4yeRXzhCDxkJ40UlpF93M
         0aka3uhQGt5OY16xKTu9lChMwGcjdk1acrXZnDM8RE9XxI2En2VbjZVpGZ9kpZTEhKa1
         YHHA==
X-Gm-Message-State: APuU4Z940vS410h90TdvZEIlPnuK0W4JRpMZU2g7suTlkyKIITSpDIRT
	oEZ7f25wavlPfIuCfp93xJNa2jCBB8yOQyKtVAnpHr5wUFJQyHhPNZAvcK/TqyQx
X-Gm-Gg: AZFdTZfg6wemXrVB8xgYzP7VJWM7A/rylKOWnQCB0SCLstJd8JfpSyXaMLkN9I9HHXN
	jyGf2SSZKBwbSUp/pkmrs0YwGEWibJW+kUILLUn17/sitSkbe3nbpRtm2+DKvInzPseaFpFVDBV
	3H1GqOkftzOkQOj6Fb76FZGIvtCJIDn2NOmxUS70u4b0TGaRwmmJce1OsRb6Gbi+XGtHBTs5hX9
	zYOh39wcfEiDBUtF9qaUBLlPdU82jIvzDEYgFYSV0Loow5WGaTRjPY0tGohU3PmXvAay9hCjRBN
	FbJSnjAlPxkt84tnWoD5ZErcBDjh50HSy/TQJ+oYEQ5JF8kjYYyJMLJ0fPPlD4WMtcsLLPF1VL9
	GsOJaNJon+zdXS9NQLWg5u7wTyRO4tk9k4kCLkGFBPE8wdYTnNYNinpim5bCbqzKGe4nG8uny9p
	nrL5mnTuHf4lWMg5q1QSeWqCJLgS3MBuP2Ng/70CAZQFV+9h4gcj8iVtZFRblBskKMNr5GLQs18
	NX730mzPeJkYzx+VrwWoKDUL8YTkuep8doFcB8hLjkxWWaRpCQYCs6VHeLoc1RMH1wW6IiHW6Nv
	DZ8gN8VzCbK9hI0p8ZazQzk5Je9nhGEE6P9lN9UKuaa0ciMjzdz6ezgY77HU5C9sJP2nfz4P2sK
	myi3uLxIq+YPCzq/Folm2pE6hLoAdYRo/NcuUOXkyuOLcMEXo62ouExoJtL8ksv6XEttU2Wxfun
	YoxzXWduENZ1GicvCy0Jbm5tfpWvuyOQXB1O5ptD4cy59jz+B4vulzrEf8mP4X08L9uSbPWBoJR
	uy48M2kw01einGxA8UfPtrqQH8zGo//7OZVseur2Uh4XUTAqAuX3Xa8aM3sgRtcCMCXzGPh38PC
	XDM5GeaLcp5iIBFD5L2A6Fg0WQ==
X-Received: by 2002:a17:903:110e:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f0ea4b33a9mr43573275ad.11.1795739796136;
        Thu, 26 Nov 2026 16:36:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/39] psqlodbc: upgrade 18.00.0006 -> 18.00.0007
Date: Thu, 26 Nov 2026 16:35:30 -0800
Message-ID: <20261127003543.2167775-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133196
Content-Type: text/plain; charset="utf-8"

Security release fixing CVE-2026-136499 through CVE-2026-136515:
- Application memory sent to the server or returned to the caller.
- SQL injection with BIG5 aliases and multibyte client encodings, via
  names the driver puts into its own queries, and from differing SQL
  parsing between driver and server.
- Use after free, double free, out-of-bounds writes and buffer
  overflows in result handling, conversions and statement rewriting.
- Debug log records the database password in clear text; log file
  redirection by another local user; connection string injection;
  SSLmode values with capitals or braces connecting without TLS.
Several behaviour changes came with the fixes, e.g. stricter catalog
function metadata handling and multibyte connection string parsing.

The three patches still apply (with line offsets only). Add
UPSTREAM_CHECK_GITTAGREGEX so only REL-xx_xx_xxxx tags are considered,
not the -mimalloc variants.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{psqlodbc_18.00.0006.bb => psqlodbc_18.00.0007.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_18.00.0006.bb => psqlodbc_18.00.0007.bb} (95%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0007.bb
similarity index 95%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0007.bb
index 086d2bd829..f7d04d380a 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0007.bb
@@ -26,8 +26,9 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://run-ptest \
            "
 
-SRCREV = "96fa03dbc968c40920c907bf18d3b4cbd8efeebc"
+SRCREV = "b7fb29e201ea9449209923ff3f84e1c3d640b912"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
+UPSTREAM_CHECK_GITTAGREGEX = "^REL-(?P<pver>\d+(_\d+)+)$"
 
 DEPENDS += "postgresql unixodbc"
 
