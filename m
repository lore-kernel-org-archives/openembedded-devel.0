Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 15D5570031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:53:02 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l132so246903071wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tKoD0FoJegJp3+Eio3rsy9FLhY6a0557SVqr4+YT3Pg=;
	b=k2e3JVZSx3CSXSvP8GFPVsi+4lEHQXS+apEW2rpKYGWg5ht1dhNQ8JZKXgLPhAHjOv
	/mlX1rPdT+wRgAhDRi4TbSpVpyJePeFsk9LFm2fXKSEiCXigkRDPVxpk9Fj6Izr2OB1v
	O2/VvONRAPanGuq/TKTjDSGe7Y20mJQSL4+n0q8Wl4uJ+Q3LZ/Qdifao6B8FTOIMh7ec
	NPxZc3lITiJx/OoitnIO0Q5pvPLsbrQoVHtgCX7JvJkqTqqkqnOaHnr5PuAhDR3k8zsF
	yR6ubZy5KrTwwxR7PEOZkaoEDa8Q8wpYNhdnBbRcFltahmaXNFyFgOa86JvNgyx0UkVf
	eLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tKoD0FoJegJp3+Eio3rsy9FLhY6a0557SVqr4+YT3Pg=;
	b=kSVeKiyGlOEHaxUh490aTI5qXbS4uoTswpfa8miqSF36MMB8isJjmG61O2C9D1GDYs
	57++709i9cLWozdu47fnXqBU6XJS6iSPE/TZviJAzu515/0QNF8OCupwqUq4bPKyteAz
	XPhADxZK79+Zp9kuFbR9k1tLVg1SvAAObBDGKcL+1yGbjnLGB7Dmc6KTdqbzR7/GhDG8
	g25KKNWsjYo+H4NN8vAQ8LgMHsB+4R/1TY6nl++NzNyZadAYrbB0ghsFtBnUweO4EMcG
	/Ylk/TIBhDHs4dsvUn/6pmMKD4rTXX5egNcQ+hJQthzwIsIzqlELvXIts0DN/2C4SBz1
	ub8w==
X-Gm-Message-State: AE9vXwMJnG5RMYcEHL5KxF7z4edOxNGdwmP3cYwrUN0K336YesXuCF1eQa68v6I6sSvdYQ==
X-Received: by 10.28.39.133 with SMTP id n127mr1563046wmn.6.1474437183517;
	Tue, 20 Sep 2016 22:53:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	b128sm30776307wmb.21.2016.09.20.22.53.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 22:53:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:52:51 +0200
Message-Id: <1474437173-26079-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/2] fftw follow-ups
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
X-List-Received-Date: Wed, 21 Sep 2016 05:53:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These came along by further tests.

Andreas Müller (2):
  fftw: fix reconfigure error introduced in previous patch
  fftw: fix native build

 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.5.5


