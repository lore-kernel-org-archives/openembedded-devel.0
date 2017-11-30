Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id E8F1D7853A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:09 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b12so3621950plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NKjkkKrfp6dMjNSRJiKi1Rc3ZI3wVTXO1FIMAMMroXg=;
	b=bRJFqvVXrnG9BUhlABrHFpYBhgOrSMqEDF1MakyaG47i/80gLz+r1nCN210Np5Q6fK
	5jVFMtN8SdiM8w6kl8gvaWRSi/5vrthA8ryZYIlLUCFqG0pjkTMEDpaba+5nAZlsu7Jb
	K6R69dXLrfHjsuBCz9BDZBUDzZD2hDJFx0cLlTLh3Jcqd9eZHRXGcpcTaqI/nzVkEXoU
	Ug0ZnQwJd5pBY2k60I9AgWqOVDaCO4WEUZkk8LPVSjCXiu09PYJA3C+TagVJLQE1GCXn
	HCed0rTOyEqi2b29JC+htX7DIXbPHq4Z77P02j/WEVw1PxL50PqVygnz5ay0Ze4gtQD1
	vd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NKjkkKrfp6dMjNSRJiKi1Rc3ZI3wVTXO1FIMAMMroXg=;
	b=fHdSW8zhKK6kImYFI/7xOkvGIZ4SSCOZ3Rxj3Sa0NO95qEkFisC0043ZV0MGqMvBD5
	iu2HgFk2PVZrUIWBer57Mvuv1uW7MNWygPGWXkojDCbPeMZr1lPE91443s0d1Lig9mMt
	1He93Cvnb6ojRSTreU80ycLJRkY+hkpiegjTdLQFiaHBfnupTTYX4nb2FfIp/spxwzKH
	vsdyDGo9GwaNE1UaHS5pBnhdDc55nrTxzjzcUp+ByZMqE2LgglFukyVXLKEPDL3UMbbt
	P8BwBlVV1yHM2gDc6IxI8qo1zzwnpvoYD20kKQjbZJt1Bpa4l+fwOkaw/sZIe1/andIh
	xwJA==
X-Gm-Message-State: AJaThX69GxBTCLXTPP+qhjHkevI1xx1PKwN765LQysfNDQnXfLkYr/g8
	JewDabz8uo3VIptO4/iDga3Yyw==
X-Google-Smtp-Source: AGs4zMZxCgcM6kY/q+Yt0+iKgt9SgJjvY6Gb2yngj3focYGH0u3WVfCnpj6kqGkl7xmZu+DQ1mgonA==
X-Received: by 10.84.128.76 with SMTP id 70mr1407592pla.171.1512020890684;
	Wed, 29 Nov 2017 21:48:10 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:09 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:03 -0800
Message-Id: <1512020828-4040-5-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 04/12] python3-flask-bootstrap: new recipe
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:10 -0000

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


