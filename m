Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84918771FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y144so16734901wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oEOoCJPjhqrIAgL1oSFyMb236M3sPj8xF5wlTlb6eh4=;
	b=jig4iLWSS2+RjRa3Rb8OGQ/218csmEn22hCUXpKxLA1v3wZOJqwHGv1+/yr/woPPBw
	21XlLWkhCFbuQFv57bnLjyqkGIhUredBz4v021gSPasTB2bRDAEEoGF8iQsDFipiyV0K
	eGV88dFdBauYjH01FDbEyIOV60KXNcWmXPNai7eGn2QfP+TdiOFx+Pv90mdrlEPmBqQl
	ldZOMOxiSsLmQDDjRL5tzoFST5VqLA1ruO633XYL1kE0OWLntMu/0inOoyO6jhGCJzlH
	xalWgnEL3RiBQchMsxzaB7GK8yb/elRQap3MqaSLho81qmGAl1QDOxzVLmPkD6QYdjZb
	cQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oEOoCJPjhqrIAgL1oSFyMb236M3sPj8xF5wlTlb6eh4=;
	b=LPUmqgSWweXCmH46cFtrjuz1nNA+hGW8NVytOtdtQ2sgbacwi2BGlpvRE1TVuJEqlh
	spuWz/kaCjSPnYKFzHr+YCqs6cW2pfcr4g8afeLYOrtnHfle9M0e+Nb1UmX4l8XQYYKT
	XGwvpErOrjbngiLmsQdVtxjGrbDjiHSKGLnk2qCyTXs6ULkz5v8Ope+g6GpqoQbr3W5E
	gHPAQ1fWj4ICvICumJyacGvGTZV6n7HkHEPJ4DZ56bJSKAhKtv2JLo/sD8eYfz9M43I1
	1UCPtU//xjWpd8qOW7fSWEhpGkWh3ww8TFMdOypRcL9aufk1a9YDXOivK86O6TCPQRlp
	t0Bg==
X-Gm-Message-State: AD7BkJJ+T1aznH4vNnxgbRvYVeBrgEkMUUc2Ea5FghkmB2Yc4TuRBaoaGs61WneyFa/gLQ==
X-Received: by 10.194.71.226 with SMTP id y2mr19854695wju.127.1460317310768;
	Sun, 10 Apr 2016 12:41:50 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:04 +0200
Message-Id: <1460317290-4787-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 05/31] qttools: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8991633..afa4f79 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "05206b44cf25ca6a895cc9a8716f2b7f2f14191f"
+SRCREV = "9904992dc4eb9a5958fcfbac238374ff38498143"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.5.5


