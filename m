Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAB17F306
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 06:46:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id 30so5154458wrk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 23:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NMcxsiMxAcvFVk1+b4IX5t4jBVgo5W/efsOVCiiDtTA=;
	b=edzShYw3CPXYpXqhWYdnJBK7BIcQwQQjyrZvRJKNjgxW99Q3YKfTC3hMr5p2UMWUEf
	6P4GKh3wcSkk9n+nqxE3tnUhOgxfCJo0peLUeXLjCRtsdMaLby9KIbDcMq4I3KewFp1n
	/OUidBv0YKqu3YA5fa6thIEfqrj9TvbpEpUuTOn4Ah1HkJLAB4AiT9gETmc751NBDWbT
	oTr5lkIudgwteEcSrOtFSo/A1AH/d+nB7tazZ5tfycmFwMvfb4kenv71w9YI/2PshCRb
	RmcdZxl6eyZNYseuIgTOKzxWHFRxIxJsFqub3KHF3BIN80VfSxzYWJgTrewncJqeu3bf
	71GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NMcxsiMxAcvFVk1+b4IX5t4jBVgo5W/efsOVCiiDtTA=;
	b=knv9/8CKK/beL+U4ZrraY8w4KFPMNSnkQFj03vdhyspDGQ7t0AuykiJoHQlduUoHsx
	pqjzrcXWem9iMOo+IfrQIsWKGUKYoJZlKilual3jN1mgNaEdC5BFMI0HiGiGE6x/tun9
	hpO0Iwc6UuVliRUp8gr9L0uXvTUgyGU/Pp0RwBdKMSyUgxWXpB1aqp7l2ujV1Rwck/Qc
	T242Ezy3s4NLze8dRSmawq0SMvmCmWDxtQmDSP8K9/s96FWPH4fUa9v8ZpuPQ685C3Rd
	Ly31J5pNZzTjvCDO9s+J3pib6Y5kwDYCnZKf/1B3AUxYEyQd1uuOHVEFL2O3BPXEUDgG
	ZNDQ==
X-Gm-Message-State: APjAAAUof8fb1ZzEsR0hbzX2or/rvBR/gDB94UsREBULecalmjr3ig7h
	g3p/WW6UlxB6JZaVACleNO5zvrrR
X-Google-Smtp-Source: APXvYqwAZyU/sRHPcSzkpQX6BWe51BnYtuGm7m2DGuN1LsnlLC1ZxAh1RpB+Fs0PXGNenoJ2Lg787Q==
X-Received: by 2002:adf:e44d:: with SMTP id t13mr35008278wrm.240.1567493175855;
	Mon, 02 Sep 2019 23:46:15 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02A21973D945F5DCDB0D0E.dip0.t-ipconnect.de.
	[2003:f0:7f02:a219:73d9:45f5:dcdb:d0e])
	by smtp.gmail.com with ESMTPSA id
	f143sm9121245wme.40.2019.09.02.23.46.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 23:46:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 08:46:02 +0200
Message-Id: <20190903064603.17637-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903064603.17637-1-schnitzeltony@gmail.com>
References: <20190903064603.17637-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH V2 2/3] xfce4-settings: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Tue, 03 Sep 2019 06:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor bugfixes & translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
index 902e326de..a24928cf6 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRC_URI[md5sum] = "dcbc673448e1a816b2c47a7ce0ca13aa"
-SRC_URI[sha256sum] = "e03040d623abda0222ad04f226582277a1936507ddfa927ec8e87927debc113c"
+SRC_URI[md5sum] = "2f4171c21db905d9ba0ca9bee3fc7a5b"
+SRC_URI[sha256sum] = "e873e9f6b8e801fd9304ee100c4c76ed9987446c38429d02477c086431c0bf7a"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.21.0


