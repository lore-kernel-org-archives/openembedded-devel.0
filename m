Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 74E13795E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 20:27:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 206-v6so6893941wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7X83YpAGcNsGX+MBaL/EMpC8EZjl/4cKRO9iF3+/BnE=;
	b=micUaJn6ZYgjqaTz/YzzrIH+K3Eyo5AIQ+3lERobcSmYhcoGm7x2SvBAuMRT94XC38
	4j0flgZi/vTBbJvPDd826gFkF89obbjUMqYrFlFuG51GVHQKAGA/U61bXMkdM6t8daK5
	uvV+4GjMb2doLY3Eu2eic+NuBNf4pr7vRPgLKCuEsQPubpWSAXan091nQmKUkEtIHEj/
	+kdO+jY012DE99Y7J2/V3PamjBN8jxtqnB5tkpzS1N43NlTjbZacT23lfmYVPwA4Ggjk
	NsrTJCJkZzruG+UQGLKZRs824L+ATQl3RRMppf/adknfJk7CGyr5uxdgs35WFZCaWgrR
	yuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7X83YpAGcNsGX+MBaL/EMpC8EZjl/4cKRO9iF3+/BnE=;
	b=LTMBmimkN8+yimhuh0QKwi4KApku6MFr8EuMT0dvWo69NoCQZRL6BtTtbDtFmsU4LU
	4DBKZERBZe74lPwSTlOb3ITlHZ8th7cxRNGE1qZKN11FF3KRO8Cmr+DyzkpNH/z26VIa
	ruKmaNIfbuXB9AiW5bz/hkyT0mDJKdJaLBCA80GpvLnqklUh68fYfifIwxKCOgpueKcF
	er1jGjAg5DVKlufRD+XmWHOUqrW6KNpJTYc0UW19bypJfgru63emG7nuUc5kApRj5PN3
	VaeBobcpLTDaMHmkGQHc9PvsxscXtVf/3uljZ3CB+suTkcZftQ6P/+5guheRlInemDZB
	O7jg==
X-Gm-Message-State: ABuFfog6xIybuEVI1IMpxMz8AgzbdTrzHkwBOI3vVMQBSG5jebevpIQQ
	Dw4zEOelxOPcdoGLSr+JsnMTQRSF
X-Google-Smtp-Source: ACcGV60j4y91LCJbE9wRYh+fbBfrSXDLiIFdMJFwUsiJK0RXus26rR5avriPMIEqrq2UilpFsQbung==
X-Received: by 2002:a1c:706:: with SMTP id 6-v6mr1961262wmh.83.1537907259538; 
	Tue, 25 Sep 2018 13:27:39 -0700 (PDT)
Received: from localhost.localdomain
	(host132-248-dynamic.14-87-r.retail.telecomitalia.it.
	[87.14.248.132]) by smtp.gmail.com with ESMTPSA id
	u13-v6sm2056593wrq.16.2018.09.25.13.27.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Sep 2018 13:27:38 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2018 22:27:32 +0200
Message-Id: <1537907252-357-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc.inc: lazy assign GCCPIE in case security_flags.inc was not included
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
X-List-Received-Date: Tue, 25 Sep 2018 20:27:39 -0000

fix build error (GCCPIE is unset):

EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack
EXTRA_KLIBCLDFLAGS=${@-z relro -z now -pie if  else } -z noexecstack
| make: invalid option -- 'z'
| make: invalid option -- ' '

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 6342be0..be01c2f 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -75,6 +75,7 @@ KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
 
+GCCPIE ?= ""
 SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
 SECURITY_LDFLAGS_mips = ""
 SECURITY_LDFLAGS_mips64 = ""
-- 
2.7.4


