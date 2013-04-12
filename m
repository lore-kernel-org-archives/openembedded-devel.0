Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQb7l-0002UT-Fh
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:23:31 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so1183488ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=NQ5ByLHIaz+/9N4EPWwNwqfqHJKCxjhM1zZyosxbZTk=;
	b=U69VJoYqTBR6mMf7wRMhfSvkW3uZfvFtPrLuSYOfDIsHxF6gpasjDpUCWtqOVUWanA
	EwDl9lnevq5g6bE2O6nPm1rHof7T09RUg0clN34PNoFY1lt7uC4vt37EmdZXGPbQwfdg
	L4iDAWh+LOJpeLYX/cVy/r77kbyTaUuy7CEJdaUWWMKpWs0gZrJwYze6xm4xVNY/QTDe
	bveDfisV1UCiMZbGjjr2+vNCbg5u/DzHZkoPRQj5eg3AFu5SLk6vDZeF4jKswQiNmGZ+
	2eYnI0y579nGlelgdhTOqhgZSURccQ7gGlN2oA/avn1xwjbhlSVVttP68KsWVoBOPU7J
	k7HQ==
X-Received: by 10.15.27.195 with SMTP id p43mr26647659eeu.8.1365761105286;
	Fri, 12 Apr 2013 03:05:05 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm10203666eeb.15.2013.04.12.03.05.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:05:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 12:04:47 +0200
Message-Id: <1365761087-1229-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn3DOUzWsaxnVKV3YPWSL2ebgdhKFrV4BffmTgqVDIGlU2ho0EcPqUgFCCl1d7FFuxmeUNM
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv3 5/5] nodejs 8.8.18: unset RDEPENDS for native builds
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
X-List-Received-Date: Fri, 12 Apr 2013 10:23:33 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 3ab2ed6..2db9e68 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -36,6 +36,7 @@ do_install () {
 }
 
 RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
 BBCLASSEXTEND = "native"
-- 
1.8.1.4



