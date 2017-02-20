Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D78FC71E02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:52 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id q39so12811253wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=URusZ7K6hn8dc6fmf/Rc5NVLhmx2GuEBS00gRToJmZ8=;
	b=XGzRJmMGc5TvIJJ9c/kDptbfc4yO+LiBoWZUswKYNlaZw5bflRaW86zzvwSz7KDvpF
	Xf4DiHFNtxrFtpd3eKlBgB4kuzszSU/OVPAcoMrwI0TMvg+dkBoNVoWm0Gf1pnYzSrGb
	CKWepvxhkPd2xKWAXOqXZ1NXufmFEdwK87NSbwRrPyuF9PByzTnjnWSv/ukBLtgpN28Q
	rjes5AndhWAfghC2CuK9rZClCnYUELweFQvdAwSfvQPOKWlKGkUJc9Ed6y5QYT1y5ea+
	x0EUnNrj1+bwC3G+ArMtTu6o0w98L6pr51rUuRNoNpF7WJ+He9DwcutqvBlmqq12VSjY
	yUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=URusZ7K6hn8dc6fmf/Rc5NVLhmx2GuEBS00gRToJmZ8=;
	b=F8nEz+XsBeVWMWSf4FLD3Mi7TLVA4Sfy1C+kMKrgpDHGTlcAlQ1lAriHcMVSbGLL6f
	Kip3ePH98cDYvIGAySN0KqoJkTMK0QTctglABFujbhpY5q9MrTBnJwy1IrpbAzYuNtmQ
	rq0N14v0GxFVPeP/ckLZEYIz2t1goeQh9SQQ7r1SsGwizIuOP73T1bkSFMjf/aim8e6o
	uJMtrZvhXlRyLBiIaCg4yipyWxi1FN23ni47TPZUGkET6ArChSr0JGT2sA/Jh522gN6E
	fPxSec3+2wSmDXs4C6hqQr2SbYf8/mXFC2ZZinWdEMub42DfDfCbL1dncPuOQ4imrtsO
	++zA==
X-Gm-Message-State: AMke39kSXxCyY403Yogctl2XsUavtiNt7VlspasIN7YJj17I7N8nO/7YJzCz6en/AIB6NQ==
X-Received: by 10.223.143.36 with SMTP id p33mr3912473wrb.2.1487614072613;
	Mon, 20 Feb 2017 10:07:52 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:54 +0100
Message-Id: <20170220180700.29836-39-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 38/44] gst-plugins-good: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index cabbca5..7e4a525 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -46,5 +46,3 @@ SRC_URI[sha256sum] = "7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d1d44dc96d9
 
 FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
 FILES_${PN}-equalizer += "${datadir}/gstreamer-0.10/presets/*.prs"
-
-PNBLACKLIST[gst-plugins-good] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


