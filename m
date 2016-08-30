Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8284860620
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 17:24:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so4108754wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4Qx/SmWtU+qgPgcjiXw475ScjH7Byh2WzBIyD+2Es7A=;
	b=oc8zIbbFtybdlw4NKU3OojycElf3drAzpdXLyf4Q6BBbtjIqdDAv97OWn8WZBI5BnX
	DqPtJyQQRZXIUv3y9nXT4Ec7SPL2DCWF7VNr+c3IhiXJDHSextqHDZ9fcPGhk/zXWaGE
	GkElesewZ7pT559EQfoJx8OuzROmzbASaL/GBNclUEaVZE9W1xwnjPUeJSeMlyS4fQgZ
	+QJetIvoxJcs8cfD5oBBRAAqBrimTr7chDddK5N5rtG0MAeT2UrrwWGApYX2FFMhTiFb
	5HqbCX6gGlk3GuLsTTwyiejGkM4OOjZcfjKHsl+cUq1uzPF2WwAPfLmEDejbU8LpI87M
	p98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4Qx/SmWtU+qgPgcjiXw475ScjH7Byh2WzBIyD+2Es7A=;
	b=JjhIFk+m8CWIaHkkzozKEhQZiVEGiYE/bMn4VLYg2KvOR4d8Z97pGMlbhCwigx6e6L
	ysbDztH6Y1bz1H2/GCrByaRL1HoSWCH212G9U7nLLsnKlDxmP85qJlP0ZDdOM5raPpe5
	t8NWq+Z4v/EV7HHsRNBEce5mZNpn+slRqbLe+3n+QZvye5fEwVP75Q2u1sqSlvZwSu3m
	m0WTkXgXjkBgiFO7Ly+2ETVV/UBVBgdZyYS2f2uvgbfzLbWVB481uEvH/nP/2M5KikaN
	+wINCa9lMegtN+GKzP4BeBlRK5+hRJ52bt3VSF4B6/AYAk1Gl0LxUn3RT5qT4ri34SyC
	GCfQ==
X-Gm-Message-State: AE9vXwMf3mtT2iJl5tecqrAdjFIW5XQ2wCLnGfhADla0Z/WXcZP6WXda6VChUMw52CbJpQ==
X-Received: by 10.194.135.205 with SMTP id pu13mr4514533wjb.37.1472577853110; 
	Tue, 30 Aug 2016 10:24:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	lv9sm40485692wjb.22.2016.08.30.10.24.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Aug 2016 10:24:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Aug 2016 19:24:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160830172411.b7yyncwl6v3n4doy@jama>
References: <CADNFeU6vcmB1LzunSQ10Ka1ahxLj9rG3hu5hmERCKs9wb=V-zQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNFeU6vcmB1LzunSQ10Ka1ahxLj9rG3hu5hmERCKs9wb=V-zQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH] package_manager.py: Restore FEED_DEPLOYDIR_BASE_URI functionality
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
X-List-Received-Date: Tue, 30 Aug 2016 17:24:15 -0000
X-Groupsio-MsgNum: 62884
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7obpmsuwbrvdq7co"
Content-Disposition: inline

--7obpmsuwbrvdq7co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2016 at 11:31:26AM -0400, Reinhard Tartler wrote:
> According to the documentation, setting FEED_DEPLOYDIR_BASE_URI should
> be sufficient for setting up local feeds. This commit fixes the
> implementation to actually do that, even if BUILD_IMAGES_FROM_FEEDS is
> not set.

This belongs to openembedded-core ML.

