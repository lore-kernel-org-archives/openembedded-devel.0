Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 15C3161892
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:13:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p18so680178wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VrcLhBqYNERpihT8mheB2F3CW2GxQzs69JJ0q1cBAsA=;
	b=prUOvLFOLFSjiB7t4Rmw1+SP/HK+zMbh49JWrFkoONX8WTUEAg6tvMVnvQh3C806di
	KSIyYPC16GfE4BWlSvfgDtuYbdfc4ySH4zXKyBvg1Rl6r6ykXfc967V6sy3UUSHKqq0a
	+Wv9kTR6magWxq6EGm2QnkzXPwe+slc5RLFeGWnYem9MDiVTH4MqhOI8qcp4eAfc58dm
	/sdp3XXd6cV+iJlDOJ7EMGMSjWm8+L78PUW27zhBBvsCo4SreG0oQ7MLdVynZR9Rc1sd
	frgg2tIgc1B5jk+skmrkw4g9XEqm4qUAYAJLWrmH11OmYXqgNCm0LSCsF1W9wwZYfBTU
	HmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VrcLhBqYNERpihT8mheB2F3CW2GxQzs69JJ0q1cBAsA=;
	b=q8jM6ZWNy2qkIEM8Vu49WCNuBUn+31fWclFHpWsLRvEKhtjyf3AvqGoVAgOZ+K+/q7
	/nzD2K+GQSLzqLw5wCWMp3mXDU2y6qRCsPVq9CWz/5lyBbTZAqFZT3mlYye8NcJRa37W
	K20zdCzxNZZW0RVnjWaMqCPC9WtUnUjzooaK9jUNJsaWEws6fOzXaT3JYk2GWe1CLhbs
	y28gY8A6w+ZHbJzxeqBw1U8weMI98oz+twUfPuQBi0XlCVcQYtQ9ZC2azosRiNVejUd7
	6xO5NrhpTGKKTgXmlprvogZxhng/4H9j7IqnjildiXZ1ArU//OIfoMZYPmJGuURClRra
	XCaQ==
X-Gm-Message-State: APjAAAUxNBzxbXzM1UKvB9+gnpjyYL4A6aCg0CsaX8oJ9TCdA4XLF6V/
	x/crfB0fDSRayl4yRPsIyLyOYkrC
X-Google-Smtp-Source: APXvYqwbUhJnAd9keYBmIb1lBDYhc9NyPeZqplkgRuOsV6DBMsWKn9stEeNezcmQR+3k/FVb/reBdw==
X-Received: by 2002:adf:e48b:: with SMTP id i11mr946498wrm.376.1582841582495; 
	Thu, 27 Feb 2020 14:13:02 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.13.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:13:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:44 +0100
Message-Id: <20200227221245.22944-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] libgee: upgrade 0.20.2 -> 0.20.3
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
X-List-Received-Date: Thu, 27 Feb 2020 22:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgee/{libgee_0.20.2.bb => libgee_0.20.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.2.bb => libgee_0.20.3.bb} (77%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb
similarity index 77%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb
index a048e4832..576eff6d5 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb
@@ -18,5 +18,5 @@ do_configure_prepend() {
     done
 }
 
-SRC_URI[archive.md5sum] = "45db478f2b300ada8e039ebc6c9458de"
-SRC_URI[archive.sha256sum] = "9e035c4b755f46bfae70ba81cdcf8328b03f554373cec8c816e8b5680f85353c"
+SRC_URI[archive.md5sum] = "e574b3952b93d219b5ec7c74c5892c33"
+SRC_URI[archive.sha256sum] = "d0b5edefc88cbca5f1709d19fa62aef490922c6577a14ac4e7b085507911a5de"
-- 
2.21.0


