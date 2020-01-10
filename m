Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0A327FD23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 14:34:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so2044870wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 06:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EkysWsAwtFGvqhIHtJ93bc42lDljG7oPRTWopnnEt4g=;
	b=oSmoxa9WA2w2xq0e+wOOH6TPkx0bbPRJbwGM2QiKNZRydw8Dw41JjVcTSGfeVx58+9
	0J+PeM1gxUU5H8+ptKJn0zq6lya7OZZ/Hq/BhMex1hHUsTRgP9HZy3rgexfIHtsIz8N0
	I8BZ/Ej/5Xd3PoQklxNgDtDkmzkZVXeO0q+ZTHtt7ImBome2AMBDRnn9RusZEVmBm3Gz
	5NkvlHdX8MHACcEkisqL/jxMBbLFQdUUcgjXMw68hlflo4guhJM4QeuebDzLV2FFj7Pf
	V/pf9p42+XLypCIcSygppXMh0RrnhSImjBc3b5V2pEWljdhnX9ydWOmiuhT525J34+c5
	BOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EkysWsAwtFGvqhIHtJ93bc42lDljG7oPRTWopnnEt4g=;
	b=nhGRV8uMsMIXe+lSLEELkwv50t2zDBsGhXTJUZ3ucYZjWX2h6gL4UWtAgXmvPyz80g
	jl1NbCYieZ7NS9BZ7vcpfUkzmDroxT39dtPtEjF0AGXSfdx1bLfEgye0EEG0QYNd09Fe
	jDswAlTPTiCSnQRK+8AJBMlHXLl58cDu4H/tK4rKSg2KQonXfkbncPbV3a4yIjNXdtF4
	A1HWsKLS22rj6w5q5cHAcNzjTKxQ6U8Y8lzgI9+hkcpG8Ewz3F7ecka6w5alM/Eqyybc
	VJKUk1IujBMQF/2Oq1Mh4anZUfwkB0egsmDEs3vmgDZah0PDGrT7amiOs9FCSpM2hYMi
	L/ug==
X-Gm-Message-State: APjAAAWAuAqmjP1UiN2Wpa5xMPxHOBvFvqtoV3REVbbqX7hG9snRi8Ew
	M4tneTRdCQua2qzSneVisZgs1ItmH0I=
X-Google-Smtp-Source: APXvYqy7GbSk/bRfPiSVsdK2fX3VLWb3IDh4VHgvuZ8MTSaQLB/kfQSPk6os782LMUAa3K714POSpw==
X-Received: by 2002:adf:f604:: with SMTP id t4mr4144837wrp.33.1578666848167;
	Fri, 10 Jan 2020 06:34:08 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	n3sm2428821wmc.27.2020.01.10.06.34.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 06:34:07 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2020 15:33:17 +0100
Message-Id: <20200110143317.32258-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] websocketpp: also install examples in a new -examples subpackage
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
X-List-Received-Date: Fri, 10 Jan 2020 14:34:08 -0000

Thanks to Khem Raj for the suggestion, the location is similar to the one used by Debian packaging

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 8a2a3e1b8..4303f2473 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -30,3 +30,12 @@ SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN}-examples = "${docdir}"
+
+do_install_append() {
+	install -d ${D}${docdir}/${BPN}
+	cp -R ${S}/examples ${D}${docdir}/${BPN}
+}
-- 
2.17.1


