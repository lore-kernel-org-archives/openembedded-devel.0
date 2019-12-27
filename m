Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5DD67C446
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so9325834wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GpwLo9WmNgAgE8Fr/gmx/m8zRVIRICwFrC3o5J8XSs8=;
	b=V4N3xnFTSDH79fwbrtXV7r2Jr8xuzCx3FmQGZTInx00fcMCwQaw7N64rdCMTZKf4RN
	4rqRV9nkOcx9usoGcYyfDUtf5xECe6WWGQ4DcesOJfXAwrvLpYvgsLbZYLl3ipCTak6F
	kqguWVngFwj7OcVrDqABF/HXoht4hyJUEUCV5hev3n0Yvp+G6msRzCI6fGI/ydY82isX
	0wrJP21nRIuDKgV/TXJy/wRG52Ca49wqKU85EHX+CI9Sr5JGIvPb/PFUYo5fCnBRSxhb
	3PCvu1ZSn0VCOgdZEzq48gw4IYHliO+PT4cyN6HVjfz601JHlwuE5B75QiEQNluK+9gE
	o1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GpwLo9WmNgAgE8Fr/gmx/m8zRVIRICwFrC3o5J8XSs8=;
	b=kTLYIAIxdCKKuEHvgipo6NqakN9XKxWg55JWROxOjmp6rhCODKWjDvkNmvs+l9TQUh
	QYIJUGCn/YxOi6bZsVWmJ5ZlxNt82ItLMsoVD7fEmxPVxFoHcDZdtNxxgT6wVyz1aLV7
	X5QEWMxqWlAFrGWB/K4XjdpYKf5mQ41hx9uEuzLQ5llyVN6ogDalAj+GlvkwEjiakaB6
	O7rDZNVptoEXyFxqG+bA/F/i5I1zadLEKmnl+qJ+w89yyH+tkUlQLt/syhWP7xm6q9/R
	Hu91iBjhUwcimSAcAMFX3bpyyfAPADI3Z/CPLTLoRfUWkeScy6OgwKFZehsDk5M0ozOG
	6yrA==
X-Gm-Message-State: APjAAAV7FVTSm4JN7mSeLkZsDGlVAGGPYqBayivBivi9Sh5CGh6k1P8v
	pJFDQcF07FLzP2b06xGAnOAwP89Ub+0=
X-Google-Smtp-Source: APXvYqxoOO5ShpT7h10AuLYOoaTO3JI2KAnSXUboSCMF0AQO4KYkOsv20mWwpdZT/4xRTVxj8KkFBg==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr20428316wmc.112.1577482294457; 
	Fri, 27 Dec 2019 13:31:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:06 +0100
Message-Id: <20191227213120.3930-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Evolution-Data-Server 3.34.2 2019-11-22
---------------------------------------

Bug Fixes:
	I#156 - EBook/CalMetaBackend: Automatic refresh not always setup ][ (Milan Crha)
	I#159 - LDAP: Fails to read userCertificate from the server (Milan Crha)
	I#162 - e-cal-recur: Ignores recurrence exceptions (Milan Crha)
	I#164 - HSTS (RFC 6797) support for "On The Web" calendars (Milan Crha)
	I#169 - Detached instances shown as with floating time (Milan Crha)
	I#173 - ESoupSession: Accept also compressed responses (Milan Crha)

Miscellaneous:
	EWeatherSource: Use g_signal_connect_object() in e_weather_source_parse() (Milan Crha)
	Correct runtime warning from camel_network_service_can_reach() (Milan Crha)
	ESoupSession: Do not presend credentials on insecure connections (Milan Crha)
	EBackend: Slightly enhance g_warning() messages with an ESource identification (Milan Crha)
	ESource: Required signals not connected after EDBusObject is replaced (Milan Crha)
	LDAP: Change how LDAP query is constructed (Milan Crha)

[1] http://ftp.gnome.org/pub/gnome/sources/evolution-data-server/3.34/evolution-data-server-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 0893f8e92..0e58b0cc2 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "d1701875bbac80d6d62e9acfc6c43bea"
-SRC_URI[archive.sha256sum] = "6ff56ba04cb639e627fe9d6e0ada106a10cadd68a0d53b8ec72b4e285df53abe"
-PV = "3.34.1"
+SRC_URI[archive.md5sum] = "7a0571ac358664c6e96accd3ac4cd245"
+SRC_URI[archive.sha256sum] = "3eb89f82eee042884a8d65737564fe48829c3ae187f067cbcdec2b088d2fe89b"
+PV = "3.34.2"
 
-- 
2.21.0


