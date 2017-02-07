Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E554371A6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 05:21:34 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y143so30023960pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 21:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=k1MLKUycKNPttS3qngtrsMQ2u8uAKYKrwds15kDx34o=;
	b=s9AFh9ytqsDum9hsRR3SHDlrpwX2xdhIaGTefCZbtcbRJS01PlVHRtgvecGsgL4zs8
	X5RjHYu0ZhXLhFDRgBpxmO5ERD0P5DFEd3Y+663O6XjsEaszrLl8Ctk/i2wNWCzhQJTr
	IdH0+/gmdeeZhq8hXeBHIxER8/kbPzbGWeG0Jr/pdlKYeB5unklIxnAyKilFtWuyrxBt
	nfr6WulJoVzqHWNVBVQ9xbw23bSTiT4DDGaYD+4Z6ogOkS+CTgYpsZ7DO6+ayrBKc6ak
	9i1I6IvA2gp9rRDoY9PuAloWLYcMYlF2om0IhUobXLpOsP8v4Qtah/uxb24pnH8GkSSZ
	apIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k1MLKUycKNPttS3qngtrsMQ2u8uAKYKrwds15kDx34o=;
	b=SsYpDi9QefTvpKSz5Pm3+7mXC7qtSOeyUWBtzG5Eza7J/5SVDzs5sE3ObIRJqma/bZ
	p9jGN83xab0O3R59Xa74lrPt8djuq2Z2FzHpnIBSs0++AwVkc9ou/3Rgs/qz3TUZMd7w
	nV5DiRDm/01uqfjl+1WkiJVhtFVKDtB8tC05vCoagfOjVS8qQJ8Su16gWZhbOSGVGypk
	XfvvQutbb4YDssvFqlWQA7dMhHaolLnMFPbodSYIEz9W9aFSQR7Tf+w/KmP6vSLIzaKm
	/ssRR1jYPEAyabhIAC1T4WjADZXgW+Dx9JJ+UGwyvYy8N6SIBj7BljeeEhn9NdT8iLLC
	CLGg==
X-Gm-Message-State: AIkVDXLu8AZZoBP0jqhc9dqJfmEEcjDdp8OGAU+tpyBjwepUiXcPe0bq0PsfCaNLqay8Wg==
X-Received: by 10.99.146.7 with SMTP id o7mr17793008pgd.6.1486444895355;
	Mon, 06 Feb 2017 21:21:35 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id
	h14sm6779677pgn.41.2017.02.06.21.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 21:21:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  7 Feb 2017 00:21:33 -0500
Message-Id: <20170207052133.1791-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH] netkit-ruser: update SRC_URI
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
X-List-Received-Date: Tue, 07 Feb 2017 05:21:41 -0000

ERROR: netkit-telnet-0.17-r0 do_checkuri: Fetcher failure for URL: 'ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-telnet-0.17.tar.gz'. URL ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-telnet-0.17.tar.gz doesn't work
ERROR: netkit-telnet-0.17-r0 do_checkuri: Function failed: do_checkuri

Debian moved these sources

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 24eb96f..459e39e 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -6,8 +6,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=f4fc634a4ce8c569911196b72b10770e"
 DEPENDS = " tcp-wrappers libtirpc rpcbind"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
+SRC_URI = "http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
+           http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
            file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
 "
 
-- 
2.9.3


