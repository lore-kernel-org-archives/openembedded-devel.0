Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id D03F36CC79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 16:35:40 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x13so16024831ief.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=vpe+7mryMLnfBkTVtGWBSfCEEK+MKhB3y/mW7ttueRo=;
	b=ZjJk1f+zq20H8cZOZkMN9LAdBVAqHjTtCp9j8GTTTAQsdMdIa7JilUUZKXpgeg0tFS
	PiCQ6fCkfbshjiqV9DcFvtWqqKO9Aeb1l4LQkz5y0XCN69RPASkIOf46uofoYGqr1cQX
	2kFq8RJg7rExl/z+9lPL0YvV8UyP6mqRv4a0IR5ftA7b5oRDhQ2DY4LxA7QlmycfFIsX
	eB3nRynYYrL5AlUBwDHFOwLmy9oAmhmjlCe+Q4IMyysNMZIEm5Jk10/MOQ2wYwEtdFVf
	wX6/CYX1jUf5iruZ9JEMn5yFjJJ1Fy3hqWzgKpGA58CJJ7Ze3of0uzpnpcrLOl0sx+Wl
	YdOQ==
X-Gm-Message-State: ALoCoQkprtA9aCV2maKgKXMZUByH8Vl4fpPuATDUDHbh97zj4YslOfBPRC0GxIvoYcHRsvhKgJrv
X-Received: by 10.50.57.115 with SMTP id h19mr7219931igq.2.1385742940614;
	Fri, 29 Nov 2013 08:35:40 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	jk5sm51711321igb.0.2013.11.29.08.35.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Nov 2013 08:35:40 -0800 (PST)
Date: Fri, 29 Nov 2013 11:35:37 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131129163536.GC3940@deserted.net>
References: <1385692657-10783-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1385692657-10783-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] ntp: comment out the invalid server
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
X-List-Received-Date: Fri, 29 Nov 2013 16:35:41 -0000
X-Groupsio-MsgNum: 47316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking] ntp: comment out the invalid server] On 13.11=
=2E29 (Fri 10:37) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> When ntpd starts, it will create a daemon to connect this invalid server,
> and fail, then ntpd will create other daemon to connect the local-only
> (127.127.1.0) server.
>=20
> The users should be aware that they need to configure the correct ntp
> servers, a invalid server will lead to a redundant daemon, so it is better
> to comment this example server to wait user to configure
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntp.conf |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-ne=
tworking/recipes-support/ntp/files/ntp.conf
> index a9cc838..e26b615 100644
> --- a/meta-networking/recipes-support/ntp/files/ntp.conf
> +++ b/meta-networking/recipes-support/ntp/files/ntp.conf
> @@ -5,7 +5,9 @@ driftfile /etc/ntp.drift
>  # This obtains a random server which will be close
>  # (in IP terms) to the machine.  Add other servers
>  # as required, or change this.
> -server time.server.example.com
> +#=20
> +# server time.server.example.com
> +#
>  # Using local hardware clock as fallback
>  # Disable this when using ntpd -q -g -x as ntpdate or it will sync to it=
self
>  server 127.127.1.0
--=20
-Joe MacDonald.
:wq

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKYwlgACgkQwFvcllog0XzkxwCfUOgMiNBF5LdmYxSGKgvrzx1g
gPQAoIGTmecoj5Ju3MvI9MdT5KAy0wXj
=pMEm
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
