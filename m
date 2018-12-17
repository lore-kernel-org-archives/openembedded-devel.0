Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id E063B7BE39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:35:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q18so11690780wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zTJ+w1AseFfFrF39MWij3G6xxIsZ9inD07wnRUXsCHE=;
	b=IqX6bpkqNV3NHKRCaQzRHx8ZBXiDOER7vuAB2fuRazf4J3uz3M/ou4VAUTeeKxNLJZ
	eblxSE8ln1L1fahcgZxWE6AgflaG9iQU88Mf0GscBG5WegnBBxk2Otn2IfXVk0enbaUj
	SSL5qYIe1zKT8JDzDNi2dlFXxYLREYSQMzHZrAYhfXiskl/QzwwrBMB1YlNPwG94CBTZ
	eluUj01iwP5Uyf/9gMKWv+HjDl4feK3ArQOpYzcyXJZ+rnmgG9SC+jcw8PkAcsliwDH5
	9XKuU6PQKamgNAN80Jks8Q0dmrf0Egl9ShM7sAcz23b7uVCi7PQIDpOQL/zhBVgfw8bj
	oYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zTJ+w1AseFfFrF39MWij3G6xxIsZ9inD07wnRUXsCHE=;
	b=T5ODBVPAvAJ+CJ2qJiBO+C7ebXKHR51O9jQs7UqdARZms4uhliyiiFJjPWMN2ZTh10
	pfaDzraMrS4bHZBlEqBDX/RoIXl+to1cb7aGxSPbl8idpFhvx3kDr+GIH0oD/UhKhPYf
	VsgvEOqd1cxEjqFGAL4Rm7KO5WwdvMqs4/594fJ2ZH6fSfCZHEsAb3IkKcykOGzlV1TT
	I7LgvcOxLsq4F5C0PjV8JVIDBUFElLjzvzkp0bXkbHROx4GSY4C6DBROLS1oP4mKK7UV
	mmmP1GRnIYGizX+Cy2i63aC8sWeG1xdjaKAxIf0tWAkATqU+2ug+nPt4KhA3Zdli9UUs
	l8NA==
X-Gm-Message-State: AA+aEWbehGKzr3ZATDPn9tXm8uJaS1uCSVglxZAwxFJzQUK6YTmgvUdP
	5gdtOJqgg/SDjaR8cOabIBFBc2M+
X-Google-Smtp-Source: AFSGD/WCzMnwuhMJuZ1zkzE2mpfG3lxpsR+9OEBA/z1b+XPv0m5VRBZecC04bFKqwsJR8FBJ13GHaQ==
X-Received: by 2002:a05:6000:14f:: with SMTP id
	r15mr10856035wrx.53.1545042959540; 
	Mon, 17 Dec 2018 02:35:59 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.184])
	by smtp.gmail.com with ESMTPSA id
	w6sm16366615wme.46.2018.12.17.02.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 02:35:58 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2018 11:35:55 +0100
Message-Id: <20181217103555.29398-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] kexecboot: update to latest master (7409a1e0aaea)
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
X-List-Received-Date: Mon, 17 Dec 2018 10:36:00 -0000

implemening --no-dtb option for older mips/mipsel

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 6d79e8f83..61210e768 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "4c01d6960aa6a9d03675605062469ab777fa2b01"
+SRCREV = "7409a1e0aaea61af87c4eca0149cec18a9f58ab6"
 inherit autotools
 
 EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
-- 
2.17.1


