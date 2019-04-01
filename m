Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 094247D007
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 07:11:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y7so10407875wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Zh9/fmCgluSFIC2sJCPa+DlGBL2IR8UU3s2RJhei0b0=;
	b=hHsNl8v0vSIoNzjK1vSaD0bGD4jYWtNmgI8NW7ybG6AhXUmwKGMQDNM8IEP0NeV+9a
	TOanGJdtUQGSf8zlspSLQhRJgIw6t39s6qULfH/S5Ad9n61iK5F+diuv7aPZ8sz6YY5d
	I0lw5BA9Ctha4dqwrUn60XlsiL6UesQYB6UxvqmB3rMHVqcLDjATVu/tv6Y/qQbCL9Um
	r8H7TBsmy0APyayx8AgORjGT1SDNu00adf8jFADGLcHORUV2EST+2k+h9ezDQKhRU5zi
	mm5197I+qvQzTFxHlredNdmV1ucugVWxzh924wqM8M0+uDRwaUWcvom8Bqf8A/Jd+x4F
	+Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zh9/fmCgluSFIC2sJCPa+DlGBL2IR8UU3s2RJhei0b0=;
	b=p77+7ogQU3HsbJ3T0GXskFkpgkVskM62DHd1ENEWWm3phblOAldyBMEPApA4HOKlco
	ZeG4tjNY72M7z+U6JI60ZaZP2RIzEZwuCgqHaP24BgrcUMDWdUtukUhUdJ6BHtEQ4aF3
	ljB4DhIl6gCZJMNfiHxf8m3rv+L0eizWCWVPnpZN3bOH35Qi51znvZ0QizWOeYxGUAgM
	cDZLFdeHpZGf1XYoNG67tHdFO3npzLTLQ+C57BWymkjQrKVFDkn0EUk53Ld3QFnGrCg+
	ibRA5/saaTNjsyB7/dloI60kfq3qxyZU12eoi77ZfUaSBtTVWGDcBjGLxl/nNSUo75RO
	Ql6w==
X-Gm-Message-State: APjAAAXg/XKJ+HdPedHhxOSk02uBMdi/WmXhdf8pGYzEbLomkQIb9YGp
	2WJyDe+CU7tSxfcWI/RCZOCTmZOG
X-Google-Smtp-Source: APXvYqwhJpDrgnyEjbvWa6ZWXKXcAlO94ulbPKzsrSxjOgwZUB4gqFkJtFrMiI3G31NX5i7FZSOU4Q==
X-Received: by 2002:adf:cd90:: with SMTP id q16mr38582683wrj.75.1554102661421; 
	Mon, 01 Apr 2019 00:11:01 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.128.92])
	by smtp.gmail.com with ESMTPSA id r9sm8615522wrv.82.2019.04.01.00.11.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Apr 2019 00:11:00 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 09:10:42 +0200
Message-Id: <1554102642-12899-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] Rsyslog: Add mmjsonparse to PACKAGECONFIG
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
X-List-Received-Date: Mon, 01 Apr 2019 07:11:01 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
index e06141e..f1a6e85 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
@@ -68,6 +68,7 @@ PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
 PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
+PACKAGECONFIG[mmjsonparse] = "--enable-mmjsonparse,--disable-mmjsonparse,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
@@ -136,6 +137,10 @@ do_install_append() {
         install -d 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad imjournal' >> ${D}${sysconfdir}/rsyslog.d/imjournal.conf
     fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'mmjsonparse', 'true', 'false', d)}; then
+        install -d 0755 ${D}${sysconfdir}/rsyslog.d
+        echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
+    fi
 }
 
 FILES_${PN} += "${bindir}"
-- 
2.7.4


