Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22456.1794808935900876098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rm2NxI1f;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3989332eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808935; x=1795413735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQnEI8mKevSTBnSCXZSpEcfm1RhqPIZke3ndOXoIDJo=;
        b=rm2NxI1fjEymNOiIfbQrLLImdVWiRVab9n9ZqD85xXtP/5UW7M0+fOUPtkABhGxp4G
         RjV8tRqnZNooEztGPkkbmHUVSy6VhXAoXvji0kSLBqhuDODW9Uxk0IPqeLpMXACD+LWV
         daf2dHd71aMesi0xN0ZtuRPS47in0gUbngvXIm9guP22UiMURSZL5Ie1JEJdQpaLPB3H
         k79PURiaGbV5bMszlrSSFQnUcLjQb+Tfs2ytRJBecnAZ6np2HBOT+tMl1x2sUjdB5nC2
         BXISgPkYUvXwMPjwtfnA5EwuWnzw6iSFAb1kzCM47Ye0dEWA0pgw45/4d95Ufse0dWQO
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808935; x=1795413735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQnEI8mKevSTBnSCXZSpEcfm1RhqPIZke3ndOXoIDJo=;
        b=L9EzCbXhQeQukiv4C4jg+9kw44yll3FzpogMhrznBeTVQQj/S8Sm1QSEGt2xRVO/js
         +A9L4g+GePh4DCJohY0knwchKNiXskrIjzRRoPJwR79SnYsJDnxhWziVyJSlZFH3bnGz
         LzjaTNo5WXi8inYxx08PjdaMCa6evE9OATLJC4uHLiAdVcm3ebeitz5lg6BvtaF63csI
         x8aVyjAgCXFPpAm59DN7bK5D4wxfBTXYN6lued0ouDVUd1Uy166rC3CPVufZLkgrhX2t
         HaE9CrF7zFfAdcQhhRxRNSWxckSwayHHc4xcdNwbKvHPzqJSoSDkGzt2VtKXG28kimm6
         t4JA==
X-Gm-Message-State: APuU4Z+FzUno2WXharcYgVVXHGocpUpxwmYD3xzXwVH9PyF4M8nZXsqQ
	Wod/Lx/VmlZAXdG7n3ABdolE1dcufWuNv72jmASGltD7uTe1i+dvSS6eoYqIAvbB
X-Gm-Gg: AYBFou2yJtFCyfUFz+0XR5olSEbNvWNxLbNj5tF5+ymAGWwDmwP5DTh0s7d6m3R5r7r
	DRDgsx5QZpd/Vv9/dIxmV1O/UIP10sFvhUmR/oFfz2TgDavEBndpwSY/9FbmYod97VoDHEUfSqo
	RegEfuoikYLgy6irWaPrOgrqG9E/GKefzMxr0T1pU1H67O9K1c9El6nSAQljqIdMa8KUiqJGMQl
	Ai9ar+pO20XIoAQAXDIFqc2DBAxkir0Qn3wBJTVu6kRgi1B4+SY3WlohvWgJt1l1J/Kyz5zJ3LB
	u1pYguz/htPVAxHjLM67YZ98zEsX5VH5clfrc/unJ5q78rVSTiGXF5Pc95K+g73sYQ7DcHFFWc5
	txkKCVAU/EbCsH6us+VNhykrzRYpmaBOmkpCjzKOsxgTC+X/ASKOBMVi+yPvvZc+tRAW6hX/CL7
	UGYiACQplYsu5dUNMhZB8MnbfaBCIJvRHtKlRP/iEtMHvRVX0yM5KYQmPCaHhnK/zhHZTZJ9ZRx
	slyR0YHc8XvDxNcJy8SY9Lc2q8os3xfLPQKVGHDgoT8BQuUse66Lilq4bBoBav2Df3VAtCyTxjl
	iR8gW+vVB5VlMrG0O2JoHVPmm1fm4MGxiG8vY1fg85aO/wsyKDKlPtd+0oTL12X2XgtjULI3KIa
	PHYxSgT7tjTfaXZn+dA3zC9lI5bf2o7ZNNgFGD9otGhIWWd2LE4uBYyOyuuZF9Xdrg0ZWPKao9Z
	aDo6LvMKB41Nkyd2BZYBazObT+HvP6W5HnvHilO8lzv6PebUxVxYQBiqxQ63XQnHF7m+RB1EBuq
	AvAAhsUB3GlbapbJLyYi3hSLQxnFeNwzsbj4uy7Hl2jOk87qBMMB2MratnMpqCtzcBq4vBKELS2
	r4Vx
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr10625267eec.11.1794808934969;
        Sun, 15 Nov 2026 22:02:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 03/30] libauthen-sasl-perl: upgrade 2.2000 -> 2.2100
Date: Sun, 15 Nov 2026 22:01:41 -0800
Message-ID: <20261116060209.2916444-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132401
Content-Type: text/plain; charset="utf-8"

Fixes CVE-2026-86219, a replay attack in Authen::SASL::Perl::DIGEST_MD5.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...authen-sasl-perl_2.2000.bb => libauthen-sasl-perl_2.2100.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.2000.bb => libauthen-sasl-perl_2.2100.bb} (92%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2100.bb
similarity index 92%
rename from meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2100.bb
index 4d99672840..b9a7cedad7 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2100.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} = "libcrypt-urandom-perl libdigest-hmac-perl"
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99"
+SRC_URI[sha256sum] = "4f0f100aeed34b52977a94b7df973e7f0b8f92d167b09f2b249bab81e8590e57"
 
 S = "${UNPACKDIR}/Authen-SASL-${PV}"
 
