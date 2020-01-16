Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 29C787F7C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 19:12:21 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r11so10392053pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ma+6HvwF8lZVGKZvF33heuPCwCtJ7ylk/munsdjn+sw=;
	b=IP/Vag4PZNrsLOCNa3/vsa1X9rTRVyqBJel6gUvY6OsI+7zNqXWjqQEdMpYxwknWXS
	sY/jnYQE6zMiqsOtjkqNqhzgYUxvL8Cd3BW1lHnze8TOs5aJMNbRx27Nw3FJ6/iKxAPi
	+V8jySGrL5EFkY6DlSv43ueuQPdquDgWg5KXPeVqdnpuYJ/UOFvWMmTKyzcxwMlfJjm1
	bvOVRzDHdlsx41L1QhwmnrJFCowLAKo+Qyy/KfNjBR+DA46NVQb+TxMH1MdcfliV0UuD
	YmEBSRYt20oUpsxUgARCWFksKXWMQHjGV2dhJpwF78gI85iu3GkZtxv1lgJJpRdxnP87
	njMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ma+6HvwF8lZVGKZvF33heuPCwCtJ7ylk/munsdjn+sw=;
	b=pzqsQT/Bb/4HgZCYMGJHlrs8WwwB69qodSxe9vBMGKR7FdnVA54pvP4EA4SY3OdmUw
	+EnWWxFPaVmIi+iws5jXZ+EHBU0srEySiyA9x/+OZm0O8FrdzD/5VBTUZ/LVbzd3YCwY
	8d9dJ1oEHFfY25Iaaj04tE2BQ1TXgk798e651KQ/+KrEZBiXCvYgAlddWau3oIM689Xb
	zjmfHGxVMVe1dzXU/cUPyh7tVmsj+7+uhuhrYeehZDsum8uZGvqavEAcLCNtUDE0+HAE
	vhjF+ZW3O4d1VP8UTV8ETPB9qoYhjbOPx1Nq+BYsn6llg516Cl8ZUU0BctgeMov3sg4m
	L0fA==
X-Gm-Message-State: APjAAAV5p6Q7f7XkFdtwORi8/TbSaYTVsLv4uBybZGaGIfHloXyVBdMz
	EaHqypErsOpI0yRr5bYPD6N+VGfdtlQ=
X-Google-Smtp-Source: APXvYqzZzlxEpvA3Oz+rVBNy7Jm8KsSNKd53XXtzxbaPTNb3AK30Fw58uIJjWiCTDz2yQrwj5nhtMA==
X-Received: by 2002:aa7:9145:: with SMTP id 5mr38882043pfi.74.1579201942679;
	Thu, 16 Jan 2020 11:12:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l10sm4539199pjy.5.2020.01.16.11.12.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 11:12:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 11:12:16 -0800
Message-Id: <20200116191218.2768160-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116191218.2768160-1-raj.khem@gmail.com>
References: <20200116191218.2768160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] ssiapi: Needs boost/ppc support
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
X-List-Received-Date: Thu, 16 Jan 2020 19:12:22 -0000
Content-Transfer-Encoding: 8bit

Internal boost headers are missing ppc support
ssiapi.1.3.0/lib/boost/smart_ptr/detail/sp_counted_base.hpp:66:11: fatal error: boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index eb086817ef..ce46cf5892 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -34,3 +34,5 @@ do_configure_prepend(){
 }
 
 RDEPENDS_${PN} += "mdadm"
+
+COMPATIBLE_HOST_powerpc = 'null'
-- 
2.25.0


