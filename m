Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C177F78260
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 12:07:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u23so7628682wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PLPL7Sm5iQk2tR73TH5EeZFsGMAwqtvT4OT8TVlZ9k0=;
	b=SWwxb/OZjFfdBKLBK7zpqyv2r2YVLEzo4YfLNLCk/Lz+9EJHJUQnVVOip3bQvipOl1
	3Z25GXc1yF3k7OOgK6TmzhUb2zmvPAOtYpB/WMwbtG2nD8YNMQuYMW8rPdgz7nETwgyJ
	rfpHsGA/HCKJfbIN46qCo3VflXGT7hEK6xbsn22NOI2iKDDf/mR9qM6gq/6eihZeMC5t
	uESq86e/uJhtwE4coMkr9a2V2ZiHPfZw+ktqNZt0b03Ly68Z3YLnRtk7k8aS0BL9BwmM
	SiX31mo9QDyOin4oUxqYjP+tVQrYy7w46LI60QG8MrvcfL7104qutQRaGQYfkyRKYp5K
	/7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PLPL7Sm5iQk2tR73TH5EeZFsGMAwqtvT4OT8TVlZ9k0=;
	b=D7L6jgj8Q+Gw1639f7FJyYnfpV4JQfg2gag5MErcri4cd8+O9bM7K5gTeSTajMmsJq
	JK6p1tmWZAz/5tr8GAyvkUKXTmczhk0bdv618KE/3BRm+ER3RrvqB4nhGoZDKBmrA4ac
	5VGOWMYbVI5ik2mYmM248lEJPUH5IYp8nhBMgaKIweQCl7uZxfSNd8kG/wcCHccaKPYv
	PrnMvem34Dad7u+5H/7RUhKpdZcJZ1YEumgBCSJLKCcumiDxTjgn61znImHWvlfjtNNi
	Z3M183gayduZgewWIuHyycugZp7FZkv5DuIWlcfDQHAiPppbtwwi3wpKA/JhEd6TXMIQ
	ZEEQ==
X-Gm-Message-State: AKS2vOzz8+6hv5evnXGbEQ+yWDUD1EoX6tqgFZ6aDr7QnmCJoIpluvBv
	OesrRhFp6SMUPbU8
X-Received: by 10.28.167.205 with SMTP id q196mr15275323wme.54.1498824464210; 
	Fri, 30 Jun 2017 05:07:44 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-134.hsi12.unitymediagroup.de. [109.91.251.134])
	by smtp.googlemail.com with ESMTPSA id
	d91sm14159496wma.7.2017.06.30.05.07.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 05:07:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:07:30 +0200
Message-Id: <20170630120731.3745-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170630120731.3745-1-schnitzeltony@googlemail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gegl: update 0.3.4 -> 0.3.16
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
X-List-Received-Date: Fri, 30 Jun 2017 12:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.16.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.16.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
rename to meta-oe/recipes-graphics/gegl/gegl_0.3.16.bb
index 90f0216..b6026ee 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.16.bb
@@ -16,8 +16,8 @@ PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
            file://pkgconfig.patch "
-SRC_URI[md5sum] = "c19478321594d715a4cb324a0decda6f"
-SRC_URI[sha256sum] = "846290a790854d1e6b7c17a2d6f82ad7cb14c72e240bd3b81b98cc0ceddbc3ec"
+SRC_URI[md5sum] = "e4a523420c5f050c0ca0187b3758ce23"
+SRC_URI[sha256sum] = "11174f20d01f25d4b5425ff77457ee00fbde7bc26ea4b1ff0765fc1ba6028006"
 
 LDFLAGS += "-lm"
 
-- 
2.9.4


