Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 89FC16098F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2013 08:09:43 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id o14so297230eaj.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2013 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5sbmHU+qnw5neFloDU+xqBdtAI9YgUAXuI6kUmDWzrY=;
	b=bkum8GwB5H/yzxi3zsZ9wOpNaAayUOOfS0mQcs16VK8b4OOfeON7KKHxG3e2fU56Uu
	WxPQWxO3ioAHdR/U3c7qfMIW/znXX6WL2rvEgl/M8OVSd+qnrfgaRfm/KF3BNMkGkQFo
	4tse4Yju12IDOasDJpPsnzbi+3BPpLp6ma1UOcXIxRIB+VqxbqERhnke3jkhIuoQKn6p
	KIF+fS/TIw+8AmQwRuO71voZOt6uwV7eBqq43tiyGLH8GN4s7IYeu3GI1hyBsxGHDk24
	bvYXjETgitzFnoUVlutalYklk469Agzqddr0SRCgv7dOtrgvorT0hi3EK/qd44/ui9EQ
	ZTLQ==
X-Received: by 10.14.214.198 with SMTP id c46mr19303442eep.82.1370160583156;
	Sun, 02 Jun 2013 01:09:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y2sm77301723eeu.2.2013.06.02.01.09.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 01:09:42 -0700 (PDT)
Date: Sun, 2 Jun 2013 10:09:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130602080956.GA3279@jama>
References: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH] webkit-efl: Fix build with gcc-4.8
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
X-List-Received-Date: Sun, 02 Jun 2013 08:09:43 -0000
X-Groupsio-MsgNum: 44944
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2013 at 08:03:22PM +0200, Martin Jansa wrote:
> ---
>  ...include-Element.h-for-hasTagName-function.patch | 43 ++++++++++++++++=
++++++
>  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  3 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-inclu=
de-Element.h-for-hasTagName-function.patch

Ignore this one, it works on armv7a, but fails the same on armv4t and
x86_64 + there is ICE when building for armv5te.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGq/dQACgkQN1Ujt2V2gBwlYACfTvrEouQwfjk+GE4cdqwQFqfw
b2gAn1MGgriBx1wuqPsGhch+EWjVY+Jq
=4I+O
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
