Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.2255.1615660251633903753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J4BkowZU;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id p21so17950629pgl.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 10:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2snidSZwYOnxGfP2YORn1XgMRbHzgedlYxvGgHBMf+8=;
        b=J4BkowZU6EkFLx/8M3zxiiMGvoLaeyhVhNuSRB/cf2rX5roWde7qoxQkjMB5XBmww8
         hNBZE6BhiPd8fTHp/E24PZEmEWH08+o4fdFT607mFBrlaY3NDjqpuwD+PQagdBY3dS6T
         +n62JgS5zcrDXhM06VXjy1E4xTE5xeGovJHCHp3jZZwePiDmRqbcwuSg8drQ6RD0mbT2
         yjzk6ItKAZXhUSID1J4Wv1LaMfof+NSu+PulqOTsMpw7tu1i5OPMFhUTS6h8E10aYZPQ
         3eFj6GHK9sxmjQ+F95Z9WWrkStEXe31L6XJToNAYnw7bo7bIcsJP0UbnlpRKxXRQ+H9r
         murA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2snidSZwYOnxGfP2YORn1XgMRbHzgedlYxvGgHBMf+8=;
        b=Na3nWgmUwWextYwO8TXQzcqvDq0J+g3IGUFwX8DGR6nRuO3dwqHifATvmITDcqeqNP
         XlSpHo2e+v37/Y2nkfxMEabTUjBund3oDgKSxfGgn8ZnooHSVplquQ9/RKiMkJBJoWY4
         VY1dBPgqTGhLpvQQFiXZKYJ8aKWiGZoZ6gE9OKiC8DoD+c3hB6+YjpkaV3cZFYF6QkJF
         nW0q71hxv9UBt4h3PKRJYcc/R5GUO7uCssfB3Vfk3/18VjrAYF/tZrfF/B6z5nOeDHcn
         SdIW0X668ly/JQaZniA+QJglIslCi4kN09o/lGZGK5jnF5yQcuqweRPYl2Cb+8SDcXjz
         s2JQ==
X-Gm-Message-State: AOAM531Ys69/FVrIcKpYgHfqzGsKaUFTA7Iu+21qzuhYxjIgsQTUv5dF
	qdSxG50AYABnvvjVwr3LtGXNRCvEQMGxtw==
X-Google-Smtp-Source: ABdhPJxqhOaH3yY2ej030nPapHWeEoIpbNPZjHxfG1d/upG8wowBCqONETD617N82C6avAHZkhne0g==
X-Received: by 2002:aa7:991a:0:b029:201:b736:c556 with SMTP id z26-20020aa7991a0000b0290201b736c556mr3731608pff.8.1615660250781;
        Sat, 13 Mar 2021 10:30:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y7sm5915317pja.25.2021.03.13.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:30:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-grpcio,python3-grpcio-tools: Enable build on ppc64/glibc
Date: Sat, 13 Mar 2021 10:30:47 -0800
Message-Id: <20210313183047.402000-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313183047.402000-1-raj.khem@gmail.com>
References: <20210313183047.402000-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can compile abseil-cpp now for ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 2 +-
 .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++--
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index df4fcc8826..c6ac19a225 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -449,7 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-zopeinterface \
     telepathy-python3 \
 "
-RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = "python3-grpcio python3-grpcio-tools"
+RDEPENDS_packagegroup-meta-python3_remove_libc-musl_powerpc64le = "python3-grpcio python3-grpcio-tools"
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-cryptography-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 475b4e6063..6758429aef 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -17,6 +17,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Needs python3-grpcio which does not build for ppc64le
-COMPATIBLE_HOST_powerpc64le = "null"
+# Needs abseil-cpp which does not build for ppc64le/musl
+COMPATIBLE_HOST_libc-musl_powerpc64le = "null"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index fa030b99e2..13cef537e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -44,6 +44,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 CCACHE_DISABLE = "1"
 
-# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
-COMPATIBLE_HOST_powerpc64le = "null"
+# needs vdso support
+COMPATIBLE_HOST_libc-musl_powerpc64le = "null"
 
-- 
2.30.2

