Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B22A475EE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:27 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 90so56330099qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=t5CRz+wv6+zPLhyKB2VkSHAMUdE6C3u9H52n4fglofA=;
	b=gZJ6HllDzk1iOWXbHFZ6Debm8vnAmp215HPNcnh4F5L81c3cgq8Dc8xULEokIlaxHK
	qtegM65PYJNOr7ZAXuD9W/LeC2DcJdLHxxUIb5JFBrsAiYyC9FupnXw9Y5hNsXTGTX7M
	ms175kc5qTuNa2kVc+NFYi/+GwwsVKLvAdw3ZyWkrsb9mc/vmsAVk43WAw+YNJH7QWsy
	8bVs+YNBCKe3Ql8PxRSrqqtb+/khNwiK1phfSvOXQEXmRP+0xJLFYvY+uAnxi9tHBfja
	Tb/P/K5+0XVAcqpSUQLBSTRoK5IF/D2kngTLMqo6Ru9cKHI8T7ThkKUWJ40ql8FOSHD3
	b7Vg==
X-Gm-Message-State: AOPr4FW4ZdDf7tDmv8AxM+d46Bz7uLywpp4RoOKCi6C4ocT7lvfRf94339Tv6neRdev8nQ==
X-Received: by 10.140.129.22 with SMTP id 22mr20923575qhb.28.1462543288084;
	Fri, 06 May 2016 07:01:28 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	d65sm5782954qga.15.2016.05.06.07.01.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:26 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:42 -0300
Message-Id: <1462543259-7206-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 05/22] rp-pppoe: Fix rootfs creation errors
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
X-List-Received-Date: Fri, 06 May 2016 14:01:28 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

error: file /usr/share/doc/README from install of rp-pppoe-doc-3.11-*
conflicts with file from package dmidecode-doc-2.12*

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
index d5f4a20..e1ca17f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
@@ -29,6 +29,10 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
+    install -d ${D}${datadir}/doc/${PN}
+    if [ -f ${D}${datadir}/doc/README ]; then
+        mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
+    fi
 }
 
 do_install() {
-- 
2.8.2


