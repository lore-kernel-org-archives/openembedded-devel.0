Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2CC71AD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so10013860wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oeFgDjuCAvHvoPLg+I8W7KG9YCK3LWIr8ZUxTS7N37c=;
	b=uJbv8r7eVbQUxqE3RQbVYzeItIHeP3qn5crswt5blXP4sT3TZAHIYuSuAWifqD9TAa
	wfK1Y51s018FhAySYMl6DtDunrYikIxNuUJzmeIRAWGkFQhAPnUYfGbhpHD7ygLtwPP6
	n+zBLKdnYW86OyNse1J/8Jcd3kJdK4cVameVYlcdYo4vFp0XWL1G5cN1ARXwKQRRR4Lb
	CJdlDRfRNYBxEKXjFV0XsHikKs4wPRE7mlG+HF9cZQ2JaNGhciwDOOeup66xJ/1+gBR+
	RyTc2z/hnPvFSlUnszte2lXKRTJeLyPiTNEZ+B9piWaNsb0Ah17/0p47aK733Wn5HZD6
	+h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oeFgDjuCAvHvoPLg+I8W7KG9YCK3LWIr8ZUxTS7N37c=;
	b=NZqSyJgCW9eCtmtCGxZ/IM9r2figXQGWGqu60wKXWBhImz1sFo6Fnz9AQGlrTCnq9H
	bRELgniWvsUwNDZvs3GQSawykYYl8AXP6ynrKdGIYNWlkg9/IcYUj1Q3URAyspt0THk8
	0/tEY45m4QqhwMuzzV5p4rNCLMRl3fLZaqvUkU6lSXDyvQIiACEsnIE7T25G3f4aNbOe
	SS7jOV7VdKa1KUmIGVOtJiEbOzYg0iW4jZe5K8NQ04lB6/CQQ4VJIwkgo76zACLfMLCB
	zO79XJlXTd0JQWUjWNf4eMDAq5mfPBFU6OmdCagBMNK0W9YJ3vIFwL4Bz1nEYvhnKVE5
	2QiA==
X-Gm-Message-State: AIkVDXLdz8AfmiPwcKVN37cJ3qhFQ27eJKQeCVhtUYLmwMQI6iUNNC5hnLGV3G6cTuW4xA==
X-Received: by 10.223.135.43 with SMTP id a40mr7053883wra.197.1484812425242;
	Wed, 18 Jan 2017 23:53:45 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:29 +0100
Message-Id: <1484812412-26806-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] jack: update to git master
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I am interested in dither random generator fix [1]

[1] https://github.com/jackaudio/jack2/commit/0279a2d65a36d1378f5bab56d95bf9e99cc8cefb

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 66cec0a..ba074ad 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "libsamplerate0 libsndfile1 libopus readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git"
-SRCREV = "364159f8212393442670b9c3b68b75aa39d98975"
+SRCREV = "0279a2d65a36d1378f5bab56d95bf9e99cc8cefb"
 PV = "1.9.10+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-- 
2.7.4


