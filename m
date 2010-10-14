Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6QnK-0001L2-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:36:57 +0200
Received: by mail-ew0-f47.google.com with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=J1zjek6KQINjN90lEGbS5sZ5hL3DN7nwvnl/liSAuGQ=;
	b=Ps/sAK7Fqp6vLcGzZe+oWjkksIJQv/b4STbIACb+U32t5UDiKWGXjrd8YusbMvG5Qa
	uD6P3HowzdII0PwGuAgWhumvdpaLYGy6/UI1IfgRiyHhnI4VRVOh3AySy+blt02goo70
	cWRsakY+sD5PGo8W6ISqtxM4P2Jfgup9f0Jw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mwlQesYiswTSnOoTnr/Vn4Vzd4PvT4DfJ8jgg97AbvLvIjyWZG5yMDZyxe6AjO1Yth
	YrOKBErP0LQCwBG2bfiIfMkEgZh1uYb0cpBGlra3G6f45ngL7Ewdj++Bc8PPTTassohy
	h5aHCR3vpmoclq7OnWH8kH3ob5BdRpnfIxIUg=
Received: by 10.213.14.19 with SMTP id e19mr2119430eba.14.1287074175217;
	Thu, 14 Oct 2010 09:36:15 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.36.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:36:12 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:42 +0200
Message-Id: <1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/7] RDEPENDS_append = ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:37:06 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/avahi/avahi.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index 4ffb6d5..385450d 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -17,7 +17,6 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
 inherit autotools pkgconfig update-rc.d python-dir
 # handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
 # anything but avahi-daemon and avahi-autoipd
-RDEPENDS_append = ""
 
 # TODO: build and enable all the extra stuff avahi offers
 EXTRA_OECONF = "--with-distro=debian  --disable-stack-protector --disable-nls --disable-gdbm ${AVAHI_GTK} --disable-mono --disable-monodoc --disable-qt3 --disable-qt4 ${AVAHI_PYTHON}"
-- 
1.6.4.2



