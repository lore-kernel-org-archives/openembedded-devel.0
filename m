Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC0977071
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 16:19:18 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so87317280wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 08:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QiTQSaUS1SGcbbN+PXoUAaCY7s/mgycwZSPqFnsl9eI=;
	b=Tu1v9TcL95JwPiQrld+5DgmaOYJ/2K+34NVwFGFT8u8jgL/HtBw1EWEtgHJV8oUL+L
	YQyGbJA9HAcDToh4Yp1IWMszmiJmhz4b4uhOczUfrLem7ezjSNG8UZH8HexV+6v4s/nx
	ZhrTu3XOXVxe3QPiq9O/HLYjE5R5LnWSFogI9f08Rjyar0G/sBlio/YVwcYHZGDkiL9a
	IbG2f5V9XrCBxu0LMY1KFMYncLrLpJoQ8/42Aa8psy2oQluKcrvlSXQ1q6bgy4EswGf8
	17pnrFESYi4aw5qSluHkZw+6/cazpBfI9rRCxRt/JvcHrteSnidcRmUvX8uQ5P/nKkDM
	UBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QiTQSaUS1SGcbbN+PXoUAaCY7s/mgycwZSPqFnsl9eI=;
	b=bph5Lq4MjUfd3TZkP2XgGNvwDuxu4ydZZUzyyFVJAeqgR2dLVjWzIx8Ou+UrqgKzgQ
	7VZGzcuiFKt6bpRc47iETGsN4sUAdjTkHntiH8lAqvJUmXoNxWVNrADHj84mudDz4wud
	us4P9kLjT04Z25I3XHkRqzpjhe046tPQQx9DX+mwA7Yh5ql4SUIgKFNLbcw8Jgh5RFdZ
	Ida41BFY2PW3t+6csnzlly33/OPcCZsX3poQynuFFI6k8z8XCkykfSEym9G4uoFsfZkI
	eGt1K7XirEP6RkW+tWxLAC8Wh5GRwIsT/TdLKROTgCsdGadbqAxnD3X7Ig/qHLeUsh0u
	nTSg==
X-Gm-Message-State: AD7BkJKoLtxR9MTxHqjFB7SbATalZEZPxP2dbpJdkT5K1TWEiIbZTSA1p2PDJss6ePGZbw==
X-Received: by 10.194.76.72 with SMTP id i8mr26610161wjw.117.1456935559388;
	Wed, 02 Mar 2016 08:19:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c136sm4848202wmd.3.2016.03.02.08.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 08:19:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:21:10 +0100
Message-Id: <1456935672-15538-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/5] mplayer2: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Wed, 02 Mar 2016 16:19:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 9df4e74..191d4b9 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -154,3 +154,6 @@ do_install() {
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
     [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
 }
+
+# http://errors.yoctoproject.org/Errors/Details/40734/
+PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.7.2


