Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcz9L-0007rU-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 12:45:59 +0100
Received: by fxm17 with SMTP id 17so434652fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 03:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MU7itNheM9z4RBiIoH5ab78xqTNH2CS7bRzr7eqizE8=;
	b=Vsq5useXExZdjOJIEoSOb3SjTTIYE1k6ijg0XWJrum6CNZj1Xn1zEkxQ8LIi50ReVK
	l40vGT8oi3nxjTrvQaeUvvY2ZV2jOluA5OvefO6vtVIcpaf2O57HsS6mrfupVhuJyRrG
	6sB6xlJkbQuOKAq0yYg9icf1Q1FqKyO7RnKuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FQa2zNmlDVI5cMZDzE3gIm8TdqSwVTlC7juLhRQQXeBZQ0kP/Xg29xEJ7tykyydnT9
	BTLJjmCMiHe4PufUjUdSGuFcWyBUXa5XJdYZCq/RJtpqp1X3apR0r84wwoQK866Ay4y1
	g9zy13cheBPCGchDHzMrd0xxMLSBDVMAX+5Ow=
Received: by 10.223.79.68 with SMTP id o4mr955132fak.0.1294832728237;
	Wed, 12 Jan 2011 03:45:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm160948fak.20.2011.01.12.03.45.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 03:45:27 -0800 (PST)
Date: Wed, 12 Jan 2011 12:45:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110112114540.GJ3244@jama>
References: <1294775921-25696-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1294775921-25696-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.5: Get few more fixes from linaro and upstream gcc-4_5-branch
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
X-List-Received-Date: Wed, 12 Jan 2011 11:46:00 -0000
X-Groupsio-MsgNum: 27959
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWEb1MG/o7IKOlQF"
Content-Disposition: inline

--bWEb1MG/o7IKOlQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 11, 2011 at 11:58:41AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gcc/gcc-4.5.inc                            |   16 +-
>  .../gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch   |   52 -
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch |   36 -
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch |  147 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch |   34 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch |  104 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch |   45 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch |  201 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch |   72 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch |   46 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch |   65 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch | 3163 +++++++++++++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch | 4236 ++++++++++++++++++++
>  13 files changed, 8125 insertions(+), 92 deletions(-)
>  delete mode 100644 recipes/gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch
>  delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch

Didn't run full rebuild from scratch, but today's upgrades built fine
with this and no now issue was found.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--bWEb1MG/o7IKOlQF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0tlGQACgkQN1Ujt2V2gBxwywCfZlFaQe3SyBDIDMOv3gGfURWM
XMQAn2o7aGlAf0srXjS1fGi24ORsGvjJ
=Bv/f
-----END PGP SIGNATURE-----

--bWEb1MG/o7IKOlQF--
