Return-Path: <twoerner@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3D1160B58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 22:45:44 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id n8so4040897qvg.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XRsH43oBOd7GyEuGkNeArUoaPpCUdG1htts942OqiQ=;
	b=Z0s8Fo6HNp9Oi9OSgetcyzmpVdx7owKUgs96cFzjg6851OvWvE5VpaB6lwE8CNG1zB
	Pcu8ZxlL6laxUA7+dhGzFXKOMAvZQkIJ3avKOaJx/z1fBwSoVDW4gkr52dqYtKI+wkGt
	dPQpWSy2Pi8ENJfPb2zUORjSrCnSNEgMgDFCRa11fFE+O588EWDwKmFuFuFliMSLgh9i
	/hetj7vqy+A2gvdJh9ExPHg/Llr4L3QyfhPu6aLwBUb2flQj03n7sS21WHCN15HYZ+1N
	ec5LrlFyO0ivGFKHwFmS/WtwWiVppns5tREHfyQUXQSOQNxv0/CsOojdH2wkeBFPrRqU
	aHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XRsH43oBOd7GyEuGkNeArUoaPpCUdG1htts942OqiQ=;
	b=YMDmIHVDdaUWaBDGBzHE7Vv9B8UlhCR+3vpyJ0RatDfoDYGISZZ9UWmBwV6tNNWVN6
	1OswBkY5BtSfvomh4/jcaB9gHaOev9P2cywFg8oCIRbGNmyLORgAVGQtIz0jthu37cH8
	vVNMQuaoIJO6aDgAmiJZMc5YuYrDP5+BMi8HJrDW0YxcdAXzhQaN1OfiBg3Xgowz/Rm9
	GhXD2okWzVO5rnUXs3bANy0pH3hk/xIFZhUQ9Um1uPTb782P+Ue1HXBSeNrcabz1Dnpy
	pHjn4PIZ+OHXnSpYUy56JHX9RQhvlAfYIOntbLWJf72QTuw8UyZJFXeyZhsWLffFCJ1T
	+JmA==
X-Gm-Message-State: APjAAAUBYt3XGFY5jtKl1FoHX4fdqiJs5MPr/VwTMlx1eK4M1TJ7m5FX
	Mrcms+yelq8jsOVRZeB63B6IgwnLpzQ=
X-Google-Smtp-Source: APXvYqxxjNDzK2hjlB/JmuoQrTNpEDteqM21QThQPwyGRBXVm/mCbGoVb2VZLaMHpo9MFymqsNWjGw==
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr191862qvs.217.1581374745301; 
	Mon, 10 Feb 2020 14:45:45 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id 141sm882473qkk.62.2020.02.10.14.45.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2020 14:45:44 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2020 17:45:30 -0500
Message-Id: <20200210224530.18390-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.25.0.114.g5b0ca878e0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-bitarray: fix name
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
X-List-Received-Date: Mon, 10 Feb 2020 22:45:44 -0000
Content-Transfer-Encoding: 8bit

This recipe's filename is missing a trailing 'b'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../{python3-bitarray_1.2.1.b => python3-bitarray_1.2.1.bb}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.2.1.b => python3-bitarray_1.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.b b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.2.1.b
rename to meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
-- 
2.25.0.114.g5b0ca878e0


