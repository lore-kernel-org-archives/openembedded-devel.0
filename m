Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D049C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 19:53:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.30356.1640634809835231272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 11:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MKPLZUXd;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t18so34128507wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 11:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdEykv3q/AF0dPVS+MyFnRqNvCUlF6OD4NzkWeD8mIU=;
        b=MKPLZUXdq85JF/VSYhDsSU8h0dP2D2rggOFfb5ukix6o3YlTYygtGsFkB10xAmkwSh
         ISnf4xgryCss1yTEZwHGP92aCjpJA/1vW3CRcG5xFfDw7URfeJA61CcxeuvRnfsiNinM
         e8opFBhsbmyFZUd0kFys2Lnpp90so33ClxlNyVyBsL8OWRncJMdvTb5BjjN/r29lsGYF
         AYsNeENFTtygzMa5Jqg4Y7I02ImKRR+7brV2btmHt2Z1pfUU9hqx+4TGcstR29luaWlv
         5HsKyCSWqtGXsrgoFlMymAsr13X7sSGsnoq1vZpEBCJtaeBnnsErAQCn51fj3G1okD9t
         TBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdEykv3q/AF0dPVS+MyFnRqNvCUlF6OD4NzkWeD8mIU=;
        b=Y4a4WCPkJbUuYQynRVbSXS9g/nNDqIj3Rv9d0Ibd3ZHqpXh+ptXqWCfNYjAXD2gRkd
         s8MP+Bqvz1+fDa0CNtyc4DV2jLFHOYsSSMIbMIda+nX4ZMWq/8Enz6IIj6szbjqgu2l2
         5AeQNJpN5FMmR29l9plqOvKIM78U3hy/MEYnCSwrl7WiIlJhRIQBevaU7epTE82hIMtx
         QS85Tf8XAgjSDNLzo9v4UqVjVFlSjzl+MdaDAzgnlBBLGvjIwzgisZPSo+33dGfPx1t2
         5FtnPK9Ejp9Vt7Y4Pp9A+TN1caTAljEwsg3abnD5hHWzfmXOblj+121GdICnXkobs+x0
         tzEA==
X-Gm-Message-State: AOAM533ktwyia95OwZ98kRoEZyYNSm+UVvA82/ibNb4/llJRmVILYLFc
	7BBcWStFyWXWd54Y6tzxAJvHYKJtCK4=
X-Google-Smtp-Source: 
 ABdhPJyLsgcHDrJl5SkmI5cHQRE6Drdh2xrzgUgocHwR43vD/EK/ch52t8fB/3ecBncB81NPbWl5rA==
X-Received: by 2002:adf:c10e:: with SMTP id
 r14mr13969004wre.558.1640634807871;
        Mon, 27 Dec 2021 11:53:27 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r11sm18844184wrz.78.2021.12.27.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 11:53:27 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] ulogd2: Add recipe
Date: Mon, 27 Dec 2021 19:52:43 +0000
Message-Id: <20211227195242.16740-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 19:53:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94515

ulogd-2.x provides a flexible, almost universal logging daemon for
netfilter logging.  This encompasses both packet-based logging (logging
of policy violations) and flow-based logging, e.g. for accounting
purpose.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../recipes-filter/ulogd2/ulogd2_2.0.7.bb     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
new file mode 100644
index 000000000000..9c6d21954c22
--- /dev/null
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Userspace logging daemon for netfilter/iptables"
+DESCRIPTION = "ulogd-2.x provides a flexible, almost universal logging daemon for \
+netfilter logging.  This encompasses both packet-based logging (logging of \
+policy violations) and flow-based logging, e.g. for accounting purpose."
+HOMEPAGE = "https://www.netfilter.org/projects/ulogd/index.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+
+DEPENDS = "libnfnetlink"
+
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://git.netfilter.org/ulogd2;branch=master"
+SRCREV = "1d9fd9d64b17b48dd0b38bdebb7086c88a649e1b"
+
+S = "${WORKDIR}/git"
+
+inherit autotools manpages pkgconfig
+
+PACKAGECONFIG ?= "dbi jansson nfacct nfct nflog pcap sqlite ulog"
+PACKAGECONFIG[dbi] = "--with-dbi,--without-dbi,libdbi"
+PACKAGECONFIG[jansson] = "--with-jansson,--without-jansson,jansson"
+PACKAGECONFIG[manpages] = ""
+# this needs work to be functional
+PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,"
+PACKAGECONFIG[nfacct] = "--enable-nfacct,--disable-nfacct,libnetfilter-acct"
+PACKAGECONFIG[nfct] = "--enable-nfct,--disable-nfct,libnetfilter-conntrack"
+PACKAGECONFIG[nflog] = "--enable-nflog,--disable-nflog,libnetfilter-log"
+PACKAGECONFIG[pcap] = "--with-pcap,--without-pcap,libpcap"
+# this needs work to be functional
+PACKAGECONFIG[pgsql] = "--with-pgsql,--without-pgsql,"
+PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3"
+PACKAGECONFIG[ulog] = "--enable-ulog,--disable-ulog"
+
+do_install:append () {
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${B}/ulogd.conf ${D}${sysconfdir}/ulogd.conf
+
+	install -d ${D}${mandir}/mans85
+	install -m 0644 ${S}/ulogd.8 ${D}${mandir}/man8/ulogd.8
+}
+
+PACKAGES += "${PN}-plugins"
+ALLOW_EMPTY:${PN}-plugins = "1"
+
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
+NOAUTOPACKAGEDEBUG = "1"
+
+CONFFILES:${PN} = "${sysconfdir}/ulogd.conf"
+RRECOMMENDS:${PN} += "${PN}-plugins"
+
+FILES:${PN}-dbg += "${sbindir}/.debug"
+
+python split_ulogd_libs () {
+    libdir = d.expand('${libdir}/ulogd')
+    dbglibdir = os.path.join(libdir, '.debug')
+
+    split_packages = do_split_packages(d, libdir, r'^ulogd_.*\_([A-Z0-9]*).so', '${PN}-plugin-%s', 'ulogd2 %s plugin', prepend=True)
+    split_dbg_packages = do_split_packages(d, dbglibdir, r'^ulogd_.*\_([A-Z0-9]*).so', '${PN}-plugin-%s-dbg', 'ulogd2 %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
+
+    if split_packages:
+        pn = d.getVar('PN')
+        d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
+        d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
+}
+PACKAGESPLITFUNCS:prepend = "split_ulogd_libs "
-- 
2.34.1


