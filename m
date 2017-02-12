Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF82E71E4B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so16041984wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=blBiVXAkYaRFpeMxc4afoleIpgSKpNHvWjPhn6h8kB4=;
	b=GeAQouUlEaJ/bx1QYsdYGfvC7zE+vRxOQtpqIeIqK0HUSVmQimdEszh8ue3/5DdK46
	7KE+tMqqwD9fERqECu8tp3eNvH7ulas+Lf7VQ2bamPY27FMbrqhGZi6cioKnVBRiaGim
	qVUow1RPUOF8XxZIubbryhOYnstMS4hCDRvRpTSQPP+YYgNmDn8x0TwD7hO3znsuyUx1
	F8YlNjG74/aE8RytqyFODxiCoLqflT90OXAAHMpch8VW4ZzX1eEszJHHYiCwcVIEwFCB
	++68wLwVukYnAcPD4AKdovNUpQRlYEjCHVagX/zya73xg5nLHHn8W9zL/r93lwLRxhj/
	3hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=blBiVXAkYaRFpeMxc4afoleIpgSKpNHvWjPhn6h8kB4=;
	b=MR0mzkmx/gsVL921CaT9lnyLJuMFtiyrhi+rJugm6mn00Z8h6qSHhxL/enDqH2eiGp
	qPU1x4Rx6W3ZotNuEBz3OQO+hIx437cN+ipaoyJ61WG4ZcbaYlQfZn3U868Kx52EXH/p
	XKNRPeuMatr8zQFUnLY7nY2cVnccpAOHgTey3o0yvTf3Ely7NKmyndopMMbCNeSxh8SM
	vwkyyO5y5tvqpIyE6ePv6QQ1X8YINcdLPNuhhPqKr5MRJtxNI9wywxoMyzJiiy2UqY+A
	5rMz70hBcY1E5FbRrDZ6DR2sekV4Ux6Sg8g0wLwWEyEvkmMZQM5pJLAeDHKp3da14y40
	5o8g==
X-Gm-Message-State: AMke39mUOJVtmyKytv5V4lKIMf8j9gkW1YbDe2RmfdpLwbj9RIEolem/y83Cg2wycnMV9g==
X-Received: by 10.28.216.130 with SMTP id p124mr15301022wmg.58.1486933350539; 
	Sun, 12 Feb 2017 13:02:30 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:07 +0100
Message-Id: <20170212210216.867-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] esound: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| /usr/src/debug/esound/0.2.36-r1/esound-0.2.36/esd.c:144: error: undefined reference to 'sin'
| /usr/src/debug/esound/0.2.36-r1/esound-0.2.36/esd.c:137: error: undefined reference to 'sin'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
index dc6c366..49a49a5 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
@@ -24,6 +24,9 @@ EXTRA_OECONF = " \
     --disable-arts \
     --disable-artstest \
 "
+
+CFLAGS += "-lm"
+
 do_configure_prepend() {
     sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' ${S}/configure.ac
 }
-- 
2.9.3


