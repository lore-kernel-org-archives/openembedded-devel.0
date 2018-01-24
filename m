Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 26B8D6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 13:18:04 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id m11so4806727iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7KKvxvZOjWeiq7iKTDVJEwj3vyrNIuroT4wgJjGlciY=;
	b=CcgVXejDH+RTOdzjcoLmUlh+afKq7lUAxOFpYzVMQvBTG0Y9kS8YaNrEElQuLGizi8
	sxZqrLorEfJogCV6cGTUXGH3cCbjJbbs35b5i9nPmPVIITvk+++Y3aDiKa4jKo50MdgO
	7oz7UNPSMo3qMz11Af54q/3yEzUEpRsl2O7b3kSXyZWXVBo7RCrRPl4SC6MnoHy9gsu5
	SCVcOwu3zqWUdKdaL0E+FawzyWVGRJPQYcQ6I8NGGDlBWo9HFYIRdQHOQLugafnHNYgX
	8kX5L6PsND3cZA8L5ff4+JNi4Qng1AQMel3XVaQMLi7UpOu1O5PSxAaTFN5+SOQYCq0a
	awPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7KKvxvZOjWeiq7iKTDVJEwj3vyrNIuroT4wgJjGlciY=;
	b=ESAkda5HuVsAuOD6EwOHcsU/2w2g7BNgd9pMHj9x9HFdROckpCSEyCDECklohIHRwI
	B65pjw7dOq8reenJuPX4eOE6bBT10KgN5cuVfwtjYdd76xDDMoXlRkFGcAkJxpGo51Zh
	SdPeMxAJ9BKSX1ICeO98ixtxLdSbUczYhQ+S3KC4nwyIE9VoWylV4AiNDiK4F6s8MTB5
	PaiGa3EzqSqmnbFy0sr+4SqbqTL1QiJIWrfxXAzLUO+H0WvXt0+u5dJfmZA83/ttuiIW
	VUv74W2RntzFcYo5z697mk3dJaef021Vu28jUDs1Zm9GQAQk82OFPeZ5dHZFrFTI/+EV
	4FaA==
X-Gm-Message-State: AKwxytfzM0q7lT5GB/tqgoJJfMS2UKu42UXX4dWTfq2xied1zE2ShwxC
	0wKZDmu8pLIzANGVJo/EZAdy4K7L
X-Google-Smtp-Source: AH8x224uZDZZSwhoCWCQ1oadGlGQ2N9VwaTm2ksj7j2h461kSGkj3ZURPLgCnlZ/TWnFGgL9sjxwUQ==
X-Received: by 10.107.198.140 with SMTP id w134mr7946803iof.255.1516799885784; 
	Wed, 24 Jan 2018 05:18:05 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id r139sm167963itc.9.2018.01.24.05.18.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Jan 2018 05:18:04 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jan 2018 08:17:59 -0500
Message-Id: <20180124131759.5884-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [meta-oe][PATCH v2] uriparser: add
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
X-List-Received-Date: Wed, 24 Jan 2018 13:18:05 -0000

Currently I'm aware of the following layers/recipes which depend on uriparser:
	- meta-measured/recipes-tpm/tpm2-tss
	- meta-webos-ports/meta-luneos/recipes-webos/luna-sysservice
	- meta-webos-ports/meta-luneos/recipes-webos/libpbnjson

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---

changes in v2:
	- update license from "BSD" to "BSD-3-Clause"

 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
new file mode 100644
index 0000000000..b4be853ddb
--- /dev/null
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "RFC 3986 compliant URI parsing library"
+HOMEPAGE = "https://uriparser.github.io"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
+
+SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-test --disable-doc"
+
+SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
+SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
-- 
2.14.1.459.g238e487ea


