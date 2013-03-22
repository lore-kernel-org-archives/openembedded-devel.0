Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyPr-0007bM-MT
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:37:40 +0100
Received: by mail-pb0-f54.google.com with SMTP id jt11so270619pbb.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iu6j1kmd3qCeFyQNfOs56vfTEEHmmI8XkvEUJckFfB8=;
	b=DAx72k5C6zT8x2l0+PZ0cuC2UwAECrtpWPFBK/NCKhmALDRLvDQGYxzVvtdRz5OieT
	r4lEzFG+5SsW3gH9y5VwbRNrZqa4gnRa47gDtTDQapW/fQ2PM3ukLrE47LKgRgUac0hs
	hUy2bkqbYPYLf5pgbJhYuVn76ehgG4fbzwJ3BKHCLPO9XWfIr0ResoBVtAJ3VY4ZGm86
	g6gw5hcij77GgZn6Go7YCoB1/OmAq0W9oWvOFF5qK43AGo4E8LCqqGYggQZPSBCCwL5U
	1fpGR21TmHhlA5rQw6pzgB5LCy96ItoSYQH9VKFeDbfV0K1Aii/YK6xFcmvdeWtHcaVw
	Noiw==
X-Received: by 10.68.224.65 with SMTP id ra1mr1553331pbc.55.1363944045250;
	Fri, 22 Mar 2013 02:20:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pg7sm1755704pbc.5.2013.03.22.02.20.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:20:44 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:20:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092043.GJ3219@jama>
References: <1363817316-31547-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363817316-31547-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] busybox: move /etc/default/busybox-syslog to ${PN}-syslog
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
X-List-Received-Date: Fri, 22 Mar 2013 09:37:41 -0000
X-Groupsio-MsgNum: 43651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RUqJLqMNe5u4kDWT"
Content-Disposition: inline

--RUqJLqMNe5u4kDWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 11:08:36PM +0100, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-=
oe/recipes-core/busybox/busybox_1.20.2.bbappend
> index 0741b76..5d06265 100644
> --- a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> @@ -9,3 +9,5 @@ do_install_append() {
>  	install -d ${D}${sysconfdir}/default
>  	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/def=
ault/busybox-syslog
>  }
> +
> +FILES_${PN}-syslog +=3D "${sysconfdir}/default/busybox-syslog"

Applied, thanks!

> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RUqJLqMNe5u4kDWT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMImsACgkQN1Ujt2V2gBwPigCeML4SYQWHIwJgZ9ej2WDnwv5c
lboAoIjxsGDMxtXKJUHBGpQq8e7nPs9I
=u/J8
-----END PGP SIGNATURE-----

--RUqJLqMNe5u4kDWT--
