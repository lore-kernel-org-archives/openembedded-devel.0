Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD876780C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r133so994151pgr.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XHn+BfjI+jtSXIlv7rfgSYVAP1EwNMt5fBzo9TAp9gk=;
	b=dQpfTjGwwrGjtVclpzvBkQ+a2cniTa6pkUpwFuaEZ8seufSs1HlHsfx3fj1xPGfTze
	qMWL+aYPuR06j32IjrmquCdYXsG82BpYHdN1cnrdYSHGgPpCKGgTw4aduJQEU503mGRu
	C+dRDDp5nQ1H+PH3yVKBJLre1Q/CzG2EVYyHZb/OmhNpwz1FqDtmujFpW7eGNxTEtU9S
	xluojH/RwVsPcNirPaH/Muatuq8f2xXDIsBw4CJ9sYdbNgGjSAoil7VH3RQ1LvrV9mhC
	dAIG2NcdveM9vbI8pt6sXcoLzs7xK6s9X5B9pyrFyYIT6YDieJyWPayXbA20Knc1G/Mz
	BJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XHn+BfjI+jtSXIlv7rfgSYVAP1EwNMt5fBzo9TAp9gk=;
	b=geTsDGzSSVW7L/TAK/Fw92tKoYfp/iWh24rIOiN+Vm2MsU23v1rQU/rUCleador0tB
	aj44AJos1ypdMOgQxyxvk2PtiSs8VIg6Hm7Ip0SEGq5CDSEw41pFTAEcF76vcxk/Ubc8
	LqjzfUQAPwPa6CpZ6c1EUyH/zZmDvnh6ieyG3yAk4aQ/Qf9ylvrYGgmn2PZ3WewyJMEG
	ifLBYOEW6wA0nPqS01B0rN6JlxnvkpwkPMzKAKYU1w8VwFOfl6qBTLQvvucPDf9DMDCV
	Yx52wSNdlSPpVziiiTtcZr3YATUlyjVSAYQTc8fxFBWLcHkYUKzTJnjLv4hR2DpOK3LS
	7UaQ==
X-Gm-Message-State: AHYfb5jRqSqXXhvj5xeEXWqGwo7aMk/9FmiwI05GH+jmq/WxLEoVqzmU
	XvFf8hqGFzSZppfq
X-Received: by 10.98.64.154 with SMTP id f26mr7767537pfd.21.1503610721189;
	Thu, 24 Aug 2017 14:38:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:26 -0700
Message-Id: <20170824213829.41431-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824213829.41431-1-raj.khem@gmail.com>
References: <20170824213829.41431-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] enscript: Define PERL variable
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:40 -0000

This sets up the perl interpreter correctly on target package
Also fixes
QA Issue: /usr/bin/sliceprint contained in package enscript requires /mnt/a/oe
/build/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 96129880a..2b6d14e6c 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 
 inherit autotools gettext
 
+EXTRA_OECONF += "PERL='${USRBINPATH}/env perl'"
+
 SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
 
-- 
2.14.1


