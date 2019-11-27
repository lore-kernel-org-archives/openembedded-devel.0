Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2C87F87C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:03:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j5so85226qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 05:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=dA9DUh7SA5SwAHuagafLyqux+T3IcHBScgEQvFnuLMc=;
	b=ADmjR99JdiX+0xkSK7R0Z/AzcyGvFK5kwE9aWmnsDJ+JthAVNc4/cARqw6nLz3qwlm
	3hZlELtCCxw3C7JSLImhBfP3qnlN2DFviTJxTt7+QRLEdc9hg8/u42q5A0oW16nO/TBC
	uiHVkDl/3OwegxGjCCV0tRxtb0eCxFlayjEk7x107iEnlDew0/IkWj+vq1vBL6NbC7Lm
	aDvKhvDqQKTc78bpsq7vEQrLOyr81Vy7qYhwftfstvtHpx5KHEAzUT5p3V1Pz90skDmI
	2KR7DK1HPACGCn6Vja3kKflu2yeAz9e6sQ1b0bO+Hw1NHdAmD6mE+ya9XzT413dKTkol
	DLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=dA9DUh7SA5SwAHuagafLyqux+T3IcHBScgEQvFnuLMc=;
	b=eRc8RlSTVwvak1Hctu7c/F5dG29bophk4Jc+VQ5zgGAyBE6dBKLx83UGDhCIUSVtaM
	EXCcBRwS9u16noAqxGc+nO9ylxPPFhTb6qn1xyC8HYLibq08dEmgx7YVAU1Q8oFtSe7c
	9tc/Ez+OkRbUEFG4o+mVZsMvs0C3H3+X3GAG4yvo1WPmA0PzTfPj2p2+GAEHZ0MCuTp1
	H46w9/eUL3cjijjy5mruuZVjcrktJyCK/MuGHqoxBRxv8459/FKAV//J6oPV1OGDX8T+
	2Wihb451LnI1joiQ2IDY5HL4TOYlJw4bKDkvvcecQkA5mFAI946Rsg5+xQ11s6ol+Dz6
	IAJQ==
X-Gm-Message-State: APjAAAUIXg6EC6SlYu4AoppJW8TaoVFMrJjEfgx4I+pPVjBMPF/9ZucL
	DCcT5L3UZQ9fApiavzOfNj6Ecn4nHFIEhw==
X-Google-Smtp-Source: APXvYqy2Ls3Jp9xOV8Ne+IrjAwJmZiyNSTiigSRxs0fiPNqRTGriJUQxzCJ7EmiUtVh+vX9j89uDtQ==
X-Received: by 2002:ac8:4905:: with SMTP id e5mr23681311qtq.285.1574859798193; 
	Wed, 27 Nov 2019 05:03:18 -0800 (PST)
Received: from centrium.lab.ossystems ([189.103.49.163])
	by smtp.gmail.com with ESMTPSA id
	y91sm7735101qtd.28.2019.11.27.05.03.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 05:03:17 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 10:03:03 -0300
Message-Id: <20191127130305.22666-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 1/3] mdbus2: Add recipe
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
X-List-Received-Date: Wed, 27 Nov 2019 13:03:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-core/mdbus2/mdbus2_git.bb

diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
new file mode 100644
index 000000000..82f2cf8c9
--- /dev/null
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Mickey's DBus Introspection and Interaction Utility V2"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
+
+DEPENDS = "readline"
+
+PV = "2.3.3+git${SRCPV}"
+
+SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=http"
+SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
+
+S = "${WORKDIR}/git"
+
+inherit autotools vala
+
+EXTRA_OECONF += "--enable-vala"
-- 
2.20.1


