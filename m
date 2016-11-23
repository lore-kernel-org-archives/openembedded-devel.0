Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF85F71AC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:32 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so452134pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FzxAX7nlTc+Wv0VSSjTTyHT7eHrvLqNRvLWbgBctmSw=;
	b=hiJGkad+5KAoSAaitU4RzNN6TGDsVnowhnowMAJxbBLmKxlNW8ivI284qbneUmFvQn
	Zy1roCn1pMHmbuZ0kFwZ3LFlqJJIIj9S6VOrIad666bJzJdy/CwfVDvpBsFKGEvmbz1p
	87iWZNqE5n8D7s84Tg0Ucy2gzabIaXjjtCdiW/CWfejT5hg6DdUNkO8j6bRMrH2+v1DW
	4W1Z35TAZEdzr6IhEXysla0slxszEfaGcILozs1Zvlmsz5uX/BLgM32E5Lu5dnjj+coc
	ip6Oj8wmjvK15qZ1Ohvw0I81ivIY+9ej6lNvJVUaKjAWLMBJx6ZH9Ws4j9exnIJaez47
	RMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FzxAX7nlTc+Wv0VSSjTTyHT7eHrvLqNRvLWbgBctmSw=;
	b=joBLcdTxChypbx91JbrpHmPM0srLsrXIztphwnboiim8FliFbGSDSpLyDPlPiAuk7n
	lAfEuRnXQxr60qGGCb9ROOAGHK6SiSHugWN98MB38smC9eyDHVmkg3riRALp66OFhAVy
	ftxhFq83WmEWEgjgH+MVk3oNKez0paaRPWf3/Wbsbg0AlMk9TLUQgs8CHXmswcLQA5g1
	uujUHxazkpGkhS8B7HiIgqa1oHUjOqwE5rdCyV44zvR1lw7a4pCwtnjE4anRb+D+MoUV
	2MYfcFdLDbeXXUhPWKDnCgLiHOzrvIuU16yz0d8Mc47PGKFHGjAu8jKhzXo6oJRrtoGR
	vwXg==
X-Gm-Message-State: AKaTC00Qp/GcOjcg2vKFM1k3IB8nO9h+iv33PfhqNIYEh1qsEwIJjfDIv2Kzr051b6u5ZA==
X-Received: by 10.84.213.144 with SMTP id g16mr4643017pli.134.1479892954480;
	Wed, 23 Nov 2016 01:22:34 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:43 -0800
Message-Id: <20161123092209.23699-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 23/49] miniupnpd: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../miniupnpd/miniupnpd_2.0.bb                     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb

diff --git a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
new file mode 100644
index 0000000..dfa3fed
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Lightweight UPnP IGD daemon"
+DESCRIPTION = "The miniUPnP daemon is an UPnP IGD (internet gateway device) \
+which provide NAT traversal services to any UPnP enabled client on \
+the network."
+
+SECTION = "networking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa71c78c373ccfe0ff207af0cd966d91"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS += "iptables net-tools util-linux"
+
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz \
+"
+SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
+SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
+
+IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
+
+do_compile() {
+    cd ${S}
+    CONFIG_OPTIONS="${IPV6} --leasefile" ./genconfig.sh
+    oe_runmake -f Makefile.linux
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install ${S}/miniupnpd ${D}/${sbindir}
+    install -d ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
+    install -d ${D}/${sysconfdir}/init.d
+    install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
+}
-- 
2.10.2


