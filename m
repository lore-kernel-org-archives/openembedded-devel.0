Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48515.1795411835208646477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JS91bBVI;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so3934062eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411835; x=1796016635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBviZAVQcF7tBvaXjxwPUUCCk4yjfoWFaXHIPbPNaOg=;
        b=JS91bBVIe5VJaC7BVjkk1fpUWgsDJpDuRHVivDMSctm17aAH7XK1wkeEVtAQEz5jDj
         keG3qYXMVvuTElCz9ojqJNoqhOB5gSkctmQyr7IRmvsTPBB73fehasBK8m2nkK9rxeqp
         HJV5z4ci0tkM2ZR48KY5MKW8J/R7tRIdSd1BJ3znKbnJS9gd2EgpauMp6fvJmWAhHA5Q
         4w912lPWuc2HfYfytiVIZy5ITa5BeeBpwicVaazcur+qg5fFBi3AWah6Y5E44P46fkLo
         cgffrjBOhTnG24P4z/LwKWZhOjX7Utof1YmdYfP1yfbwilFE/T1hcR19biGZ0op6t5kY
         mdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411835; x=1796016635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBviZAVQcF7tBvaXjxwPUUCCk4yjfoWFaXHIPbPNaOg=;
        b=Yoei43yCZT8RPnxkB14mEU59j6tyVkkb4yPEszg4wavtM3kcoYz5zQ9Gku0X7IaxF2
         iiWhEquHoPAHZrelzzM/Paqa7zpov5rJ5t08oylYiG5to5Ya5IcY6is0rMXZrmaUbwQQ
         dNVLS42NEMN4Ohsr5ibiX94xWo6PsBeXTGTazYlspvKTZxQaoEEVggxxFUErjAlsM2YE
         aBs5hyFP6X7eVGalyGQxBY9h4JIzAVKt4qABff4/B/RFs2pr33mDCSNfQfrjcN/dh8lc
         cJFLvU6c/CfCI20Jnvp4q0Q3GSQ+QMs7/MnMOME4zj5E6VChYR15GrLgzCzYTDNnMVPu
         LRbQ==
X-Gm-Message-State: APuU4Z/KNkwG3THmWNGoxF5KznEW3rVR8k/dcsy0eK7pDqYsuCftsCIy
	Mn3HSqn1cmLipjK4ZcUumxt7P0Za8N206OMC6lG0aUnnsQXv6aAqCtiSYc1Uu9cTZ8A=
X-Gm-Gg: AZFdTZehffbKGKyFJn6tqJkd5oH5kAK/f81Y9ZvTWJgLomwj3TaK5qKAEG3+vcHbh0L
	WWuR/7+4QMi39d4gNVf1mqBmRHdxtaVUUcSF6OchPJGkkw3CQfgdEE7qW7prlmQhaiBbCde0NJd
	v48MkIA8YHSbdNJIFD6lGtE/fZSklpvVVfuSDMQJzisjzAj10HRlWqi0VWJ+hqPOeUmrM3iKULL
	xs1dJWGlDbe6umGdBMUcyW/D1LDp5BJafxXgW4GQkLhmZy6jALb46yhj2U/mhDxnMH0uA7+Z7EF
	n+06XYAf7N2Wg7FgXB5cbUlFkcno+cPGEaK73YM20lNu6DZU5twkRMMeDb8VSn+J4+GDLwsaFAY
	eWbnJI+PMrriJVDEW6JA7CgJ68J47It7JQ4ECX1dQoS/eE+v6DLC/Hj/HZvzfax1eHcx2upfLeS
	3UgTjD09RayHNPw00CQie08gaOfG4UjJCQbGiWi9aTXQzo15eB/E+4fxXfhQbVLh/FCfA0HsX9D
	hSx6hKOClx5BrEl0lG92DVN/s4b9QbRnHzVbEly4QY/U4E8rPcs6/+FBgfco8i7zZnw46a2Wu07
	CMIKBgXNKuXy9pU1EBBb1HL47WSqVmvWlF7LefOteuWRo+shGAya8mIDC0B8fBwGfmE4J7Ks23X
	0c1Pq43GBD9TAPB/0ra36Aga+WPTmgkjoIZ0tl3oxTudvWbjM6UdvV2cdDphb7ov8tQdPx2JSZ8
	F5kbJ46RoQio31ue+sjbW8B4t4keCcHv3L4Jws8mj7jsfQQvVBd1rf/dUaF+QQZNqkPOk6opi9v
	zFLNMepAN3P6INrlAuijEY0jTiOzI3cusIwiSnveXySR0eVPg9k2nTqIWKLoHle0hQgMrBfCsaG
	h3TP
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr9713393eec.37.1795411834538;
        Sun, 22 Nov 2026 21:30:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/42] bmap-writer: upgrade 1.0.6 -> 1.0.7
Date: Sun, 22 Nov 2026 21:28:47 -0800
Message-ID: <20261123052953.3658549-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132818
Content-Type: text/plain; charset="utf-8"

- Allow writing images larger than 4 GiB on 32-bit platforms
- Show write progress while the image is written, updated on a single
  terminal line

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../bmap-writer/{bmap-writer_1.0.6.bb => bmap-writer_1.0.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bmap-writer/{bmap-writer_1.0.6.bb => bmap-writer_1.0.7.bb} (94%)

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.7.bb
similarity index 94%
rename from meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb
rename to meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.7.bb
index a11fc7ec75..24d5fe0e19 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e49f4652534af377a713df3d9dec60cb"
 
 SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "7662aad2fba224530c45afd511db9146dcb48ccf"
+SRCREV = "b11dda47508daef0dcdce629c4e6371db6cafcd4"
 
 DEPENDS = "libtinyxml2 libarchive"
 inherit cmake pkgconfig
