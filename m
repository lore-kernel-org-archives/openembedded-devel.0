Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B55C52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:49 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.64582.1723135128420132399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mXwvtovD;
 spf=pass (domain: konsulko.com, ip: 209.85.166.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-39b3c36d297so4052845ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135127; x=1723739927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Anf+ruONGKP7JXm7aVdSpAKPvL2cIa98EUiaEINm+OY=;
        b=mXwvtovD/4JteXyRI79ZPyG9HBVruVrn1yGwOIonr0+XlJnZPnKE5U4pj1CBkKrTgQ
         EgluZbXVA8BIPjCMnJ9lODk9kYaZq+d3FvR17JokIGm60mhbKh5fX4i08VzeZ1hcm50E
         lU3svFq+zMj7PSmQGkt8W/+dDGxvjCgVLVcdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135127; x=1723739927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Anf+ruONGKP7JXm7aVdSpAKPvL2cIa98EUiaEINm+OY=;
        b=rCVNgHX4k2Y8tTvWZ5+PbSktKlCDeTLWT7Iux8cnt+geSlENiglDzdG2SHb89aGQxy
         GPOx5tQKUlA40fcnEkv7zx7RwxUXkWD20DLGnDHE5ban7hKS+ybPEeIWyBySg5QefONz
         994q2KweFpV8w2NZFspsgDBAFLU6Urko3d7B+Fd6oCOeM+Jz3iVCpU7DYZzZuQgsu428
         gPBVhUivR/Gubts0NrTOdaUECswMB9mtSths8zYlzF61XIHt/LbT+i6nQRuwIpvfgf/k
         MJM1pQrtssCC0bDnUeR8O+1HQwe6GBT5WrQheLdyEZi5OckZmPiu+cC76QrEuqfavq11
         TJ7Q==
X-Gm-Message-State: AOJu0YyXi1fYHIEgReTEU4zlgga3zuEGzjL6kfSOW/8iIm/g4BsKAecB
	HsR+2ob+Ld/mSsGw/jDFUz4R8DYvVymmbOZVlRLpsaPN2c9ePLxhcU01n5B/9qX43pEOM60182S
	xOSg=
X-Google-Smtp-Source: AGHT+IHBreLhl53UJmOLZ04T9y0xheYdgg4gxLWJfRYop8qCubS04x8ouJKgmKC0VqOOjR/iJi4UBQ==
X-Received: by 2002:a05:6e02:20ea:b0:397:3a28:94d7 with SMTP id e9e14a558f8ab-39b5ed67b05mr29940255ab.25.1723135127142;
        Thu, 08 Aug 2024 09:38:47 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7bc54c72957sm5122650a12.85.2024.08.08.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-tzdata: add recipe for v2024.1
Date: Thu,  8 Aug 2024 09:38:38 -0700
Message-ID: <9502c729a8f49537d10d32d56fc71dbf55b9e462.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
References: <cover.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111670

From: Tim Orling <tim.orling@konsulko.com>

Python package providing IANA time zone data

This is a Python package containing zic-compiled binaries for the IANA time
zone database. It is intended to be a fallback for systems that do not have
system time zone data installed (or don't have it installed in a standard
location), as a part of PEP 615

https://tzdata.readthedocs.io/en/latest/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-tzdata_2024.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
new file mode 100644
index 0000000000..d73b27a4f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Provider of IANA time zone data"
+HOMEPAGE = "https://github.com/python/tzdata"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
+                    file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "2674120f8d891909751c38abcdfd386ac0a5a1127954fbc332af6b5ceae07efd"
+
+inherit pypi python_setuptools_build_meta
+
-- 
2.46.0


