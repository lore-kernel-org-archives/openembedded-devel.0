Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQytH-0004e5-8c
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 13:45:23 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1600424eae.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=p/MNBtO9vb9kVH3D4biLP9qGfiHjRQ1j7At2YF+QwZw=;
	b=sSQLHwGGDYlRuc2if217uvCG2728i3ztw2yTxKp8sFGTbvJpQtCLpyEhDLjHWtnJWw
	cjzc2rocvVC/GoLvTNuhiEMGuSAo14wbbr9O1h86rR0b8zfD+/gm62Vk9ws+NWskujDa
	BqAMrPNYeq7gbFweNM9Tc0t34Zz0hegKuzuYCbzzczrWrwpeg+7vAwYG24n/8L7+HPkI
	AK0VCYMirCbx7YWADrp7F/yDlvc6Vsx51fYRwGuxi4ie0z9AcneckGnyByzXJ7YSjlGG
	uRlSu/GGgq4FsIjVbSW5zm93/0gkjsKvSUVFeCpFYP1Q5Skx+SEd4pYCiMYglKtkS+od
	Evtw==
X-Received: by 10.14.182.137 with SMTP id o9mr38416447eem.13.1365852461758;
	Sat, 13 Apr 2013 04:27:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f47sm15894210eep.13.2013.04.13.04.27.40
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 04:27:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 13:27:38 +0200
Message-Id: <1365852460-3361-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 3/5] dropbear: move bbappend to oe-core subdirectory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000

---
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear.socket   | 0
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear@.service | 0
 .../recipes-core/dropbear/dropbear/dropbearkey.service                    | 0
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear_2012.55.bbappend  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear.socket (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear@.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbearkey.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear_2012.55.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend
-- 
1.8.1.5



