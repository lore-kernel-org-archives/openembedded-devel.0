Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 648777FD58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:34:00 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z124so556636pgb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 23:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NTs2HCaLx6b1EFwgPqqojDD/n7rvGIi4Tx0jfGG3fec=;
	b=oZCna8EAsrEeOeJbCfjhD1ihC4xu2zH60WuFezN/W4qWxAZPFo/SXPRNykZNybrLJm
	BCknuIgNgW1prDvtIn7Gk1+BOg9BGjz1NeSZqrv+T/OgPJ4eJFlAg8w3DsXxLhq/TCrF
	lDs3Z6Nq+vR0z6DjrK246KcKKJY9yEI3qQDCFiXOwh5i+xtss6QBJRVjAqR8704XoWEb
	RA2OWS1aKivsfahIWDcA5faOzGlWx60Q1WQcph4Cd3vJNgeUFMdBtuS6tHt5nin+t+9S
	tneOnYySPCONTvwimj+SatfVxSED9CsQYjxgAD2jQGNWHdRkbQYMvMwNeHMEaaz6yQUL
	V2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NTs2HCaLx6b1EFwgPqqojDD/n7rvGIi4Tx0jfGG3fec=;
	b=OUhukp2uKOanVLTANFW8Z0V87Ce6L+KmqwSAhzx6zdqjZW1iecsjtAVoFlwQzEcV91
	wbjK+2MXJ/yRwMlQqQ6uO6ad2YxTa3nQ9Ex40nB4hrm0hys17dSEjRpEErETozc5bqWC
	SKNu66EM/0+SrlwA+SUNiQn47pMx92yeet8RYjaWQjzNvnohvSladUlfjIRbJeuVsjez
	NqwzHAOhAoamLtkJGX8rg9xxuoTL1g5RjdMXTotLex9HEo5efC6rYEpOgq8J+nFjrGes
	C2whyfgJ75d8+lra/xzJrt7firo5lZnfP+KMkJn0y/TsSAQVNT6s19y8nqT/wHvS3wGD
	qjAQ==
X-Gm-Message-State: APjAAAWgRngPqsBd0DXBB1qSIWxuO5+BxXduV2FRFT6ZsKRkqJL2Y9vU
	I5ihtEjugPwFkGfyJERQHBZ8oy3yJs4=
X-Google-Smtp-Source: APXvYqwvEyGZdnI8pQlBDI0OS3AfweKE8oqyw0lQFyDTab61jV8xxok2ynVtWBVDiAGcKWXUwr8jfQ==
X-Received: by 2002:a63:f5c:: with SMTP id 28mr2710810pgp.348.1579851241225;
	Thu, 23 Jan 2020 23:34:01 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:3c89:c57:830d:1156])
	by smtp.gmail.com with ESMTPSA id
	y62sm5137279pfg.45.2020.01.23.23.34.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 23:34:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 23:33:42 -0800
Message-Id: <20200124073342.24494-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-asn1crypto: add target RDEPENDS
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
X-List-Received-Date: Fri, 24 Jan 2020 07:34:00 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependency:
  - python-numbers (fractions)

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-asn1crypto_1.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/python/python-asn1crypto_1.3.0.bb b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
index 90c6d83d..2954eef6 100644
--- a/recipes-devtools/python/python-asn1crypto_1.3.0.bb
+++ b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
@@ -22,6 +22,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-textutils \ 
 "
-- 
2.25.0


