Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2960F7851C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:19:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f84so7052130pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wmrXiU7b7rcr5npnNgku9DW02DpDKFGGl/H1fqtRfrY=;
	b=D4HvRj1xCVLvdbMm+HuNC22dIgFJAQdPt2U+XPf96XymOq/KjhWmsgc9eT2/gx4Xoc
	95aYgU9kymH1AOTyfl+WV75TgHDTM3/qq88pFUTdSXj57cEdfSZ/Y+7kAiCV3JTVnczb
	fsKUqghV/rxOe8KDC1e134vkhphGkwaBt/wUyDdF9rQfgKzD/jBC+6szEj3DoUq1llHy
	LV7//A9HfTQkTbi6O12pHoarKNMyvXeTmBSIQihbuVzkUNgbdNr1wxkJwx/Eg4b2tZN8
	QIKpbZaaNphXL/RfVl4mYGsvEnzjp9GpKyPbiVz2LTYrRViHPyq9D3CpnaIJH+Sxro92
	1i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wmrXiU7b7rcr5npnNgku9DW02DpDKFGGl/H1fqtRfrY=;
	b=X5San59CuorLSF/UQky2BgNXndxUQl7D6yJAU+hKxknZAoP1kW5QvSzf9bPuhrLRp4
	hrH4aS+v4tbDxEBdkJCfnwDCXlwphHVMVrpfKEBlY69+Fc8p0Byss2T/NuCLqXvG51r9
	BhMESALG51GRSaT4NmRaL9+apB3E+N8znHJh4L5qfOC46k/RMHTfEBkIZpXxvJ27RxO2
	pf8oIpvnQIDgcH6Tj/kT/fBYgBKdz9IPqGXkB+Etsgriev4WlFhQXIwFjLGYUu1eyqns
	s7b1lPAKuQ5CUknkOGQ+nW8MzfhEaPFRPaXoG9AiV5vqUXK3tF9OTIKbnNZxZGTyHJh7
	P9yA==
X-Gm-Message-State: AHPjjUip0Vzmy2BshBBQEWoxvJIZGO6KRpcKELpEFZZQ6nH41ypQ+Z0A
	NRjwZKYphM4HDN0d
X-Google-Smtp-Source: ADKCNb6ZzAPI98ALHVieQLWDQ2RPcw56XfClicr1eL7k4E1jcluogDg7IROyM+G8MMiXhjTjym6bbg==
X-Received: by 10.98.89.151 with SMTP id k23mr17365941pfj.69.1505276363159;
	Tue, 12 Sep 2017 21:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	k14sm19270258pgt.3.2017.09.12.21.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 21:19:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 21:19:12 -0700
Message-Id: <20170913041914.39999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] debsums: inherit gettext
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
X-List-Received-Date: Wed, 13 Sep 2017 04:19:22 -0000

Fixes
| cd man && po4a --no-translations po4a.cfg
| /bin/sh: po4a: command not found
| make: *** [Makefile:11: clean] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/debsums/debsums_2.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
index 41ebf87b2..13f20eb94 100644
--- a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
+++ b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf244523c52c4ad8
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
+inherit perlnative gettext
+
 do_install() {
         install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
         install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
-- 
2.14.1


