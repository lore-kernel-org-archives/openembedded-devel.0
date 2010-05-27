Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHkVa-0006o0-Ac
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 23:20:57 +0200
Received: by vws20 with SMTP id 20so453522vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=ug1EXvbvZ0arU76RxrL8bUQl1E0IgskR4xPskCKqYA0=;
	b=NnY+pwyYnz0eYrJIXQDo0O+tj9J3DZvPKmd5mEawKmOu9j9ZSzHL7GDxei5ZHS5FvY
	X00Ks6EkcO/e2vsJIHYblvHW2yt/MNJDu/eLzRXyzRiJlCoL6kuTJgZp8StBQjnGqtGP
	/7ZRaJcC9ZyDmrlimRfPnbefNVvM9XrLSl9wg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=q0tNmTjWa/euJr0A+pNABnhP7YVrisBJQbYRzHEx661C0/2s6iNM6bkKVP2hH6EmWJ
	l1Bv563SN88cRrSIOmNXLaNr1aBb4OqNRGaPVl0Gn+Bl2F358b1FGThkjsBswfVt7dVL
	Oh8m0e+fF/bo84g/luQWFU5zcYsd0tZdR8CEo=
Received: by 10.220.107.28 with SMTP id z28mr7929864vco.240.1274995004533;
	Thu, 27 May 2010 14:16:44 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id z22sm6593023vco.10.2010.05.27.14.16.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 14:16:44 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:16:27 -0700
Message-Id: <1274994988-5750-3-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
References: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] bitbake.conf: make the EXTENDPE bits slightly less disturbing
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
X-List-Received-Date: Thu, 27 May 2010 21:20:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 5dc6772..1980f43 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -178,8 +178,9 @@ PN = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[0] or 'de
 PV = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0'}"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
-EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
+PE ?= "0"
+EXTENDPE = "${@int('${PE}') and '${PE}_' or ''}"
+EXTENDPEVER = "${@int('${PE}') and '${PE}:' or ''}"
 EXTENDPV = "${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}"
 P = "${PN}-${PV}"
 
-- 
1.7.0.4



