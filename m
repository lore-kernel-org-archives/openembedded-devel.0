Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMo6n-00080E-5f
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:12:15 +0200
Received: by fxm9 with SMTP id 9so275742fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=XnvxVg65vqHNXRKAnpfOZNRfXq7r+aBhn+Nre2gcAqM=;
	b=ou4TQhu+A3pI3ITOlsLisGse/AZZ4tq1MSagME+MrBaeCa+KibDi2LuTCsY+yyfxOb
	VoD0CgPDTwpOe1HOM1Fqf6P01q4jqqfpZuCdYZPoj4S/ZZzNBIz6I/NngSgdF42+l+KB
	iCSsjyr9XTVi/A2zg3sgl3LldP9VqCStE8p/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tNv7lP5mrjt2RzxaA79zrt00XXLiCZ1BzAX5BtWEE6kkjlTbL5k70UCqWZwfSgjvE1
	mo7yf7xABihsJNMKqm0e1DQ8Z4tYkpVwPyCczxI00kWo8aDFtR9ewvCD8CQqhrsW216M
	MZSnkbo3J8ipW8jey7br02cGEshtOBZ2TEY7s=
Received: by 10.223.20.73 with SMTP id e9mr822464fab.103.1276200470111;
	Thu, 10 Jun 2010 13:07:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1462586fad.22.2010.06.10.13.07.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 13:07:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jun 2010 22:07:37 +0200
Message-Id: <1276200457-11650-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] navit: enable qml build
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
X-List-Received-Date: Thu, 10 Jun 2010 20:12:19 -0000

* but for now without DEPENDS on qt4-x11-free, because 4.7.0 is not yet
  released and building qt4-x11-free just because of navit (for someone
  not using it for something else) takes a lot of time
* should I add qt as DISTRO_FEATURE like "tk" is used in python DEPENDS?
* I'll add PR bump before pushing, if it's OK to enable it without
  forced qt4 depends (navit build before qt-4.7 wont have qml and
  rebuilded navit after building qt-4.7 will get qml support)
* At least it doesn't fail without qt, even when it's enabled in
 configure param

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/navit/navit_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/navit/navit_svn.bb b/recipes/navit/navit_svn.bb
index 2b75c4e..61d5e24 100644
--- a/recipes/navit/navit_svn.bb
+++ b/recipes/navit/navit_svn.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} = " navit-icons ${PN}-config "
 DEPENDS_append_shr = " gypsy"
 RDEPENDS_append_shr = " fsoraw"
 
-EXTRA_OECONF += " --enable-svg2png-scaling-flag=32 --disable-speech-speech-dispatcher --enable-cache-size=20971520"
+EXTRA_OECONF += " --enable-svg2png-scaling-flag=32 --disable-speech-speech-dispatcher --enable-cache-size=20971520 --enable-gui-qml"
 
 SRC_URI = "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=https"
 
-- 
1.7.1



