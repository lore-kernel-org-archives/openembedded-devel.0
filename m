Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6CECF7EF41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 10:46:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n9so1927028wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZOr80lEXXLdEGnqvTCCL1bwYGONxHGXBdFwZ+cXjdVc=;
	b=IFCrufyCpEh8l9B95qVwQ4JP1NkeMVw0jBZUdteHeXh2rFGJIKAaSRYXtY9Yo64bNk
	sA3PLrcgEd0EhPDLKn0ihYdlz/tEB2oo91GFTeIrtJ3GLlvzCLopuUYVk4q1fPvzW/fk
	iSoOtsHn4w5ZYj55TFmuAUoHYK+xtbnicePZ8ZtmOvtsZDOjf9PcS7jSmCFVfW4W2sHz
	tGNiWJH3WCpi+eApGGOuh30vA5OFknP+KIPsWb9iBjUbTkvwdQvV6rQw+1OwKRv5c+S3
	2svOpDQH3UFmSotp54IDs87xh63TkKsycX5rGs0YzGWcLJZyOvdcqI6yreDgDanavNNo
	6J+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZOr80lEXXLdEGnqvTCCL1bwYGONxHGXBdFwZ+cXjdVc=;
	b=opqsCc66HLzReamBdFp7CqGg/1G971Y/RFkJdgwWXTr5Jq2KrODVXpHAphzvBwXiNJ
	+oCyDtJCUAUp9u7BNyHhwXPylG1yw7R7n1tSnfShg5QIreOPdGlN1nTaZdnuluXBqxZn
	U7Hf7pztn/qdUdagXhfckqUQpf3cj4MfU6oR9jE/f/eWzYbGheq2Cf7ZjKYgq3Nns+kn
	9V/K8XswX6EEeon7mgs29NhEgVXvjDt/KQJUI+khpa6YilAp3Ex9/3GK4J56iYPlqOxG
	aDc9ioh8uvrkJsycEl13BrMm8PEqDcsc7TwjOz3398EJNz+aUEBseTxTvUa1x+UTSmSz
	gLGA==
X-Gm-Message-State: APjAAAX7c1EKqd2ceHAmX5OFmphG5nN1dVMdc6BT4LgmSQHoUxgulYQ4
	c2A8vwOZ3KGRSiUYD3j2txt5uOPr
X-Google-Smtp-Source: APXvYqxQ1RCIKMpLkZ+onKGDzVIOJ/K6Axe2nW/lqOBlrLmTATkI6cii9QfwX0RpNdoIAGFiBUFmyg==
X-Received: by 2002:a05:6000:1186:: with SMTP id
	g6mr10653635wrx.17.1562755617808; 
	Wed, 10 Jul 2019 03:46:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j10sm2666391wrd.26.2019.07.10.03.46.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jul 2019 03:46:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:46:55 +0000
Message-Id: <20190710104655.2229-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710104655.2229-1-Martin.Jansa@gmail.com>
References: <20190710104655.2229-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 5/5] SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and util-linux for phoronix-test-suite
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
X-List-Received-Date: Wed, 10 Jul 2019 10:46:57 -0000

* phoronix-test-suite is allarch, but util-linux and lsb aren't
   === Comparing signatures for task do_package_write_ipk.sigdata between qemux86 and qemux86copy ===
  ERROR: phoronix-test-suite different signature for task do_package_write_ipk.sigdata between qemux86 and qemux86copy
  Hash for dependent task lsb/lsb_5.0.bb.do_packagedata changed from 7baca400e354b600fe967ea615032052 to 67888a6c7511339a873b547745287ef2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc9039041d..672e1a0155 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -49,6 +49,9 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->bash \
   phoronix-test-suite->python \
   phoronix-test-suite->php \
+  phoronix-test-suite->lsb \
+  phoronix-test-suite->util-linux \
+  phoronix-test-suite->busybox \
 "
 
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
-- 
2.17.1


