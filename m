Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 609DF60745
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 02:00:16 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 63so1276527pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 18:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QNexJtvS5kNQq2eV9ffASpyTU3yLg9tXUQh9Zjzh2r4=;
	b=maGFjsyDqM57E5zXfg5k+MNPwKPheD+wQgGuMn+v2K+eTQKuQjyQdcWs5FRayZxGpS
	2UV+L+uQZhIXdk74qpRMzBHE6jVHv3OwlhcSz4AybjXG2Gb3pBDk4WGKiPIO60tJLs6z
	7MyCQkaI3V4ZL+egl1H9uBvfR6ZkkNQ449ZLDR26NfoHJ72ExwivXeUNE9u/Zpowvo4O
	sIJf/cYx7atKIaoLNQKhWKY2LCuIp5s57cB+KJ81IaEuzKnHaOqRDMPFqEi1dbplpF5s
	svM0ju/Glo6+H3WD4r1nk6H4nf/GT5Y3+daYpGEHmkPy1HfqAf7bu1xIbsNU6jJ+Wm33
	QAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QNexJtvS5kNQq2eV9ffASpyTU3yLg9tXUQh9Zjzh2r4=;
	b=HTzKh1ql2MvvM1rPvzuRxardAMg1cEUZd1bhH7ot9R3Q3izFVupSj+fcY0K9uJd11z
	sPRmIq2AU2i2YzVYAwq1fyPCeyeuaSIAEl7BnATu++9DqqDWUJJaXcryW6weL2dJehcg
	Hh8cxs9PXBZRP5ypVyRgSmyAMLxJMBLS4htIp827UjkURT/jnHfDw86Kxt3L+rQaXAJP
	BNX4GpxOvlOdq8bo/EPt61U/UYQ0giuTECBo9TrDggto/snBJfyqfieZU4VdIxKfsarZ
	0z0VxTzsA6rYigtzDdRt81rkmFiUsXs1vMcQmf/WZ45qmfCGDs2J1JF610jUgy0gKzPy
	0jmQ==
X-Gm-Message-State: AD7BkJJjMfXnkWarGziqF3urLBdNIWEe1qIuIFDa/jUf2NrZOZ6+E65j1Y/7JvFzbhlKbA==
X-Received: by 10.98.12.154 with SMTP id 26mr38037599pfm.20.1457402417377;
	Mon, 07 Mar 2016 18:00:17 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id cq4sm425130pad.28.2016.03.07.18.00.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 18:00:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2016 18:00:13 -0800
Message-Id: <1457402414-14879-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][PATCH] python-m2crypto build fix
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
X-List-Received-Date: Tue, 08 Mar 2016 02:00:17 -0000

Found an issue running additional while new clean builds today.

I can squash this with the package update if you want.

Armin Kuster (1):
  python-m2crypto: fix build issue

 .../python/python-m2crypto_0.23.0.bb               | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.3.5


