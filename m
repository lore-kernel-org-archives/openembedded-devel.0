Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83043CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:43:09 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.7492.1760499780144917553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2oxzB24;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3305c08d9f6so447687a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760499779; x=1761104579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GnxRdp03qBg1y4dPH+C+m7Y5QHYygzDnFMruz3/Wpw=;
        b=O2oxzB24zXABPmZUnw6UncpA1uQe1AAMk+StcDmhZIhweRr6wKWiB8ja5mGUx0DnoV
         PA5hnxUfBZHV2+nBB36Frqw7Gu/xD6SzfOZugEpdlFofUlKOvAe8wa5zLvpw0nv9jBk2
         bjbVF4xcwAe7faJlVDDo740QIr6o3b5NbaER9WBpCN4xiuTDKa3W9gIsCkEAFYJZdAlZ
         JB39BmCOAsAG0GRCACekaTJeAqdXswRiJcKKl+bAXdgCE0DaQbuQNufhm5jASSLZwS/a
         6B3UvyUJWRti9vBPeusnpjvvM1SV21Om3NZavULOH2KUJUmXzooNCF6NWPYPP01Fdki0
         Xz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499779; x=1761104579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GnxRdp03qBg1y4dPH+C+m7Y5QHYygzDnFMruz3/Wpw=;
        b=lgw/NNMgJ5TQlmw1dHzFp5+gZPHbimlVhU+xsfoVvMmr5M3f3EvfY//WBRbNkRMfm/
         cRx4FXjxU+zNxs01a4LjtxhNoaYEgLt/5f+k2WCxpO/f+rctC6r2lgyRE9R6UZGVg42f
         MaX7ftoBoe8wUDGt2Qhmnqy0M+Jr/h4EI4/T8b3GdNjmXLpGkk6BHej4p/5Lf/T17Edp
         epqffpBB7usQEqa07JwnmtziFQpvnfvO4kTt9TMbdYhRe0xRo4jZE2JOb6WJlKV6iDOM
         J9RczgmjZta6Tdp3FWYcNtQ21FsYRRtph5J86lHBJZFNx+zmPJ6pmy4vnPj6M+5mpvqU
         m3PA==
X-Gm-Message-State: AOJu0Ywppjx44IJK9Xe1zoCuIKlTZLyZ+DeyKAjyYA7LeI1qNCWx40an
	5oM8dDH0b+7v2Sg25PWcN5Iz1DAoY9v0kZSBKSktkWIHJp/tB5LDN7Tc9Fhp8g==
X-Gm-Gg: ASbGncsmmmmM4pnXfA3zYP/9gPSy0wBBzUf320HEDA0T3VCXbTX7j5qHph5fzRxmQcR
	073IPTaaO+yTsb0IUTx8qNQh0E3HTeEZr/rmaKFMEOs8X/soOaVBEhaUUDX+noSa747OlSjLgZI
	uffd/T8baS/ekuVNwok926H0y/Fuy26uixH0rI/9s/wT0Uu2i9epb+Nm+YM44P7phwuEgtpLdhB
	n/IaxC8dAHIMUchuVyDaxlQt1Q8wIogyNIMtmZBMKGFPC/9WD2BiQ95j7a/J6YMGMETY41MiDN5
	kx7vqkXoH4g1au+7i2lZLi6cxyuOelCFxe7v6YLho2ek//6qtIHc0Phj8HT5U2XI9e/CTAxDRmT
	pcqGIqy340lj4qPONA7JHw2peJxkq+JYAtMKQxH0whDTXAUrukoXEVmbHBtJNfN2+aQ==
X-Google-Smtp-Source: AGHT+IF/d5F+BurJgiPOHamlC8x9hkSEfkxXiNUuPf4gaVf2e4NkEac99FCr6j53NnsIIEJPjaXztw==
X-Received: by 2002:a17:90b:4984:b0:32b:94a2:b0c4 with SMTP id 98e67ed59e1d1-339edac69f1mr41535568a91.16.1760499779212;
        Tue, 14 Oct 2025 20:42:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a096870a3sm888627a12.33.2025.10.14.20.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:42:58 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/4] memcached: ignore disputed CVE-2022-26635
Date: Wed, 15 Oct 2025 16:42:42 +1300
Message-ID: <20251015034244.1445689-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
References: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120680

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is a problem of applications using memcached inproperly.

This should not be a CVE against php-memcached, but for whatever
software the issue was actually found in. php-memcached and
libmemcached provide a VERIFY_KEY flag if they're too lazy to
filter untrusted user input.

[1] https://github.com/php-memcached-dev/php-memcached/issues/519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 889ccce6848276fa68b3736b345552a533bc6bd2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 270ad5486d..7234f02a13 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
+CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 

