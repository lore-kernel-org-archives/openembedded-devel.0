Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9q-000485-4o
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:38 +0200
Received: by mail-wg0-f46.google.com with SMTP id n12so2191099wgh.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zYxJZ1rT8kGE4ht3sHPkxN1ZCe4ToKWxinO+K0Vg+g8=;
	b=yElRgleYLtY2CTPxrsCsZ3vG57JDvI7Zpaodx+sl8TMJI/Ml8z0Z7oU7Lp/fAGG2Jw
	1X3BvHA8RZr8w0H3Ou9ge2gl+Xi7TcQWKwWHa1+z3TxakHhMcLltQEucM2rf57oTGpPc
	/ckOvBqlOw5F6Tt2FRtxhWLNUs4atBUSwt4fThB+vClwvHy9kLWb4TFY318ZtZ8DaMNn
	MUxd9fRbxSrTLxS6sFOhitpkgBrz9JSDM+upQqyjOcyO3m9D6u9fM7jCT0KV19JZEq5k
	/CwpvrdG935hA1Aft5NW12b54OjV09hdJOzo2xh+V2gxRfa8GsfVsiTqBwmMEpvc+c4W
	odZA==
X-Received: by 10.180.187.206 with SMTP id fu14mr1476533wic.11.1367660138173; 
	Sat, 04 May 2013 02:35:38 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:37 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:15 +0100
Message-Id: <1367660117-19572-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-multimedia][PATCH 3/5] vlc: moved to meta-multimedia
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

vlc depends on fluidsynth which is in meta-multimedia.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 {meta-oe => meta-multimedia}/recipes-multimedia/vlc/libdvdcss_1.2.10.bb | 0
 {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc.inc             | 0
 {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc_1.1.11.bb       | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/libdvdcss_1.2.10.bb (100%)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc.inc (100%)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/vlc/vlc_1.1.11.bb (100%)

diff --git a/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
similarity index 100%
rename from meta-oe/recipes-multimedia/vlc/vlc.inc
rename to meta-multimedia/recipes-multimedia/vlc/vlc.inc
diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
-- 
1.8.2.2