>=20
> Also fix some bugs in the old implementation:
>  - Fetch uncompressed Packages files, because
>    'bitbake package-index' does not appear to create Packages.gz files.
>  - Add missing newline after the URI so that the options don't end up on
>    the same line.
>  - Fix the check when local options are necessary.
>=20
> Signed-off-by: Reinhard Tartler <tartler@deshaw.com>
> ---
>  meta/lib/oe/package_manager.py | 59 +++++++++++++++++++++++-------
> ------------
>  1 file changed, 32 insertions(+), 27 deletions(-)
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
=2Epy
> index 2802254..e92bbbd 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1649,33 +1649,36 @@ class OpkgPM(OpkgDpkgPM):
>=20
>                      config_file.write("src/gz %s %s\n" % (feed_name,
> feed_uri))
>=20
> -            """
> -            Allow to use package deploy directory contents as quick
> devel-testing
> -            feed. This creates individual feed configs for each arch
> subdir of those
> -            specified as compatible for the current machine.
> -            NOTE: Development-helper feature, NOT a full-fledged feed.
> -            """
> -            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") !=
=3D
> "":
> -                for arch in self.pkg_archs.split():
> -                    cfg_file_name =3D os.path.join(self.target_rootfs,
> -
> self.d.getVar("sysconfdir", True),
> -                                                 "opkg",
> -                                                 "local-%s-feed.conf" %
> arch)
> -
> -                    with open(cfg_file_name, "w+") as cfg_file:
> -                        cfg_file.write("src/gz local-%s %s/%s" %
> -                                       (arch,
> -
> self.d.getVar('FEED_DEPLOYDIR_BASE_URI',
> True),
> -                                        arch))
> -
> -                        if self.opkg_dir !=3D '/var/lib/opkg':
> -                            # There is no command line option for this
> anymore, we need to add
> -                            # info_dir and status_file to config file, if
> OPKGLIBDIR doesn't have
> -                            # the default value of "/var/lib" as defined
> in opkg:
> -                            # libopkg/opkg_conf.h:#define
> OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
> -                            # libopkg/opkg_conf.h:#define
> OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
> -                            cfg_file.write("option info_dir     %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
> -                            cfg_file.write("option status_file  %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
> +        self._setup_devel_feeds()
> +
> +    def _setup_devel_feeds(self):
> +        """
> +        Allow to use package deploy directory contents as quick
> devel-testing
> +        feed. This creates individual feed configs for each arch subdir =
of
> those
> +        specified as compatible for the current machine.
> +        NOTE: Development-helper feature, NOT a full-fledged feed.
> +        """
> +
> +        if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") !=3D "=
":
> +            for arch in self.pkg_archs.split():
> +                cfg_file_name =3D os.path.join(self.target_rootfs +
> self.d.getVar("sysconfdir", True),
> +                                       "opkg", "local-%s-feed.conf" % ar=
ch)
> +
> +                bb.utils.mkdirhier(os.path.dirname(cfg_file_name))
> +                with open(cfg_file_name, "w+") as cfg_file:
> +                    cfg_file.write("src local-%s %s/%s\n" %
> +                                   (arch,
> +                                    self.d.getVar('FEED_DEPLOYDIR_BASE_U=
RI',
> True),
> +                                    arch))
> +
> +                    if self.opkg_dir !=3D self.target_rootfs +
> '/var/lib/opkg':
> +                        # There is no command line option for this
> anymore, we need to add
> +                        # info_dir and status_file to config file, if
> OPKGLIBDIR doesn't have
> +                        # the default value of "/var/lib" as defined in
> opkg:
> +                        # libopkg/opkg_conf.h:#define
> OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
> +                        # libopkg/opkg_conf.h:#define
> OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
> +                        cfg_file.write("option info_dir     %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
> +                        cfg_file.write("option status_file  %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
>       def _create_config(self):
> @@ -1702,6 +1705,8 @@ class OpkgPM(OpkgDpkgPM):
>                  config_file.write("option info_dir     %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
>                  config_file.write("option status_file  %s\n" %
> os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
>=20
> +        self._setup_devel_feeds()
> +
>      def insert_feeds_uris(self):
>          if self.feed_uris =3D=3D "":
>              return
> --=20
> 2.7.1
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7obpmsuwbrvdq7co
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfFwToACgkQN1Ujt2V2gByx1QCfUlaCcq7X19JwQWtsD4FbWWAN
CbAAnjg4LEY3ehN0sn1fsmy8Qqs/0Md6
=0rBr
-----END PGP SIGNATURE-----

--7obpmsuwbrvdq7co--
