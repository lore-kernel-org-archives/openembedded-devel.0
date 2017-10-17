Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id DC02D78269
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 01:18:32 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id z4so89645uaz.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 18:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=H4KaO0Lbf+D0duE27NuMDwVYSjkBiot3OcBoGc8YgFE=;
	b=hI4djCnQdRLdMfMuZsQeEn+VzsEiRbg//pVedFegNXpKnbh0rdix82qzQ9J1s5MeiI
	23JJVyiFhIM+b8KoafGjQxpdxRkDcAaUSfPzrSy7OdT9qFTIe9OIsbiRPC85ITqO3V62
	jUOr7eVB5v8vKEjljK7tZqd5HCZlszgIJzqKG10y7TQTqD2uCK9CbHv4xLmZ3d08Psyj
	AXJ3NFLSfgkb4CCbBcIZPkVBhZaFqIm7eNpCLQvGQePbhmmkQg8f570dgovB8ugjexyB
	7l+aTNlk4OjEu6F6X2LNayDe4PRzVvdWzKOdUln4FhRwT7l3Hxd2XF+EeWx3KbKdKqkj
	Uayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=H4KaO0Lbf+D0duE27NuMDwVYSjkBiot3OcBoGc8YgFE=;
	b=q2IKJUHamKx0fkqKyzwdww8h7QGnbQhJcai/W+1hRVYJAp8v2LAtvqniwFpcqhCdpT
	8yyAtqAivmcxHUOV2is3JHx6Hr66RY5ZWb22Utxm+I7j6Dgr2i0HhslX5poI+SXGcM3L
	lcffKLhjmki/opPImLU4fKsY+1DbyiBuGpoPF8HmhI3c1InCkjCPRmsipjwlz9U+9D93
	d1VGcBR3br4kX7K/wXnjU/MpAeVV4ey91F0NXFDb7S9JV2eXcAlXTSZEh1RwssU/ohBg
	0hsR7tuyLiSWOiooJd6QHnMDddVEUfK1voTvkf38F+4l8mn2BRj/DpvAsglvF8WQP4N5
	Egvg==
X-Gm-Message-State: AMCzsaWrXQbXTwpeSIhl9w5xPL7jBYfsMK8ihn00C2mVqAnKsU0fBsVG
	5XKILVfKLNb7k3KhTRK3DBKWcACBWw==
X-Google-Smtp-Source: ABhQp+TXk+MYy4Cj7iFEl88ntE09qP/1gPk3njGUGNnTg0e5Kg4I7Kc4sVnOIFR+bAazZfIbKGtQRQ==
X-Received: by 10.176.8.201 with SMTP id o9mr6896230uaf.155.1508203113237;
	Mon, 16 Oct 2017 18:18:33 -0700 (PDT)
Received: from localhost.localdomain ([179.223.173.46])
	by smtp.gmail.com with ESMTPSA id g16sm2076283vkc.1.2017.10.16.18.18.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 18:18:32 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 23:18:26 -0200
Message-Id: <1508203106-11857-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-asn1crypto: add support for Python 3
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
X-List-Received-Date: Tue, 17 Oct 2017 01:18:33 -0000

python-asn1crypto.inc already available and used by the Python 2
version.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
new file mode 100644
index 0000000..30f3404
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-asn1crypto.inc
-- 
2.7.4


