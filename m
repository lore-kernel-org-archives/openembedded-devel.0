Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7105560088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:56:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c74so4503454pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=lnPNlQsnjiqPbOWnd28sOj4zs7QyNi9+aJghhPSDoLk=;
	b=YJQ3qasgbQgK+sDFhyzuHCa9CAZicVPxt2HNabBJadSAZe6dxBTXPu0o8lL80Dh4vK
	o+ipXqPzvLnvvmUr8Mr4IeU6lXlLAZkfwa/lxVWc9K4v/ntP4QxnLfoNn42Po7urLmv8
	GXor+piv1rrspxZP7GHyd205uoa8yY5j+tuxFheSotwLGypnap9bp5g2a509H47RinQr
	p/N0a2jh30vOZOXaooo5Oi6MLEKfMbHWzT65p7kwRAjjHj6wTyza9RL61ADN/+yJsFDl
	+J5Oo6CMJOJajgB8nA6kNtOy/qGvBuSJOHyEaWip78dmgvxKWej12rkUZu6FAyVMkYyq
	K67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lnPNlQsnjiqPbOWnd28sOj4zs7QyNi9+aJghhPSDoLk=;
	b=FFLnGQfst7LfhnCPE4IHnQc+BAnmJubBH+DJE3wt0iIbEdMcJxqlY8oomJzFwISVji
	Y1E3IsELkpn7NbfZ1L2czB1IczFaaKOMR+4Ko5dSaxLFPHqKxtjHAoFQ3nH6y9bvbMMv
	5YLxs4v8bx97aDJV0HOXu1XyGwcya2NRs2vTG7AT45HiRtvK0sGpF91x5SY5ME9VR5Sg
	PbGL703eErJSFJZyaxgcoV97YpdOC72V9CNdaq1jHI4v2eDFcbsKc55JlNbLEin8UUs4
	Lpy3YfAYN6j6OEqYZ0FDi06Pfqu19/8NlR5m6I2gmGvsXw8QtDEI3XTEgq6YHI5Jj4IA
	Z4hA==
X-Gm-Message-State: ALyK8tItrql+j9gUF3Re+VGhR+YyQH9IqKOolPRwmNjGS/Ru3zBTFYfwx5RGLUPbWCs11A==
X-Received: by 10.98.15.68 with SMTP id x65mr35853579pfi.66.1466614607863;
	Wed, 22 Jun 2016 09:56:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:fcd1:61e:b1e8:f28?
	([2601:646:8882:b8c:fcd1:61e:b1e8:f28])
	by smtp.gmail.com with ESMTPSA id
	ee10sm1122364pac.31.2016.06.22.09.56.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 09:56:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1465344898-22391-1-git-send-email-sarnold@vctlabs.com>
Date: Wed, 22 Jun 2016 09:56:45 -0700
Message-Id: <2908AC66-AE79-4922-831D-415D7CA7BFE7@gmail.com>
References: <1465344898-22391-1-git-send-email-sarnold@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Stephen Arnold <sarnold@vctlabs.com>
Subject: Re: [PATCH] redis: fix hiredis build so it's less failure-prone and links properly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 16:56:47 -0000
X-Groupsio-MsgNum: 61932
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BA346903-766C-4BDB-AB15-66B129F28720";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BA346903-766C-4BDB-AB15-66B129F28720
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 7, 2016, at 5:14 PM, Stephen Arnold <sarnold@vctlabs.com> =
wrote:
>=20
> This patch resets the default OPT flags to -O2 and adds the missing
> ranlib command to index the static library.
>=20
> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
> ---
> ...-update-Makefile-to-add-symbols-to-staticlib.patch | 19 =
+++++++++++++++++++
> meta-oe/recipes-extended/redis/redis_3.0.2.bb         |  2 ++
> 2 files changed, 21 insertions(+)
> create mode 100644 =
meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbol=
s-to-staticlib.patch
>=20
> diff --git =
a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symb=
ols-to-staticlib.patch =
b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symb=
ols-to-staticlib.patch
> new file mode 100644
> index 0000000..2b3b587
> --- /dev/null
> +++ =
b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symb=
ols-to-staticlib.patch
> @@ -0,0 +1,19 @@
> +--- redis-3.0.2/deps/hiredis/Makefile.orig	2016-05-06 =
19:36:26.179003036 -0700
> ++++ redis-3.0.2/deps/hiredis/Makefile	2016-05-06 =
19:40:15.341340736 -0700
> +@@ -25,7 +25,7 @@
> +
> + # Fallback to gcc when $CC is not in $PATH.
> + CC?=3D$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) =
|| echo gcc')
> +-OPTIMIZATION?=3D-O3
> ++OPTIMIZATION?=3D-O2

You can pass is via EXTRA_OEMAKE from recipe. No need to patch the =
Makefile.

> + WARNINGS=3D-Wall -W -Wstrict-prototypes -Wwrite-strings
> + DEBUG?=3D -g -ggdb
> + REAL_CFLAGS=3D$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) =
$(ARCH)
> +@@ -68,6 +68,7 @@
> +
> + $(STLIBNAME): $(OBJ)
> + 	$(STLIB_MAKE_CMD) $(OBJ)
> ++	$(RANLIB) $@
> +
> + dynamic: $(DYLIBNAME)
> + static: $(STLIBNAME)
> diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb =
b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> index 55f2c96..2e4b760 100644
> --- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> +++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> @@ -12,7 +12,9 @@ SRC_URI =3D =
"http://download.redis.io/releases/${BP}.tar.gz \
>            file://oe-use-libc-malloc.patch \
>            file://redis.conf \
>            file://init-redis-server \
> +           =
file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
> "
> +
> SRC_URI[md5sum] =3D "87be8867447f62524b584813e5a7bd14"
> SRC_URI[sha256sum] =3D =
"93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
>=20
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_BA346903-766C-4BDB-AB15-66B129F28720
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldqw00ACgkQuwUzVZGdMxScOwCfc1S9qjr3ck6i+uhp14Lmp1mx
810AoI7iyUJ1eNf0zDUM7lcPtZIAdf+u
=d+fJ
-----END PGP SIGNATURE-----

--Apple-Mail=_BA346903-766C-4BDB-AB15-66B129F28720--
