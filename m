Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2VJX-0002D5-Vy
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 22:37:44 +0200
Received: by iwn2 with SMTP id 2so6054317iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KsMcBup+LjuYdGZiQMz5fEqVl2V5elP4HpVZUUzEJI0=;
	b=f4ivqen77nkYEgpjQO9nTndmTvJNinusPCht3XxYEKACKCevO3LEhMRtRLKriu8G0U
	aBL2AhZMrrqZlJ/4tErFrY0NSURbD9Pl2ZXdvvWkhoT5vQF6pbVI3RBHsN2qhsDPHeIu
	tgOOcUzuLq5Zpd4KS4R/i0J/Hnj9mERwzocb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PmY5KSsrYVWshszAhfmYOf0aNmZHdtwX3mtKOPr7jI3mUHDo/+HkPxT6wYa9v3e0No
	i6kHkafTU1F96yqElQPtXa0l6QX7wJSMRbbw6o4qi3i6dCjWxMbAKIxseBoHJzRJVcn9
	29uK746CHQ86MSKxlAbU0EOdD5NJgS9uuHgTU=
MIME-Version: 1.0
Received: by 10.231.151.135 with SMTP id c7mr8987674ibw.184.1286138247305;
	Sun, 03 Oct 2010 13:37:27 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 3 Oct 2010 13:37:27 -0700 (PDT)
In-Reply-To: <1285792594-10032-14-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-14-git-send-email-obi@opendreambox.org>
Date: Sun, 3 Oct 2010 22:37:27 +0200
Message-ID: <AANLkTi=tUws1U6fpoB-FZnBWUwdYTXEQst8H6VoHUyo_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 13/18] libcddb-1.3.2: initial recipe
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
X-List-Received-Date: Sun, 03 Oct 2010 20:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Andreas Oberritter <obi@opendreambox.org>:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/libcddb/libcddb_1.3.2.bb | =A0 14 ++++++++++++++
> =A01 files changed, 14 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/libcddb/libcddb_1.3.2.bb
>
> diff --git a/recipes/libcddb/libcddb_1.3.2.bb b/recipes/libcddb/libcddb_1=
.3.2.bb
> new file mode 100644
> index 0000000..8539569
> --- /dev/null
> +++ b/recipes/libcddb/libcddb_1.3.2.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "A library for accessing a CDDB server"
> +HOMEPAGE =3D "http://libcddb.sourceforge.net"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPLv2"
> +MAINTAINER =3D "Andreas Frisch <andreas.frisch@multimedia-labs.de>"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/${PN}/${P}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "8bb4a6f542197e8e9648ae597cd6bc8a"
> +SRC_URI[sha256sum] =3D "35ce0ee1741ea38def304ddfe84a958901413aa829698357=
f0bee5bb8f0a223b"
> +
> +inherit autotools pkgconfig
> +
> --

build and tested this (and the libcdio patch), then pushed it.
saw a patch from koen, but actually that one is not really good either.
both libcdio and libcddb do not depend on each other, the issue is
that they come with example progs that depend on both.
I suggest splitting the recipe in a real lib recipe (which does not
depend on the other) and a recipe for the examples (which then could
depend on both libcdio and libcddb).

Frans


