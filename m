Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABD7F6E47A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:15 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i12so5035753pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rLFagGppr9yMhIvyy6kuH52/DRfS7/qmRkI9+DX+cgA=;
	b=Cc+OrVTsse+9bkf/qt2uF3PFUN0VfyOuYTL4PdowKISrjokqbdDO8QopwEAc2bMda2
	aMR9X6TAqnAeBXdPULHs5TCBSl+HQnxwClCobsbUFb1ESzDLmtqftUPgdwySI50204Nc
	bNYV3Y6ir2I2oN9+n3r87ij3oV/abcUKv10jGtZBeCdkw8MZ+PfTOvdeUsQlRGfz0knf
	2IyczYx+KwLhPAcSHvKxCxASsBAzFv9hcWH34eAXjHddnwYsLvDTkblYcj1jyeScFLem
	Uqae+5ZlHlHZ018Iw9aDSKp0AGN8MQhs1da8EgJwhFLOaULBhmQmEdQkVpkzukOBT3q+
	So9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rLFagGppr9yMhIvyy6kuH52/DRfS7/qmRkI9+DX+cgA=;
	b=nm0q70j1fCP10A8rVe16V8ZiPi4T1zFVdyPyaZrG+1PxzvLQozrTTpyAJ8nQQWba/z
	EOsBXSQmyeqWRTKDIslZMlX/i3LYQEOH8eyc2NvZzCsWH3rteRvSNdldjae0mBF9HauU
	DnkkfOgFoA+TRzlqtqdWgtssYqqlCqXD2Wg2QIrWm5Yqn96lX1BQkWP5W1aTDCQ9SlKK
	fOPKD1whmwahNH6FpZ7KG72Fj5FLPzHsqYqSrGisz2BOW++jOsYhqmoS2xeaNWrHCe1P
	QvnbNeKcj0LwvPzlqOe4JNCT5wmtyCsMyeO1W2xSBwe0qoSvm26urpmvUOK4rX94ZQqY
	neHw==
X-Gm-Message-State: AJcUukcRKlgzPp6RpcRGX91+rr3AdUiTNAqb2wkpEzG4GEZ+a/1LlI4i
	0ExjE1D/qFKgIM/0z4J2fgtqrmiAXng=
X-Google-Smtp-Source: ALg8bN5Fq8mwLPpzQL9Jte6ykdbxz0OFdSlL8VekpDfac1D06a+xIvA1RoOr8H9ToAknd27wBqWm4Q==
X-Received: by 2002:a63:5d14:: with SMTP id r20mr10378166pgb.329.1545600976416;
	Sun, 23 Dec 2018 13:36:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:47 -0800
Message-Id: <20181223213557.7834-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/18] lio-utils: Switch SRC_URI to use datera mirror on github
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index d9780cfb4c..ea54e75523 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=c3ea231a32635cbb5debedf3e88aa3df
 
 PV = "4.1+git${SRCPV}"
 
-SRC_URI = "git://risingtidesystems.com/lio-utils.git \
+SRC_URI = "git://github.com/Datera/lio-utils.git \
            file://0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch \
            "
-SRCREV = "28bd928655bdc7bd3cf380f0196630690c51e05f"
+SRCREV = "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
 S = "${WORKDIR}/git"
 
 inherit distutils
-- 
2.20.1


