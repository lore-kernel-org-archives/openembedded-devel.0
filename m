Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BED1F77E91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a11so1023453pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Fdfge968DcTxZzhYt4fgXGXzpNHrEbab9olOC3VYJE=;
	b=vK8fKYn1aTB5qF5VJJ9kgQqoL6xm534is3cX69nbGDCR+KCkx6QmUjtH3+KDmSylyh
	PzXsBfbmgeRiWO7sD4WwryG0hBu+1TrozalRAn9OomvVEhUXAJgHCdlYh2FvpZ6kDd1V
	lDgTnIGKGEKc7R4mP/iBi3S+ytg2fI83IbSKOOp0/x5iLZZUH76y07eRDRCmTV/bldAC
	7i53/rDVitfaWVAkJ3bptvPKK9SzI7OaDMbKZ8NGGlGqA5UfW54WM1HXICMQxHgtN0Yu
	9seXx5LopKTCKk/QCWNUj0zPIX0MEgwXD58AtGcIBMy3IljV7YgxEeLYJKHlphbmGfac
	tT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1Fdfge968DcTxZzhYt4fgXGXzpNHrEbab9olOC3VYJE=;
	b=FrIZBTmZMEVazabC251cH4jcKP+uQBdzS+M5P22ERj/KJRz9lvZU2P78D3+eDEUJNw
	l7GcVbOlrTLJb1wUl9XNLCe3+aoh50/TH3AV8XcMfngT0nNH3BTqwbBobemRrKNWEfwH
	cI2cYKVSGi+yvfFm645Wu4IG2K/OgMpcIWgF7QlAWQBEYWgVeReViVGwxlJ5i/PvzSHr
	wYypRc1il6P+oVgh1DDdh7/U63T7YGWVqrDBMM/97jzV93uiyTRj16lwgY6kBmvEmzPd
	k48jxtobpD/Kl3gmLdYW9B4+9Bqi829G1vexP2cjn78lkyoNaZNLc8Skid7sQ8IvKklq
	QJQQ==
X-Gm-Message-State: AIVw110MPfveQA31yVv7UCktaerS2hhCgtY5T1FPhIQSp2oJVFc58UQf
	x+np4ePSPRvcOKqE
X-Received: by 10.98.19.138 with SMTP id 10mr780803pft.87.1500347429510;
	Mon, 17 Jul 2017 20:10:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:00 -0700
Message-Id: <20170718031013.44536-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/17] a2jmidid: Link with libexecinfo on musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index a520f98e1..59b73f8e8 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS = "alsa-lib jack dbus"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 SRC_URI = " \
     http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
@@ -18,6 +19,8 @@ SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d35826
 
 inherit waf pkgconfig
 
+LDFLAGS_append_libc-musl = " -lexecinfo"
+
 export LINKFLAGS="${LDFLAGS}"
 
 FILES_${PN} += "${datadir}/dbus-1/services"
-- 
2.13.3


