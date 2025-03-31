Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19479C36019
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.3926.1743454883820646603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFIGHfav;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so780828566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454882; x=1744059682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l7KCTTZlSntXbnZ79u4NmTK7QasIypXD1ZfJRFn5lU=;
        b=cFIGHfavZ5a/qsn0IVoQIiucY+VhJVNiA+6kzj2/oPj5TLsafb+AfcdVFuEd0qyoyg
         qSE+lAtMnrZ8MeCogZjWT5uVFQBNIGx6OX2FHeaX8nAKyxGrBMoFZQM+0O7JB9D9PExj
         J28CMNYKKdWK3pQ7GLtHC+WlfQ0jIJ7k3v/QVEOPddMd/56zRfYY6UNPpFWsWtwBLH3b
         Xoh6V6VhrhOr8rSAAhMnIRlUQ0pbUWIJYHVaxLAw7X/slg9ZllNUknBy3JPSaaDPhpAt
         s6SsWWmlvOUMmTyoDGUW5Q8fOA7GHXCpmz9jx05p4Fq32gJPMw1E+kklkq3CNgitGUNT
         l4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454882; x=1744059682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l7KCTTZlSntXbnZ79u4NmTK7QasIypXD1ZfJRFn5lU=;
        b=p9mpDizfX78EcuTHeRB50UXdULkH6b0L7w3UHIVciIrGtCDBz7L1baOc1cdTIP/pqD
         KTtLQihsrULf3BgVWWf4LU8rNEFeFqopvieqXSssacw5DaV7LqBpbHVA8BCE+VMvUd7X
         Q7wPBmQ0Kv2qSN3i+QTzTvTrwPGGi0AHJm7a7WNxTc4zHcP7RR26IDED7Dzag3OsfwpV
         aRTJLMaaf4wWNZvgsPRUBSCb+EgNyFXLCQXXFNcwJxrYD5IggqdUJ9ATCQc4QClS90pW
         yoDHzg8YDoWGqDxwAzzfvmY4hHB8NFPr+pkOXlbWDPm2ggkI2AKjlWUX5qonk5Gdbv0q
         IPMg==
X-Gm-Message-State: AOJu0Yy1MHbSRCG8wdOfJoMcHJxV3kANZtSEueKfZyuWysgLNFVY/Kg0
	iUcv7MLFuJGNfZ/sYQy77gaZe/ex4foyEWiRbY3WI88tP4W8ilRSGvbRpvhT
X-Gm-Gg: ASbGncvjJ4dgj+OfW1Z/zNNoxnQi9ynKLyfRmsOfqNv24kDCqMGECg7Oaen0PgzZL4H
	h2qo6HB/sBXn0ggsjdTMpMQle9JljSMi14DcfHdjCM4ltwEW45arbjU+/zCiJE6YizUF2FlhhX5
	iKP36vQg8Pk5fZ1se+s8vY82cTpFkAEvmOp5YuM7YUIRRHFddb4SviXCOPE4q+Vhpi0HlOpRp9q
	L1zvE/cLvIR98ym5aNikiVFpYHz9hgENSDMeu2RXO6mIC7Y1vV9Jhd5/m/82OZOG0OthrwS+ZvL
	RnWFROXR8LurOyoqyEG1RSGx7b/iv/2TRztzORjLzK2SArA=
X-Google-Smtp-Source: AGHT+IGziJb5A/wQpwYUkEyMWhWk9JmQXZQG4Bi1DKRnRk8dEs4KbuLH+9JRa52GJv8VZIyDFCwCdA==
X-Received: by 2002:a17:907:97c9:b0:ac3:3fe7:b254 with SMTP id a640c23a62f3a-ac738a152d0mr991554366b.4.1743454882084;
        Mon, 31 Mar 2025 14:01:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196e8191sm676899866b.170.2025.03.31.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 10/21] python3-pyproj: Remove absolute paths from cython generated .c files
Date: Mon, 31 Mar 2025 23:00:50 +0200
Message-ID: <20250331210101.3460858-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116446

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pyproj_3.6.1.bb       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
index 681678306f..f6b6ee8a46 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
@@ -23,3 +23,11 @@ RDEPENDS:${PN} = " \
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
 export PROJ_DIR = "${STAGING_BINDIR_NATIVE}/.."
+
+do_compile:append() {
+    for f in `find ${B} -name *.c`
+    do
+        sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" $f
+    done
+    python_pep517_do_compile
+}

