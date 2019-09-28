Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id D0C577F2FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:43:24 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q203so4827439qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=MmJwD+sI+SKfA+bW8cx3ab/9aNOdz0Lrbz1rbE7GcnY=;
	b=lNtnuuHvwmvzZQzXgF1DxhSJExN0r5JsMgfrM7v5tBeLoSZVgS1TqEoTl3JHc1ZX5J
	HSLQOr6DR8JMywrC3mi2oDpDp4lGu9BUZkGOT3cVdoW+P9bYo7gmDVlVB3NYQKnpa+bT
	49MWGrNuzNVZ1e4HKJ+rDfTLLhqi83B7AB4+7rgssp4VWyWl2g5sxHBZp7DIYUGt6pMZ
	q9wS32unIitp2TG5ISClPscKtsB1HVCTBcMLzbACS0snJ/zUCHnEEyKkdq0VDWNGn3QI
	bGOCKk2v9dkA6IwiZzc0a5mqc+G0G6c1gcCWcngyVGKKcrVM3XtoBKT0b6q/r2tDtYNf
	LlFQ==
X-Gm-Message-State: APjAAAVNOgwAEo7EJ5V/9Z+NuNJzqmU5V1ymckp/JN82gXWuIQmWvU3Q
	ZATlraOkkeVA2a0XdMTd91hyQFoDkH0=
X-Google-Smtp-Source: APXvYqxjVRLhWusI8gdjYvg7kWc3gTPzpBLx/1EesstShuL69RnKJhHX9v2MgbeFHKAq5dnKns6BPw==
X-Received: by 2002:a37:8cc3:: with SMTP id
	o186mr12241509qkd.186.1569710605427; 
	Sat, 28 Sep 2019 15:43:25 -0700 (PDT)
Received: from localhost ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id j7sm6230340qtc.73.2019.09.28.15.43.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:43:24 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:43:15 -0300
Message-Id: <20190928224318.4127069-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928224318.4127069-1-otavio@ossystems.com.br>
References: <20190928224318.4127069-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 2/5] networkmanager: Add a `resolvconf` PACKAGECONFIG
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
X-List-Received-Date: Sat, 28 Sep 2019 22:43:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../recipes-connectivity/networkmanager/networkmanager_1.18.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index 1c93f0115..3c220ec77 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -78,6 +78,7 @@ PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-clien
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
+PACKAGECONFIG[resolvconf] = "--with-resolvconf=${base_sbindir}/resolvconf,,,resolvconf"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
-- 
2.23.0


