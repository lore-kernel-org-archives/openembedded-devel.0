Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C66E9B259
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18699.1771933479112457880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q6vvhGmf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a316d89so4921617f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933477; x=1772538277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y9qc+DNslvevr6iwUkR4mf+Ci1efwGA6oFhzSpIszs=;
        b=q6vvhGmfr4dATHTKO/igPi0c7BzMRu0pTlzZwu9Thh7GD7iWalbEtSFM/t66fi55AF
         7XDS2K1NP9RLC9wQKK557czPwYrEt49HIdcqS18wBSwmyXP1e8ouCXBOiZ8wIp9QUzeg
         hVlGujADhYjgTNJBpqFC0TM904aB+vVonDhFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933477; x=1772538277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0y9qc+DNslvevr6iwUkR4mf+Ci1efwGA6oFhzSpIszs=;
        b=V/VNn20JOM/ODZ8j74R4273kcx2d2PSYxRm73BwoM3bQH/zJOrK2EZeZTZw2c5Ty0N
         BF/36YY1tKaU/LwztzIpP5rwKG4AzAhxH7Z+9XEVj/RmZqrjaUhjLf8VSNW3TdPht6k9
         tdVW/3JjU/TOfhgPFnUg4ctd5BUaNzuW15A1l6KiAw530fXwE4oMqw/VM21G7b/e47b7
         RX+XmQmOO0Z33d4uGPESUV8pQ6WzrHSmKVz2x81J4eVZvpEhvIKR7WUuBqh3amPqWJKk
         k1JLRo+oV64suGESvqzlzdZkZMMI6I7YVWIH8FvsmjhGoZ/wM8oT3NXK0bLxVpb3Qxlg
         /UXA==
X-Gm-Message-State: AOJu0YzFAkCeT36MxqYsCprulr4nI8AKJDzYA4/UUu95U6SAGYKUYo6/
	qul5JPO+gRO+Cwv9am570LQaY5xthfAmlvOFa/guHEEyf+VyrVqC2J43TBXmatv4kpTwVCepD20
	VHAg1
X-Gm-Gg: ATEYQzxkGjofQdRovfVn2ge5fFR1rdYsrC7zDry/XALwnQm8NePbf9OOIWyEWJAzBm7
	X19KF38DPUNzM5015ydsT9pqMII5FFLSzbnHWm3AWsgRv26EHYE4rRr38V1COaD8KGFnjYJ5EGX
	6/B5YG1wxIiIWJURzHbtFuO9zLw9CaG5JfWKUXkkx/1bozzwOjOq1apers/DkoA8DuvTk4ROeAA
	TI/mA9GuDioWjO3Q+xmLSBh43b9yL302/1+iEXOyk1SFMcRvMpsZs2wCMCVfEOr6SWdzQc9eTWh
	6rmEsOfLisyRv32laxclpWPxY53260UXB0BYzGH/xv4gfES4OVsmNhfHLuIDHPEpe5ZefpLxVbK
	L5QHpCwmF+tJkmuM3UjxrkpIX0taZ2Ymvu5nwEvyZNEP0G8a/lwSKxG8qlR8tV9YNtCST+nFQFV
	zZK6fvA+SQlBFpqbyw+jV7M2wO+m9DNmUNgCKr
X-Received: by 2002:a05:6000:178b:b0:437:6d3f:a056 with SMTP id ffacd0b85a97d-4396f1753efmr21847933f8f.32.1771933477097;
        Tue, 24 Feb 2026 03:44:37 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/8] python3-flask-marshmallow: Upgrade 1.3.0 -> 1.4.0
Date: Tue, 24 Feb 2026 13:43:44 +0200
Message-ID: <20260224114407.1760757-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124577

Upgrade to release 1.4.0:

- Add missing commas in error message for validate.FileType
- Support Python 3.10-3.14

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-marshmallow_1.3.0.bb => python3-flask-marshmallow_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.3.0.bb => python3-flask-marshmallow_1.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
index f0cc8ef64f..189ed5335b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_flit_core
 PYPI_PACKAGE = "flask_marshmallow"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "27a35d0ce5dcba161cc5f2f4764afbc2536c93fa439a793250b827835e3f3be6"
+SRC_URI[sha256sum] = "98c90a253052c72d2ddddc925539ac33bbd780c6fba86478ffe18e3b89d8b471"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3


