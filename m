Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id C08146BDA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:22 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so340574eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cvLE/vK25IyIQEjV9UNboWAKudabFHzz2CLEEJtBJbA=;
	b=cTUK0W+PxjJ2iaetwgv1uKDeqGdje+V7brMW/Fp7uwFSU7Pjq6TG0VYVoxGTXAjUoh
	rE7GH9mf8d1omMvGdIN8EnQKUyfFDFOSCD0BRLeF2sHbH5nKwhd0wOZcE3V1LmBr4h+B
	LD2KbXilrSg2soAXwNtUgnWYWxTgjbSDOpUDrDWUNFHPPISjyAMjppub3d7lY1AFU5cY
	GxLHH/t3Sz7gPfzYYvjK3xcykmACfRcvoa2viQnocjF+xjcIg3nq3TLsfJwZyg+Sk1Wx
	QciTVhmwRiSkZKLfLyHYgQSp8V51PXbtFi3siNU10Vt3euMq8jxWBf1HYitL6x4Wz9zO
	Uq3w==
X-Received: by 10.15.99.72 with SMTP id bk48mr5430444eeb.22.1377791483125;
	Thu, 29 Aug 2013 08:51:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47156921eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:18 +0200
Message-Id: <94c21859d9bdc278d07101dfd6128e70683e3e5f.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 25/66] collectd: Add PACKAGECONFIG for undeterministic dependencies
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 20df494..25be1c4 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -21,6 +21,13 @@ FPLAYOUT ?= "--with-fp-layout=nothing"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp --with-libnetsnmp=no,net-snmp"
+PACKAGECONFIG[libmemcached] = "--with-libmemcached,--without-libmemcached,libmemcached"
+PACKAGECONFIG[iptables] = "--enable-iptables,--disable-iptables,iptables"
+PACKAGECONFIG[postgresql] = "--enable-postgresql,--disable-postgresql,postgresql"
+PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
+PACKAGECONFIG[modbus] = "--enable-modbus,--disable-modbus,libmodbus"
+PACKAGECONFIG[libowcapi] = "--with-libowcapi,--without-libowcapi,owfs"
+PACKAGECONFIG[sensors] = "--enable-sensors,--disable-sensors,lmsensors"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.8.3.2


