Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E37E7FF65
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 10:04:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q6so1188768wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F/6X5GJAdh3Bhnr8Qoy1hMCA76rJkWQgXZcDMuxEgJc=;
	b=uoBcOoNIHJI2nocBpbITWg/nUBQMlxMMt/k2nUmFBjUfsw2i2ONHDiTfwtarO3yRqH
	TVE0SV7ry/efQpg4dDps73WJS/GjciJEYmbGp7PWGUiMGrL0qp8wRFnatkefFszBedQW
	L7eRRjE6pYi6n382/CvNjshKyI7TObKFUzZzfXVS6dXFbu+Fs8TRWvPLyh2+JVp7KxCh
	+MeDAn8+S+SZJdkxR3bbQdR0z97z8lDYOHbj7V1x6vMZOQV8egG76UeMFEXu2+2qx9nt
	o6117s0HmIkJtJlPBMz3pr6kN7fnUOdUP3pMStXFFhL5y8lGuJGpCpYkaKxFTFilFAFt
	CWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F/6X5GJAdh3Bhnr8Qoy1hMCA76rJkWQgXZcDMuxEgJc=;
	b=XSnrYp6G7YmALrSkzha3gnVJO5EQNQyeWwCr4HLd3FiagIXRN60HOWMknl93f1uIbq
	w1x3rmkjQTmTDKyrhL0Grmp7YPF48jBgPCOlXSbbeT06r6qrlAkkPDTDNjGBO8I2nuBL
	qPsCCB5lMwbdvyClNPYE5pS9cViw6h/8sEvN/NnDO1i60tnuqJmckt0F6Zc5rcskJV6B
	ma88kKb2e+asqIB+qEMwS0rEM6MkOE2ROiG5egQuDyiQMl4rIVF8+CuN4WRdiAjESF63
	r47Ba6BEh6yRvDChQWqTu8RO/VJ+ESPJK7HkAQGSRoTvIzVU72cWPSr4bEqobZCczf6B
	WIwA==
X-Gm-Message-State: APjAAAUk24yZj2NAzGMKIxt/3ieFPCX5/SRKsLuGQdDBFU+Q1w4NoLg5
	xSmmNWZrcr4AuWqazBZUBo609rw0UDk=
X-Google-Smtp-Source: APXvYqzNhDd/8nLgfBxPEBh4qSan8NvaoANGW3OjNxOy2w+x2j2TQI0jiwwjJCiyeLtcNGiucKMOMg==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr2668499wrj.357.1578650696746; 
	Fri, 10 Jan 2020 02:04:56 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	o129sm1644937wmb.1.2020.01.10.02.04.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 02:04:55 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2020 11:04:54 +0100
Message-Id: <20200110100454.20554-1-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Fri, 10 Jan 2020 10:04:56 -0000

Thanks to Khem Raj for the suggestion, the location is similar to the one used by Debian packaging

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 8a2a3e1b8..9562809a8 100644
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
+	install -d ${D}${docdir}/${PN}
+	cp -R ${S}/examples ${D}${docdir}/${PN}
+}
-- 
2.17.1


