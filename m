Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 71BFC71984
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l2so72337103wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bg7bF8+x5jt/WWGyt0DkaCseq1+/t2Fq8ERN31eQouc=;
	b=DCYE2Q9vYaYepqOj7wBXyJxllSjGLKu3u6eOa8Nz09ep/9aB1DVs4qFn14iTF7o30/
	RqXrsVd5M1mU9ST+YMymzjWhTowacpqx/NDv656BDSGLMPqI2swhvxcR7FYIVAi1YjR3
	KD5bbHH/7z8ZxYzkgdYf4CdkPzdjGhaDlHYJ8KLos91x62P9DJOhxFvQ9jZiZv+Yzpd0
	UC1qdizFZNh4HGV/GdzO8k7L8Ie60Ama87LJj9jJLpJXZ4g7l1OJQ5Ju2tgei8tl4ZRe
	Hhdo4QZH7Gj2zdc+3XknB2dMQKd8osMRaEQ0WypcPbDRdlpVFqFaRj8Z6sR5evqlDgT5
	EaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bg7bF8+x5jt/WWGyt0DkaCseq1+/t2Fq8ERN31eQouc=;
	b=GmU+F+P1MzAGPdfHMqkr5W5DlHY83zuUNo7UWRJBOtmt1BHCIp+YH8jT8RJQtlX4xZ
	8ILyq9br7PZDiCNfzvubDoKzxXGBw+C8UcTM14X78tMC6kqfdOE3pF4KqNW1J+4G6ITg
	6MzNx+629lkVKwPre2GvD8Y8swuQEuapkUDQ6yzHWMeltfrdpo5A7cqS4eeWm1y1hMbC
	bAw/gJdnuZLMydqWasextO98RZkU/yTDPpeeyRnzoRVBhUZas2dZ1Kvj9Os52XCaVadb
	d3hTOMVl1zcf06i4DBcOan0yeXj750mU/86YCMOq1gDkUi98pzcQDb2QunsDpHfwkG28
	k7dQ==
X-Gm-Message-State: AIkVDXIbcuLRcDM50/MyBDsFUujLrcTZISvL4jG5A+MSzZSJLUeI3OmOENJbkKhpdO+Tsg==
X-Received: by 10.28.169.68 with SMTP id s65mr7732603wme.71.1483636301990;
	Thu, 05 Jan 2017 09:11:41 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:18 +0100
Message-Id: <1483636284-6351-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] libsigc++-2.0: update 2.2.11 -> 2.10.0
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{libsigc++-2.0_2.2.11.bb => libsigc++-2.0_2.10.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.2.11.bb => libsigc++-2.0_2.10.0.bb} (63%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
similarity index 63%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
index 546305f..00d465c 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "815d0c6d61601f51bbcaeef6826606b0"
-SRC_URI[sha256sum] = "9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
+SRC_URI[md5sum] = "70bcbde2c900e4925d6ef4bf50954195"
+SRC_URI[sha256sum] = "f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.5.5


