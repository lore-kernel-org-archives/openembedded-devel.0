Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1686774FBC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o76so26086967pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oqi7PjCfClwXfxm4BQ/RFmP96NxrZbgHp2RDYU6Tnko=;
	b=DzQD8g7BLBEW069Xko8FZL4q/Hw2f6vFz8ff3JQerLNRcfO3y1JBxa7zy5ZvK+HnFx
	Kee/Frhj5XCXb+lH0GN/aS1SuqohiWsHvjnmvNcDtMxhq+nElrSvz4aCa4wSYCGg1YXJ
	s2Qq1ggu06ORhJpxsxxf4ZEyXSNwiuBR1jfMdOIPYTekHZse/raRojqejJcdMoJIiBxC
	3rRXC9o08pm7a+bo4ktuDJUmXfUhqzWYkj+UjdaMM4AtKZaYEPWols395HmFEm9SfqVm
	AZZq+dPYqpKkku6j8xTKyk3rcPl1y2y7UnHUMAZ+qWVjJN4Cl9mKeSRjoWBU9P8Y6q+Q
	PQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oqi7PjCfClwXfxm4BQ/RFmP96NxrZbgHp2RDYU6Tnko=;
	b=o/2bcTfsmAeGF5fOBCpUik+ygVeuQR47fmOYEIsAQZu/OzneRAuQx084x3F9dJC1Zh
	CcNsrtpNDMwgs97hvgewChlZTnFsHKzdEIN9CmvvFs4UiCKNBMX0TcA99brozpK5WXqL
	VQGXyA7FCs9QVgB5cEejuINKcF/rk2gzAg8A3kzVAsc6ixjS7xQRb9u02cbsDtAHZZwY
	rsjUYcJWHI/nqfEqiYw3VJBnpmcPYvPhye3GN1KSBHjpweMk1lHO3+bGcffvjx3Fo0rI
	uoqZ5I4iIarnQbZUS9mV4P40/K6HMbEwFL6M2QcZhM4LnfJQC5v+TlKANcsy74Z+/HwF
	eTTw==
X-Gm-Message-State: ALQs6tCogpH0kxrzGV58CLpf+UF1xts88s+fmSo//WADPTXsrbis8nCt
	0tuBV3/LyuV7nNB+s2855rCKuw==
X-Google-Smtp-Source: AB8JxZqfAOzr0h1dUdlcroucUsP+tQGys6hfDo0gIzouskCl6a5B3XQkoOPKna00/8bZw/dFfp5+4A==
X-Received: by 10.98.71.141 with SMTP id p13mr44787798pfi.164.1525892433888;
	Wed, 09 May 2018 12:00:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:08 -0700
Message-Id: <20180509190011.30006-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/16] libmbim: Upgrade to 1.16.0
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
X-List-Received-Date: Wed, 09 May 2018 19:00:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
index f89ef9d570..5260c0f14e 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
-SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
+SRC_URI[md5sum] = "76ea4d8381989919b1d9b91c818fed80"
+SRC_URI[sha256sum] = "c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2"
-- 
2.17.0


