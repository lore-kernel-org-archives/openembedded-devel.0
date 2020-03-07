Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 095F5607EC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2020 04:06:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id ay11so1687537plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 20:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=tG/d6Zf2weNsXX1NySjSzxjSv6qbA0LjELS6HQaBCqo=;
	b=JtB+JD0o7/S12WYd185jHpMDJQA5nD7onVZutjfZWwQwcgZvF8PL7IsCCPRI7VL++R
	8oHWq8TO/TzYnMvTYxzubCoqZ5bJBAjGG3pcqPh1a4Giat9V5y/skOD27XA5b5JP4nOc
	t2GC7CK4Bg5xuZsCJd3dPyMKEXENkBD7fqic6bnooYw6PmGYH8PnYsD7+h7P4m/FsEQw
	N3hFOBIzNWspW9CEVsoMnamrOAZT5UUyl2SnfMw6UktOYzPlmOKfQlOnT2dMP8OS55z8
	m7p2j35iL2eX0ErXtkxQ1zcdoem4Kg5Xr4JSR9I904AMP8MdGIYFxlARnikgLPh9/ilQ
	ofuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=tG/d6Zf2weNsXX1NySjSzxjSv6qbA0LjELS6HQaBCqo=;
	b=oxgw9ahy3jWbn+72XsGR4JshUT51cpM2C/aroE1JFQbu78Q7E20/Vcy8VXaTkuyx+b
	laQCIPYNE4OnK+rAfjPtnc6k1W7+lfR6YiMP4DjMALwSfwxW0XLCJlO9tQZKS4YvlxLc
	wepk5YUGVOs0yl7qHfteKTB8y2xDnsLwbM6MGrjdo+RMspOFdMISe2Eq3E2LEqiTe4rJ
	u/iw8cVlIDzXxGWcEBIZzCf4qUI7O/rPy/Q0DKACiv5E5IB7FnL6KS1ZS4xPU+rKiWTH
	F1lolvyq71CvuISJDyfFjh4fNHvr06DffqPbhstomH+HmZqXmZpoHMhuz+DJrNzZ3dFa
	0qxg==
X-Gm-Message-State: ANhLgQ1rRJjR7ncLXQe3XDrBLiBJMv0MQCl8MoI542qvXSvTJB3UXXVe
	gc5isWFKw+RYn8ajAB+huPboLpJTyU4=
X-Google-Smtp-Source: ADFU+vtfWv3FUv/85UdtQq2Iac3bx50uaR+1U1W5LLj7g72vZi4d5UWTj3OchPztaJQyRerKCuGRDA==
X-Received: by 2002:a17:902:bd86:: with SMTP id
	q6mr5632904pls.143.1583553971362; 
	Fri, 06 Mar 2020 20:06:11 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	c17sm16366725pfo.71.2020.03.06.20.06.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 20:06:10 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 20E0F2A05DF; Fri,  6 Mar 2020 20:06:09 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Mar 2020 20:06:07 -0800
Message-Id: <20200307040607.23866-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-networking][PATCH v2] net-snmp: fix reproducibilty issues in net-snmp-config
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
X-List-Received-Date: Sat, 07 Mar 2020 04:06:11 -0000

Both STAGING_HOST_DIR and -fmacro-prefix-map path to WORKDIR were
encoded in the config.
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 9c2ffb2c7..5466649a8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -124,11 +124,14 @@ do_install_append() {
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*--sysroot=[^ "]*@@g' \
         -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
         -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
+        -e 's@-L${STAGING_DIR_HOST}${libdir}@@g' \
+        -e 's@-I${STAGING_DIR_HOST}${includedir}@@g' \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.13.3


