Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91764601D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:25 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b32so4539880qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=vwsukiyKftAmcXuppv4tZmArYi90PYkFnvKiSyRFh+0=;
	b=kOBlYexPDPozfsV2GhREtJcMp6lwLH3gusBxzUJ/5QkWt7WXbcUQ4n8CjsX11ShsoO
	6k3l4ryqwBGFaP8KQu0tLeV7sqQ26kvAavcPyTPS2fBOdfBUH8CrhbDnPLqvYwgSmarz
	c44OeOyaRnkYnvnc47zEHkXg++AJdakj8pEHrdoO5PInMXf2mi7nWLhojXQ2CUXzJACe
	/uuTTUSNP4Ly9iY1eEhfBJpdDLL0s6thUz6UH2fbcmlomgit4F9oHRtMejJeCYy39aC4
	+mIWrNl8vovYyTdd4z7/ZJAfIK2A2/xE6oguWSY27eHpS3UOx8AaqwfzvTUDWqwvBEL5
	0wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=vwsukiyKftAmcXuppv4tZmArYi90PYkFnvKiSyRFh+0=;
	b=dyj20Ce+dHtswfEDbCOaGQtAlkEl7s62fxsaP97yeLKru60TtO4+fn6h4S21K+zskm
	nPDMahLAkVQ/bUZPmYbwVABj3XSGRGcpJQrSB1e130icJMxXs2UXX1YN7XF+ZlUeBDTN
	b6tepH1ejlkPEd+COymgxrcliIktrUCaSLjCGNpbsFOu5xHsQ0T3tZOqvFWy2iFfC+Cz
	zL0iH0JZAKqK/6HceusnaUl5d6EpzP0iXQqsmUeHgVuNGRldUlexcvI7AWg2AmHJVnhW
	6jOKh839hfK1qke8LvtDpzjjkqttcqfYTEgS6ETrnQP9LOjXKwTmT/zeH7EDgVoMm/aT
	M4XA==
X-Gm-Message-State: AOPr4FV5KmbVCoXd/nor5DDcG3rF9Txqn4Yfx5nMutjcdJ+7jab0mRj7kJbH5EA5sIJhtw==
X-Received: by 10.140.87.98 with SMTP id q89mr11183822qgd.8.1460553446294;
	Wed, 13 Apr 2016 06:17:26 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:25 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:53 -0300
Message-Id: <1460553420-12533-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 2/9] python-blinker: Add recipe for version 1.4
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:25 -0000

It's a fast, simple object-to-object and broadcast signaling.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-blinker_1.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-blinker_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-blinker_1.4.bb b/meta-python/recipes-devtools/python/python-blinker_1.4.bb
new file mode 100644
index 0000000..0ce141f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-blinker_1.4.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
+
+SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
+SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
+
+inherit pypi setuptools
-- 
2.1.4


