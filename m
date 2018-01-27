Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7620178860
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:10 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f4so167677plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5O4K2VpZse35NDywwMhdEczaiNfQTcqY798XoeSdtwY=;
	b=o/fOJ2Bpe3qjMkD1cVMcDE0x/kFagOHni++pPdgK3cJo/c/EqoYCeAFFvglGarqedF
	g87UtIM2X+tUNbmvAdPM10e6Z/pKM2VfT/gb6GswGrIhqwiApxe35wZUMPangpjlRf+n
	3CQgL/u3COFE39RKLpctnLcMoXiz1ExkH5LKsd/upX2yqmwus5vIeTrCIR3y07MdPrR0
	4s/Zd6sLeaR9mRQQBzfHj2AhfoeIfkPWhYWf4t6L9BNEth1LylBin7UttyNzWV2F1BwE
	/1zbbYSxKOVw2NUGsbGHBeTt0mmkkU14dvbSyG9LnUB/JXudiH3RX14mnRrpwOyRArQP
	o0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5O4K2VpZse35NDywwMhdEczaiNfQTcqY798XoeSdtwY=;
	b=ZvgRZjH3UaFMJEuxJg9dRCzElwvrzO6ka+fOG/05BVJO8qffBZzDX/4GXiaNH1DAC6
	qiWqrK/2FkWwx9ckZIzAgfNLpzEhzUEiWEyC4YinVno1XUNLg6V141xlZ2IleYOHmEK1
	rPGxziWQftYHzLH9wluUin/vqXAkkju/SuRspSQHwchjwR83JU1HN/X3wzAzn8B5fy8q
	nct8rzYPQWS+v7k/VvezZ1ZPedFvvGZidK0esngDFyF6IZBZX6g6fHhli0H8qxPEAynz
	eNhVXpXmcpWgGOLcGYbBG50ubxAOspkYZ12B3phmJtrOFVUCbsc5BpHpkFibRVhma32d
	XqsA==
X-Gm-Message-State: AKwxytcr7ejYIoZ6fWkV3iv/UQ2zeI7HmqxW4oqOsWYykPNEMLmGi8aT
	Kmcr9WlA9UTt8r3QQXJLReM=
X-Google-Smtp-Source: AH8x226wUMHiurBLZGDu7XaAH3tI6KXNxlAFeUsD9XKekNlKVU2nHxWO9R0aJgZdm2FV4+ob0944Eg==
X-Received: by 2002:a17:902:d681:: with SMTP id
	v1-v6mr15665627ply.170.1517023512159; 
	Fri, 26 Jan 2018 19:25:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:35 -0800
Message-Id: <31556ce39f46bc0e8483fe077c8fda834ee6b91a.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 35/36] dialog: update SRC_URI
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:10 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Update the SRC_URI since the upstream server is changed from
ftp://invisible-island.net to ftp://ftp.invisible-island.net

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 550acd329584cb3fe9f167cd85e1efdace304e8a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
index bff3d97..85dede1 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
+SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
 SRC_URI[md5sum] = "a39ec183517bc1feaff017d067300b8c"
 SRC_URI[sha256sum] = "453095abaec288bfbc1ca9faced917e17742cff1ea45ec46210071ac153562f9"
-- 
2.7.4


