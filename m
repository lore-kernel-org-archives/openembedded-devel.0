Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3798.1794728971287612539
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uEYveLUI;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37f14feca60so18913eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728971; x=1795333771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNbYywGFqHW+wWPqRKnmCDizvH6d6vepRdcS50gDVlk=;
        b=uEYveLUIeie9SsjV67oi039OGrNslxWn3dd+BVifyB1S9b/nlD+WmQgz7BA4MsJuhB
         tR2XnuAfc7zX8SSIkWR7pEYTjZlsb70L6lBbx1FgYYKCy0oJ+GDhfnDPTQfItEVUiFGT
         e7u0B51mfaLa35OYswrVIvRH8DfGJLocevXM5bXP8N7gDi4p/COyayI5G/a5C+YMRx9a
         53Ai++AnledkDu5XrBx9OmOhqdJoWTKwyjfH2McLj6Tz3nsuo3R/RTjMUSgjbqwkDcod
         H1h+uibC7MpkeWL0GlMbW1pzxPc7YMKoiiiJ2LA0U2rCE2BvbN0YFpCTL9DS8a3AobAB
         cxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728971; x=1795333771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNbYywGFqHW+wWPqRKnmCDizvH6d6vepRdcS50gDVlk=;
        b=L6+mMpCxlYnxyeWWZvGM44HNOQSeEKyS4dxZLNm9IQh+/oBaBn88ZhOgFGziq8Tueb
         ulACBx9KGw9TdiWB8osYJkfH+D5ROZK0Mw8I6io//uocWMajAVDFrXh16DTtPV78e7s/
         4FSh8UHvOfdrhtE+SIaM+V0flDKPd2MnnnQ+HoSn201WRYQibln6tnITf3qu+YOJqgZf
         kfC7hxNBzkmqygjLhiQJQpPmyeKQmDl3wh+orsIDlmEstDkBoCnuPuYJrQjPfO4ozsnb
         CVyEfpu4sLw030/UD7H/vyWqmXtbhQvfwLT67UxFnmzLOHYwHC9DRiwlqBMSW55pP9zu
         l4Lw==
X-Gm-Message-State: APuU4Z8ubpPziYyViMNYV9ip/I5KH/kP23rUyl53YTqZ/Qw6JqP2eEoz
	XekLir6J7hUmwegiRdTGD16Fr5+ZtwD9+eJufWYZ9BAf3qJxAOgAfJeLP00zQHzq
X-Gm-Gg: AYBFou0VvVpcupqTGnjLh2PQtSHGaAbsilqQcvnnhcSE7wFfjKYXqXtNa9F8gjCorZO
	C7c8omIgHWBpqaz79AyIvhaPzegkmXBMLqcPRKETxU3YQ76i+I1QAxIf6syV/Mgj7O1c/3h3x0+
	7PBIXnbFKRH1OLthn7ohktXAq8Ln2wUhpyZfi8xvKCqyLATnr1S4qkKGiAVWtDAjc5nqUgySDCv
	ptgJh+5fTw2jz0lAswhs+YcZXYyYR7umPHNbLohO3AT5ARGJUAzRSeh53xdWXsmG76MZvXj9MPL
	9jbwv/B+e49V3D7LwxYzA0QgHQwt4qWtjIcl0xWI9ciCe7gAeZA0AXSWV8xvEnN2uhhk+fI3tQZ
	7XY0nvZVqcwJb0VEiXxJVPfXiNQ9Xhac9lztUjTJDV2apTewu3jcUGBQiKJyKacnMIB1cj9orb/
	KTs5xt6VzzoC/QfoSkcOWrKzxMf60/amuWB8aGPttBUvDIgr5BW9WIjES6xIy8rsMmtXv6phblR
	eNfQK7kHEf4NP5BA0CSZjGWoPzuk3AUWH8eLuSke7Eq/p355REGVAymZWioCBP5rrZKm9JykAkM
	xIZvEefAF+V8c0c+SfduYAnj4Ae7YBkGiUsHBcL2HrvRPTM+kk86ERE01FwXLLY4I5mEnCtgkjn
	02rNE6WUEmFzlJHIj7YOtEvddXpRIIRZxE8t6jR4Cvj9uuPbkl3yqtgqv2SDQRXL6sy3ANbJCaE
	/dEEQd156+BJZgBgM1dMGf9zK4X7wVldfNC5WNnpujxxEiaVa+Gyq+w/g/hUdPz30Jga7TLHcuU
	p9bPwgxUTBnQHEIeoRiQFB2HrJOqmfwgjdzopOsMr7wZuiyMCrUbvVXkPsjn+4Fw1UDlQw6gBxP
	RyNp
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr10586230eec.40.1794728970543;
        Sat, 14 Nov 2026 23:49:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/96] gosu: upgrade 1.19 -> 1.20
Date: Sat, 14 Nov 2026 23:47:44 -0800
Message-ID: <20261115074918.2932593-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132276
Content-Type: text/plain; charset="utf-8"

Update github.com/moby/sys/user to v0.4.1 as required by go.mod.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/gosu/{gosu_1.19.bb => gosu_1.20.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gosu/{gosu_1.19.bb => gosu_1.20.bb} (89%)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.19.bb b/meta-oe/recipes-support/gosu/gosu_1.20.bb
similarity index 89%
rename from meta-oe/recipes-support/gosu/gosu_1.19.bb
rename to meta-oe/recipes-support/gosu/gosu_1.20.bb
index 937c45b96e..3b9b10c89b 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.19.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.20.bb
@@ -9,9 +9,9 @@ SRC_URI = "git://${GO_IMPORT}.git;destsuffix=src/${GO_IMPORT};branch=master;prot
            git://github.com/moby/sys;name=user;destsuffix=src/github.com/moby/sys;branch=main;protocol=https \
            git://github.com/golang/sys;name=sys;destsuffix=src/golang.org/x/sys;branch=master;protocol=https \
 "
-SRCREV = "6456aaa0f3c854d199d0f037f068eb97515b7513"
-#v0.1.0
-SRCREV_user = "c0711cde08c8fa33857a2c28721659267f49b5e2"
+SRCREV = "29b939aa5bd4dc588af765b8248f6e39150d2565"
+#v0.4.1
+SRCREV_user = "85a71bbe1faa36c552a960e6a5f3d0cfb632fbbe"
 #v0.1.0
 SRCREV_sys = "95e765b1cc43ac521bd4fd501e00774e34401449"
 
