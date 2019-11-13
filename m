Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 818867E553
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:10:00 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 205so1478941qkk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=z3yXRD0B9npin7R/Ou4Oj7F+FEgsFbaj724x6+SA9BI=;
	b=tSSb9TprmMG7PLgn6/JMlNmBggK0x4fUQD7NheyceAah3sEL3z7aHw208o9c9XDjr9
	fFDhTE4VeDnpZ5pZMwO391eilDIvCGqEs2CIJFKTxx4KKuZdiVuZYDQ9ZCHhNrrucztO
	B9VW/Cm35qH8iNyGszQMXkF3AHPqt1ncOtxOitCcOBExb/0xfkJTzIZi3Tjtk/53fI8Q
	q05P8APnke5qyGrMktHc8lwKoCftcXwMF6++xgA3JPsVaU5uwTFSCS6ZLX92QYmUKeP2
	jm+MlIqC7/gBAdz0o0YBPqwhQlG7O7lxW9tXOrvjaYCtBdxcGFnFKoFBK5IYsjBKH34k
	6s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=z3yXRD0B9npin7R/Ou4Oj7F+FEgsFbaj724x6+SA9BI=;
	b=c91Qxpbkjj5bvZ0CUpU6xN47q9d4ZDXf63FN2ep+4TCurzoMtvf95mv+ljrstXtnAh
	25NTWESmiCrTEVOmJp855gaBQHVBabeS1FFou8LpU7t9Nncdp3nOYxhmX8If5vVs3e6m
	2hzHvqNbR2qxdWLIvMipRiSGKYhy5cUGrX/Qv2OImMF5UnW13XeQSfiKeoX0/B6r+APd
	rnPbeMKayN50AVIspmeYdl3GtBWaZKFpdx98B3cUW6Vllp1FfB5aq/x03U2/3qlPzzmk
	WGEVVJ7ThFKKV4ylfql1B6KxR4jQ52ZIM7cktguicJ8Xqo2zSJFOzxI7Bt5eX6t8TopB
	h15w==
X-Gm-Message-State: APjAAAWBj8DSTiwaPR5ihrsECEj8dHmieNHGrwXQUKLd9Hd7BYtrDZyK
	gF7Aqd53MlGgBgC9kuyJ4+fDgE2R32EbPA==
X-Google-Smtp-Source: APXvYqyDN17tyRbU2906Ik15UdAXC8aev013ML1m9VTOCvjXKBzIid7ziRdrBltnyFj9rCSfsEaz+w==
X-Received: by 2002:ae9:ef0b:: with SMTP id d11mr2087726qkg.68.1573647001310; 
	Wed, 13 Nov 2019 04:10:01 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	a137sm830252qkg.75.2019.11.13.04.10.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:10:00 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 09:09:43 -0300
Message-Id: <20191113120944.10668-4-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
References: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 4/5] python-zipp: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 13 Nov 2019 12:10:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-zipp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-zipp.inc b/meta-python/recipes-devtools/python/python-zipp.inc
index ba18f7216..5f63852ad 100644
--- a/meta-python/recipes-devtools/python/python-zipp.inc
+++ b/meta-python/recipes-devtools/python/python-zipp.inc
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


