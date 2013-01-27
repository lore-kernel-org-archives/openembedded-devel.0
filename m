Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzY2l-0002Sf-E8
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 20:37:33 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so911416dae.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/tEIudY1m5JtmDfB60FGra0UGdU3IoqpNE9lyxCecbY=;
	b=yGETukBym4LEktFcOew0eLZsL5kLKKWs/P4Ka7vbJyXbEpTwB08491PZNh9xVifVS8
	7G9EcT0dO77tplWXq/UBYuZpfWT33HVpPwoloQqkS2tKi7bo0ULfGICKjLmWvQLoctwI
	JeKYhihiZZc2C1DjZqtTzuqI8bUdCk/9ZMxcCsGWUUjgFriPtNcqHk6jnnyvbGYUnWoE
	nVkaOLTfsMEuu+uWGBoWvaF8L+n8wA77HnnraL4SDAX0JWIrEa9wcpTMlEMb8FASEd1l
	xQXBdX4uESqsaEmvMBKM/tomG6XIWuJGntTprAh7cGlX6AOT0Cr7CU7BIOSDpARBE58l
	f0bA==
X-Received: by 10.68.143.195 with SMTP id sg3mr10199811pbb.137.1359314513425; 
	Sun, 27 Jan 2013 11:21:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vk5sm4791672pbc.34.2013.01.27.11.21.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 11:21:52 -0800 (PST)
Date: Sun, 27 Jan 2013 20:21:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130127192151.GN16904@jama.palm1.palmone.com>
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
X-List-Received-Date: Sun, 27 Jan 2013 19:37:34 -0000
X-Groupsio-MsgNum: 42866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zbynv6TNPa9FrOf6"
Content-Disposition: inline

--Zbynv6TNPa9FrOf6
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
>=20
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

Also RDEPENDS_${PN} and also fixed in jansa/in-test

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

--Zbynv6TNPa9FrOf6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEFfk8ACgkQN1Ujt2V2gBw3VwCgh/7AIL9zH2doiJ/2VuRmNoGX
bZAAnjx/DMs5DxkQ7mOoA+/cnxx5Kovq
=ILEf
-----END PGP SIGNATURE-----

--Zbynv6TNPa9FrOf6--
