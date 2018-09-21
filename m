Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30B3A71BB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 10:55:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j15-v6so8326222wrt.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pzi8A7dvwktoa0NeaR0m8trSJoEo8htPeatqZKSB1DM=;
	b=JPibFTb5B1jo5UVmpGGNl/NFpzrGJU2ACDUn3erLy33V8O12aC2YiOYvQ1aQfFPvTk
	0w2UXdIoiFGMl7lkmu8Kr5SuIItZ+iG9lWeKoW8rANPOmpFIATPBP506mwB0jGCMjkBD
	dEODAAmUDAUwFwylYR7p7TnrV7dwgl76wDAzZOV2ip/TN7z/A+E9QZYXK/QFMXN1vmtC
	eWc6zpq5CWfzfTnJbULv3r7ppiYSQC7rLvLhGPBl5Pbffw3dTVepyEVLTQJXkCTlDVtD
	4XHpkbMDgQ4g0LaS2OPuYqrqGMv0ygTQOJxBTQB33kiZ7H9OlC7f9wQgN847I/L/WX4X
	mzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pzi8A7dvwktoa0NeaR0m8trSJoEo8htPeatqZKSB1DM=;
	b=ZwBMRLaf/W7YS3D5rqFf0Ttk7cMfVhLU0C8UwajHvcms7Ps+lYKBWjUTq+ykRCBYKp
	Elx0VWIAemzy3GlfcmdFZIpBsQKpeCpN6Um4sh7V/rQLgjjgA/KWHdjRt/DTKMZIAe03
	jLJrZdMAwdr/PbnkvliK/Jf6fVpspy/i67EFYYKFII1XrYV/gwq1q9tACWq4NJwXXbvw
	o51C0/9jFhx1yftcdRIzRqcjxXrAM/U7hPYbA0XDwen99HK+IH/xKWT5ur/7/Gd+P8RP
	TQtczzN020R7m4MxyfFbjFE4ySMzHr1hRyyzTsNcz1TkMVMK7H6yKj1V9f1nV/hPiGWu
	xblQ==
X-Gm-Message-State: APzg51ACBWkE91mZ7awLKnG+KVxKycJedbmXEGf8CauF42jceLhrXoKN
	Wxs+8wFNH7od1iduHrmgTklphAdq
X-Google-Smtp-Source: ANB0VdZd7EfSJuZvIGQJC8Gpr2Gnvd7R9QJyAzQpBMfml6n6LDxU8cvms9f1xtWnnE6gid/ELnUK7A==
X-Received: by 2002:adf:c98d:: with SMTP id
	f13-v6mr37533694wrh.148.1537527321599; 
	Fri, 21 Sep 2018 03:55:21 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	v192-v6sm4786299wmf.40.2018.09.21.03.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Sep 2018 03:55:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Sep 2018 10:55:17 +0000
Message-Id: <1537527318-7762-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] lvm2: Add RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Fri, 21 Sep 2018 10:55:21 -0000

Some of the rules installed as part of lvm2-udevrules need to run dmsetup,
so add the dependency on lvm2 in order to ensure these can execute
correctly.

This fixes cryptsetup hanging when creating volumes.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
index 9da0f5ec9661..7bd7b09d8f78 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
@@ -50,6 +50,7 @@ FILES_${PN}-scripts = " \
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
+RDEPENDS_${PN}-udevrules = "${PN}"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
-- 
2.7.4


