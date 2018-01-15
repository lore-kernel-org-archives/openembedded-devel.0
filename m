Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 46D9D786AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 12:40:04 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d21so16623369qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 04:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pK12QlEEYhLCuSdqS6Qp6NO7HuZhYpfbllCfYMGqK68=;
	b=odssiXWEDIOuQsVXJlcaN+fn/gbKdo++uQQ5Ojmi/74b1Ekb7JVim9vQgd23BXVn2S
	6iHy1M24x2nsabyBYcsAxtN+pyTtuH4CYmkEM5eY8Q204u3bBCIXzcQ3du8j/Ni2vngM
	nIL/xlARgFjExZz74NFNZcZYX+aY5gZQPcvIPzKcPdZz/zZ/qHTWC8PFM9g2r18KsXQx
	HH7byCONCzGlaEaEEbkBbvzN5HtspldIXlQ6XhgZ8fPSq2I7iDNdWRQvFMQHLb70uHMC
	+frcoiVh64U4+CfpSq82LUy9duY3NW9wSQ+UvZTNUvD3hY2yCEWFPk3mNkNCd7KJMyJo
	mwXQ==
X-Gm-Message-State: AKwxytdTAu8Y0c6NGKqzUvmXwVgTo7cJXWlrvcrbi0YV8WRQ8u7elP0B
	W394om4H2rPPO6UrNdrujk9aug==
X-Google-Smtp-Source: ACJfBotJO95KAAiWexpuX0b1jOtmxZMJyWPqy6LPFFnbA6OKLQl5BMjJnw/gfgou54jCSLcJnxDzuA==
X-Received: by 10.55.97.2 with SMTP id v2mr529090qkb.266.1516020005087;
	Mon, 15 Jan 2018 04:40:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y11sm12811748qkj.87.2018.01.15.04.40.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 04:40:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 15 Jan 2018 10:40:00 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:39:46 -0200
Message-Id: <20180115123946.26327-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115123946.26327-1-otavio@ossystems.com.br>
References: <20180115123946.26327-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 2/2] python3-pycrypto: Add recipe
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
X-List-Received-Date: Mon, 15 Jan 2018 12:40:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
 - rebase on top of master-next

 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 000000000..0f0999955
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,9 @@
+inherit distutils3
+require python-pycrypto.inc
+
+# We explicitly call distutils3_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.15.1


