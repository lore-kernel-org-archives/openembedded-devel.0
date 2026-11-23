Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48536.1795411866115884406
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gurQpNMo;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so1284882eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411865; x=1796016665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fVFZHVfPUwWi1w9J4BbNRNfW0cHHO52BuxeHdbmoYo=;
        b=gurQpNMoHpbi20AQpFbZypalBHCfe17/2dAPkuqRS/kREzEyAaaaqBNIAwXGLcqMXM
         g6kZ7rnoDoBw0WmwDheHn8MQmzxJi2R+0aaam1yvPx7rKShYjJ27kJfDpmGnSLPCf1bk
         p2B2nmY8UI55GrKv2Slbg7B2gS1c0NzM56rccGJJdmO509kyhReEHV3nFfLkJKLqBrXI
         YDIefz+FnnQTtfJbfe1r1XCcdeYbbZ6CmW4PGnHJdBG40Lp4h9wZ3fHgoix3fs6+VrIw
         zGfMYFo8p2XJnnuzCzPb0GIj21KJUGf1LP2MT8UKRCTUUWWI+NdAmWFke1K+fnP9iYTe
         ePwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411865; x=1796016665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fVFZHVfPUwWi1w9J4BbNRNfW0cHHO52BuxeHdbmoYo=;
        b=Vd4JlmYNXBed3Fqd1djWV0LuFjrPB/qWdAqhysOgnrHJzOoDmjGcFzwEcJA86kVJtv
         MIVVzKdoEcGJ+qUAEqEfZ+1K3yg2ctkxI8HYoA/XIJDzYhchvNrUjrL1xoyIIX7rhspo
         4pEJmVd3dtQwNlB8ejqAOIcQ54HFJDWwbcCYL//X5RJDV6UoznEeB6b9kG4K2O/02Axr
         NdHoSmgxzzvl9LLd2qnXZmpfCU/9qgEN2UuLqCMs97/lN76rPOuC6xV9P+9EMiuCmtNR
         hrIilJv1N+KOIrAAtNEqqXDEgwtNjn2mWGf90NEJF4wYwBDOa3t7FY/MfibGo1Ivddda
         wbuQ==
X-Gm-Message-State: APuU4Z9uWdIwJLwAP8pVUhF8hYjFQsddfFaa/rrJg6Z8ntS3Miz3Jy8b
	yhQK0e1kv6rvKR+cjSlhHa5zq9kWMTg07GnWc6zdaUfVq+dylTwtL3Q84RAjKOQGsIA=
X-Gm-Gg: AZFdTZdoxXr/ZdOB18NBZvSlok9eY5DzE45XnUl8szC2vM0L5b8G191kvclLIQ8kZbz
	nsqql/Wk9YK4GJYsTgb0er3EQF1VSWyhmiuakVi99WI4ITkDr1id3e0ZzIWqPlDvVV4tquGNvB3
	9FvUWr+Mh6lXmbL911kTFFqLmvtpiIw2On37G+0nQTyh3moJTJVYjvdbXG0Fnt9pmQOTIBPo2qE
	S99sWZWQnDeu/5htxfZByhvoGPiO4E/PYf5/9Jp7EHRi6S4eT0CTDW/hIsI/v/oIIuWyanEtT2u
	ah5IUDurUQcNTwyzPcy0ojufiW0wdNUID3jQ3aKs8KQ1hwTc5F4XmkMex/1LUb0Y1M1puf4lmZQ
	5sn3tO6hI2Us2QBmX9ruXjvut6HIC9UlUwZ+s4Mo3k6L+ryXsCFZi3Lcg5EehM6IwiHqYQ2ucDz
	lKV5B7vslW0YK/4HxtLUToBk+Pya1xyyhoBt6mZUAilN/tRU+AgpiPieZQ12HRjGNOrtFoDJo0y
	5jTnUG/MblBoJyIkDxxk01863RggXA+nDITxSkst9RYou4g3udfQ9DoPOQB5Rq+80ODDd6jUUAO
	FKNvFc/dM1YNXUXYN79rpKbNMgjd/tdn2Om5MptXECIf6K9FIjLkTWkjECqMezIMCrxTpOj872X
	hJwmo0I68KIOsAB6Lw8jdR3JWleOMxLcf4KXw5l7+M2SqqBK4nIuOBIkxR+z8QEaOqe2mKJ23hj
	xf7+BgpPWlnE/rXW+YcJXleay0Caf6JD8ACjzhDQlNOtKtttgjZWCoxN7KyuG+lotwzAepU+A82
	9vRljs7OzgzgMAIOe3zdSxQrHsM3ygmdVcNraIOhvoExy/4FN0nDAL0hEeYIvOusvXs13bBKyp7
	dyJZ
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr11145535eec.28.1795411865438;
        Sun, 22 Nov 2026 21:31:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/42] pcsc-lite: upgrade 2.5.3 -> 2.5.4
Date: Sun, 22 Nov 2026 21:29:13 -0800
Message-ID: <20261123052953.3658549-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132844
Content-Type: text/plain; charset="utf-8"

Bug fix release: the systemd unit no longer uses PrivateUsers=,
fixing a regression introduced in 2.5.3, and a polkit bug is avoided.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pcsc-lite/{pcsc-lite_2.5.3.bb => pcsc-lite_2.5.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.5.3.bb => pcsc-lite_2.5.4.bb} (97%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.4.bb
similarity index 97%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.4.bb
index b4494ef6bb..c9f41b5e21 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9637dc508442c2f458df6444fca97e09"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe2bb733ecf95e52768907eb00da9f9f3daf180960283e514a05dcc090afa3bd"
+SRC_URI[sha256sum] = "23b1c644ab4f13269d3a9ff26734f473f622deff6ed60492171a9a25f603f078"
 
 inherit meson systemd pkgconfig perlnative useradd
 
