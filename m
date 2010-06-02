Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuix-00030e-Sj
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:41 +0200
Received: by pvc30 with SMTP id 30so2440042pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=EoZSPPiDcX1yoaFKga8AqwqY6zyuCEwJz27fobhux4I=;
	b=KKi5Sf+HY/zD0jss0TIm0EATXhw3Qopefktv1KzJqlpfyYfAFQdd8lcM+dt4/3W65H
	O6uT077dBu5CHfZr7Pq3+P/QRCtun0y9/98x/Yui62wX/ho73noI8XOiV5Eer1IHyTTn
	oZ/xmeqMz4fDtdTKWpKjtlwjUTLSDtr3VGzEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OE4Aujqsc2AUdzlb9VR9lVrSFPGeTecilMS/YjLdk5Opwgr6EiMoQLrifrp8s2Nnxd
	EIJ56LW2ea8QwdKMfnHemmXNXU0vpANxS9oHzvgd4a0199KcKCmR0n3MaJwn8nPFtn/L
	FvWNkSmoamOWsuZpIB5bYXFMYh3wjl//Opxxo=
Received: by 10.143.25.38 with SMTP id c38mr5492721wfj.251.1275510923833;
	Wed, 02 Jun 2010 13:35:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:41 -0700
Message-Id: <1275510896-30845-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/16] classes/autotools.bbclass: Dont bail out if gettext/config.rpath does not exist.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:41 -0000

* Add a note if this file does not exist. The reason is that gettext can
  needs libiconv and libiconv needs gettext so we need to solve this
  catch 22

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index df2c114..8a5b982 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -125,7 +125,11 @@ autotools_do_configure() {
 			    echo "no" | glib-gettextize --force --copy
 			  fi
 			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+			  if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
+			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+			  else
+			    oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
+			  fi
 			fi
 
 			fi
-- 
1.7.0.4



