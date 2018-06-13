Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39B1078A17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 09:55:59 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id w17-v6so1237437pll.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7qfV+EQKSFiWfqIxyBXKaPdLRr9KA2J+qesJi/4Vbfk=;
	b=V1RzVmPo/m9N2yyCl+d8tJmJKrN5j7kmtYYKQpxJXkECbN8gp+Vznl6H1nED3y2yAI
	A/iqQePksMy0Px6GM0q9JpHInueKF81gT5YlrVDtvqryzS175W5vMFjPPwJMfXphm+K+
	5ClLG3LDCOkEdmj8ziNr0T0RbyuDThRqNm8BsyXuGoXdOj1/Ds8cOIfu49W6WKw9+HcK
	RMM3X7ZFcxJvk4sgU2QTwy8NBcl0APjX+qRVRQhYtja/EBboAoGytu9jBxgHj0ygzR8t
	1r7ieOEW3VP5Kmzb2Ks0/XkL83OUCp/iHxYA4/mOUow2ywKC2VU55TmRy+byCf2TGQKz
	uIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7qfV+EQKSFiWfqIxyBXKaPdLRr9KA2J+qesJi/4Vbfk=;
	b=nS73iS8ExXlEQDB1iKxAxuZGx1NlbPMBtV1qiO9l5T2oF6bWDfQrYEGRSU8sHs0dd/
	+z6WeNqJeoGL0g8TvSjIj+Og9fv+xGHae5Uv/IFFKZAdFoIJ3WCMu4v7C6Y+KMv6yJyp
	eY20vBh+NIL4CSAclw2TeJZsr6UTWR39AbPhNj/jQzy6+iPoU6lphA9M10j4UheVuhBl
	5+nAoIf74KRvPr/APJmbOFrWhboT7GX8ZtNnII/79+O6J1cfW0FQsKbm/lTMdLiDF3aJ
	NdLxrvcx+hwGo2HrBOzSEmr6YnYwuhjAxDGXRCyW/xltleEJ6i0ThaaAoLnWwszV8jVw
	vdJA==
X-Gm-Message-State: APt69E2awEZswpDIMnrD9iXWCriygh7PSO18zw5yT/TQk7ygI52YbtXV
	RNTX+t464R2UG2sOHFKx/RKRC+x11ts=
X-Google-Smtp-Source: ADUXVKLLdxlSS32tQ+8JJH0kVRMQChRdjwbUDF5sjSCBuT5l3RZs3jopBkCKXL651hXYjjHe2trqqQ==
X-Received: by 2002:a17:902:8a87:: with SMTP id
	p7-v6mr4375798plo.281.1528883760238; 
	Wed, 13 Jun 2018 02:56:00 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	r74-v6sm4047912pfi.174.2018.06.13.02.55.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 02:55:59 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2018 02:53:03 -0700
Message-Id: <20180613095303.7433-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [meta-networking][PATCH] netkit-telnet: Switch to update-alternatives
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
X-List-Received-Date: Wed, 13 Jun 2018 09:55:59 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb       | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index c03b8d968..9fe3d6e51 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -50,15 +50,11 @@ do_install () {
     install -p -m644 ${WORKDIR}/telnet-xinetd ${D}/etc/xinetd.d/telnet
 }
 
-pkg_postinst_${PN} () {
-#!/bin/sh
-    update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
-}
+inherit update-alternatives
 
-pkg_prerm_${PN} () {
-#!/bin/sh
-    update-alternatives --remove telnet telnet.${PN} 100
-}
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "telnet"
+ALTERNATIVE_LINK_NAME[telnet] = "${bindir}/telnet"
 
 SRC_URI[md5sum] = "d6beabaaf53fe6e382c42ce3faa05a36"
 SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00"
-- 
2.14.1.459.g238e487


