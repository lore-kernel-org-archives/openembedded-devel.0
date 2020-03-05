Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14E2361027
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:43 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id o21so2725588pjs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hnrq0RBRNa1oF/GPmzGBtKXSMnZF2ohWmc5TkvXjIK0=;
	b=bwCXwPdkZ58BtkaUwvmCjuxP4zvSJ7ywABdE3J+Ua3DqD7NObdoFxSA2mBi1hPHKPg
	D8+69z60xOeIm1AtJ2YVYe14to8bM/XvAToCc3oH+mWpMfAiM4LuSWNrHYKAI0wTaU7h
	Bz5Ed4dLsWc9GOyGlV8SEzxXyG79djH79TRuKBVHqWrT/LACXgy4Q43rJxLnvSMRLTsq
	mDxczsvczi9R13wgMupko+rBNPMh5WyFkHfm6yscOMnyl+0wF70gTCAM8489X2PKlvxG
	Aowc1LShTPRgZrhPRVCcZ+sbR5yqPsRneTEYBx6nMBzzBjOFMOGyPI091GdryUf1XaRB
	WsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hnrq0RBRNa1oF/GPmzGBtKXSMnZF2ohWmc5TkvXjIK0=;
	b=pREscYOuVr1oK5hIMw2uRKoqlw/9tG90aFU+k1T9qmiy0oFuDxkqZSpjxSkGmqjp8t
	d9dGX9qhTDPHXoMmlY9jOgu8+o1TK2xOJatapx7WkkxUFNdIjBF4T5vtsVakIBOom6U/
	/9p6+MYmqNdyNLKp7ANA9o5mvvuGUtCt2W7o2xCR1fHszYVPGW3U8Vbpal+cYkoyumb+
	1gSHYA9pYbXZqOIclpO49A3ZosGzzyvVgaXXIsPa4gqhAT09eRplkH7+wwTSehJiYWmz
	BIluiHx3nmx1xhBmEBq08afTejTXDFylY+jFvs9YPWC476vdWSIYaNqHrOroUe7ioyzb
	eJDQ==
X-Gm-Message-State: ANhLgQ0CtkNBQvpH6upCl0T1f1SyjdYg7AOpQGeoNbPDUt2vj4mu2br8
	2aIpN7BzjqVro3U4teYgJLpSaKvB9Yg=
X-Google-Smtp-Source: ADFU+vuxrXG6E6IKoYnm2w2xCjLFzV27DgXyfotKHVz/5HYkE1kxfBkwZ8NV6wZmUjdWdEWOrnx7Yg==
X-Received: by 2002:a17:902:8a8d:: with SMTP id p13mr6480plo.159.1583447984796;
	Thu, 05 Mar 2020 14:39:44 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	u12sm26925549pgh.52.2020.03.05.14.39.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:44 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 6DE692A05DF; Thu,  5 Mar 2020 14:39:43 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:35 -0800
Message-Id: <20200305223937.12418-5-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/7] net-snmp: multilib fixes
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:44 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

net-snmp/net-snmp-config.h:
- encodes type sizes
- encodes pathing into the libdir
net-snmp-config:
- encodes build configuration data and lib pathing.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 91c50c4e3..762dec48c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
 
-inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative ptest
+inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative ptest multilib_script multilib_header
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
 
@@ -138,6 +138,8 @@ do_install_append() {
             -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
             -i ${D}${bindir}/net-snmp-config
     fi
+
+    oe_multilib_header net-snmp/net-snmp-config.h
 }
 
 do_install_ptest() {
@@ -270,3 +272,5 @@ RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 
 LEAD_SONAME = "libnetsnmp.so"
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/net-snmp-config"
-- 
2.20.1


