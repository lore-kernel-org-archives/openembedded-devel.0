Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD8960721
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:07:59 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id m8so6268026qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=E+AYYQdaoEYFA2DRBSjAjcOfs7OvVTjio+a/2f1I2CA=;
	b=ldljLTD2r0llJ0UXll4aX+LHW4OjExCJ+ZfLSCldujnQ9BmFCCo38oojaHPewl+pIU
	8dUrykBaHwFAFNvhN4wP6r3l90f+GiUoBP7Mtby6XYlYX85lDjlDgMtfLtfMGxboVHZK
	ScYOvPPFxafFv6QTDGo5sKEzBxW9Hp0Aijc2HbzE3tJxmOxQngasb8NE0/yrUNI6q+oZ
	AkP9FhpWaqkSO7O4LQyG7B5jmzPpZohMGMxq2g+BcBwbfrHOE81gXvHfYxYRPAIRyIqW
	ycZMLTfgSzE3E/RXqYeGANgiOw66a/cxBTio/n8/XhDuDwWozANB50XMJ2hrdkzCRLWM
	+nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=E+AYYQdaoEYFA2DRBSjAjcOfs7OvVTjio+a/2f1I2CA=;
	b=Zr19nqv1Sh5dyYzpZfyw/JQ+xr72GMlX6ISnqMeRpJU135v759MLrv67pDVa8jXg1L
	uJ9O1ySEYqMVO84QJh8l7jJcfXLmOxdnr0sy9eim+aiOHVgYulMJabUQ8vHIIaNK7TeJ
	jBQlN7Fr8qFXa/9cZ9xke4x3xCB7Ttxge/bM1fuyfCwem2KSQrinSzMXYVLmO1z+d80w
	kP7ATzrZGLRhkI02CDRqDzm0AJQBIwlszc5yL+5ewhMuk67mIJJ+y9QmIUSiMLL7KKWf
	KbE8FKXKZsGtUc5FC99POmj+AYtsN0uH0xq+K18VDhse4qP37xO/qoixsHU9fR0KLEYc
	zWNg==
X-Gm-Message-State: AOPr4FUrwJ0cpnfQDWpyEcJnwtVhUg2YmzuerUXb7skJnm0aPXqFj6AhPoBX3ExDBKWu3Q==
X-Received: by 10.140.172.6 with SMTP id s6mr47448288qhs.57.1461006480395;
	Mon, 18 Apr 2016 12:08:00 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	e14sm27047101qhc.17.2016.04.18.12.07.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 12:07:59 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 16:07:19 -0300
Message-Id: <1461006439-16137-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1461006439-16137-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1461006439-16137-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 3/3] python-visitor: Add recipe for version 0.1.2
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
X-List-Received-Date: Mon, 18 Apr 2016 19:08:00 -0000

A tiny pythonic visitor implementation.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-visitor_0.1.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-visitor_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-visitor_0.1.2.bb b/meta-python/recipes-devtools/python/python-visitor_0.1.2.bb
new file mode 100644
index 0000000..f53091e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-visitor_0.1.2.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A tiny pythonic visitor implementation."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "e9471b44e5d426b0adf5d27694598be0"
+SRC_URI[sha256sum] = "d9444ffca56a46a920719460d4952f8c88f8fef97f1ea7d2b1f7c50f675022bd"
+
+inherit pypi setuptools
-- 
2.1.4


