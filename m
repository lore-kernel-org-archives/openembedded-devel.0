Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3B7771E39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so15746282wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=seW23slcnpsHdqeB09WAM6qWlTgXaXuOsGND/jdWl4A=;
	b=jlw0nFiFH6yKEDBmLFqmxX02w6kz+s8qtSibQcOii2hZNoZs6kRg3vx9FwgJfU1ezS
	fEYeayy9BhBQX60FbkDChxg86dLLLpq5J0kmqq3ntT0ppnez3CGJ8eDmsbO2lKMu24kM
	fltB0cX+qlKuF9tkzayYfvkk3yuApGTI26ZnuxK9wHpE0pGs4vWRDadqMOm2sGLg2wPY
	YRAYfhjZsx1Ru8k/QkCH/rm0ehsVEBdZzWF4cYbojStKn7smzAyTtcqsrs/eJsaEJSd1
	CviLdVG9zEVbER7jOVd5V6sEZKxm6V31px3SMSRmhmrleishu2zbKqoCf+fs165GnwBn
	N8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=seW23slcnpsHdqeB09WAM6qWlTgXaXuOsGND/jdWl4A=;
	b=lzX+2hiUHgy2BQtdAXNu9V3nXVixcQMESzO+HOCek7Zl52Fp0BzM4klEEYvxUUHb5+
	bzUdzbIav2dYpqGgtGZdyGIZza0W/0bNvWbqDNvQnzXuXzp0es86ku0OTPs+MfGYlXO1
	rcAvhhN8xvXy77bVKc07q8T+usckJHMBmeA49Yk8UeUEFbKT9fnVVLtCVn63U8NyYkGg
	zx2bfMCIH5mf6X0ihm+xT+bjzPBxSPTChqx4f8AVMpuhInfH6jaFSvbR1StB0JvSjwOQ
	yGpExtPpT3Du6RLm4wVl94ji+J7Nb6SEePYMcFGAl7fHPbReqk4YB8gnZLpJ6g7bo31w
	3i9w==
X-Gm-Message-State: AMke39kGtRQen5gr7vpNZgtQpPrddL13y9zWFu+d5c6JrZqOkmiIdz/4PS9Mv2am07wpRg==
X-Received: by 10.28.71.220 with SMTP id m89mr18983520wmi.120.1487614077939;
	Mon, 20 Feb 2017 10:07:57 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:07:00 +0100
Message-Id: <20170220180700.29836-45-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 44/44] packagegroup-xfce-extended: unblacklist - all dependencies are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 9aaa2f3..c07188f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -66,9 +66,3 @@ RRECOMMENDS_${PN} = " \
     xfce4-taskmanager \
     gigolo \
 "
-
-PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted xfce4-mixer"
-
-PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted xfce4-verve-plugin"
-
-PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted ristretto"
-- 
2.9.3


