Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF2077199
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:21:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10344485wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bqSaJAT+ePVFtGEi3QSoHgvsfgkEj2KqgYpIUQMF4+M=;
	b=nuY+Alx869PKqNrORcNDaxLq6roJZzYZsoboYqmQbC2aEP3huPeLHpmknf+4Kwd3nu
	wBL1qIj/s0qq3DSAqhaXM/cZsbWyXEeq/ukpM7tDqHwNO6RMGjIaqvO8RQIKd3BuqO/O
	o6cgSd3dYb5y0s03bmaFB9YkDQuwHd+qmlsh/yZBAD7p/F4WieTOm2t9Gx//87mARonO
	SuIYYngtTv0DzBHcQJy2ZttMLlqj6EJzGqT4W0f09ftLNDA6mgAYyPV6y0pNvIjbbBKr
	MHbyaHPB5agI3R5I7FZFCUq2Q+QgFfuguEtCMl1aiBuJ2MsDN8M9MK1pFBMYZIC83GaQ
	nDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bqSaJAT+ePVFtGEi3QSoHgvsfgkEj2KqgYpIUQMF4+M=;
	b=IKqdpX9EXjMBFLGnLzuHZF7wzJfcCHYStWdM5atFf+mZpKWnX5BLmVnxmd9Cnvbq5K
	8HkADNB4JoHA/+rqCAxXjM5dWse7FbnDqV/FMpJC4V3I4IyJeeVP94soJF/MqRtIFTcD
	Bs6VNIpODyYcBrcYHZg1vFnbYiTjVi+xI1nYxdHTxdHwtzDk320/oNaYXCwxefgDxVd3
	IIL7clQpdUAuQCOKR4d1YFp4MZKG6oXAhhmgP4Q8dXLFz04IbhfLFYx5jjno01rl49+x
	pDyT3Xl19uWBJlMYG4g9y2hJexsgexemnNVQK0aAwGMyFEG/uS3UyNCsbAHQwAjj89xA
	umKA==
X-Gm-Message-State: AEkoouvN52fN4zXXbuBIA4rU6ySQf1Saynof6rBZWgy5HsXHj/KLTGi+YRiDpH4xRkg8BQ==
X-Received: by 10.28.27.143 with SMTP id b137mr15204076wmb.12.1471256462946;
	Mon, 15 Aug 2016 03:21:02 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	z18sm15789204wmz.6.2016.08.15.03.21.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:21:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:46 +0200
Message-Id: <20160815102049.3291-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/11] networkmanager-openvpn: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:21:03 -0000

* fixes:
  | ../NetworkManager-openvpn-1.0.8/configure: line 12468: syntax error near unexpected token `0.35'
  | ../NetworkManager-openvpn-1.0.8/configure: line 12468: `IT_PROG_INTLTOOL(0.35)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
index 258ee68..fe1d601 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
 
-DEPENDS = "dbus dbus-glib networkmanager openvpn"
+DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native"
 
 inherit gnomebase useradd gettext systemd
 
-- 
2.9.2


