Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1493B748D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 03:17:34 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id g1-v6so1423794iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=WKAXsXAqcyNRzZsNdmBQ0X5nYqLnjISu0BbW8fLmPbc=;
	b=EtoUUO6abDaDekdSSO7hCDoHnG2NHsKQjGtnDUPYpPiXxcwkMbfOWvUHgBKR64V02E
	KuLAJOmoh/yit7u5o6wl55LeTB2QafNsdu2k5wldFEkFU06TP0YqHe7ffC7tQzAknllP
	jA0C3klkMpy4hxhArtmfOwcFwbcanfca7K3KXjb3ucTqYgwGRmPPrhcf8hPOkYczF+yq
	YTxirJkhP2MHCBAu4Sz5YXMgh/bdhZoPcMjF9AkoK0oOX7X7j19qj0hw/kXJWI+3CTag
	OktBhJx6cdLObH/S4sqKp2MKkwAExBKkh48mtNc1TKnNMYusv8HfmjwC6prFx15UW/31
	+R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WKAXsXAqcyNRzZsNdmBQ0X5nYqLnjISu0BbW8fLmPbc=;
	b=PqKTODXWWChDuWWQf3inDSrQ9eQeQNpdP1CTuA+6Z3ZYGIs4hxgdS62UsW0kd3nCD3
	ytAqzLKtmIBb2N2+Gskmnbtlq84HhIt038lMOlWuZchd2YIGWJvG49ze6pSac16CqRNy
	WT28MXqQLIDQZb9H/0yWQYixe0oxJcXk7LzANXAAf4PYRryxxiMOpZiXLrUV7xmvaLCH
	bSBFnov5GDU/fknLnioPQIcqqZGSVrvplotM28ZjRthU6di1kkX52IXehQLajKM0HlAL
	2UXZls2rc8ojS4G31IQqG/zDzspO6FCYOgANfeHui6PhZGy6xCBgspDPG6JNo8kG2JTd
	TxJA==
X-Gm-Message-State: ALQs6tAaJA9CBO2HLxWEchMyUCQNOYKCsgb0giWhsCZnRADak/SvHiq8
	wyzy/APWKW9HOIHxxqF3L/yXPqJ6
X-Google-Smtp-Source: AB8JxZrVL6UuljbG4eL3GWrezxBcfUOypzG4J/kRwGsGgyrSaI6ylVCsfKdAf/PF+wU4Dzkw/eplPQ==
X-Received: by 2002:a6b:980a:: with SMTP id
	a10-v6mr54011316ioe.212.1525922255624; 
	Wed, 09 May 2018 20:17:35 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	v20-v6sm13468071iog.59.2018.05.09.20.17.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:17:34 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 23:17:26 -0400
Message-Id: <20180510031727.21476-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-networking][PATCH 1/2] wolfssl: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 03:17:35 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-connectivity/wolfssl/wolfssl_3.12.0.bb       | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
index 512619098a..9290651d05 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
@@ -12,15 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
-SRC_URI = "https://github.com/wolfSSL/wolfssl/archive/v${PV}-stable.zip \
+S = "${WORKDIR}/git"
+SRCREV = "d195009dcb62d8712195661bd1d50f8dd6831044"
+SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https; \
            file://0001-fix-no-rule-to-make-cyassl-options.h.patch \
           "
 
-SRC_URI[md5sum] = "f9caf558169ab650dc8200708799ebeb"
-SRC_URI[sha256sum] = "b6d87d3e2c8757177d69aff373c91cf162f4a3944fae90fa10d086fd5f9542e7"
-
-S = "${WORKDIR}/wolfssl-${PV}-stable"
-
 inherit autotools
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.17.0.rc2.3.gc2a499e6c


