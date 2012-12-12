Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1TiqTK-0000kw-Bv
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 18:51:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so645799eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 09:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent:x-gm-message-state;
	bh=TDWhxbowkmDokmd01SHNejeinxrM82pBFUJc8mTDp2A=;
	b=AxaoTbSQFuHQoHtKnslw52MOyepj8hCWRHYqFRE+SkAj85nm44CKSxqMUamAh+V282
	VXsSQH428ObxhVOapyzoPiHpzeUrM1Q6+Mx+vhH5TAvYBeEU2xGHLcCx7SkqlKMAmy7X
	1AdaX0Xqf5UIc5NkPe/9UAOU1jLyXJPHgh/lyP1GErvG2f9j55TvPbMVggrdp/QMQKlR
	nR2dUbClge0nMdgCSWXe82yEklWX26NMC800KNbXxoR6Uf2zkPrg93L8DnRrgw9JPcAg
	ZnZ5p3AtC3JS63twVvooB4iRhMnQYogee/PAeEp+Ji4tmBRuWgU2nWp/WMFCalwtnIi5
	TRSQ==
Received: by 10.14.204.198 with SMTP id h46mr4519734eeo.1.1355333840568;
	Wed, 12 Dec 2012 09:37:20 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id r1sm57203573eeo.2.2012.12.12.09.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 09:37:19 -0800 (PST)
Date: Wed, 12 Dec 2012 19:37:07 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20121212173707.GA20975@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQmy+nwx5e8lfj7wOTkK3qGEoVjhS4Ags5Djo4Gk5ztCUCHuxIPQ6Icjjqz72x6EcwZj86ny
Subject: [meta-oe][bitbake-devel][PATCH] bitbake.vim: detect *.bbappend files in ftdetect automatically
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
X-List-Received-Date: Wed, 12 Dec 2012 17:51:58 -0000
X-Groupsio-MsgNum: 42106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, *.bb and *.bbclass files are automatically highlighted and
detected as a bitbake file. Since *.bbappend files are also bitbake
files, vim plugin should automatically detect and highlight it as well.
---
 contrib/vim/ftdetect/bitbake.vim |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/vim/ftdetect/bitbake.vim b/contrib/vim/ftdetect/bitbak=
e.vim
index 179e4d9..6822e24 100644
--- a/contrib/vim/ftdetect/bitbake.vim
+++ b/contrib/vim/ftdetect/bitbake.vim
@@ -11,7 +11,7 @@ if &compatible || version < 600
 endif
=20
 " .bb and .bbclass
-au BufNewFile,BufRead *.b{b,bclass}	set filetype=3Dbitbake
+au BufNewFile,BufRead *.b{b,bappend,bclass}	set filetype=3Dbitbake
=20
 " .inc
 au BufNewFile,BufRead *.inc 		set filetype=3Dbitbake
--=20
1.7.7.5

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQyMDDAAoJEOM7bMm6HhcTaUgP/0CkJK5paREBwK7lBolnYmeU
08osNyBdl5et9MM0QsIkfi4xDrmS5fuExlVRTsauU71On4koJEHiGdq+hy1q5pIl
n+UaelxK6THqA1mYhpfc+907RP+R7jhuxiBT3Uigup5XfHa+2dsOJSUb9iZb9V80
SblhLk/TBKYGhmPN7PDdQ9AF4/OWRARqON/YNtxsDaK7/eyssjWlcrwPsG9Fv1O/
hkfNMjoYPeULTsTnQjjw1p/A4Zf/RaFQ2+ZEWZWbm57VqaS0RrLpp3GQxZ3TUPIC
N5yOMPrH948mhPXcSa61NN4Bs9FPf4qDcotKb8gxR46/r7vA1HdBTAsyCoC/1wkj
c9/xHjb1RcYoxtsfKNnh+ImqipoONPfnYzx1igderd8OvmEYQsANcjFan2aRHyX+
NNtKhXxdUEjxJE0HrC/JOrJq34XxiMRtgCdqjSlSfC7yKtbq+Raso2T6X8KV+X9A
cFW4SuKr6A/TMibfEsTKKzLCixR6OpKOCWNSOnnM9cRmgjWfiT4x40V69nIDOJtz
WOsCLZjolqHenhOBOaul33eM4JSPyLaKo8OX2hC9DQVeSrbI8SgUCYrJN2KI9okh
3xmkI59RVaWagFU00Fll6XlQ2kUKRs5CXkY1JV6PBbYNeQu4a6xtJB7PWLwOHrE4
9dc/9BVgL39tIfBqTRqZ
=Ia43
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
