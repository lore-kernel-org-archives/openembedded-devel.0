Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD697850A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:11 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id x4so3639925plv.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yecWduOlkbL+biEHoIY43cykl+Jlqm6t9VFPLJRO0js=;
	b=FJs2j/X0jVsY2ZwewqYnIajuNsFa+hwKVAIkgsMpXi663nvS59GHZvuTA31J0ujqR1
	yk2dQgAilLlWTdiqJ8EYKeleNA27u1HkmYrbo2sfg/5U3rtilUJzQycels4tST61lxjz
	53pg5WvKdD1CgiHRCn2vETcFim7rbQk+qAyVcEMtDRJwvPkpPVUsLL2aCyUhSxH8ViyY
	GyAQtY08Rn5/TUUhydLGSLGUdaOf9EfMbzHUVre4TWf+iJCjlA5IX6bu9sn5nWYfHWF8
	3SzyUS89VwlWkKmqg6HZXJSoxCj6Bh7ikvf58S5yYh9iHA48/2zhkFLq7emnisUTnZMR
	lgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yecWduOlkbL+biEHoIY43cykl+Jlqm6t9VFPLJRO0js=;
	b=nuupboFyQegZr1JoSp7Jz6aU4OLa3kk3P6ORFFMBZnzlnqq0OhVA4dY2e7Su2o1F3+
	e+LaIknRKEOKM2uqJVv9p2yYvraalzY+mECc7hCM3KVdwut3EtwrlRxn+94CiqQl3tSw
	17VWeWZ8bzTBHNVxU9ZXulsPnnWFHJthVI6GPeX+omg0l3dhTbtdodYUZPEiuR+Gi1iL
	g1WiznCcRfS0AGz5NmrkAC2xTHV+DmdS+zU0dM5XFiJieoJr/ZiUXSmyI/6/nrwyx80n
	62UkAZQc8a24Bh/ihp2xw83zPHkwT+eWRt/KezqPaNelTydeFY+453DE61u36gUs3JQs
	csXw==
X-Gm-Message-State: AJaThX4OSNr0+Uq/+h2gmzhEGQI6udu6qySmihtnG3cDPxeK5buWU7ZC
	7Co0mg8h+Ejr8pqfrJmnqc7Clw==
X-Google-Smtp-Source: AGs4zMay7cAXTXTZPlxBjJ+RrqVoiP3Bww/Dpeb0mllThCx19SUw1f0+CqZk+Y80BCgcz87W+w2IwA==
X-Received: by 10.84.233.207 with SMTP id m15mr1408921pln.424.1512020892781;
	Wed, 29 Nov 2017 21:48:12 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:12 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:05 -0800
Message-Id: <1512020828-4040-7-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 06/12] python3-flask-sqlalchemy: new recipe
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:12 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
new file mode 100644
index 0000000..07f45bc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-sqlalchemy.inc
-- 
2.7.4


