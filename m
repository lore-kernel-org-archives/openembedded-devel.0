Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 71F4F7E9D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:35 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id p10so3428215pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JKgax1/JA3rG3mIzzlJvX+0nubFO07ESn0wG0YJ8qEs=;
	b=Tcdr1affl7xvBOl2PTFRaL3/u/fqTwfY9mO08yy6yPmWJO/YMrPPWaPNfs9GxIMD0u
	xfKaSxFSycY2ujEgkyHux51npJtPIMHeH1sD3l6aXNX0s10amRx1peUOYbe5Dl3u5d7j
	ipGOjcK4cqklENAzlOGMiHV5TTYDSv78y4IZXGUYLWUbdoKtct5lrwcHfJ78O/sCugKc
	yaL9hPkP16PkDeJF//lqxL3J3nZc0FbrK0w8A5xD/WViANs7MN5f728Gq4r1wSWKXyP0
	y8eOrbIuNxe+2ymhyP8KPONfTCqcEqs7cSyDfgjB+gPpvevw6hmn57dORqE8EKWY1UoA
	Ywrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JKgax1/JA3rG3mIzzlJvX+0nubFO07ESn0wG0YJ8qEs=;
	b=gu0Fx3iUmA1l14XDBxEf0pYNtgg9RlU6quk+An0QBoiQOF1z3AUpFg9f+jPYCwjL4h
	/To4QWojVBxAF7AmAQocYUS2gra2vsxjjswWgJ/VJ4lzqD/V/dUjA3nyufXFTug3DIGE
	TLErQH9wrAEAFumfziZqXJsvo+Fv9cPk+tAyWI16s9McdAg309ZEOPbTfOqJX1+2TwAm
	MLuB7iQqqpr1o9d9R/vQB8uTSWnIZM7+VCwGtPVyJtCk782YUnFey/b9PlsY2nJdjAf5
	FeQjpGoqXdaC5fruw8Gj/s0SkSjEzMFUf22wrox70zpBDIRHF2yL44vePN0z+VyDUG97
	f2jQ==
X-Gm-Message-State: APjAAAVcpOHmxDlfkZM4ShNNrTlrDIbfPtL22E6+PNt8wl4330DW9cCi
	iex/+8sZ+/3HGnZCSiPRK95s6IBT
X-Google-Smtp-Source: APXvYqyAvlTyrNMszzF5sShxpXnfZ0G3krMnmGsF9M4KltL6jAn9te5HGoF5/HAM6G06sRaQ1B+l1w==
X-Received: by 2002:a62:5e06:: with SMTP id s6mr108531072pfb.193.1560621456167;
	Sat, 15 Jun 2019 10:57:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:08 -0700
Message-Id: <21fb7771ece4e7e3efb19d394c55acfeda3009b1.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 04/23] umip: make MACHINE_ARCH
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:35 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* Depends on ipsec-tools which is already MACHINE_ARCH (and also RRECOMMENDS kernel modules)
* Fixes:
  ERROR: umip different signature for task do_configure.sigdata between hammerhead and mako
  Hash for dependent task umip/umip_1.0.bb.do_prepare_recipe_sysroot changed from 7c74a208880f6c8a5aa46b1c8577e39b6b71429d9a379ea75f17a155ca270035 to 87c6cd438dd9645c98530e3ac1094005bace785bfd89bfe4073bc8815926abba
  Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-networking/recipes-connectivity/umip/umip_1.0.bb.do_prepare_recipe_sysroot with hashes 7c74a208880f6c8a5aa46b1c8577e39b6b71429d9a379ea75f17a155ca270035 or 87c6cd438dd9645c98530e3ac1094005bace785bfd89bfe4073bc8815926abba

  bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/umip/*do_prepare*.sigdata*
  Hash for dependent task ipsec-tools/ipsec-tools_0.8.2.bb.do_populate_sysroot changed from 1100c4984d88050bb7ca154445205bac3c3ab80c3ff0aa7c9124825c9d4f6e14 to feeddbd35a8106b264c98076e21d0b3cb227ab1d209e150926112b2906273ef4
  Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb.do_populate_sysroot with hashes 1100c4984d88050bb7ca154445205bac3c3ab80c3ff0aa7c9124825c9d4f6e14 or feeddbd35a8106b264c98076e21d0b3cb227ab1d209e150926112b2906273ef4

  as detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/umip/umip_1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/umip/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
index e2abc02..43367b5 100644
--- a/meta-networking/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
@@ -20,6 +20,9 @@ SRC_URI = "git://git.umip.org/umip/umip.git \
            "
 SRCREV = "cbd441c5db719db554ff2b4fcb02fef88ae2f791"
 
+# Depends on ipsec-tools which is already MACHINE_ARCH (and also RRECOMMENDS kernel modules)
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-vt"
-- 
2.7.4


