Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8618D7E66A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id n4so13801049wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3SFZZ/gspQFUvJhJUFkE8MeAKr/n57wxdD4PEK6/Z8Y=;
	b=vXqS7k7RDZP2XVJmf4e4bEHg4kr18bC8tdO7Y8qotlVAAZnL7c4wmg4S/rOrCtHEP6
	2tpQHdbRXQM25Ldou7IVxDOCT0s6RVR9iGDVqmB6GWD4VHbr8WiAURqGTkjFSMZUkgaE
	h0VzQH5kxwUUaD1VkIRsH/c34ROHrl+dKS5rhqVN+Zm+yfWu3y/8LDud757eN1S7ci/4
	URrZllPtknl20phxAJtblrQFGL0GredE5Hn06qjTHDB0pK5g3pRFJTrNbXP7nPayVXU8
	6N2CuRaTgIk6gUg64j36k3YH6Jgkn72g5mHAdhgwttZVdT7p9nt6I+S2HGSAzuFKN8q6
	XOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3SFZZ/gspQFUvJhJUFkE8MeAKr/n57wxdD4PEK6/Z8Y=;
	b=EXZdFPp1UkbSSi6STm0NZjLN0EIb5OkIipYg4y97wHCTcmy0CXVQ4Yf16y1FIRWfH6
	IcynP61rQ4Sc+n5G8REO1gyuE7Mgb+L1IUC00S8c0cxmNr1DmnjQzxvH95r60KVu3Ijg
	Mk/ub09UGL1Ul19EpM4xBJsuh+tjajaGx8mVdXQANDmlQQiFGPzg50RcPl8eDcuBE7rL
	gOFhIGLPweyjDArtm7s6Ux7i4p2e39UODM4jjcsqjwFfkW+Ja3uf20EkhyL7f5Nk1bQ7
	Mjwm1REaHtiXv4xMptcEyfR9xYcWE8ByQm1D9DZiuCJwRwaIO99eMRnJyLTVN+Z7uBOE
	Erwg==
X-Gm-Message-State: APjAAAU4SEPxBKurpyOdHkJHjWc7EENIGaUgNFytagDf1vajSP1gWRT/
	Xg6nyPxasqPHE2JTCqs0acnL311p
X-Google-Smtp-Source: APXvYqxIf/ZGHFFlmlvNL7mug+pIbi5dvEe095oFq7Q7nWHUcz1ZJ/SBf3vVsPOC3vAp67ixJ5Z4DA==
X-Received: by 2002:a5d:6212:: with SMTP id y18mr2456655wru.178.1560272111069; 
	Tue, 11 Jun 2019 09:55:11 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r6sm8334156wrp.85.2019.06.11.09.55.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:57 +0000
Message-Id: <20190611165504.23049-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 04/11] umip: make MACHINE_ARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:10 -0000

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
---
 meta-networking/recipes-connectivity/umip/umip_1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/umip/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
index e2abc02ce7..43367b5503 100644
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
2.17.1


