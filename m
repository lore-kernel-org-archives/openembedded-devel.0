Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 488B565CDD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 23:37:36 +0000 (UTC)
Received: by qgef3 with SMTP id f3so26943425qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2015 16:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=KNbjOBfNvKQdf0W0s5JOj1u3ZNteO3iznMj3IF3QjCg=;
	b=sj6rvIffwGxkfeqRAPDVPWiwDhsj4+S47LVbpByxEg5B4SMpa0obTRMdjUkVxRHktU
	rZcirb7lMUE4NKgBwcV9QfEqBBMw31LOJ5u34kboC1YxcdCij/KP0N0NBB/nJIRzkBiC
	sservpOLdi9VAD6cROwgokJ3hqPy3ZQFqkWNKDprkFJlw8UfhV3aaBzdPQBni7NlaoWS
	/ejHYD+WKHFwW7bTpthOCPxK2S0NFpUQgP9+d/LiXAkB3R9Rn4FWmcUIfEw7Pu6CsztC
	xr/HkCs69kgtt0sXOW3SM3pOajMXatO16pvMhe7s58UIzADn55x3YqQrZ1jbR67H5CZc
	00kw==
X-Received: by 10.140.100.162 with SMTP id s31mr2330358qge.36.1436225856588;
	Mon, 06 Jul 2015 16:37:36 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.226.57])
	by mx.google.com with ESMTPSA id
	e64sm10182675qkh.19.2015.07.06.16.37.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 16:37:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  6 Jul 2015 20:41:04 -0300
Message-Id: <1436226064-32465-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] collectd: Add PACKAGECONFIG for mysql support
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
X-List-Received-Date: Mon, 06 Jul 2015 23:37:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/collectd/collectd_5.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
index aba9c6e..3a566db 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "collectd is a daemon which collects system performance statistics
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "rrdtool curl mysql5 libpcap libxml2 yajl libgcrypt libtool lvm2"
+DEPENDS = "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
 SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://no-gcrypt-badpath.patch \
@@ -29,6 +29,8 @@ PACKAGECONFIG[libmemcached] = "--with-libmemcached,--without-libmemcached,libmem
 PACKAGECONFIG[iptables] = "--enable-iptables,--disable-iptables,iptables"
 PACKAGECONFIG[postgresql] = "--enable-postgresql --with-libpq=yes, \
         --disable-postgresql --with-libpq=no,postgresql"
+PACKAGECONFIG[mysql] = "--enable-mysql --with-libmysql=yes, \
+        --disable-mysql --with-libmysql=no,mysql5"
 PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
 PACKAGECONFIG[modbus] = "--enable-modbus,--disable-modbus,libmodbus"
 PACKAGECONFIG[libowcapi] = "--with-libowcapi,--without-libowcapi,owfs"
-- 
2.1.4


