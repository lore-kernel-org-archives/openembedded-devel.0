Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 145DA7CB90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:58 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i20so7619639pfo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jXY5H1Fv/woUVKhMQNXVP/YS527icOcrqq8HIvUhwCc=;
	b=hYZ75HkDmsTxPimh/mxa+CEeT/jnVJqhxI5EY95uQIaTzJhIJnvYm/kI6H9y0I6RFl
	78XofL7KIfpxOcH+aCKdoU2AJQaUXhR4mksh25c4OL/4Fs43v2WleXCfcoQ2Tdtmd1RK
	7AyJ1isEdy7euGeCbcs6/ElCmlMFZWtbr33xdc0wVbGJMb0+2Y/O093+EnF3deNgEKlr
	AGyqM/R/7FH8DUdK4psS5cQsX5CUyFPm08zXXfqCoY9AvNLj90PGzb9hg/kUA1ZSjKA4
	10y+mSz2BL3Afmf84KLQ7jeklEC1LuV8S1fnaoSwGxsVLoXRJ9yi+ntFLRFiK+jAVAKe
	GgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jXY5H1Fv/woUVKhMQNXVP/YS527icOcrqq8HIvUhwCc=;
	b=hFrPISsrTAV7o9QkbNMp+6p6dUNe1p3UX2LIlheLJRWCHeqqBeGa8uOHhrgeAA6r/l
	AVKOgksOV3CeGiM2znvWMx/OYxRtrGOOsjMPMXO0qU/Z2RQ23llUJWP9FJcsEB3c5q1w
	yjEoIEBjErwtRoSTfJtqYqEPVXvfNouFJZtJPgaS/rtyrXCBr53zU3hlCnED/rjqCuTT
	9ORmLj6zfDK4YYLSa5Qw+zOBhnZz6E6/X2Ec0clMe9nDS/laH6RPESXuqhITmiT+G2dC
	x72e+TANgQhz//OhrQcVrCXIuiMJ6quraeSnwKGUmap3ZS1owU2IhhxQSgPZ8hePJwQ+
	ZEBw==
X-Gm-Message-State: APjAAAWGWbWUgViIafjMM07KcTuj+oslJw6hNCPKuybeogdVl35gS0Mn
	ojI6pJGDbPbKf7JtUE31DcLneKgV
X-Google-Smtp-Source: APXvYqybfI/UcXDm3fvyrJvQyNea28xRJP0gOPo7jyRviA8K6LvS0R1gTLOQvqcUbQo3mCB9Jo7lAg==
X-Received: by 2002:a17:902:7b8d:: with SMTP id
	w13mr5204213pll.129.1551851159707; 
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:43 -0800
Message-Id: <20190306054548.16430-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/12] nmap: Fix build on RISC-V
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.70.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
index e878038266..b1b150a7d0 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -42,6 +42,8 @@ export PYTHON_SITEPACKAGES_DIR
 
 do_configure() {
     autoconf
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
 }
 
-- 
2.21.0


