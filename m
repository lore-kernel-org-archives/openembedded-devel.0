Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 970977199A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:00:50 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id i7so4331452wjf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rb6Jik9t9aMxNTjYmsuCxbhnoIHyhBouEwQ9bz1EzWo=;
	b=JkJ7uj+xZjCJw/ogHlxbR1xsZOxGtHcMAHsnIW7sfNGes7cnhrujoPzWVtFSVLM2Lb
	qRd13nJAgz4Or6uzDRgDkD2nGKpw86DexiuWEoYX5KcFDOkPjttF+ZhCIId4L+7ZwOZl
	ronHoBw+/N/WwjTa3+ewmhL6s2Ogw/eAvbWYiNspgs1CyO94AccgPGmNN+D+4veKF6xT
	BaAwCQsUdcS7XbSzkl/RaohayQxXDEUKtYWfXidi4Ids94L0nX0RxYvqbsjmNFzdGjj2
	TeBB5+7izT1BivShS4Kssz0m0Bc7211ON78OP+tJG+1DEK1n103vunzsmAL9pJmRaTvU
	OEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rb6Jik9t9aMxNTjYmsuCxbhnoIHyhBouEwQ9bz1EzWo=;
	b=Y/G1u7qLmU5NvJ68qGioGE9hTPkbGGI2BimrWgfCGidkEa3klkcZFSeXEk++ILmcc+
	tBScF6SpHY/bC4/A1GtpFyt42W+x/W1HDrxooaYzEHVmp8o6oeA+/psWC3kkFzzA99dx
	3dwacr6nlmAoFtv9mHaDUYPOzwwW6IqjLkG/dpWBAL3qsvLTHGLmzTd2LYVaWfbThi4B
	b9mL7AdrZM6LbjVM9BE3x073mLJqhqWX2AxolCl58iVoms9coIVNneyqycMswkg+ctzf
	JPyGQt1EY9lpS1ycRZ8iGBwbR1SXsU2Qzr7LZtlbd7PmgeUk/FUaZ3+cEEIIXqLwAle3
	/K5g==
X-Gm-Message-State: AIkVDXJES/yf9ZWLi3+I6QL1ouCyxbTgA4P6L2wyL95S2hNDQvyFhgTGsfsLFV71DCxXrg==
X-Received: by 10.223.138.172 with SMTP id y41mr10632746wry.118.1486411250157; 
	Mon, 06 Feb 2017 12:00:50 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E97DF1461E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e97d:f146:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	b8sm3328308wrb.17.2017.02.06.12.00.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:00:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Feb 2017 21:00:38 +0100
Message-Id: <20170206200039.32123-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] libtdb: fix SRC_URI - http has gone
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
X-List-Received-Date: Mon, 06 Feb 2017 20:00:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
index 3296bee..fa1f0c5 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-3.0+ & GPL-3.0+"
 LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
-SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch \
            file://tdb-Add-configure-options-for-packages.patch \
 "
-- 
2.9.3


