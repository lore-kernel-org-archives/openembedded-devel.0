Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A23E6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 03:31:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id c10-v6so5208031pgu.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 20:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pSr44skdkICjD6bEIC3dOulHklUcp6ck3qOO0xgOQ40=;
	b=rJTUGNOVw5t3aUixTJBSPQe0BhMzsS06qLwpurDKRwgh/ttNlJef2EaX/85mokXhUR
	BHNQKA5LRPVEx6k/wAsfXy0p7Sy4kvwLasLPRy6nJvpSbDTJyXsyimWuxTKi4tMCuMwx
	zBMm7ALuVwLy24q5m+1KFaSQqS6KNA3sDi4JeE6J2TAssRiMngkHRbbLRaOnBGWWIdXY
	5eH0rUum47GkXKw7LWXjQp7UlKzo9Ztwl2KbCfWmdXbOuog8pFvXEFYPmqys07xOMTxY
	Gdd5jgRsYQdJWEBMepZnYN2q6+1YutKwppXJBQUAAan7feOASi7DQhpmZhGEY7iqvc3t
	xw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pSr44skdkICjD6bEIC3dOulHklUcp6ck3qOO0xgOQ40=;
	b=PS5aekKh4Xra5wCly52gX2NeynBhrdCNlc8hMVZFHMpdxQQOq1SRx4g59nb87a2qL1
	lyjfLf9BJs/QzvfFw3WDdqCMWcJGUShEki6pCM8YIlm+JNgHDwLmXAyLDgQp5EpM+uae
	HV6RsyPUtpctay6RUhcts4UCshaZ1YBA0SnVw52PLBz8KOPNzMLIrCCJzx3Pf4Cfxdpw
	ulB/gb+ciP8Citkm+YOwJnmqk/Q50tHDjOeMvut8c81u00NDcIq2QafAssrZY+TS/QN1
	HxZssIal5ZwwGUHdi8bHHN535ArX+FGJaA4VXSHeratjRZv1p5JHcQHlG3HBfDS3UpH8
	8YyA==
X-Gm-Message-State: APt69E2jufcITqRZX9Yzk2wfeuxGfZvnYj+rsM19SFZJnoar+pEhkujb
	USQY+2F3E6ACHZ6fYRkpGYD/oQRYz/w=
X-Google-Smtp-Source: ADUXVKLKx6PU2e8I0QlURG2PPwdTkb3T84pfYLCII4KjKOjWnhjeSyb8KU/OxQDW5PBwTebnWR7hmA==
X-Received: by 2002:a62:de03:: with SMTP id h3-v6mr4791725pfg.46.1529119872835;
	Fri, 15 Jun 2018 20:31:12 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	i65-v6sm29498614pfd.17.2018.06.15.20.31.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 20:31:11 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jun 2018 20:28:16 -0700
Message-Id: <1529119696-3508-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.4
Subject: [meta-networking][PATCH] stunnel: Use nogroup rather then nobody for group
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
X-List-Received-Date: Sat, 16 Jun 2018 03:31:12 -0000

[log_check] warning: group nobody does not exist - using root

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-support/stunnel/stunnel_5.35.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
index ec8478d..427c8dd 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b5
 inherit autotools
 
 EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
+# When cross compiling, configure defaults to nobody, but provides no option to change it.
+EXTRA_OEMAKE += "DEFAULT_GROUP='nogroup'"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
2.6.4


