Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA96785B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:19:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g65so6821188pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9DaT1JacXXOh/Xn/r0l78ZasVSz5zBrjpCd243uTIF0=;
	b=dhzyYcwsaXmCSoResJVF73pLLD+QY0PClhPshFKuWTDAsjL98taG6Zd+jGnrAMJFNZ
	PSPHzw5acxRCApcf1+Td5nUmi+d2VPSWyeRvkac5jTe0NUTlqUFP1opWvmSec9p3XDRE
	zj7ihEvkpKPEx5X1brsZKNj/Gaeh65qiI1VTOWLW+xo1PF7vIs5fiYhqiIIrvymWHRzZ
	5itNztw20F0tMqCR1T9p1jx98lfe5rs+Hu3kuMY9cG4MimOcOLM2lClh1+CRnji/Nbrf
	VU5vKzeGuOCSyqmMiHZg6iNhbCIwB771YQJ6dXY64i70c7uraIFIUG6ukks/U5Hr19CY
	NRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9DaT1JacXXOh/Xn/r0l78ZasVSz5zBrjpCd243uTIF0=;
	b=mtvEXYhgU2fGGYncfKzHlOX9UFDltnEjTflDKu65+fr74u5Z8BVBog2IrHO1NsKCZ0
	K6dLJ79c0P6T2YWbVNggfFPtAnPp5p4g47K8etmn17XxjK99OkmFydU3k5D/2BaEfyg0
	UvcPT1CMjB4R4RY373xxxF/DZrtvcgiSHo5hvtxZgMpEJxjg9St4AucHnOdfrkQYUQEf
	jZfoo9hfiuqd2yZWAnDBNOWqiSEgEfa+nNw9/IE3rp0ZtBcRXqC+dn3aDujzPOom6qEl
	8mobYaLXUB3XY+02pZFPKcJLZ0wi1xcxjthUTunipNJM+pjIyyMNVRxsknvHfaRoyZX1
	YuOQ==
X-Gm-Message-State: AHPjjUjebJ0TW5I18MoQPRhPN3olYB6mGIFnzQHxFFg7vvn/gfNusiQ0
	J3hdgYSTRwp0YJms
X-Google-Smtp-Source: ADKCNb6R0HtmK/wyYrEkOgmAsTfFvzzZqJ/TpAzb+nZDu82Q2v1J0v+DAh4Zwzd1/hilrfJFIHdSxw==
X-Received: by 10.98.209.68 with SMTP id t4mr7663358pfl.315.1505276365474;
	Tue, 12 Sep 2017 21:19:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	k14sm19270258pgt.3.2017.09.12.21.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 21:19:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 21:19:14 -0700
Message-Id: <20170913041914.39999-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913041914.39999-1-raj.khem@gmail.com>
References: <20170913041914.39999-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH V2 3/3] klibc.bbclass: Add -mfloat-abi on arm
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
X-List-Received-Date: Wed, 13 Sep 2017 04:19:24 -0000

Default toolchain is not configured for hard float
therefore we need to pass the right -mfloat-abi option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
Changes in V2: Rebased

 meta-initramfs/classes/klibc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index c9de58cec..2aae4a8e9 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -3,7 +3,7 @@ DEPENDS =+ "klcc-cross"
 
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
-CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
+CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} ${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 
 CPP_forcevariable = "${CC} -E"
-- 
2.14.1


