Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 282AC6D1BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 15:38:06 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so5964183wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 08:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+WJz60InAnWzRVF9QISrXF1gYaeYPG/0i8aeqrLwIY=;
	b=Va3OeqAvOWiuBuEGZlK0HvftCzOJSHfZ0N40y1iRo4IUWsgsUcBNanZaEbuCFLeNen
	iQxGab+tBUCkZzmkMq/OBpdeDGl+ff/XBPFJwrmlYIf9gegkjm5Nq+FXi/oQjRm1QRmW
	xpxRCDE8ZZH53fQf3qtV63soKq24OL/VIMDzw1iyAcjjELvAy5dl7tYxlflo519IwCzV
	46OyXul3Zhfu8WsePsjso8d+x2lmPZfNgnMfi/NksVOdsFMoTWGMwyS0Mr33pfqgV7ke
	KaeLnWnmcQkiGSJnxUuU+DlBoAiG4A9z7ZavTVL2Q8HrIMzy29TgyJU3oh2i1gVy6t5N
	p+FQ==
X-Gm-Message-State: ALoCoQkH56BF1tGzIfeZ0IQLv+fnC3qhX+42Wzs3QsVlIcKujD+/gN3vcBfx+dsv+rLW7pS6Phsw
X-Received: by 10.180.10.136 with SMTP id i8mr15210057wib.46.1382456287615;
	Tue, 22 Oct 2013 08:38:07 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id e1sm7514891wij.6.2013.10.22.08.38.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2013 08:38:06 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Oct 2013 17:38:01 +0200
Message-Id: <1382456281-16216-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.4.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] qtwebkit-examples: add missing RDEPENDS for qmlplugins
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2013 15:38:07 -0000

Some examples require qtwebkit-qmlplugins (flickerview, youtubeview),
and this dependency is not automatically added. Without this patch,
and without manually adding qtwekbit-qmlplugins, we get errors like
this:

qrc:///flickrview.qml:42:1: module "QtWebKit" is not installed

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 recipes-qt/qt5/qtwebkit-examples.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index 38b2a7c..50c28cd 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -9,3 +9,4 @@ SRC_URI += " \
 "
 
 DEPENDS += "qtwebkit"
+RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
-- 
1.8.4.1


