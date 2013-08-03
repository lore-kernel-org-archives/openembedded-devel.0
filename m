Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 307DF6A59D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:00:47 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so712816eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SpWoJJIApGWKCMmWA1/hIJSW14FPwYC+oBVslf6pFeI=;
	b=imrScp/EVPeIo5yyi3o/uVSFlzSltbSZ0vbjsoje8/7jsDee9Le35a5Q6jDM3sX/Jo
	oRUEt9ZMeTga+pXTxOoG/TVeDLirnElwiEDYCJc0QOnAJbu+tx7vfeqJt8xtSARck0qP
	ZAPdEFvnVzz3353phs1ZVHgYLD/oREiJEXAPz0fpU+YNWWb6MPO0oIDH6Q8TwsQfq472
	qJ031dbSJrjmGpXdLgdfgr0CbbXBooPVNQTiEAGHgRXnlpnQ36qT/K8/HvsfkcjQR76w
	TTutua0R0/KkOTZW/xloX7nrOMh6zfJA0akEaJsDvF52eGLzA37+0XlLBl5vsZPk5zo+
	7MUQ==
X-Received: by 10.14.184.4 with SMTP id r4mr8782919eem.100.1375520447084;
	Sat, 03 Aug 2013 02:00:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm17960935eeo.14.2013.08.03.02.00.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 02:00:46 -0700 (PDT)
Date: Sat, 3 Aug 2013 11:01:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130803090125.GW3280@jama>
References: <1375519570-11528-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1375519570-11528-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH] qtbase: add upstream QTBUG-32534 patch for QHttpMultiPart corruption
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
X-List-Received-Date: Sat, 03 Aug 2013 09:00:47 -0000
X-Groupsio-MsgNum: 45558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sh7h4lnU5nPTsIof"
Content-Disposition: inline

--Sh7h4lnU5nPTsIof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2013 at 06:46:10PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++=
++++++
>  ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++=
++++++
>  ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase.inc                          |  1 +
>  4 files changed, 124 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0025-QHttpMultiPart-fix-d=
ata-corruption-in-readData-metho.patch
>  create mode 100644 recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-d=
ata-corruption-in-readData-metho.patch
>  create mode 100644 recipes-qt/qt5/qtbase-git/0025-QHttpMultiPart-fix-dat=
a-corruption-in-readData-metho.patch

Looks good, will apply it soon.

General question for all meta-qt5 users:
what do you think about dropping 5.0.2?
It will stay available in dylan branch.

If people are still using that, I'll keep it until 5.1.1 is released,
otherwise I would remove it soon to make patches like this one a bit
easier.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sh7h4lnU5nPTsIof
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH8xuUACgkQN1Ujt2V2gBwSsACfavUZUz3qDTcn2qLzvTrhF3q9
3KMAnjdQUMwzwu9F+SOt2YXs7EGhadJi
=J24C
-----END PGP SIGNATURE-----

--Sh7h4lnU5nPTsIof--
