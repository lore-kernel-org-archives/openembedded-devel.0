Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3606719BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 18:06:55 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so32654488qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ywExAJy/6Wve/pERZVWtkYs16/n8RbrXn8gxdn/L6o0=;
	b=c0/HaYNZ/RKDj3AKDFR22O8aq4dAjcJOSwVtXS62hQeLWJZ/PzeTAGdXNWL6e/iNpb
	UqspY+apJgih1bzxgvTKjgyVxiIBtpAVtsqJAQV/dTdRVglPBjUKLrnI0L9MOCsE2FMn
	lqBwniHnCbjpFH/SpnV6n+OaOBoclWYc6Ew0A9/+JsLdhNOxC5dwq62E74aGoq02uxri
	3Nb0pPBNnoxOTpLfep0MAl26Be6YvTGqssKYqmsFJnyFIykFmgqwDumUKDN2vQsoo7Mb
	eLa6KiRI8Z4lEztNs/Ni/+w5niS73rUNXcE1Ts9dwRYhetdci7s1RKfaB5Wr+hZkplfn
	nEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ywExAJy/6Wve/pERZVWtkYs16/n8RbrXn8gxdn/L6o0=;
	b=Y7obwgsTTDfUcX9tPc5Y1zCr+vSsOSx6AVbVvW99deT/w9YC5ZwW7OE73lj82ExSeh
	Ruuz7F3p9QRasrfFeTNQ2DaQvuAv4lGTYcl+UBGvWm538HdL2K717Fj/bKbt30owObOo
	xP6UOW2IXrTYqnmiwGjMBOO0VGM6EkUpkp9hFnZoZPmqFaPCHlRdRzOBz9JZ2InLAxJg
	rpjywZAjn+uKuEF17k8s0wMCQoW0B/Mn3co5r6mryKNuofjRMCO4MDQOpwmBnacVy0wy
	avab2cxyzZF4UjrtPNEUdMUWrGT9wl1vr8IDak5TNyOdxASS5tE6pzJGi62TyIyRBMMw
	Kurg==
X-Gm-Message-State: AIkVDXK5ge7ycqP08bh5miRf9LG8JlTphUrZcEkGvBeZvgRzpf1i40yKif4fJyl4E1Hd3w==
X-Received: by 10.55.169.21 with SMTP id s21mr36243691qke.246.1485367616121;
	Wed, 25 Jan 2017 10:06:56 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67])
	by smtp.gmail.com with ESMTPSA id 140sm924624qkj.19.2017.01.25.10.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 10:06:55 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:06:44 -0500
Message-Id: <1485367604-27736-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485367604-27736-1-git-send-email-philip@balister.org>
References: <1485367604-27736-1-git-send-email-philip@balister.org>
Subject: [meta-python][PATCH 3/3] python-pyopenssl: Fix build for per recipe sysroot.
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
X-List-Received-Date: Wed, 25 Jan 2017 18:06:56 -0000

Reverse order of inherit and include to prevent DEPENDS= overwriting
values set in inherit.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
index d7177e2..b7d5146 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
@@ -1,2 +1,2 @@
-inherit pypi setuptools
 require python-pyopenssl.inc
+inherit pypi setuptools
-- 
2.7.4


