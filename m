Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4F5C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:40:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.30711.1641228003667979875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fPuL2420;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id v7so70845349wrv.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Otz/SlnLc2C1+G4lqYEuhvQ8PpbIYlgxNksOGgAwFA4=;
        b=fPuL24208IVc3ZFCl6uCkYYor1RGD+Soy12mRzqzav9aU2ESKj2uTIT6LLeG5QoJtT
         Som7Ck+r64ZavNbnjhkP9cugKgNh6txnFiZxvp+kwQjtwLR3JcHvxNtDMe6SkaL8NgRu
         oBeeHw3/FywxtNbI4HPNpk/Ji8LahduYP/Nd09XkworF/QT77cXcRBMlpEE57IG2VLZJ
         wd/fHXyAzD9ho9QzJD9ZXEI2AsNSjIGkZIsR+QQ7Qly1RC3PTUNYA4bZdK+zQjwcGKmO
         GtxZkdjOuxLGaUmW9H4TGLq4kFUMi45mk5XsEgZ7osjMFfM93ZL5WI+c43301ib4fTWz
         iPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Otz/SlnLc2C1+G4lqYEuhvQ8PpbIYlgxNksOGgAwFA4=;
        b=AsPeS0FJXFO9ruJiug2rFkp7+ZGobQnIODD5WzmhxhGYPmyt3A5a7/2RimxtZmEKAz
         q6ZtQ/ShkMVa/2YqDhz9ZinbDeOAPABAUTZB/vD/pvoHAKzsmU3uB60ESXW1BRN2Neo/
         oTWOaIR691xpQfmtMm+wSY5xZn31O9X8Iaxc1aw+X/4Fpuxbqw0b10G2JnqCwUi28qP0
         FyQm/vKTLIa5HyqN7QsA85QUgca71j+DI+MjQnFedxNyOpFj3XPK2JSJh8T3QaC6CClr
         WSTGGsDpNsTwyQkNydbi4gwKeEDRZ97SK3o7KIMB88fRBDM1KbKVFQJYiXgLhkiZleaF
         QaVA==
X-Gm-Message-State: AOAM5320YZPWRrc/juQ5lEvxFLdVqt9+hZiWZWUiAnk9ouukSqGUWNxd
	zkjU78aTCVTm7GFqEEPDuxny5Fwfi4I=
X-Google-Smtp-Source: 
 ABdhPJyiFy3gjN/ivUZQq9TF+dZ2OX1k/1wmHrFgmcvf00LdnxpVmhFNXIOC1sdoSpcWhgQuFxBKUA==
X-Received: by 2002:adf:aa93:: with SMTP id
 h19mr38681133wrc.293.1641228001911;
        Mon, 03 Jan 2022 08:40:01 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 y3sm35296984wrq.12.2022.01.03.08.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:40:01 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH v2] ifupdown-ng: Add recipe
Date: Mon,  3 Jan 2022 16:37:56 +0000
Message-Id: <20220103163754.32439-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 16:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94649

ifupdown-ng is a network device manager that is largely compatible with
Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
Changes in v2:
- drop merged upstream SBINDIR patch

 .../ifupdown-ng/ifupdown-ng_0.11.3.bb         | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb

diff --git a/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb
new file mode 100644
index 000000000000..42bf1c235b61
--- /dev/null
+++ b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Flexible ifup/ifdown implementation"
+DESCRIPTION = "ifupdown-ng is a network device manager that is largely \
+compatible with Debian ifupdown, BusyBox ifupdown and Cumulus Networks' \
+ifupdown2."
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=451f521abe917914139c9739ea0f2bc5"
+
+DEPENDS = "libbsd"
+
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/ifupdown-ng/ifupdown-ng.git;protocol=https;branch=main"
+SRCREV = "553f056ed9fccdf08709ea4d3087df5e7d590ff1"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig update-alternatives
+
+LIBBSD_CFLAGS = "`pkg-config --cflags libbsd-overlay`"
+LIBBSD_LIBS = "`pkg-config --cflags --libs libbsd-overlay`"
+
+EXTRA_OEMAKE = "\
+    CC='${CC} ${CFLAGS} ${LDFLAGS}' \
+    LD='${LD} ${LDFLAGS}' \
+    SBINDIR='${base_sbindir}' \
+    LIBBSD_CFLAGS='${LIBBSD_CFLAGS}' \
+    LIBBSD_LIBS='${LIBBSD_LIBS}' \
+    INTERFACES_FILE='${sysconfdir}/network/interfaces' \
+    CONFIG_FILE='${sysconfdir}/network/ifupdown-ng.conf' \
+    EXECUTOR_PATH='${libexecdir}/${BPN}' \
+"
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+ALTERNATIVE_PRIORITY = "120"
+ALTERNATIVE:${PN} = "ifup ifdown"
+
+ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
+ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
-- 
2.34.1


