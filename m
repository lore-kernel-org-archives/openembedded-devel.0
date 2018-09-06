Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1697279704
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:36 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id ba4-v6so5281877plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ca4l8DGuVbjrXgJarH8WKleBk7m/+cDzMPKLzT6L5ew=;
	b=QhcMgSUeFQ0n8RtZHhRDUXZMQvGjzEsHmnqV0hr5yK7EcZhscXTxguL5QDR1/L0nfp
	NJg3eiK507Cbc4LqcS5fHYIqMIUrFO6fgpNVFRSTw0hiVCHSemumfs4mJ0guniFB0f9g
	MxaZ7AxsEam7XBrHa03VHVkSsOJO67QIxEQ6pTjNUhMJOixtAhbdvyDJ3y8UDePOFd9M
	I+j3m0pSkoq7bffI6pJjcwwaSsdsh49ne7o4hNzaEjnOgj54LODi8S8+vBlCKMS4tmFz
	qNM8QDb0lYVigHdqTdpDCnm1eA+0QAJDFE03e9RT6ik9tPUEilf5dzMpakEyHLp2RKRg
	KKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ca4l8DGuVbjrXgJarH8WKleBk7m/+cDzMPKLzT6L5ew=;
	b=avVoN+7yPsMUHsk17+tPmEM8Fn8ehbQtI+SwIlXzH5eT+f2sIAtwcu754NLesRm3tB
	JT9Irb1hXVyZ8p/n0VWiRxN/tRaZ/XMyxsaqcVY7xmfti8w8OauUvY2h5n3csu5UoSQG
	vCxiTeQxY6lNhIeoC5fubzDgUOrBPDmBUFFdwOL1n26PypT2KgqHOzUvMaLz1tK7J8Ww
	oPsJtoVmXV4pG5YHZI780ysJCASbEuMlfI6PSStCLUbghwekyYdJr8LBPoIlVxnXeO12
	xRBSBxS/wazxCVYAqbxJzndsJbp44yBQQkyzwvXC6n2dkPTY/EjccyWJnWIUN7VZA3a5
	96HA==
X-Gm-Message-State: APzg51BEuFdF4Tik78Ik+2ut1CAxMrwVJ+hN4N1wkSrQEg3fylnumZXS
	9Pb8UTW0+6zgKvOuRyeXubfI8C23
X-Google-Smtp-Source: ANB0VdZv1ASJKEiwO7dzDXv7Jg+qVN3ERK/R8vu0NghanoqZMNcsyUE2FaK3xzyQtpbDR0+Q9mYOog==
X-Received: by 2002:a17:902:bb08:: with SMTP id
	l8-v6mr3741976pls.71.1536254556979; 
	Thu, 06 Sep 2018 10:22:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:07 -0700
Message-Id: <20180906172210.42551-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 14/17] oscam: Depend on openssl10
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index 2bd970fd5d..a8aec113cd 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.streamboard.tv/oscam/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "libusb1 openssl pcsc-lite"
+DEPENDS = "libusb1 openssl10 pcsc-lite"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
            file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
-- 
2.18.0


