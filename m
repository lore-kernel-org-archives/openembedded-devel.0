Return-Path: <joe@deserted.net>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1027D7729D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 00:56:31 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id y8so92986862igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=GwSGXs+NlmNQ3yQPFOQgE7qKjXAUtdxWGMVJRK0+kdM=;
	b=vdU6XS12RiX4YUElHsva08fUgyR9dT1yaBZA2U3Bb/QJe1f7UMvUqQqFOCaAiEOUHc
	LL+6VC0JboJneNq9dQ0gryEvyrbbEZz8b0O+mFIGcIcfoGVO05Z9BMb43YGTVGsVMco8
	rnHijXuTlmtTTfymXFEJZ3RNnsdewV8MaRWAXEEVGxP5Sh0Mtyy0TKuvQTeqpukZF4G1
	YT9coCPtLS/9yE4c5R/BJJmpbc14MFu6KwaKezLp7hsX5NE1E/m1toppr0j0N7MKqd1P
	1po5nYEYUPVdhVgyuA3AXR7w1UEUM/o6YNS7yXH/qhnozeMj9OyXWcdjOJ6Cx3VDxQTD
	G8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=GwSGXs+NlmNQ3yQPFOQgE7qKjXAUtdxWGMVJRK0+kdM=;
	b=VsnyU54PTzppm24INfWde1jGF8CXtAUomBty4nWFU/mfgXl7hs2gsCJlzlf/nLdiyQ
	asgskWY38+9+ayZDsZ09iBPHHXOosddYmFY16Pp0YjXluMprBGe4rZDHXLdsTdw6ar88
	BeQn1/0rDZWWQf8ye7On537KBVLf/cYQ1R4nDG0/d/Ca4FoQ+drQ+V2YwdCeyHjfzW1g
	kHz/aLBrjCW68RCqLtNOuok8UbJmaNX0y7JyPR0H9zZoh4XWuCyOqXIqsODNayDAyq9g
	Bb+RO/xCyCZW9J+WmO3SioL4/9TBg0JClqYHzna3XNrEYk+6/z1n3ulKyidl8wlqE26Z
	LX8A==
X-Gm-Message-State: AG10YORCup+fFYx0tYwH78k2xbn+gfZioR5ZzpYGYxDuqnx93PgkXIPRPZ2340P1YNhoaQ==
X-Received: by 10.50.98.74 with SMTP id eg10mr7549464igb.17.1456188992571;
	Mon, 22 Feb 2016 16:56:32 -0800 (PST)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	mu8sm10286308igb.16.2016.02.22.16.56.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 16:56:31 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:56:55 -0500
Message-Id: <1456189017-29180-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
References: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 1/3] samba: Fix build when static libs disabled
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
X-List-Received-Date: Tue, 23 Feb 2016 00:56:32 -0000

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 67eaf4c..62cd661 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -108,6 +108,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-profiling-data \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                 "
+DISABLE_STATIC = ""
 
 LDFLAGS += "-Wl,-z,relro,-z,now"
 
-- 
1.9.1


