Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmOO-00039C-Pm
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:56:50 +0100
Received: by mail-we0-f179.google.com with SMTP id x43so1403494wey.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qRjsCUHO1OnmsOA+lT1Vy4JgnpT3KdMPkLQayx5kJBo=;
	b=W0RxZNUMWaaKonOS8Fmf4CC/93Pvvqg2+Syj+g6bQCWivyPgYz0bNjBZoT7MM8opGN
	WWazWk8d1vyU3r//T3z0rqYwbULkbL+AHH9feEvQ8zeQsblGy0xspYGpNA2LtjNvTSri
	YaahkH/ZWeME9AfrEiB6EsmqRiNiAlvCDHyYcqiHZgrS+X0eisoZKIl9bo773wj1lWq3
	Rf2bzzEieeS5JJ+qJPZILhy1OS8IBVWH8fOtqqsZkaI6GdP8q63dRSWYnYTFDA5MYPvw
	7EJ/WtigmUdsa1VVYQk1mhxKhJbUFADkO526UJ3LeepNBB4Y/CgMLgM1HOR7WiwlS2ku
	GIsQ==
X-Received: by 10.180.73.116 with SMTP id k20mr6773646wiv.21.1359369670756;
	Mon, 28 Jan 2013 02:41:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bz12sm12747095wib.5.2013.01.28.02.41.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:41:10 -0800 (PST)
Date: Mon, 28 Jan 2013 11:41:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128104113.GU16904@jama.palm1.palmone.com>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] i2c-tools: Upgrade to 3.0.3 -> 3.1.0
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
X-List-Received-Date: Mon, 28 Jan 2013 10:56:53 -0000
X-Groupsio-MsgNum: 42879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pzbqGaOtRNiVr7w4"
Content-Disposition: inline

--pzbqGaOtRNiVr7w4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 10:45:14PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../i2c-tools/i2c-tools-3.0.3/Module.mk            |   72 --------------=
------
>  .../i2c-tools/i2c-tools-3.1.0/Module.mk            |   72 ++++++++++++++=
++++++
>  .../recipes-support/i2c-tools/i2c-tools_3.0.3.bb   |   24 -------
>  .../recipes-support/i2c-tools/i2c-tools_3.1.0.bb   |   26 +++++++
>  4 files changed, 98 insertions(+), 96 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Mod=
ule.mk
>  create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Mod=
ule.mk
>  delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
>  create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb

Applied, please split those perl scripts in followup patch.

> diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk =
b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
> deleted file mode 100644
> index fcaf72f..0000000
> --- a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -# EEPROMER
> -#
> -# Licensed under the GNU General Public License.
> -
> -EEPROMER_DIR	:=3D eepromer
> -
> -EEPROMER_CFLAGS	:=3D -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast=
-qual \
> -		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
> -		   -W -Wundef -Wmissing-prototypes -Iinclude
> -
> -EEPROMER_TARGETS	:=3D eepromer eeprom eeprog
> -
> -#
> -# Programs
> -#
> -
> -$(EEPROMER_DIR)/eepromer: $(EEPROMER_DIR)/eepromer.o
> -	$(CC) $(LDFLAGS) -o $@ $^
> -
> -$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o
> -	$(CC) $(LDFLAGS) -o $@ $^
> -
> -$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o $(EEPROMER_DIR)/24cXX.o=
=20
> -	$(CC) $(LDFLAGS) -o $@ $^
> -
> -#
> -# Objects
> -#
> -
> -$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c
> -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> -
> -$(EEPROMER_DIR)/eeprom.o: $(EEPROMER_DIR)/eeprom.c
> -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> -
> -$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c
> -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> -
> -$(EEPROMER_DIR)/24cXX.o: $(EEPROMER_DIR)/24cXX.c
> -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> -
> -#
> -# Commands
> -#
> -
> -all-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> -
> -strip-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> -	strip $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> -
> -clean-eepromer:
> -	$(RM) $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS))
> -
> -install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> -	$(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir)
> -	for program in $(EEPROMER_TARGETS) ; do \
> -	$(INSTALL_PROGRAM) $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done
> -
> -uninstall-eepromer:
> -	for program in $(EEPROMER_TARGETS) ; do \
> -	$(RM) $(DESTDIR)$(sbindir)/$$program ; \
> -	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done
> -
> -all: all-eepromer
> -
> -strip: strip-eepromer
> -
> -clean: clean-eepromer
> -
> -install: install-eepromer
> -
> -uninstall: uninstall-eepromer
> diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk =
b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
> new file mode 100644
> index 0000000..fcaf72f
> --- /dev/null
> +++ b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
> @@ -0,0 +1,72 @@
> +# EEPROMER
> +#
> +# Licensed under the GNU General Public License.
> +
> +EEPROMER_DIR	:=3D eepromer
> +
> +EEPROMER_CFLAGS	:=3D -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast=
-qual \
> +		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
> +		   -W -Wundef -Wmissing-prototypes -Iinclude
> +
> +EEPROMER_TARGETS	:=3D eepromer eeprom eeprog
> +
> +#
> +# Programs
> +#
> +
> +$(EEPROMER_DIR)/eepromer: $(EEPROMER_DIR)/eepromer.o
> +	$(CC) $(LDFLAGS) -o $@ $^
> +
> +$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o
> +	$(CC) $(LDFLAGS) -o $@ $^
> +
> +$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o $(EEPROMER_DIR)/24cXX.o=
=20
> +	$(CC) $(LDFLAGS) -o $@ $^
> +
> +#
> +# Objects
> +#
> +
> +$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c
> +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> +
> +$(EEPROMER_DIR)/eeprom.o: $(EEPROMER_DIR)/eeprom.c
> +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> +
> +$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c
> +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> +
> +$(EEPROMER_DIR)/24cXX.o: $(EEPROMER_DIR)/24cXX.c
> +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
> +
> +#
> +# Commands
> +#
> +
> +all-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> +
> +strip-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> +	strip $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> +
> +clean-eepromer:
> +	$(RM) $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS))
> +
> +install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
> +	$(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir)
> +	for program in $(EEPROMER_TARGETS) ; do \
> +	$(INSTALL_PROGRAM) $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done
> +
> +uninstall-eepromer:
> +	for program in $(EEPROMER_TARGETS) ; do \
> +	$(RM) $(DESTDIR)$(sbindir)/$$program ; \
> +	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done
> +
> +all: all-eepromer
> +
> +strip: strip-eepromer
> +
> +clean: clean-eepromer
> +
> +install: install-eepromer
> +
> +uninstall: uninstall-eepromer
> diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb b/meta-=
oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
> deleted file mode 100644
> index 021090c..0000000
> --- a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D "Set of i2c tools for linux"
> -SECTION =3D "base"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -SRC_URI =3D "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}=
=2Etar.bz2 \
> -           file://Module.mk \
> -          "
> -SRC_URI[md5sum] =3D "511376eed04455cdb277ef19c5f73bb4"
> -SRC_URI[sha256sum] =3D "23b28e474741834e3f1b35b0686528769a13adc92d2ff560=
3cbda1d6bd5e5629"
> -
> -inherit autotools
> -
> -do_compile_prepend() {
> -        cp ${WORKDIR}/Module.mk ${S}/eepromer/
> -        sed -i 's#/usr/local#/usr#' Makefile
> -        echo "include eepromer/Module.mk" >> Makefile
> -}
> -
> -do_install_append() {
> -        install -d ${D}${includedir}/linux
> -        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/=
i2c-dev-user.h
> -	rm -f ${D}${includedir}/linux/i2c-dev.h
> -}
> diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb b/meta-=
oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
> new file mode 100644
> index 0000000..7589537
> --- /dev/null
> +++ b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "Set of i2c tools for linux"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +RDEPENDS +=3D "perl"
> +
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/i2c-tools/i2c-tools=
-3.1.0.tar.bz2/f15019e559e378c6e9d5d6299a00df21/i2c-tools-${PV}.tar.bz2 \
> +           file://Module.mk \
> +          "
> +SRC_URI[md5sum] =3D "f15019e559e378c6e9d5d6299a00df21"
> +SRC_URI[sha256sum] =3D "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b2=
6a706094ca4c142a"
> +
> +inherit autotools
> +
> +do_compile_prepend() {
> +        cp ${WORKDIR}/Module.mk ${S}/eepromer/
> +        sed -i 's#/usr/local#/usr#' Makefile
> +        echo "include eepromer/Module.mk" >> Makefile
> +}
> +
> +do_install_append() {
> +        install -d ${D}${includedir}/linux
> +        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/=
i2c-dev-user.h
> +	rm -f ${D}${includedir}/linux/i2c-dev.h
> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pzbqGaOtRNiVr7w4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVckACgkQN1Ujt2V2gBx7xgCeK5oza+69mm4rtfFU0nMR2fQ/
PbcAn1z9ZXfc/nxr1ZcHdg+ni4v2r0MI
=D0xG
-----END PGP SIGNATURE-----

--pzbqGaOtRNiVr7w4--
