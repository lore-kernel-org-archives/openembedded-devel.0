Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8359785AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:28 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y6so6172017pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NKjkkKrfp6dMjNSRJiKi1Rc3ZI3wVTXO1FIMAMMroXg=;
	b=ht02a0iXfwDZKjxioqxxp8uNoJJLip4zswVNGg+YjH/W5UaN/XbHGlcAchxKKTSfYb
	7GBe43Hfa+5FJblw4x+/5iTsSOStNOIk2jn6WQ/8woS3ejRg4e+X2gq2JeYq0pdIo+oT
	iR3k3+64IpGSW6kJdQLmWnEj4XDr206Wwibi6omEBL/a10f2Bn9goTS60s9T9TMBtSI/
	6VfmduJNWCiIi3mw3EmopVVq0K0QRacrRNsnY9Zp8kYQUQOXciCFRM7cTX2b/9yceqy0
	ul9Y7sT90nKlmPnCIbLYEyib3uVckOVQVx5nO012lsd4EsERwymHBIn8OoyV1li8lOBT
	RYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NKjkkKrfp6dMjNSRJiKi1Rc3ZI3wVTXO1FIMAMMroXg=;
	b=XHgtRT4x12mUsO0ddC2W8BfKTj6BiJt0ouXvT4ntkafZBMP2WsKvu1pfxTFydw2tgj
	f5ISUZC+HLRQf7AW95gFWw01923YoIip1pClMt0badfDpJ0oZDZXudXwEIXAmX6+1KK8
	kd9JChoSmfhHqvzCgZGk3Rjv8RVxxNqbkK+w4B4G7pmFbLNGgrpYf6RHtStPMUFyoADT
	a/hJUosL4QgmPrScrlG3sbcZEDR4SKK8Lwq4jCdSmVjpGSkV/yti2N4OJTN8pfjjigBJ
	lmYVEB0e+DS9Y/mJLxTy8nOUIXOVcaRnOLHz+In21vHNN2HBMjgI7kBJ03DbsWPbD+ha
	Q4jQ==
X-Gm-Message-State: AKGB3mKvmIyNwnrp+pvlf6OmxCZvCWZ25pDDvO0UCIA1DY79Tp45AsHH
	4OoXLr97a5x+3xqXwHvkLbvMeQ==
X-Google-Smtp-Source: AGs4zMYdkN0M+hQXId6Yjf5o/oVKGaOLkPoQVSxQIluwlRv6LQ7SuE0TjQ+lAW+uPXmzT5rVVGjUWA==
X-Received: by 10.159.254.8 with SMTP id r8mr15309547pls.291.1512711989399;
	Thu, 07 Dec 2017 21:46:29 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:28 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:40 -0800
Message-Id: <20171208054548.26218-5-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 04/12] python3-flask-bootstrap: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:28 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
new file mode 100644
index 0000000..877c754
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-bootstrap.inc
-- 
2.7.4


