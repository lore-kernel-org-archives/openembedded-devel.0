Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60026785A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j124so6519995pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BM+3qYTor+xgbqjM9OJeQIL6BTmwjidIr2s8ZJmQ2zE=;
	b=bDaurBxFggro63KjGWnX9P+WndBcbz9xRv71J9yezvMjJg93WuLLYs3ociqP2cdoZ5
	805tqSmPS3DZHU3SR6XhSooXMlGbZJmnUuOLfTbp0sRksOmMCW1zgt0nd9HyP72radkE
	3yY8HwfFTxpfUXLjnVqYNEGiHq4mC+TwWLg5pIY2+z1tJW/416Xjy9sxZCuUh/T6k07I
	arvlhz+q9OZYkt5XXhrDR5HAZTft+s9wMVeR+i/nKZdjLnMqTIgNTPAiv7JGd/rPIx7F
	5LLo5daZuEW+m+oAK5UoYB3YnuoDs6g92OZHqI6gyIjYcvYLvx/s+YXcqqBhqgeXdahb
	BWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BM+3qYTor+xgbqjM9OJeQIL6BTmwjidIr2s8ZJmQ2zE=;
	b=tgUnM8/+h+3Vyq7CVV7aloLSkOLBLzOe6k0woDsHKN5FIlvSjtiymXGUghaHLR3TZ3
	Wj4Dp8BZLW+6KB6ZTZdTw0iqycAm73GGjRUkFKSTR4/a8t6Kp/6WncFeYDJO9q+NtG2o
	WwjbhIYKziErlfPp8I6sghFzakqfIwKg5KP4T+34vGUwICRpDhQiFfVeZitc2WGNlKI6
	GaWKNSpZuONK2CEWxzzUl8IxyqaSevD6eM9uMpuC0Nu8N7vdUyN6Um7JNWtc83uMKG8f
	AS6tGo1jHKMYHw1wBpiAqnR8SU3wir3ZsGH5k1JK39x8x4RWfzq4FZtXlZB5QrNFeDe1
	ghHw==
X-Gm-Message-State: AKGB3mILbqjNOwuL/c/tVVAqQLag+NpyOyFBURarzlVRMe+KFC8eTkNF
	FRwaKSW9l6HUprvnbaTXc7KeXA==
X-Google-Smtp-Source: AGs4zMZiS9xLOvzfFFdxAVoC99HO4eCOC/yfAm+r2l3gD69efgXChrl3/DUUpqWV6bJH1A4VkuGHYQ==
X-Received: by 10.84.235.11 with SMTP id o11mr7563209plk.5.1512711992580;
	Thu, 07 Dec 2017 21:46:32 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:32 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:44 -0800
Message-Id: <20171208054548.26218-9-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 08/12] python3-flask-wtf: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:31 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
new file mode 100644
index 0000000..52362a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-wtf.inc
-- 
2.7.4


