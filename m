Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D71F771B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 13:39:22 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v131-v6so5212918wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j7CUIe8LpJOE2Gym/4waXBZTn/vTwJzyMNl2cklvSfk=;
	b=qxcztN3I0hNfSJtM3FZUQyNNdeWCLsXg9HGFw1mygMjlDYvZ1mQ6jprue7/ugdfer4
	0dOlFLPNs9ZaVqn1ySwh+lKGwfc97Zlj9BIVuAFV9WHpx6b1XJj8jeRnwVmdfhQKqkwW
	0c63T5PPcuhD2tJyHgwV22aR9fM8n9buO+YZU2Su/jDKLIOSJgEMlIoCdqVSDAVzBzOO
	lo2PY2eHQmIEpB+nPcLu4mMJRkRpgAaS5pLzN7e9CqpHgOinIA8bdTWOtq/OTeRsA2Ge
	cyLTVCjBj5VC+KI+oWoaKDITYJUtkEsbjNZW4ojFR/Ukgowtvpy6uMVpb6bTMmRYijub
	tk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j7CUIe8LpJOE2Gym/4waXBZTn/vTwJzyMNl2cklvSfk=;
	b=m/tjS4V73saFD49wAA161ygTpZgwJG/09ylbIPIwz8yjLUTsRW/4aXcVCcubSrOn9S
	3Fr3DCoXjyhUghQIbraWNXFARH2qooT0Yc2G3NTl69wAsHwis/MubC4SZuWMOjBiftuD
	KmZN/nQNtY0as+ZhH/pzrtn9mf+fP0lsN4dfAT+TCRlEJhbPHqQWRhvGv8YptgGk9lsi
	aqxsk6j1fX2fIKcQGeBXONDspTI1G9gsHCTTNbqSVsNVUqsnIVslY6HYvSdsXDin96zJ
	BAzHFsV6NLxb8ibV9SgIfTcx8lOV6T/thGPDT02GrB93/B67bMRG07nXIsPtRqBuQ2qJ
	bFcA==
X-Gm-Message-State: ALKqPwe1dg93cC1Q8M38P3SZEgmDwTqVZ1y4Sl2so3oYAhQvF43+6huz
	gMHYjVkAs/+5OLsIqzoL41+azA==
X-Google-Smtp-Source: ADUXVKLgogJaEKq0Qtz0cGExtghUFo/BADTmc6wtqwM3B3cqtv74CP7zVJaabx7tIY8oiLXCfrZMqQ==
X-Received: by 2002:a50:ac13:: with SMTP id
	v19-v6mr29106564edc.153.1528205962653; 
	Tue, 05 Jun 2018 06:39:22 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e46-v6sm8614067edd.80.2018.06.05.06.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 06:39:22 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2018 14:39:09 +0100
Message-Id: <20180605133909.11319-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180605133909.11319-1-nick83ola@gmail.com>
References: <20180605133909.11319-1-nick83ola@gmail.com>
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH 2/2] mosquitto: add mosquitto-examples package
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
X-List-Received-Date: Tue, 05 Jun 2018 13:39:22 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

the mosquitto install populate some .example files in
/etc/mosquitto. move thise example files in a separate package

The PACKAGE_BEFORE_PN is needed because otherwise those examples
end in the base mosquitto package

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
index c71f1e467f..8dd2124c41 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
@@ -62,6 +62,8 @@ do_install() {
 
 PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
 
+PACKAGE_BEFORE_PN = "${PN}-examples"
+
 FILES_${PN} = "${sbindir}/mosquitto \
                ${bindir}/mosquitto_passwd \
                ${sysconfdir}/mosquitto \
@@ -79,6 +81,8 @@ FILES_${PN}-clients = "${bindir}/mosquitto_pub \
                        ${bindir}/mosquitto_sub \
 "
 
+FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
+
 SYSTEMD_SERVICE_${PN} = "mosquitto.service"
 
 INITSCRIPT_NAME = "mosquitto"
-- 
2.17.0


