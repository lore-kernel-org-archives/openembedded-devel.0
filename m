Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1582F79E1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:38:13 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v13so25411838wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LmjxK5oNCqaULqVgM348r0GGcVS/PcZgIhcdU0cL6jA=;
	b=kEFKLYkwEMpSAzBuXnnr1S7QZEQ/dssUpFcZRGBFAcUz8MM49coVf0gIEcBSMcuNp1
	o1JGkBAIm5rP8sNqeg04h2pDJX+aO7zn4UsedcG2yObkCiS+ShLRFqNgRYE/gx+kh5Cg
	FhBrkVgsBUJtfYqPIONwLV3w/bhF4gANShIEqYUv6w9fvYFHFLC5oGABwjOEqyVgqSWk
	fR5iLrv9MjXp5/GsNco+kL7wuZDeOhBCmYp738+VYvdJYLV9Iq2f/nNaOVltixdQpvAu
	MMTchLOPeRiZyxJ+6Kr0rrJdt6My50KPYj43olpIPm8U4SnVH8mlDsUx2xQ9du08du4c
	tRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LmjxK5oNCqaULqVgM348r0GGcVS/PcZgIhcdU0cL6jA=;
	b=rqLrjkeQ09htlo/ZbXaq/jBBWWYUFeGvqTWlF7yPAUpSUggNHPGc79fGZm6qt1rWKi
	lZF6TMZemRMhDnts3NNRhNVt+hPUnq8VYm5uF/tGF2vBiU5Wb538AhEIxF4xq5F8xa1D
	gMQTbvvjj3DbwFdcn2aq74BHbb7YyBQr7XaSGFNThHjctTK/XlTOWEKQq23OqFJKgAfa
	YvcxXpIpXHO8FczOW6+ZnZC6bL+3EEr87plqNxmO/lzJ7/lUHhL1Ysd71ATngETdq9Nn
	ph92OfnFYIJU2CG19eMsVtr6R+C3hlrFnx7dYrYGMT05XheKatSStWEzjCv6gqMRvRBY
	XiuQ==
X-Gm-Message-State: AJcUukdE8IoZwdzhtv5Z+THediNreuvKngknUPXLHiiUZTZoxvM6ygjn
	/FcZkWLvSMZyHdP/zZcDKmcUBs+Q
X-Google-Smtp-Source: ALg8bN5+n+vnBA7RF84UPrDe6FdNgaWKz3rylW2DPSyvC6LGYftGcH31aqlHB1H8A9OBpo/B6iGH+w==
X-Received: by 2002:a5d:56d2:: with SMTP id m18mr31882088wrw.113.1548117494483;
	Mon, 21 Jan 2019 16:38:14 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F275D236F96ED284BAEF9F7.dip0.t-ipconnect.de.
	[2003:f0:7f27:5d23:6f96:ed28:4bae:f9f7])
	by smtp.gmail.com with ESMTPSA id
	j8sm134645303wmd.0.2019.01.21.16.38.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 16:38:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2019 01:38:00 +0100
Message-Id: <20190122003802.19373-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122003802.19373-1-schnitzeltony@gmail.com>
References: <20190122003802.19373-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] python(3)-webencodings: extend to native(sdk)
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
X-List-Received-Date: Tue, 22 Jan 2019 00:38:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-python/recipes-devtools/python/python-webencodings.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
index 34ca7066b..a2b8410cf 100644
--- a/meta-python/recipes-devtools/python/python-webencodings.inc
+++ b/meta-python/recipes-devtools/python/python-webencodings.inc
@@ -11,3 +11,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-json \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


