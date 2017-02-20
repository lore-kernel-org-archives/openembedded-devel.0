Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B87AB77247
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so15740802wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qHkT+51kS4qJgM6iK5IQGTGIaFhnzCeXQEuEwcpDWc8=;
	b=pVUF2217o3JGyV7HuU7OLT6WZ5nwa/DtRJCwCgdgdscfs46L+Wa2QLGzIUZnLGrisE
	azmmaZ2g9abBOJqCwAZt2hojlRA9pF3T/foXAWdSaIsjG0nZQBvWBfWHbKkIFLl3FU9v
	c86l+XAeovcC+0JRh4E414hf2dEB07fUGb+qkgdOgCSDz/uuGbNB48gCJZcQvbx4KTKo
	WkPIhIQMhpHjMYTItjtI25zng21SH3/uNm2jIX03rZ1cP01LEtNiZUpW6v3HeCWxL/nS
	I0VH+cx6Kif/sq1GUw3M65MLEVkU4Jdd5adsF5kLYN0AgzE7u+qoMoCO4p/Uv3n+r0mJ
	+yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qHkT+51kS4qJgM6iK5IQGTGIaFhnzCeXQEuEwcpDWc8=;
	b=LuoKYhGa7ggz68WYEebE4ZayA2OxZNhhW/xOvSUfGHBBHyI2Z+rz9VBa85cR9eL4CA
	+RGPJw0zPXhkigElq7HZ4Paw+UPw5V8rjusZaMPze3MYXvKPn+bgPb/UtrIwUpuDJ8gO
	Ghz2LyJdn7xv0ABSL87JEt98xZhEV1PoH8PDaYo4wqd88+D2angdvXp8Zf8JbujcfGhL
	y1Bkn5sisssDNgpB0B+rTn8eTqNMSqK17DF9AQ/xKLdrO4REam3rNRrSdSo4XTt3+4on
	lEinj3Kjg97advTPbcRlYKQnicOH9aENRFpqgtmWeXxuAT9xrOzMOhYXI+UZxVN5s6So
	t3ig==
X-Gm-Message-State: AMke39mW2FOJxeeHYj/zDyM6YE9Z+1a5sPJTE5EBTbsluTwP5OREJAWPMJpS/gqVfMbWqA==
X-Received: by 10.28.222.11 with SMTP id v11mr19830388wmg.1.1487614069909;
	Mon, 20 Feb 2017 10:07:49 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:51 +0100
Message-Id: <20170220180700.29836-36-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 35/44] gst-plugins-bad: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
index 8abd63a..38fccc8 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
@@ -59,5 +59,3 @@ do_configure_prepend() {
 
 SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
 SRC_URI[sha256sum] = "0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336e2ef9ada42e11491"
-
-PNBLACKLIST[gst-plugins-bad] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


