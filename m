Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsirC-00014l-2V
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 23:04:03 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id BF8354B0095
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 23:03:20 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 23:02:12 +0200
Message-Id: <1283806932-26926-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
References: <AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] asterisk: replace termcap by tinfo
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
X-List-Received-Date: Mon, 06 Sep 2010 21:04:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

* this fix the following configure problem :
checking for tgetent in -ltermcap... no
configure: ***
configure: *** The Termcap installation on this system appears to be brok=
en.
configure: *** Either correct the installation, or run configure
configure: *** without explicitly specifying --with-termcap
* PR bumped

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/asterisk/asterisk_1.4.23.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/asterisk/asterisk_1.4.23.1.bb b/recipes/asterisk/ast=
erisk_1.4.23.1.bb
index af6967a..5869187 100644
--- a/recipes/asterisk/asterisk_1.4.23.1.bb
+++ b/recipes/asterisk/asterisk_1.4.23.1.bb
@@ -5,8 +5,9 @@ HOMEPAGE =3D "http://www.asterisk.org"
 LICENSE =3D "GPLv2"
 PRIORITY =3D "optional"
 SECTION =3D "console/telephony"
-DEPENDS =3D "speex readline zlib openssl curl popt gnutls sqlite libogg =
libvorbis"
+DEPENDS =3D "speex readline zlib openssl curl popt gnutls sqlite libogg =
libvorbis ncurses"
 #RRECOMMENDS_${PN} =3D "logrotate"
+PR =3D "r1"
=20
 SRC_URI=3D"http://downloads.digium.com/pub/asterisk/releases/asterisk-${=
PV}.tar.gz \
 #	file://sounds.xml.patch \
@@ -28,7 +29,7 @@ inherit autotools update-rc.d
 EXTRA_OECONF =3D  "--with-ssl=3D${STAGING_EXECPREFIXDIR} \
 			--with-z=3D${STAGING_EXECPREFIXDIR} \
 			--with-curl=3D${STAGING_EXECPREFIXDIR} \
-			--with-termcap=3D${STAGING_EXECPREFIXDIR} \
+			--with-tinfo=3D${STAGING_EXECPREFIXDIR} \
 			--with-ogg=3D${STAGING_EXECPREFIXDIR} \
 			--with-vorbis=3D${STAGING_EXECPREFIXDIR} \
 			--with-sqlite=3D${STAGING_EXECPREFIXDIR} \
--=20
1.6.3.3



