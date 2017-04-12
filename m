Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A31F77C31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:26:06 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l44so4185121wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MKASWS2cXuoghwnQWbyenLjyrZ1XXdMPGQovyAvLDNQ=;
	b=hHSOHWDr4ZSuAE7W4HB3KfsqklMBXUWz+7bgx9fc7i8f9U2ROTEpxfsc95mmbHOakR
	E1b6eE7F9tcaHl403nr2/dbeROH53UC9r509NHjTKe6+l7EHUPT+ISYXU5kqmSjMTxvx
	jdxjJUVniDzuSDumrYFP1gmuaExnJYef/eO9iDx3ZGHTgaUtJJZxUx6a9Xu+teLrtUxJ
	AK4AECFxx0WlelVRu1mGQPaDlEkm1TrQxzZFFaUI4JbxVaKEe0+cHaqtRCkqBNZ9GUWj
	kqonzdqe4+n0g+yR6S/r3smXm4DjU5VyWl2NnRXxnUPiyK11ZUj+tFZil+wd77m6c13B
	CzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MKASWS2cXuoghwnQWbyenLjyrZ1XXdMPGQovyAvLDNQ=;
	b=c9XC5d5R/xLRMU2xzLL5md1UWPMijJN/LfJDhsUZU6c69Br3/UaqA5cUi66khiyv0L
	OEv4QXCOYdtsJ+hkGFgfCQoEJnGFTKom4VtPvUP080bSSkOn6Edszamb/wBEJpiy//go
	PzrbFaxwRWEX9ixRBB4pttIBMHzAjuWasUVB0F1sWEhsZ5KNyMouI1QPSNGaHsLwpGNH
	Ta3JuPLfsCNWUCAIQIPi4qudsxyLiktPmum+eTTgYmRCfPIHC84JxGI1qT7SVwMyH0L2
	91OKujrSunQnb2zLSfwFv+6oaFijnnfhvmxLWXK3kfoIqRJH3DSkkwkiQLUK00MvxGoJ
	69mw==
X-Gm-Message-State: AN3rC/6675cQXONkkp4DRvcukVsrnFXEoBGSPDvshGUKRKBw5AIYQteuPkpTl48IUuTo5Q==
X-Received: by 10.223.164.137 with SMTP id g9mr3315572wrb.92.1492003567336;
	Wed, 12 Apr 2017 06:26:07 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	e129sm6606102wma.13.2017.04.12.06.26.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 06:26:06 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 15:25:57 +0200
Message-Id: <1492003558-8647-2-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492003558-8647-1-git-send-email-gizero@gmail.com>
References: <1492003558-8647-1-git-send-email-gizero@gmail.com>
Subject: [meta-networking][PATCH 2/3] openvpn: remove duplicate attempt to create dir in ${localstatedir}
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
X-List-Received-Date: Wed, 12 Apr 2017 13:26:06 -0000

When systemd is in DISTRO_FEATURES we have two attempts to create
${localstatedir}/run/openvpn: one at build time with install command and
the other via systemd-tmpfiles at runtime which is enabled by installing
openvpn-volatile.conf. Beside looking redundant, by dropping the build-time
dir creation attempt solves the following error when building images with
both base-files and openvpn:

Error: Transaction check error:
  file /var/run conflicts between attempted installs of
  openvpn-2.3.9-r0.cortexa7hf_neon_vfpv4 and
  base-files-3.0.14-r89.raspberrypi3

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index 5fd714a..8dd4566 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -47,8 +47,6 @@ do_install_append() {
         install -d ${D}/${localstatedir}
         install -d ${D}/${localstatedir}/lib
         install -d -m 710 ${D}/${localstatedir}/lib/openvpn
-        install -d -m 755 ${D}/${localstatedir}/run/
-        install -d -m 755 ${D}/${localstatedir}/run/openvpn
 
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m 0644 ${WORKDIR}/openvpn-volatile.conf ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
-- 
2.7.4


