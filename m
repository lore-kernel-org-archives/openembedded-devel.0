Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 19ACE71C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:15:10 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id y18so37502597itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KzuWdgt92//8K45ZD98gnq+R6uUuWZWRF/N3Ol1kz4E=;
	b=K50ML47lb34t92Ff7ze81oxnJS9glmqwKh3Frd3PXvDH0KmYqy0M14lg1/tfDrbeev
	dli4AjmmTIOi1/u3eaXJKQVO4E1tXhHSKSraJ5f+YkW4/xLuFhIW0KHrfp0Q0mQq3wXP
	WkcBssd4cTu8XCXfbeqeLOi/yEuUll90/jJUViUfQIqUGnowb+uICQUG26h8PVdfw20m
	EeZvKckHctQ781LTgz6j7t9GwzNjKB3UrR9B2wCcwDe46dK2AfjJUbF+eBfaZeWTmnQU
	kHxK9eX+sw52JqZzdAOOOKjNB+t1c+16uFTqIBHQtBjgG+QNL4FOH1j6UKNVDHlZZTP4
	HUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KzuWdgt92//8K45ZD98gnq+R6uUuWZWRF/N3Ol1kz4E=;
	b=CzfX7nqvM0KrelsFk1XkW7Rm5cAdRp2M4mWIjD4kTucW4eg/hJaiq025h+XzL1pZIm
	/jaqtwgqSrt3Y0ZeZXQ+e6vUuR3KyfYPVEZ/HACWP1A2nKEER1wvApaMRg6qyp+pQk9C
	EQI0ePdPuSSTk6cWX1wz/GTvVSuQMa7b9E3CSpjWWOesMwVNCbpPaN4QfIbBgUdQnKqc
	gWqmD0chp0a+6hGCPIJ0+W+tu6gje6l4vBreZwsdmEHGNiOJGWMU61SsaoksQnJzLjUb
	vhnKF7kcU9lvXssPOve/cTV9S7+afa39maLeNLrd9WsAooP2OcyqaQntCMxjNvTge2LG
	4kBg==
X-Gm-Message-State: AFeK/H2m+smo9Z346xhFgQVO+0V/fPHsFse5ReTgOPZOCFC766QQIPkXmiDNk2mLe8Oyecyf
X-Received: by 10.107.50.71 with SMTP id y68mr27156707ioy.77.1490022868919;
	Mon, 20 Mar 2017 08:14:28 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C233.dip0.t-ipconnect.de.
	[93.232.194.51]) by smtp.gmail.com with ESMTPSA id
	w133sm5345772itf.2.2017.03.20.08.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 08:14:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:14:07 +0100
Message-Id: <b3ced5c0c8686f3cb40080e07c5d885c31523d48.1490022750.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
References: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
In-Reply-To: <8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
References: <8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
Cc: peter.kjellerstedt@axis.com
Subject: [meta-oe][PATCH v2 2/2] lvm2: fix lvm2-native RRECOMMENDS problem
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
X-List-Received-Date: Mon, 20 Mar 2017 15:15:11 -0000

lvm2-native doesn't have packages, so the RRECOMMENDS must be limited
to the target case. This fixes:

ERROR: Nothing RPROVIDES 'lvm2-native-scripts-native' (but virtual:native:.../meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index cfa74d4..d0be296 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -103,6 +103,6 @@ FILES_libdevmapper-dev = " \
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
 RDEPENDS_${PN} = " bash"
 RDEPENDS_libdevmapper-dev = "libdevmapper (= ${EXTENDPKGV})"
-RRECOMMENDS_${PN} = "${PN}-scripts (= ${EXTENDPKGV})"
+RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
git-series 0.9.1

