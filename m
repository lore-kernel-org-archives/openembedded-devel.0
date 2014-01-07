Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 33B1B6BE56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:03:28 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id k14so253984wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2014 07:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WtecfBVSgBmoycZ8ZFuG1+vSwUTEC5IMbCGSutudDWs=;
	b=DEG9lj58v4myI9yeX9OnXcYC5rhIHzam/WamOTBjvD2j8s4QtKeW94heaZMXEXE2vs
	tOJ/wlw+6Bq5Ce7VIjiFUFKSToBM4htXFDewAh8gIEnB3JsJMI0LgkRh8i8Ea8cR0cSh
	lurRej2Kd+2x/1HEcdeobPOmm7UmrVskBIxQCrN6UHKD+l5ONWEsaquHFzqVF/Vi6gRT
	tBmpxpO85UYcpVmha2+b1gcPumVp9tDc9q/4pHq/6l5h+QrglNNtu7ebrwO2gfO4C7Bw
	wlgyrBC+95OU6TPY/GiOcKZXYZXqklN8lRZLDdaXsN36jmi0udjTVWN1QBkNYmiY5irt
	EqqA==
X-Gm-Message-State: ALoCoQkheB524+GWO6N70eye0pDFatq5wFgavhovlTQI+hUN/pu3IBV1xksN/XiztKj41tBzryvP
X-Received: by 10.180.12.70 with SMTP id w6mr17323074wib.4.1389107008431;
	Tue, 07 Jan 2014 07:03:28 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id xl18sm3947723wib.9.2014.01.07.07.03.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 07:03:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2014 16:03:24 +0100
Message-Id: <1389107004-6822-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Subject: [PATCHv3] irssi: add 0.8.16-rc1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 15:03:28 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

irssi is a text mode IRC client.

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

* Fixed PV
* Added SSL support

I'm open for suggestions where to put it, meta-networking might not be the best place - koen

 .../recipes-protocols/irssi/irssi_0.8.16-rc1.bb      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb

diff --git a/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb b/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
new file mode 100644
index 0000000..bd3ad85
--- /dev/null
+++ b/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Irssi is ncurses IRC client"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
+
+DEPENDS = "glib-2.0 ncurses openssl"
+
+REALPV = "0.8.16-rc1"
+PV = "0.8.15+${REALPV}"
+
+SRC_URI = "http://irssi.org/files/irssi-${REALPV}.tar.gz"
+
+SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
+SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
+
+S = "${WORKDIR}/irssi-${REALPV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-ssl"
+
-- 
1.8.4.2


