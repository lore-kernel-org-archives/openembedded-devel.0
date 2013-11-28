Return-Path: <joe@deserted.net>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3680D6D82E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 16:00:29 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id i13so885889qae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 08:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=g+Ub+WklgVJKUQsfGNBagUAsSElzUuzegzhWfcVWgLQ=;
	b=OO5orm1ZPJvK/LBZkyBMxxDntI95Plp/3FxdqASlNbvi1mlTkA50MhfWKcjWzHw2Om
	F9OZhw2QcLV0qAxG0wNxScYRTVW2KzVMPft7f0BD3/vPOdvNkjbdjo9FSbT1ocTUjAHM
	5ol/lqja872GAm+CFqwZDdf1frHcBsWkmKy91n4/Pqg4FTxcc5C3P1tZlo0syAjM4vMn
	A2KLn282utxOw/mqr04lAIMqQUP3uvTi8r6ShOmu0YdmX6kHmtCRQ/ItWhJ056GUEkcj
	io/fYWQ6u81h5bfqxDMMTZob4K9DmKCr3OKLTJP7vT80Ll3PxWdrBroM5b2FSqo5K9fS
	nCqQ==
X-Gm-Message-State: ALoCoQlRtp6/zGZZyDva9f6bO3tNvZLvxHkxTFwPu1abg02JNTARa8iAQwtDhYXxarKzf+mjyvPX
X-Received: by 10.49.35.144 with SMTP id h16mr78056247qej.35.1385654428828;
	Thu, 28 Nov 2013 08:00:28 -0800 (PST)
Received: from burninator.local ([128.224.252.2])
	by mx.google.com with ESMTPSA id x10sm75031576qas.5.2013.11.28.08.00.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Nov 2013 08:00:27 -0800 (PST)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Nov 2013 11:00:25 -0500
Message-Id: <1385654425-23858-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] tcpdump: correct QA issue (unrecognized configure option)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2013 16:00:29 -0000

WARNING: QA Issue: tcpdump: configure was passed unrecognised options: --disable-rpath

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
index 1da8194..6c62cc0 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712d
 inherit autotools
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-EXTRA_OECONF = "--without-crypto --disable-rpath \
+EXTRA_OECONF = "--without-crypto \
         ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
 
 EXTRA_AUTORECONF += " -I m4"
-- 
1.7.10.4


