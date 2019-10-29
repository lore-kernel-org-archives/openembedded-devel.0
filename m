Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F34C7FA1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:35:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t16so14809192wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 11:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jiq5mbQoaJqX5SVItb/6AHtvuVa4YByt/eEkFv8jG+M=;
	b=AvkuzsE9CxZo+jKn+i+dN+alk9v+Gx6P0nSp+/vdtba5ryryP6iWdUdhRGZaGY/+MT
	zYViLENlILipZ5lvSOOEJFJQzc2Z/h6Bqyr2vsnfbBRHrHN6rhTmm8ETqb/rbJSr0V1P
	R6C07QE57L/vP9mgjWwxhhh7UIHAeJrqTIsGvlNobQcKfc9Tk1HRM6Ks9IGA9Db0XDXA
	JNrvwaZtaTrRHJHF0toBi2oHajv+Dp2qr+84iCIef8YXzUY8mqm7euMeyVoCI2llYwcI
	ui0A5pBPprpVZMZ3ZhY4KjM0CFGufcu6spqUFNb23TAq04899T2xyMVycFbyQ6NCPuWC
	pOJg==
X-Gm-Message-State: APjAAAUAtnpbQ1nRF9QlPq6X3qP4SFFVIlBeuzcK+L0lRdLmrp+lbypP
	Wy+LDd4SxciDeVlj/radDlTdgC6P
X-Google-Smtp-Source: APXvYqy5b1Oj6UFVkXqN7qlSMzk5yAywiMYtDUGnscVMepSw8amFPiLJaqbLlobiSxXrpLzBIC3EmQ==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr20976643wrs.63.1572374110539; 
	Tue, 29 Oct 2019 11:35:10 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q14sm19470655wre.27.2019.10.29.11.35.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 11:35:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 18:35:08 +0000
Message-Id: <20191029183508.29985-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191029183508.29985-1-git@andred.net>
References: <20191029183508.29985-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] nodejs: allow use of system libuv (and make default)
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
X-List-Received-Date: Tue, 29 Oct 2019 18:35:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use system libuv via PACKAGECONFIG by default. So far,
nodejs had been built using its embedded copy of libuv,
which we generally try to avoid, for the known reasons
(independent updates, cve & license checks, etc).

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
index 6dacc2824..e86804124 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
@@ -49,9 +49,10 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "ares icu zlib"
+PACKAGECONFIG ??= "ares icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-- 
2.23.0.rc1


