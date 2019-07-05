Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 627117ECF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:02 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i11so7953570edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oPCJ5W5GJ62o4lzI7rAYXIKQQzsDrnZiiwhchg5RRp8=;
	b=B7H2jJe+8ELT/FpAe1cft4KiejlzrpdOGqnDw1nEUrp4ObK54R5gcIMwVG3HgGKfmi
	vNSbO2YZw1BqJV6oZquVJ6xbD7XDUnGvDVDAgU+UZD4i9x+hm/a5lJerh2j6vRtZlvWU
	1HtWIyG+kzWKlOQF5RicshORo4BirVZKxF3LGAfDSBmSgENB2mZ/vbft5bRE3rvqpUy6
	F+JxZOugFpGp3uUpRhmUCzPvaTbH6A+wUN1095LQqzO6ILgWpe40T2A+QX+S1dvyB6dV
	I4cnzx6Yyhz/7iNsepEvwDolbdw+IUL10Kle6mLpAaCAVuC4hWttIvOZ8tPXGQc7iNyi
	/LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oPCJ5W5GJ62o4lzI7rAYXIKQQzsDrnZiiwhchg5RRp8=;
	b=lI8Xhn/GPiFLOKpv2Q97VYwXd63QGRhhiD02nm6mcexFHL2GRAPx8Vhad2xXGW8ypn
	WuZlljsDCIBy36BLKsMm2MwSFIDUXGNqCamgmv5uMhW8Na+eDPX6wyM9192n0nTWcTIT
	2X0sYTbv6nZXfr8MbFzwFV89rRyfxRTJlQ0b2ES6D18OvBtLeArTYLaiCO311KLkxM+F
	Idu02QfAlwok4FdfGd3wfVJ0gg2pBVvYNOZrGdZ7Ds3OwXVdeS4JQ2J/VUudzy202gam
	SBD3Pgbf5ynHlrml38hnahXBcWjz9NgfMVt5jO7VtTlEXCRIr5C5hgF/RytJgsAnQwpb
	K4Kw==
X-Gm-Message-State: APjAAAXSQcsq9i+2y/q4lWeyWuoYkTqk9TMa7bWv0Z189f2agC41EesR
	NAAmrVCPXflw3OUuoANqh7/cC3GEKwg=
X-Google-Smtp-Source: APXvYqwXiQTJFiG3fMIBAduxeszMtTWXhseeaj2k45xyHI30f092nDPjJHeF5QaWo0K1/qi3xLcv5A==
X-Received: by 2002:a05:6402:8cc:: with SMTP id
	d12mr3938529edz.60.1562325542781; 
	Fri, 05 Jul 2019 04:19:02 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:01 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:15 +0200
Message-Id: <20190705111824.22255-15-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 14/23] ca-certificates: Cannot be an allarch package
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:02 -0000
Content-Transfer-Encoding: 8bit

It RDEPENDS on PACKAGE_ARCH!=all packages

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 2db1915..feaa7dc 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -24,7 +24,7 @@ SRC_URI = "\
 
 SRCREV = "793b846dcd4e79371bbe8069e4125ec2fd462e57"
 
-inherit java allarch
+inherit java
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.20.1


