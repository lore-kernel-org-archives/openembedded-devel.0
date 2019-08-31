Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 074E57F4BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:01 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id b13so77766pfo.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qvqFtvJfe2onTiT/9TcSNfbSWkanoVdHdayVQbqDtgw=;
	b=Wa7+39yO0bCj60VQG9fWSjZfEY+GSPX1i97oQ/hFkS3pakbSjBhbyq3aPsvvt3uiOh
	lBFGc7cFs++VQ2T0i7C2QI+sOhEAoCycYrAjBipJiW/WS6ghOrGkz20aE+U0ho+5eThS
	bnfnZS9FRZ6jDw0RA86eOnG8LffFSJM0kuH//MnBIDAW3+bQg4LGKX+1q9blxdvKpJve
	VqKGjryyNufEDg0yt76Y8psUd4CdpGmiAXirS2oFZDHAFh1HpRzafoNcHhcbUeyWijtP
	M1lqwjUyIUigFZQIuYZdqxBBIKzgxpC8f08TlGlLs5paEocwepE0SvX2Datm+YYjGGpo
	N6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qvqFtvJfe2onTiT/9TcSNfbSWkanoVdHdayVQbqDtgw=;
	b=AMwIVI33gAkqZ5KqOyglq5NlYJ571EVskvKiR51q9L7eF2TPVx6gH+bX+/y7fcOOcj
	8cKRwsZgfJ6+8J/tBAoAX6547tEBSQ4mHQ+z0DKRgZF/O/AlRMpCBnzkfOIzDXlAK4Ra
	G7/Ql+dd7dXpGhu3SZynA4aArm8s6chy51gv7wrO7lXOslMAtpP4pbWan2Oc9N8YnAjq
	LrdCOarjN0F38IUPVI3A/O6d8uxsybBtuS/6OMMxdzg/PyxKaSpIuRe5iznIwzb9Pl9e
	CRmXnP9hDN3cBK+lfXwnLqRXhQpbPDvuwW+En7f3zcxMGlfTwUTCTha2YAYYjasB2kFE
	SG7g==
X-Gm-Message-State: APjAAAV6ssttSw/iN0jzHBvi2143NuPt/XG7S6Ly7gAaw5U0Y99tBhTk
	lnMiS53/x/fdX3+EP4rFcIGiWP7R
X-Google-Smtp-Source: APXvYqyZbAEWllgs+4C5ky5XMb+BlB6D90biNAxE/0VIZhKko9MVNCR+ZSAf1O+guKQDR8MGhdTmiQ==
X-Received: by 2002:a62:1cd2:: with SMTP id c201mr6729243pfc.51.1567287122937; 
	Sat, 31 Aug 2019 14:32:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:38 -0700
Message-Id: <71dc9d5f1b66efb695f98860651d3ab2e1a5c04b.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 17/23] scsirastools: add runtime dependency on bash II
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:02 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: QA Issue: /etc/init.d/sgdisk contained in package scsirastools-diskmon requires /bin/bash, but no providers found in RDEPENDS_scsirastools-diskmon? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 37d083c..b922bb1 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -43,5 +43,5 @@ FILES_${PN}-diskmon = "${sbindir}/sgdiskmon ${sysconfdir}/init.d/sgdisk"
 FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
 
 RDEPENDS_${PN} += "bash"
-RDEPENDS_${PN}-diskmon += "${PN}"
+RDEPENDS_${PN}-diskmon += "${PN} bash"
 RDEPENDS_${PN}-raidmon += "${PN} bash"
-- 
2.7.4


