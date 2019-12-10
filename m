Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5A47FC8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:38:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so19181065wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KJ5ZS3QRdx4n3IPyGgVChztfbrUI6p9pusfPsrw5MV0=;
	b=PZNT1uu5bj0xfEQ+Quc0NjTkD7Z/3YAu1r6PpxctLipuaDUQbgFA0NRoSjY81kLdtp
	Bvsd59RnemDeMcv6pskU1v/N7AHzqoGBGKVyUdx7FWVDfNkoib+L6ZicmTWjKzyhHS+t
	ThFu8X7IXc6TyIPt9IWOZj9dqTsoTIcy84EjtqG+L40UzgszKFbiyqwcmnZRytVYoupv
	H68qUgrK/eu/UrG7+73Jqo415AMUFnrhYaIhfx498aQSDcZ5kdMex0SB80IQcaeVj8UB
	5unf3p/CdolYY6FidhIAT2C2EWcIMLjbTeQJgJUpyCldMvfmsk84M6BBK6BaWUtJhL4m
	/ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KJ5ZS3QRdx4n3IPyGgVChztfbrUI6p9pusfPsrw5MV0=;
	b=Bi6orjkRj0pGSkceYi/N8U5p5GpmQRVDwuQJv7DMgGFqmj5cN027WZYs39TZFiL3fp
	8GLjrK4Ed+lkfst7G+EpaMX+17GBjrYCr54vvT5RbHGW/3l+41Vy0+3/S8sXe6cpilYs
	xgsN1GG9nwq260IrkuEJXbBejU1irPN6rJDzd0yizXX2FVmFeaCIrdxZkm2MsKz6VwG0
	QtslgeTLsNFH1jnrHkZL6a39kyZW6tiI1jfZpKkWGHufoPDIhrstYGuG2ADtQ5rKeFG8
	EjgrRa6W097T+7OYaRJdDZso3Q0Hg2Fqmj9eNWRqDZir1Sn0IsHwCAkqHnn46M0LvM4r
	dFiQ==
X-Gm-Message-State: APjAAAWSG6Yg4Z7YjhubgveQCuS8P176lrVGntSTVyLHHALD7zA+IbDB
	YvdZLzokD5oHtIDhDZ1vkiI6REv5
X-Google-Smtp-Source: APXvYqzYC49RJEAHIMRWaqgnpOTZinDqUKTQ+aeJeTp2G/cajqcfRfcrdsXmsJBlwaQfpLbboSJjpg==
X-Received: by 2002:adf:e641:: with SMTP id b1mr2088962wrn.34.1575970733580;
	Tue, 10 Dec 2019 01:38:53 -0800 (PST)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:3da3:ea06:8aaf:c536])
	by smtp.gmail.com with ESMTPSA id
	z18sm2388379wmf.21.2019.12.10.01.38.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 01:38:52 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 10:38:50 +0100
Message-Id: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Tue, 10 Dec 2019 09:38:53 -0000

---
 ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
similarity index 92%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
index 0f8d7af3f..bd7339e1a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
-SRC_URI[sha256sum] = "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
+SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
+SRC_URI[sha256sum] = "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
 
 S = "${WORKDIR}/vbox_module"
 
@@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-
-PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
-
-- 
2.17.1


