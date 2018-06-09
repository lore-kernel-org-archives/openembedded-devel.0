Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id D5712752F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:19 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 30-v6so9451789pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8Rw3OLHrzMSS1S0mN3gwUpvLwLmzPFPBUGwNdIsCAog=;
	b=JDVO1Nzb6TM8epApbxCC6nPz++vQ/f+FY0fjdtQiOB/rn7cLv4xdol7HdF349w6yDh
	JSqnDTYneh1S8v77KqRccmdHLtG0o543s3tRJyitTXL/dD92GvJ4amRl0aF07UAyby02
	YjHxsaTsk0k727zKa/oA9m7wxbe9LazK3RV8hz1AGKXUL/nB2Lw3ucrVuiPIHNBKnn7r
	+oWwvHBFQMTFWx/JLCt6wgxaQPqDYqWaWpSzNOfa4BfBnvIRepEss0dasot+IkV+TOj2
	jUalFeQ4PRAnd1vDNrdm3G0UPdOf0L9uFppl3RKfKab85YfeNBsY1PKQ4e1R3V/ATNGa
	b+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8Rw3OLHrzMSS1S0mN3gwUpvLwLmzPFPBUGwNdIsCAog=;
	b=FYVJM4qeO9rG93pEsrYsdwW4KwPUtvVVMBTE9CC3c+KwDHswXbj76vZMEHWt/AMuge
	emSHkdNjjyD0d/nIJB6AooegV1olDdDnJynjWs7KQzapppq/V3RVXO73ZFgqSHHfP0El
	CWmr/tGZuQ69d1gh0xAj+mnoioBaXDFqaPDDWsdkg8RUzYjUBemKfeGU5+05iCNWUVj8
	8w9/8Sfp1OTUnXBAQFE1mdbttFaeMw9UOI0JaVUndLLB79dyOr8ir/aWSYcFTP514ahS
	MVyPAN4nwqOwvj1mc2eyDn/4KMF9sD9/StGhY1xJmVPt0HOyUxudnzA8+GAXwHkAXtPh
	HqCQ==
X-Gm-Message-State: APt69E26JJlJ+QFGaGlXt4fNZ8LVqR8IqaSaVtVKlILy2cA7PuYU03av
	f72VDYS5yjoctwedexSFLrBcdA==
X-Google-Smtp-Source: ADUXVKJ0cYpG0sqxPyzn+UwbqhNLyKNplvPYWxVS4krMEvllXUpec7/+0IeEcYS+rO6Z2adN2px8eA==
X-Received: by 2002:a17:902:aa95:: with SMTP id
	d21-v6mr9583180plr.73.1528526660688; 
	Fri, 08 Jun 2018 23:44:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:15 -0700
Message-Id: <20180609064415.10270-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180609064415.10270-1-raj.khem@gmail.com>
References: <20180609064415.10270-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] lcdproc: Update to 0.5.9
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index 96bc826fd9..fad1d616c3 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -9,9 +9,9 @@ DEPENDS = "ncurses lirc"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README.md;beginline=107;md5=5c927ce1742d6d5cddc45b7ad6230f75"
 
-BASEPV = "0.5.8"
+BASEPV = "0.5.9"
 PV = "${BASEPV}+git${SRCPV}"
-SRCREV = "f5156e2e41bb418f14761afea22eee8efb49fb85"
+SRCREV = "79fa538647c3e09a87ecc86aae1abbb82e0a25c5"
 SRC_URI = "git://github.com/lcdproc/lcdproc;branch=lcdproc-${BASEPV} \
            file://0001-include-asm-ioctl.h-explicitly.patch \
            "
-- 
2.17.1


