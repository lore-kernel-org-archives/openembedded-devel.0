Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwE-00068J-TD
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:33 +0100
Received: by fxm25 with SMTP id 25so402386fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=K26yXR8rWnUZXA7SpXgyB+vBDCYMiOVsCQFFchpZny0=;
	b=kBGJsNRA4r8uGr7hNud9Glc87NCBTwmxd5mq7K4I9Ee4eNmz0QKicd8YXQ9QNgKvW+
	rdI/xPPcz/+VhJTd1xr3bP4vDbbbSFgddmfp8MrDUgA9gyAeXT9zI18IRFgTJt2BwAOK
	DlXgllEPZ1rlsdTIKGrtLizNNuKXmbD01JXLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=D0i+U+TLAFOMyf50Vr1KCOIohX6RWimcVutLyLsU8S0koNvUqzoKMbCn9aYXqUXugg
	//SwVRh3n3s6wCIxpA2P1EpO9NGnqePNM7ItvpY3ibvHnu3o5HGXSN0+3lbcFrLkhPws
	nwiUv1m6smjZUOE0R68gTA+4GxwrHBKBWxKDU=
Received: by 10.223.77.91 with SMTP id f27mr908917fak.60.1265832654440;
	Wed, 10 Feb 2010 12:10:54 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id e17sm2620085fke.53.2010.02.10.12.10.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:52 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CO-4R; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:54 +0100
Message-Id: <1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/8] autoconf: set SRC_URI name
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:34 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/autoconf/autoconf.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 2fa1275..a561bf1 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -7,7 +7,7 @@ DEPENDS += "m4-native"
 RDEPENDS_${PN} = "m4 perl gnu-config"
 INC_PR = "r8"
 
-SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2;name=autoconf \
 	   file://program_prefix.patch;patch=1"
 
 inherit autotools
-- 
1.6.5



