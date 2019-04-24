Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38EE57D67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:19:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d55so16970359ede.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fS9ykkp9F8wgKh2E11ucOQOdWTP4V1sNs0oq1NaV7ck=;
	b=AwrB45r2r5GUSxEyFQzbASCWf6OIGZ95PdZkPAmtrfBcqHUFmdM9QFOtztRNMfJHTh
	oK5zpUoRPpYnfUAa/pNOnLmEftLYmL/pPBH+fV/2czAAc40+cPfYxZHHP+F3PfuFFvRV
	d9wxfc+nfPbUQkTjhqUqSWprcfdrgq8Jc8Zd5OeEaV9eqlz/Uv3GqalfW9CUDmXBkOcr
	xd1qxtblf8Cb6eqHYSxq1GnTHs9GEvVvSIqCoRBdtI7S2uI/F85g0xS0XVtF7FMZo3hu
	UUZnljhuGTAtH79vmmOUhsp+1dKIT3CUVVNd8nVo8G7oe87vGTfRQCN5Obhkr4uKiju3
	IcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fS9ykkp9F8wgKh2E11ucOQOdWTP4V1sNs0oq1NaV7ck=;
	b=lEuuESTzeSUx0yzhB1C+ArN/YUaQcmny36f5TxNvo0OZ2vFvwlXSRxm0LfRc/n5Lui
	TZROmADseeAR7C4t8kvUpHxZt7d3m+AQbfDGJ+kgtSkOyASca3+9MHcfosTcPe5bOjSW
	U2FZ1tIiF1qBQy8FKrS76nAHOGSZro7XDOKikX4NKEdYURImylZXkDU+a9XOuVf6DAqj
	pE20tP2CVC5V2U18gsKbb5kls3U1pJr90UUYAMZbZwMRdNMS0wejrozGvU+EAOuxXdFC
	NQrMSpUK0zuZXXap/nFLX5Of4F72F2JtTI4eye5AzN1OejyXftcd7y338cTZh3Wh8lKJ
	wa0w==
X-Gm-Message-State: APjAAAVte1DhOYNOQlrsPtdHCVvmZpkvBV9tSmXvtYRiirLkUDQkiPIZ
	bfY3omPuTILXZEMGigiJHFlg+NZKb8s=
X-Google-Smtp-Source: APXvYqwGyVHpo+7uUgqaGXCsQaFQvX/10oGFaUu4++3ZDNn1TBIK6A6RDgy3FUPUIyhazEZz+4ocyw==
X-Received: by 2002:a50:8c03:: with SMTP id p3mr5552684edp.267.1556133543843; 
	Wed, 24 Apr 2019 12:19:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	oq25sm3709151ejb.46.2019.04.24.12.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:19:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:19:01 +0200
Message-Id: <20190424191901.22479-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] wpan-tools: update to 0.9
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
X-List-Received-Date: Wed, 24 Apr 2019 19:19:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wpan-tools/{wpan-tools_git.bb => wpan-tools_0.9.bb}     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/wpan-tools/{wpan-tools_git.bb => wpan-tools_0.9.bb} (74%)

diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
similarity index 74%
rename from meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb
rename to meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
index b6d2f6923..bab75fee3 100644
--- a/meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb
+++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cfd939b1d7e6aba9fcefb7f6e2fd45d"
 
 DEPENDS = "libnl"
 
-PV = "0.8+git${SRCPV}"
-SRC_URI = "git://github.com/linux-wpan/wpan-tools \
-           "
-SRCREV = "3f473f5136f89773997cb4fff2d8ed647734e2f5"
+SRC_URI = "git://github.com/linux-wpan/wpan-tools"
+SRCREV = "a316ca2caa746d60817400e5bf646c2820f09273"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


