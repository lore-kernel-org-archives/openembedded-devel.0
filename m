Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7907.1795060355084998540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cKyPG0Ar;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so3035847c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 19:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060354; x=1795665154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TldiaVKaAInfb9xpStBKea5v6Azzb1wJ+qEEVY2MffM=;
        b=cKyPG0Ard2VwrLSwXqGZ00CSqd2EkXNumNNwJPwKgzqBZyM/O7cTlX9FAe5X235n9M
         lJe5awfw3hXOSI8ULgW9iMCQmJ8RbKEM9E70FHtgTTDZXWG9jhlqLkEXx7qGo6qQ+NuI
         5h75hJDvHluf7q2acu+cJ5wkOBmOyre7Jk/lp5dfsu9Y7Y4/QnwJ1neERTMGXQBSQLl5
         tHS3Dd5JOWdzN60X4p6YxYGovR8QhUA930rpBM7vbCeLeOrNhaEeu6+B2L7FiCBVSgim
         2pfTkWPVo2QKdruJtupmi9eym2b2xTuB9Kn25rfFmbIJefPg3Ph7J/gLzQXnQLaDlh3V
         jF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060354; x=1795665154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TldiaVKaAInfb9xpStBKea5v6Azzb1wJ+qEEVY2MffM=;
        b=Uhhf+BbzqwcLclxvJt7CRSKNXkFatkMrQqhVnoU9n81ZP7YUCUq2+OK5ii0CMvC1ko
         8MVsjxp2k4iKi4dj/iz1zkoXwKZBw4AKbpexbhP14BDNdxl8P8mK2Menxs1isrkBcP6H
         sUk/kKZ6XNt140oa6hrtqwPRKX5QYKsPeU23iP4s1FMtW5o0mnOx07bAJ9rxKq6hHQnQ
         omuNPw+GTsCCEffxwEWuvQkPBoSSAFwNsom+jmUjCXymA/Ry3E1I0PYcS49xN0G/SS0B
         V9fu0XsIH90nnCOHuUmA8nPKxr5WfKJESPtYvarDX/hNPRB/MJM3QzKog7fOV6B/UeUN
         soQA==
X-Gm-Message-State: APuU4Z+7By3TITfBnv48Ms3gU6YaKwEsUphvVw/u5+CRUcCmthI9QX6l
	DAXMBEITHq/IyJQUjNEs1IGygqjk6+3uak62qiiAj99iXyxy1vIihNYRWzjMCULp
X-Gm-Gg: AYBFou2G27txi9fvFMTxSIwg3vmHwLh6ILdGTIzFf5SFcAeUBy7PFnVdVAOx2IUuQzD
	l/yZ/JPZykEE8FW/WZjn/+DtM90CRG/h6GZuPoq1YSrU7uRRJSYdc2bIoPuoivotizSH2Xs7Nbm
	1IH0X2pvKUlPnEVefXMeDbdE/2RFucl9i4PlrgTMe1H+biHaMsQu9gp3huGCbpuN4n059odfPtw
	4Zs/i9y5MPmSHo5uNEU+02s2y/HXSKTQrn32zKMk+BUIbIpvb+Flh+fANVSGUx2pdQ0gzZ2ohIC
	3NF2NDATIoBFkZe8FkaJBZ83rwfaSe5JreDoW76NRBOGBxBXczTEWYE3OZtRoM746nB2YnVopP6
	NfyWnGWfdlrSKET+FRSLpgfxR/tvGZRIDi8Pys4cZwjGzUFIINSBmPos7y7IOjCl94JTc+62UDI
	i9jTXvjmWgM0fezcoI4wCLiP78WgjEc3t9zMkvWA9NCkd44/QcYvOq3wkQcVbbd6W21YOf/0R7N
	rAeHSxWlDqi71NysCpKEq2TBmfADQBD4rODAblJZqeYCQ9IO0bJBuusCaDkscXvttF7OhT6sNH/
	vhqNjD6Thrt1Z0dcVJXtUdh3EnfPFtRLjSgAYolZbT4Cc1wXSySSye0YYTae76Ac4pGs3Cn+4PX
	paDuIRU8nY2xpEBiWhUBZLkiz4/J6HwLhoAPGJWawm4yRyVQQ8LO/m1ykF4SuMgBfxRn7C0oRNv
	m1sWXz/E4+uDsxrKrNF6B5IeWJdDGcWhHAQWfQf9QX8ZxPvS0jQWuvvUjHxPjbzmRZSVBZv1PRK
	EADzZT2mR/MHGWVZhi5I37P3q16tZQ6mwNY9fVoyMisdd8n/WgTekqQ/13fMkZLyMULWLGdsf8R
	Sy3U
X-Received: by 2002:a05:701a:cc81:20b0:141:5281:8a41 with SMTP id a92af1059eb24-1b543cf29f0mr4122607c88.9.1795060354413;
        Wed, 18 Nov 2026 19:52:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15342139c88.13.2026.11.18.19.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:52:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 3/4] lldpd: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 19:52:27 -0800
Message-ID: <20261119035228.1759400-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
References: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 03:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132668
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
index 3d623bcf5b..8962554df4 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
@@ -26,6 +26,7 @@ EXTRA_OECONF += "--without-embedded-libevent \
                  --with-privsep-group=lldpd \
                  --with-systemdsystemunitdir=${systemd_system_unitdir} \
                  --without-sysusersdir \
+                 --enable-ld-version-script \
 "

 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
