Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83AC9731BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15684101wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=S8FrYjls4+lu9uYeiA5TvKofYzUXlViEkH9ZiJ7h9fo=;
	b=tuyawYQpy4820uRYqB2rJlYG0Izc6tghNCGvB/0DEGa2eDppvswY2hhJUz494qHXv3
	hhjRZpV0QFMgKW7pUugdl304ISHcrnWN68sysFIo1/L6OMQ57N6Euk/iZCftyi3UIE79
	73RH6CEwrqYPewqwPBt48UUEWgBfRr4h/gVfEGDXqllJryXuZQQIAv6bOntldrdgJFNA
	vmIAxYwXcsnhIIn2qIJafhYzTW0nh/bqzN1HMwW44jci2B/hyMUS+3vn1bUjfqyP/agy
	VibTpLFHtNmn648tat9OU6h6qis4SF19xd1Nq6r6bZ5hB/lma65f+RTvT4AY8VGcdfV6
	Zpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S8FrYjls4+lu9uYeiA5TvKofYzUXlViEkH9ZiJ7h9fo=;
	b=EQFcDHYFiYMIHJOlEYLaM2yoj6Sxyt46VZbANpprgT1QiWRDTfzGqaq5V3zwOdpa/1
	wadCo6scGztXasJ9RBYmGatTPsoBRiLSLiLgNhWAv5Ez6lKHDZSj5aXWtDVT2EW/SNmg
	SnedIeKpXk+fvOIRRb8DM+H4uEEfD97O47PMBPPrFtAs56WPgPwB3KYsSSJMmf/IJfuP
	aoKRWbfm7paXVQx/1hWwA2R5Jstw3TXNul/NxhlRqHaAwXAOq0RDqjvjTxYX5tv4Kv+7
	3M7NoSVToflJjaz6ocjy7MMDfNDRE4vS2nChpjRniO3MzSlY3PvKyOwbdCKLoog9CCxR
	z5zQ==
X-Gm-Message-State: AMke39kRexyRxv7gxuo+CDt+T9o5xn+d26JhYEjM2AP+l/KeZjEnRr0qD4VHdF7CgPNXoA==
X-Received: by 10.28.17.20 with SMTP id 20mr21282280wmr.106.1487614064694;
	Mon, 20 Feb 2017 10:07:44 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:45 +0100
Message-Id: <20170220180700.29836-30-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 29/44] gedit: unblacklist - gtksourceview2 is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 8151e2f..03d7fa4 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -24,5 +24,3 @@ LDFLAGS += "-lgmodule-2.0 -lICE"
 
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
-
-PNBLACKLIST[gedit] ?= "Depends on blacklisted gtksourceview2"
-- 
2.9.3


