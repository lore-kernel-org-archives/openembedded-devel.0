Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 44F3D749A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:09 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id q4-v6so2660757ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=53Pdrtp3naEKIipcVO94+tlLjVcpr7e6VwVeLcOXjf0=;
	b=IY8QRmTGx65B+nvKI4h5j5KGSS9MJA3zS9FhbrHy+Exk8fpuq1RB6uBWDzFmTAO6Vg
	EZEwMKZ9RYklyR2Siu7m9bWCoP7Lp5mdkUSW9Ppoyf8h45TwJQouDZURB88sB1T9Je+I
	T0VYe408caXd1yVCpb9NVZhM0ysEDeu7h90Rl15yz4O88Ayl8eeyOXtbtD+H3a6E6mzq
	MqKSgSpx9HDY6G5V54/+gbNXBYySQXp0tNGxYzaL7BppvsSCQzsj6ZfzdqE0HNOhYO8T
	KCdnMoHhsvaGEH/lll1it9C6+blIXB4LMZSPp8/TcslyFKuUX6jZ8U8UYEZgWw3a4NdD
	C8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=53Pdrtp3naEKIipcVO94+tlLjVcpr7e6VwVeLcOXjf0=;
	b=qVjiOvfWGX0P7l4qDnfa+3YWC5xTQDAo3rAQomj3TWoGFLcVsGLV1sBq/qD4c6XFIm
	mR0bvPhwwHRMbNJZ3g3ZjSkiX2oRtAKRwAXTCTA5z+uliNafDrT/vdIJDTC2Jnkg94T0
	T+fb2QtAU+ZPMjR7VaAvUzlNaWjfcwq1ReFZoqJgea/tINmkVN1Tq66sYqe0hkoEEuDM
	K9NK5rIx7EHYdZO39wY3xzznmNLMPKK3hwhtsCz8P1lirjTZgeDmMB0YvVPDw93Nqvkz
	ba1RQyvZ6GYiBIBx6e0TvE0fs08PzRbms1RT/O7pVQlAJ4Mfzkc59KgMuD3oDU+BNsNR
	cGgQ==
X-Gm-Message-State: ALKqPwc2oY6Wl4wPp8m3ykFs18dlFj7U6MnS+sJhS8O7aDGq045mR154
	gbUlJUh3YFbiQ/AebXpVaE6XBPdV
X-Google-Smtp-Source: AB8JxZrOBRXypenMpGlg7/h29ICdcncLR9WVSjMf0cf1vUN4N5jCumklH25TULmxHIIsc3IHMBk6jA==
X-Received: by 2002:a24:7f46:: with SMTP id
	r67-v6mr9653826itc.65.1527172750741; 
	Thu, 24 May 2018 07:39:10 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:40 -0400
Message-Id: <20180524143854.24096-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 03/17] capnproto: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:10 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
index ffbe73feee..dfe19947c0 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
@@ -20,7 +20,6 @@ S = "${WORKDIR}/git/c++"
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-compiler = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0.582.gccdcbd54c


