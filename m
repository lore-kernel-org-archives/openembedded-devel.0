Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3E254771F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:35 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so171796525wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZXcPhYoI77m7bG4qwiGZ1sqMe057jb7PlURmnEkVzhk=;
	b=V0xJKofPzDiRgDZ0rBuL9KLgxRgu5lUqMl82VvP9IA42GV6vs99eO4C9KOxeKkbl/9
	mj0hS7ytzndIvYHsgqXWUixkxM8iYwsotsQvUyl83bwp9/MwG9edmwDY0uz/CZjUg8ls
	BgZvdkpxKF4YcG62YO36Urdp5FIDF6uLKbODleIgbbB85CFy3pWEOYRLdoUXkv8DBFLs
	7KkteZmD3QNJK2VZecJ4ZYD6l79VRWP6GvKkMe2Z1puHY+izLnH+k4N5i1g+VtOoicUf
	tmeLxV4RK3EPsLkTzN4ClIbt6TeExZbRHhupn/jglG/6xr9nwerqAuLgHLJrBJy8RqvB
	v9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZXcPhYoI77m7bG4qwiGZ1sqMe057jb7PlURmnEkVzhk=;
	b=RU0VqcJgDUeobh/NYm5+YREloBn3ImeAUI8BiHi6eUBl9EDVf9JvGLdAdD2oCXBf28
	PlkdNDQC3Favtn6Zi9+BdWTPXQtbJTP3GGystY+OHEETTGn3GZXZJh+wGg1vk6qBBT/R
	s7RXd3EaIlVWhxWsBSGqqdyyvqO2O/70Li8/hGoy/Vh7Jjdku+yw2XIm8HGkJWjoNRpk
	6h3qVakBzAu7fI3JfpLKjGDzZTSn8rJwHrmgA6oMzKCxyaGU/AG0pLlGZ9mMlMYa9aeS
	7AcFR2xTIZ/T2RvdrUFhSwd0W1N2M+ESA5lYn8OZe73RaRwTC7yELmb57K3Ub5hf+mgH
	OiXw==
X-Gm-Message-State: AG10YOREbd1BMeO/w6AZvo4kGs77CV4XLtnmLXyg0f0jX7K6CNAsksStIj4WC0xZyeIENA==
X-Received: by 10.28.97.136 with SMTP id v130mr11784730wmb.20.1456146576536;
	Mon, 22 Feb 2016 05:09:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	qs1sm24644930wjc.2.2016.02.22.05.09.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:10:22 +0100
Message-Id: <1456146625-10100-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-networking 2/5] squid: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 5b27d46..a94fed7 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -73,3 +73,6 @@ FILES_${PN}-doc += "${datadir}/*.txt"
 
 RDEPENDS_${PN} += "perl"
 RDEPENDS_${PN}-ptest += "make"
+
+# http://errors.yoctoproject.org/Errors/Details/35128/
+PNBLACKLIST[squid] ?= "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclaration of 'IPPROTO_IP'"
-- 
2.7.1


