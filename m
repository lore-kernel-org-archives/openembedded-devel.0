Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 407D8786AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:26 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l22so9672541wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4SYsesTcjVhihdyNfEu4L6g2sflmEr3r+MQlppthEtM=;
	b=ihgw8C6YtU6zY/UlzkbPOZrIP2qrYZ9McfvdSbhDeNwyQbRKR/r3U6yMDHBmMqa7SJ
	1o4WUMKZ12enrqktkTJFu0SyNqC4CTKmdu8cbwUQNZnoGodR1pMtS/DM98ipNKbODcfU
	0q7IMQ9tYPaTWNIhDWCA/hwS3yQ/yX6O9qzCvfomGEgwY4SMDHhXpBxVNPAHyDeGEQUI
	oMBF59qiw7Fa5mCgONsYCWtI/G9ndGTY+Jfg3T0U7Z+p/a5gE4agli5WI90ERqq401V5
	qSQNXQRuRCIwLp07uPxNrkhDj5E6bag5DaaqUsMG1pDsCwCvdw+SMxwpPIM1c/B3OzHC
	tyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4SYsesTcjVhihdyNfEu4L6g2sflmEr3r+MQlppthEtM=;
	b=lWWs7UBRFXB4LwAWL5KEhJ7vpk8peZwX0zSuGCUMIzgKFVgVaSza8oopc5r5qv1lWd
	bIj6KUv7i1/5BlANT7Bz+C0Y0OUf7ixbfncTp5HJbKLOmt99cMT9qJ8oAmNMvbm6gIh2
	8RpWELR6w1+gPaSaQ4NXnfIyxC85Dmy6aIlQ6oZyNeaQh+IbZ+wZaokR17puoc5SNvg/
	03jEgpoPHEPH4sEnB8X9iNdpCM/sojUAShK1pfUypRujRHjlfUx+wfex20c/0aLbstB2
	hrSwZhZaXpV0A8Dy/kTzOQRPeYANffWugymhwpqkW7j1fxfZvUg1S4eOR2Zxr9XzAC71
	KQBg==
X-Gm-Message-State: AJaThX4tZ9vY/MLzVXf3OwrNtlqrsoGlbJjPLE6VLxqIYsn2DGbY02HF
	CNnueHZ1Q67MUk55GtcGb2zqVA==
X-Google-Smtp-Source: AGs4zMaOkj31984prdMn28aI39CY6KXh76mYL8gij6ZBpOk/4dhWdHWKs/CIc6Ny9kfg2/46gUzcMQ==
X-Received: by 10.223.157.138 with SMTP id p10mr5303000wre.28.1512126507708;
	Fri, 01 Dec 2017 03:08:27 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:08 +0100
Message-Id: <20171201110816.13519-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] poppler-data: update 0.4.7 -> 0.4.8
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler-data_0.4.7.bb => poppler-data_0.4.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.7.bb => poppler-data_0.4.8.bb} (90%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb
similarity index 90%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb
index e530a48..343b6db 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
            ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
            ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
 
-SRC_URI[md5sum] = "636a8f2b9f6df9e7ced8ec0946961eaf"
-SRC_URI[sha256sum] = "e752b0d88a7aba54574152143e7bf76436a7ef51977c55d6bd9a48dccde3a7de"
+SRC_URI[md5sum] = "00f8989c804de84af0ba2ea629949980"
+SRC_URI[sha256sum] = "1096a18161f263cccdc6d8a2eb5548c41ff8fcf9a3609243f1b6296abdf72872"
 SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
 SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
 SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
-- 
2.9.5


