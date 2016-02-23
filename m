Return-Path: <joe@deserted.net>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 04722772A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 00:56:33 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id l127so196548373iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=UVsXFBQj8LqA4uBkiFHKUDSVvd1pbwhdHlIUFjHNWug=;
	b=xiDZdeSChONJN07h5RRfuMbGT8VGPeRE1Mq0jvZNUbT5lf44FeaSEmHf2Aicc2bVgD
	qBRR7DecDiwrjgOKQ1AaZ8z455rJD776V6bSCN9tvLknZRSfDNCyH8CAXSiHQGM8V7kx
	t9V7qR8dWF3FozAcRU8bP9jU4eKmbYMGHzNEG3HmofPi9Waf2qzoQasi8WOs6L5bcCq+
	5jjAKAKy6uix04cfsg+FAa2ZH/eCyFu0ammc0x6v1ihEnJwlcyxK57dYa9u71vd+1PRW
	/2i4MfbjWIUMaqQ2yh3MKz/qnHVSpy38R3Kyb/s9Gq3etLZvtiqs+rNyMN7g8ICFxK2D
	Ub/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=UVsXFBQj8LqA4uBkiFHKUDSVvd1pbwhdHlIUFjHNWug=;
	b=VXZxdfpozy5Rt9IscfILfRSjuPPRVM8Lo4u7rfB0SFukN5vf1z+aVPVwGKJUfaKOxa
	hTxJiJiPti6jgG8c0CX+sUeZW3RKYQy/bprqUyNG+Q0JrgQyabMI8zwAKShBo3kJUTED
	jWo1HQGBG5o0c+ihVovhfMq8Lk1TSMDOW34swQ1JRUah7P4fhyuwLQ+ZtEjvSLN3m2EQ
	B0eNk3hgPAakMumNzenIUjyOMIo6zBWQFIcPJ1oijGeox2cpRJ/Inu88+UYEUdHRFi3Y
	FeOPagHzl4g6FArfaIpHhcBvAdEMqPDbM+8ZcO/gYz5+BoU0uVJyx96u2fRyWx8Pma++
	S4HA==
X-Gm-Message-State: AG10YOSLyHtBu+i4cO5ZIZR27u0XgbQKvPdnypkRE3frGNMgPtsbopQlzDRt4RJDOJbKsw==
X-Received: by 10.107.6.35 with SMTP id 35mr36419795iog.140.1456188994605;
	Mon, 22 Feb 2016 16:56:34 -0800 (PST)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	mu8sm10286308igb.16.2016.02.22.16.56.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 16:56:33 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:56:57 -0500
Message-Id: <1456189017-29180-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456189017-29180-1-git-send-email-joe_macdonald@mentor.com>
References: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
	<1456189017-29180-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 3/3] dnrd: blacklist
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
X-List-Received-Date: Tue, 23 Feb 2016 00:56:34 -0000

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
index d3858ad..8769e52 100644
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -16,6 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "41c9b070aae8ed403fc8c2aac7ab157c"
 SRC_URI[sha256sum] = "aa46e7f8736b88c1d752cf606b3990041221ce91d014e955c6b02eb2167db015"
 
+PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package:"
+
 SYSTEMD_SERVICE_${PN} = "dnrd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
1.9.1


