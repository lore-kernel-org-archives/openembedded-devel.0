Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CDCD174C4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:23 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id j186-v6so3634192ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AbnIhW3Cm0n6jHtTEOpgJjMpix1+f2zOLLyk1ArFCbc=;
	b=CHIwkEwaO6i63eAluQbjX4VzRLvq0MXYvX4dnxaXn/nR8n3gn0V7ZG7TBOCgmWOJoj
	tBNeJ8CGhAMdkP3dnFefLOgpN3xeXtbduNN6rP7opbGy2QKrPD6ekvo3t8ZUVEpb+0SZ
	RVzsLEr6pb2Kps2qxqbISdxN0epLMj+TQHHmnoR8n7mWV236PyWKNIzyRwtgRDddcCCU
	nkVb8QZ8g33gG/6XANe79YqulZaQouO1fnf/b0ONe831WDwMISvgX+LCclXUAswj5Zy+
	w9jp/1acI2qVfpSACxMzCa2D7SgAI46ctZfHcOxjhCmzRKcXi1LaDOF2jnZsFBWLySem
	2Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AbnIhW3Cm0n6jHtTEOpgJjMpix1+f2zOLLyk1ArFCbc=;
	b=ooIgt3Rh6atEKhgAyZm/jnqHiB7qJHKB3uugUF4pnkY+IiBKDEx54aub/97fYQxieJ
	GCMY8l9Zomk47exqDWNs5sNiV0khoVtwTLvrmvPBZWRHhG75YWRteOFYy5vCdfHio0RS
	WBDgOkhkrpyK8SpxYspJtlwy672IpXe/5cxAik7GSuw9GXNZvw+Ls6yzN0vFPIue05NZ
	baYBEbbZ/01ykQj0fAwIjxmmRT5B1pj/bglC51U3kzHSx892StE8I9TjEopPYmLoHb7q
	nB20all15z/otcvIZIecewgsaM1HOUAMnrTpZrRL5rjxqAPoaExPSAd6A0sN92W/BFAQ
	CZ9g==
X-Gm-Message-State: ALKqPwcfYHOdSgwB7cmFtjiuFVhT8AjVhDb5svFjF6yu42ST+NLs8Z7+
	FdUKd+rPFT02I2MtTqX9eufsD4kw
X-Google-Smtp-Source: AB8JxZr759wqzI/ZV8imYFjTfTUAaZUMzYQbmoQQvKCB/Tu5xAIcp7Re5KO1/Tqf6huVl7XawWDLBQ==
X-Received: by 2002:a24:f987:: with SMTP id
	l129-v6mr1210912ith.148.1527186444759; 
	Thu, 24 May 2018 11:27:24 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:56 -0400
Message-Id: <20180524182659.19986-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 08/11] msgpack-c: variable cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2018 18:27:24 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index 3ae4c1f879..690a7f444b 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "208595b2620cf6260ce3d6d4cf8543f13b206449"
-
 SRC_URI = "git://github.com/msgpack/msgpack-c \
            file://0001-Fix-Werror-class-memaccess.patch \
            "
-
-inherit cmake pkgconfig
+SRCREV = "208595b2620cf6260ce3d6d4cf8543f13b206449"
 
 S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
2.17.0.582.gccdcbd54c


