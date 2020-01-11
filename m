Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id AA77B6D561
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 16:39:09 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bg7so2345511pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gc6jWoC40rVJDHVMxdegs5YdbBDPftb4rkbeUR4TBfI=;
	b=H28LzldbqR1E0I6WI43Q2ZWWrPBJqhxkZlmxVkjfA+m8Dpva1ffAaYI+rTDkzQz4PV
	gSOn3fn9c26QBshkaell9EbjTjEuNB8FkmSTamIJgwYY0jbV9k2lvASdTRWFXAQ2pKRi
	/kgnyTVNvyBg312siQkES7iUvrOLYr4vyp2/0USM+fP7nandhfrC9F6n9qt7vN/npp+q
	0501uYdWkYd2mf6NfREFs6tQfO84A5tHw66EtHts8/KQFdY13b2Nkz+1EcfTng3b+6mu
	zZOW/TqIFmarloPhOQKBtoFVSz8SsoIO5gXYIeHyUj6/97fLr/Or//5U62tHUrrnPX7+
	ZlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gc6jWoC40rVJDHVMxdegs5YdbBDPftb4rkbeUR4TBfI=;
	b=YMYmczWPOZgnsmgRod6IGXNka3x79/yMVCQ0ky+Ja0qW71GdfTlRDJ381LJqMvEHqu
	3upASbk+8y+yfIQJd7bQ8+5WVPNeVFJRGmh2TJGBYrLq6B5K2ODtlua9oI9bpUgfLOPQ
	wtgXQJNGwBBOGcLmiFHQE/90/S37QRQkA1H+TburQg2XxrMjwnr317q8w3TuTFMu9aPj
	xxUJKj4LI9TbXQsaw1nvkS5iZi+v3CFlAKCfMdGO7u3WBoBToVpQNSrfxux1Uwmolb6s
	sj0CVpCx85FIv6zD+WSyC3oiPefdeDoHvzI2iagSE32q3jmbHp3vR+8KCKrLb/xbdLgD
	OThA==
X-Gm-Message-State: APjAAAXGYupo8eDkQosxETZDfCXDG6l1XrAJA8n+bAoI7sC1BcOUm9+f
	/0bN0zHMSouNG2NtTlwqoBB26Bb221E=
X-Google-Smtp-Source: APXvYqwCr3/F4OIT/kDoaOf/VBWWAVOybDMOVTfbJxr06n2Pa/DdxYJHqeDZeLvzDWB+WczE0yXU7w==
X-Received: by 2002:a17:902:547:: with SMTP id
	65mr11143111plf.50.1578760750217; 
	Sat, 11 Jan 2020 08:39:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id y6sm7196521pgc.10.2020.01.11.08.39.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 08:39:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 08:39:03 -0800
Message-Id: <20200111163906.675731-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111163906.675731-1-raj.khem@gmail.com>
References: <20200111163906.675731-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Stefan Lendl <sll@mission-embedded.com>
Subject: [meta-networking][PATCH 2/5] tinyproxy: Fix user and group in tinyproxy install
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
X-List-Received-Date: Sat, 11 Jan 2020 16:39:09 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Lendl <sll@mission-embedded.com>

Signed-off-by: Stefan Lendl <sll@mission-embedded.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/tinyproxy/tinyproxy/tinyproxy.service   | 6 +++---
 .../recipes-support/tinyproxy/tinyproxy_1.10.0.bb           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
index df42745731..78df437f68 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
@@ -3,12 +3,12 @@ Description=Tinyproxy, Lightweight http(s) proxy daemon
 RequiresMountsFor=/var
 
 [Service]
-Group=tinyproxy
 ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
-ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
+ExecStartPre=/bin/chown -R tinyproxy.nogroup /var/log/tinyproxy
 ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
-ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
+ExecStartPre=/bin/chown -R tinyproxy.nogroup /var/run/tinyproxy
 ExecStart=/usr/bin/tinyproxy -d
+PIDFile=/var/run/tinyproxy/tinyproxy.pid
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
index 894eaac99a..7d97f52a78 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
@@ -25,7 +25,7 @@ inherit autotools systemd useradd
 #User specific
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home /dev/null \
-                       --no-user-group --gid nogroup tinypoxy"
+                       --no-user-group --gid nogroup tinyproxy"
 
 SYSTEMD_PACKAGES += "${BPN}"
 SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
-- 
2.24.1


