Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4684E78842
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:41:21 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f8so5610812qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 04:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lVpACEDWbHhaPnI2X1/iu9LH/g9LwBqWJeioL2DNT1s=;
	b=Y3UkRdF5KjHZLlXGwvQB+oFfYJFjtjDdRJMJtEKtlWCZjMRoa210ht0hEZRdsNEy6Y
	HS8ZrXmps1T61QfEl/KYs6MxIKzFx9ro7oU5eGwKTnMCl2o1yWd3vYeyGuUulv0KTNw/
	WkJ0p8jT24YMd6srI3rsMsFxbw1thpD0AJdFc2lWabznK6/dcICBQfw9Ux8rj96EwbwO
	RDjBz/kNDWswPeOlPJ4AJvx0feGtbxEzIUuhQApfZCrlNxJPzPRqfKabv6K4CKYA8Kag
	+vwBgh7tgLIwvWsjV/OhOEoQ/ybxuOj6rODK3PVIy6bL5L0nFOyYKWD3jaCzB64gnS+D
	48FA==
X-Gm-Message-State: AJaThX4z4h+SHj7OzSkBIZByD7K89lZVZUV57UaVDgEsWlaLPZtPBB2V
	lcz38M+K6ax5nt6dmvQJ5kNkVw==
X-Google-Smtp-Source: AGs4zMYwDtJPOlN8v6Ck2fUWR06MEwdj+AZ3TfQlvbzdL3WZORi/+DdCtHTRgkOJBYkVEmRz/qQ4ZA==
X-Received: by 10.200.36.180 with SMTP id s49mr5876372qts.161.1510922482228;
	Fri, 17 Nov 2017 04:41:22 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	f142sm2609247qka.6.2017.11.17.04.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Nov 2017 04:41:21 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 17 Nov 2017 10:41:14 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Nov 2017 10:41:03 -0200
Message-Id: <20171117124103.8185-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171117124103.8185-1-otavio@ossystems.com.br>
References: <20171117124103.8185-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 17 Nov 2017 12:41:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
2.15.0


