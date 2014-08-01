Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D0A10706D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:18 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so1388883wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K9qeFdHlndYLkRahIARnaT7iJbNmKrkED/UgAgr3uJU=;
	b=QwfxP6yJzTqdeOBWgR2oCntvgWAg6OLSCGsO0al7tY9X9aUakCqfIl4JKKqdYb06uQ
	1gFx008bXVz1MYEKG3ek9Fz9ccQlUsHhOkuXdVh09Qa9StiF9MN0kxsDnZ6wI0/+regc
	R6euUFgKSFyZXRzpwrDV5KLnCh11aLvcRAREeB5ZfEQNrwFAfCc/h6Q9kB5Dc/+3dyHK
	6cO4OiTOvqoAsS/xhjUehm4S+D9bD6nDniG8+sWv3HBEkP8hBT0AzBV6A5DzgIIA5+IQ
	D2WIZwnwRSZrEszhnPthAXTo5QVo0Fncdz0mlPWKd2xTj0rubrjHgiDsJO333/pRGT7E
	zktg==
X-Gm-Message-State: ALoCoQnxA5IeAM+bWC+qPlNjJomnxk1J1TUV1bwuPueYej/Ze/UXw1e3hC0s2QMj6sjXwONPTXqI
X-Received: by 10.180.19.227 with SMTP id i3mr6889228wie.45.1406900118428;
	Fri, 01 Aug 2014 06:35:18 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id ge8sm8838392wib.4.2014.08.01.06.35.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:53 +0200
Message-Id: <1406900096-31368-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 07/10] abiword: remove blacklist, libgsf and sv have been fixed
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:19 -0000

Also disable collab service due to gnutls build errors.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
index 7cd6c65..eb4bba2 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
@@ -14,8 +14,6 @@ SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
            file://autogen-common.sh \
 "
 
-PNBLACKLIST[abiword] = "BROKEN: depends on broken wv -> libgsf"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
 
 SRC_URI[md5sum] = "8d9c41cff3a8fbef8d0c835c65600e65"
@@ -26,7 +24,7 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 inherit autotools-brokensep pkgconfig
 
-PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp collab-backend-service"
+PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp"
 PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
 PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth"
 PACKAGECONFIG[collab-backend-tcp] = "--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf libxml2"
-- 
1.9.0


