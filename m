Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4A9377D53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so8667567wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sHViNLeMVL200U2AGCT5o4SWnWEESizdx0AUWXmPnQU=;
	b=UKvg6UNJdRaWw4g0O0AsigbBimsnmjqz5SneIrNCnFv6kp7qI79zVNN/wJG2fb+qfw
	4WpVaozhVa18xrnMsSUkv5pNM9FPEJO4xl2MYPI2io43Ppo2LSsGNjxpaZzUxyJ2OQKh
	HaTc2fGCJeeaoQiFxQCgt3HW4TQHDuElMo5B2CBC7yZgvsSEG83K8TVkq0i8yeni621m
	6wBnr3ObPfMFC9P+3qTPdIxHyQip0WnGCIIn/j/L31kFUV3an/vFu8LFY35cA3t60myO
	ztqYZudU0e9nPr1FvQamH0cTBeVBW0DfqtLZp68SbBLRkwQE0sV7/DIc6eXKHneYUy9b
	797w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sHViNLeMVL200U2AGCT5o4SWnWEESizdx0AUWXmPnQU=;
	b=lSRQ0MbXe/5x+nU52nn+PI392MYwNdP8RpyIAo/pMV4/sKml54ACLm3n1Olfs1wwqw
	pIrk6XLFSVKOjIUEvJgwRAKpF/qM8z6nNT5cdvbOKublc7aLTUxb4jqLF7ghatRV3xYz
	AXw7sAvfVX0ieY4REk5HmmRpuJnI3TBKhlFKjMZmaCDBrlHZggXZJEieRudgK4SPlzct
	VWVLY0Acn3ugtcNRxpzmQIXzO0fdyb1bHLB0IfzPqph1as5kgkp4V/x0g09PAX8/b9js
	eyEyuwejHeUWL9CpcTdFLXLZ9+MRYFUa/H4zemuVRRrDtFabR5NyD9JHRV68asg9u25p
	FPwg==
X-Gm-Message-State: AN3rC/5C7KC30qrakrpCXnj6ID6Z0PJQeto+HtxTmiMbDyazyW3HgwFE
	7wjoojZXtca74u0a
X-Received: by 10.28.168.130 with SMTP id r124mr10178954wme.134.1492027027856; 
	Wed, 12 Apr 2017 12:57:07 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:27 +0200
Message-Id: <20170412195638.3243-19-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 18/29] networkmanager-openvpn: add glib-2.0-native to DEPENDS and unblacklist
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager-openvpn_1.2.6.bb                    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
index 7260323..ff2ad87 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
 
-DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native"
+DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native"
 
 inherit gnomebase useradd gettext systemd
 
@@ -33,5 +33,3 @@ RDEPENDS_${PN} = " \
     networkmanager \
     openvpn \
 "
-
-PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130667/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.9.3


