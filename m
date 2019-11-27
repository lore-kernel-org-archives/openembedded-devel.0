Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DB9D17F87C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:03:18 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id g1so15870555qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 05:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=KWTHaPbTPBhnVi/7b0VJp9Z2pnod6yaCwwrtJQFAnng=;
	b=1/HzdBUfSP5/vp+t0Pb4PQjf0FoPU9y3zOkqt6PpkIhkyepZ2/U2CKxhN2ICtkeDN8
	jWisywMdvY8l1TTVFgNdyBHYtJ6bKKJHI61Uzu6oGPPji4g+YiApWIoojp8ANIWy78dr
	IM4XAs+BCCKEeEsInX4UTtb4qCS5WH9cTHostQmh4+4o3+nMOpESptz0mnEhS5BCHcqz
	cOFYZNnMHt9L013Wadw0+VUmlSvpsDSSb1MHYPHB/Vm/y9q13xhl9bb/o1zk1iRFlHtr
	H1F3AuXFuYUxNMafA/xxJUkkDZ8CsK4ugSjNPEmDeZsWnTmSm5kyTNUeK+KyYjmjhqw7
	SNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=KWTHaPbTPBhnVi/7b0VJp9Z2pnod6yaCwwrtJQFAnng=;
	b=JWn/UR+RIcht9cPA8LOYGHsoG+ND26ri/eT05UVl/I4WFVG66z7vLO28mm24Ru7pRU
	QpZXOo0MHWvl83/QqJQnUKVyYl0pSidtCIK0u2DZyLe0JGGgvFHV0FG2Mbnv0eDjByIN
	ZvKH0jb20p5ZfutwhzwuOsa1nEudqdC2GtvkYvah9t1gfTY7w4ugfPWDiWeUyEGMoLn0
	prAedEvo5HHCI+NFqqeQQlKnYF6Hqb35LL6Etz7LjdI40yZe+YpBQMFCT9e4KJ5ktKEc
	QUULKesNAHeGk1LZAoHDKitRwG/0SFwZZRA05PCwdgl0AA0HLpVOPsMe/hZq276MBJZJ
	0lrQ==
X-Gm-Message-State: APjAAAV/Z6cTJ8l5YudAnSHxNjyq0rR4Z3zQOiD6dBvqS3YRhNNYGiyH
	sG8SCWzlJ7Jp+3e8mykmNoetzbAl+7TtDw==
X-Google-Smtp-Source: APXvYqxtvvp3G0DLPiuHCb35wwFOjwprZA+fiXr2wceuAnVD0xUM03wKPrZ0MYm2TuOZ9hcpFK09Bw==
X-Received: by 2002:ac8:27a2:: with SMTP id w31mr23682197qtw.227.1574859799744;
	Wed, 27 Nov 2019 05:03:19 -0800 (PST)
Received: from centrium.lab.ossystems ([189.103.49.163])
	by smtp.gmail.com with ESMTPSA id
	y91sm7735101qtd.28.2019.11.27.05.03.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 05:03:19 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 10:03:04 -0300
Message-Id: <20191127130305.22666-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127130305.22666-1-fabio.berton@ossystems.com.br>
References: <20191127130305.22666-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 2/3] jpnevulator: Add recipe
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
X-List-Received-Date: Wed, 27 Nov 2019 13:03:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../jpnevulator/jpnevulator_git.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb

diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
new file mode 100644
index 000000000..d2819f76c
--- /dev/null
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A handy serial sniffer"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+PV = "2.3.4+git${SRCPV}"
+
+SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=http"
+SRCREV = "97438ecbd52fbc01540221bc590f8388a43c74e0"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake install 'DESTDIR=${D}'
+}
+
-- 
2.20.1


