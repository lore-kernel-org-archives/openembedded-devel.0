Return-Path: <joe@deserted.net>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id F04E36F768
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:30:00 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so2594758iec.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=5F80FjGKNWXd0kPOaYkWOZ/P4nTi59JP3yeJC+/oG5M=;
	b=eH5jEePqU5j0IDN/ZDdtdhbDaG/rr6zLJR7fkQz78o3sDGVdg2BDUk25yzjzpOb68W
	+AMvWSJDSshqto7eIG/0ylkt1Q46An1lfpSt+XnqXNzxCb6nkefnV7m0uTyc+SXlYHTv
	kQjrhtR1jrLdJBERk1NCI67HtPmKwnDeAiyrAV/QpIv1djJobKTJrUu3xYgH1SIdwRZb
	wFLaYwr5TqyFryhaQ6oj1ms+3yRu0OShA90/8ccAQZV73y6xwn44BkUruTsTDsyYANi9
	JZWeFtLX/CVyne0GKCH89oiRhXhtxJykCrzkHWZeUDfZKg9abJjdjP1beuo+w2Wjc0xZ
	RiTg==
X-Gm-Message-State: ALoCoQnHm+DjMgV5FMWV2siyHfv9oNCIRN70VyV7VNHjMo95vcc/WNbQ3HiMTkUOp1+eVaHgPFaL
X-Received: by 10.43.146.69 with SMTP id jx5mr6787841icc.42.1394807401733;
	Fri, 14 Mar 2014 07:30:01 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	f1sm19815859igy.2.2014.03.14.07.30.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:30:00 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:29:58 -0400
From: Joe MacDonald <joe@deserted.net>
To: Liang Li <liang.li@windriver.com>
Message-ID: <20140314142954.GB8326@deserted.net>
References: <1394598577-3343-1-git-send-email-liang.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1394598577-3343-1-git-send-email-liang.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] radvd: eliminate confusing warnings when stop service
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
X-List-Received-Date: Fri, 14 Mar 2014 14:30:03 -0000
X-Groupsio-MsgNum: 48668
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline

--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking] radvd: eliminate confusing warnings when stop service] O=
n 14.03.12 (Wed 12:29) Liang Li wrote:

> When run 'service radvd stop' in case radvd is not started/running,
> we'll get warnings like this:
>=20
> Stopping radvd: no /usr/sbin/radvd found; none killed
> /etc/init.d/radvd: warning: cannot restore settings
> radvd.
>=20
> We could by pass these OPs by just check if the service is running
> or not so eliminate possible warnings.
>=20
> Signed-off-by: Liang Li <liang.li@windriver.com>
>=20
> ---
> recipes-daemons/radvd/files/radvd.init | 4 ++++
>  1 ????????? 4 ?(+)
>=20
> diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.init b/met=
a-networking/recipes-daemons/radvd/files/radvd.init
> index 921384c..5295292 100755
> --- a/meta-networking/recipes-daemons/radvd/files/radvd.init
> +++ b/meta-networking/recipes-daemons/radvd/files/radvd.init
> @@ -92,6 +92,10 @@ case "$1" in
>  	;;
>    stop)
>  	echo -n "Stopping $DESC: "
> +	if ! [ -f $PIDFILE ] ; then
> +		echo "not running."
> +		exit 0
> +	fi
>  	start-stop-daemon --oknodo --stop --pidfile $PIDFILE \
>  		--exec $DAEMON
>  	restore_settings $SAVED_SETTINGS

--=20
-Joe MacDonald.
:wq

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEUEARECAAYFAlMjEmIACgkQwFvcllog0XxCrgCXT0QMorrHpu6+egdQDnUkCYOH
awCdF1PUp4uGDKYeoE9zqr+KWlvQZU0=
=nq55
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
