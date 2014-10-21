Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6836465C92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:13:06 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Xgdve-000089-Q2 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2014 11:13:06 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 21 Oct 2014 11:13:06 -0700
Received: by burninator (Postfix, from userid 1000)	id DA87C58103D; Tue, 21
	Oct 2014 14:13:05 -0400 (EDT)
Date: Tue, 21 Oct 2014 14:13:05 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141021181304.GA18243@mentor.com>
References: <1411971857-31420-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1411971857-31420-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ebtables: fix for sysvinit and systemd
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
X-List-Received-Date: Tue, 21 Oct 2014 18:13:07 -0000
X-Groupsio-MsgNum: 52580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ebtables: fix for sysvinit and systemd] On 1=
4.09.29 (Mon 14:24) Qi.Chen@windriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> The solution mainly references Fedora20.
> Extract the common part of the code and install it into ${sbindir}.
> Add systemd service file.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../ebtables/ebtables-2.0.10-4/ebtables.common     |  163 ++++++++++++++=
++++++
>  .../ebtables/ebtables-2.0.10-4/ebtables.init       |  162 +-------------=
-----
>  .../ebtables/ebtables-2.0.10-4/ebtables.service    |   11 ++
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   22 ++-
>  4 files changed, 192 insertions(+), 166 deletions(-)
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.=
10-4/ebtables.common
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.=
10-4/ebtables.service
>=20
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/eb=
tables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/e=
btables.common
> new file mode 100644
> index 0000000..640025d
> --- /dev/null
> +++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.=
common
> @@ -0,0 +1,163 @@
> +#!/bin/sh
> +
> +[ -x /sbin/ebtables ] || exit 1
> +
> +EBTABLES_DUMPFILE_STEM=3D/etc/ebtables/dump
> +
> +RETVAL=3D0
> +prog=3D"ebtables"
> +desc=3D"Ethernet bridge filtering"
> +umask 0077
> +
> +#default configuration
> +EBTABLES_MODULES_UNLOAD=3D"yes"
> +EBTABLES_LOAD_ON_START=3D"no"
> +EBTABLES_SAVE_ON_STOP=3D"no"
> +EBTABLES_SAVE_ON_RESTART=3D"no"
> +EBTABLES_SAVE_COUNTER=3D"no"
> +EBTABLES_BACKUP_SUFFIX=3D"~"
> +
> +config=3D/etc/default/$prog
> +[ -f "$config" ] && . "$config"
> +
> +function get_supported_tables() {
> +	EBTABLES_SUPPORTED_TABLES=3D
> +	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
> +	if [ $? -eq 0 ]; then
> +		echo "Error: insufficient privileges to access the ebtables rulesets."
> +		exit 1
> +	fi
> +	for table in filter nat broute; do
> +		/sbin/ebtables -t $table -L &> /dev/null
> +		if [ $? -eq 0 ]; then
> +			EBTABLES_SUPPORTED_TABLES=3D"${EBTABLES_SUPPORTED_TABLES} $table"
> +		fi
> +	done
> +}
> +
> +function load() {
> +	RETVAL=3D0
> +	get_supported_tables
> +	echo -n "Restoring ebtables rulesets: "
> +	for table in $EBTABLES_SUPPORTED_TABLES; do
> +		echo -n "$table "
> +		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
> +			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$tab=
le --atomic-commit
> +			RET=3D$?
> +			if [ $RET -ne 0 ]; then
> +				echo -n "(failed) "
> +				RETVAL=3D$RET
> +			fi
> +		else
> +			echo -n "(no saved state) "
> +		fi
> +	done
> +	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +		echo -n "no kernel support. "
> +	else
> +		echo -n "done. "
> +	fi
> +	if [ $RETVAL -eq 0 ]; then
> +		echo "ok"
> +	else
> +		echo "fail"
> +	fi
> +}
> +
> +function clear() {
> +	RETVAL=3D0
> +	get_supported_tables
> +	echo -n "Clearing ebtables rulesets: "
> +	for table in $EBTABLES_SUPPORTED_TABLES; do
> +		echo -n "$table "
> +		/sbin/ebtables -t $table --init-table
> +	done
> +
> +	if [ "$EBTABLES_MODULES_UNLOAD" =3D "yes" ]; then
> +		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) =
ebtables; do
> +			rmmod $mod 2> /dev/null
> +		done
> +	fi
> +	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +		echo -n "no kernel support. "
> +	else
> +		echo -n "done. "
> +	fi
> +	if [ $RETVAL -eq 0 ]; then
> +		echo "ok"
> +	else
> +		echo "fail"
> +	fi
> +}
> +
> +function save() {
> +	RETVAL=3D0
> +	get_supported_tables
> +	echo -n "Saving ebtables rulesets: "
> +	for table in $EBTABLES_SUPPORTED_TABLES; do
> +		echo -n "$table "
> +		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$ta=
ble ] && \
> +		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table=
$EBTABLES_BACKUP_SUFFIX
> +		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$tabl=
e --atomic-save
> +		RET=3D$?
> +		if [ $RET -ne 0 ]; then
> +			echo -n "(failed) "
> +			RETVAL=3D$RET
> +		else
> +			if [ "$EBTABLES_SAVE_COUNTER" =3D "no" ]; then
> +				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$ta=
ble -Z
> +			fi
> +		fi
> +	done
> +	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +		echo -n "no kernel support. "
> +	else
> +		echo -n "done. "
> +	fi
> +	if [ $RETVAL -eq 0 ]; then
> +		echo "ok"
> +	else
> +		echo "fail"
> +	fi
> +}
> +
> +case "$1" in
> +  start)
> +	[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> +	;;
> +  stop)
> +	[ "$EBTABLES_SAVE_ON_STOP" =3D "yes" ] && save
> +	clear
> +	;;
> +  restart|reload|force-reload)
> +	[ "$EBTABLES_SAVE_ON_RESTART" =3D "yes" ] && save
> +	clear
> +	[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> +	;;
> +  load)
> +	load
> +	;;
> +  save)
> +	save
> +	;;
> +  status)
> +	get_supported_tables
> +	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +		echo "No kernel support for ebtables."
> +		RETVAL=3D1
> +	else
> +		echo -n "Ebtables support available, number of installed rules: "
> +		for table in $EBTABLES_SUPPORTED_TABLES; do
> +			COUNT=3D$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! =
d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
> +			echo -n "$table($COUNT) "
> +		done
> +		echo ok
> +		RETVAL=3D0
> +	fi
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|statu=
s}" >&2
> +	RETVAL=3D1
> +esac
> +
> +exit $RETVAL
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/eb=
tables.init b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebt=
ables.init
> index 0044e98..c9a77a2 100755
> --- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.=
init
> +++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.=
init
> @@ -23,164 +23,4 @@
>  # Description:		Saves and restores the state of the ebtables rulesets.
>  ### END INIT INFO
> =20
> -[ -x /sbin/ebtables ] || exit 1
> -
> -EBTABLES_DUMPFILE_STEM=3D/etc/ebtables/dump
> -
> -RETVAL=3D0
> -prog=3D"ebtables"
> -desc=3D"Ethernet bridge filtering"
> -umask 0077
> -
> -#default configuration
> -EBTABLES_MODULES_UNLOAD=3D"yes"
> -EBTABLES_LOAD_ON_START=3D"no"
> -EBTABLES_SAVE_ON_STOP=3D"no"
> -EBTABLES_SAVE_ON_RESTART=3D"no"
> -EBTABLES_SAVE_COUNTER=3D"no"
> -EBTABLES_BACKUP_SUFFIX=3D"~"
> -
> -config=3D/etc/default/$prog
> -[ -f "$config" ] && . "$config"
> -
> -function get_supported_tables() {
> -	EBTABLES_SUPPORTED_TABLES=3D
> -	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
> -	if [ $? -eq 0 ]; then
> -		echo "Error: insufficient privileges to access the ebtables rulesets."
> -		exit 1
> -	fi
> -	for table in filter nat broute; do
> -		/sbin/ebtables -t $table -L &> /dev/null
> -		if [ $? -eq 0 ]; then
> -			EBTABLES_SUPPORTED_TABLES=3D"${EBTABLES_SUPPORTED_TABLES} $table"
> -		fi
> -	done
> -}
> -
> -function load() {
> -	RETVAL=3D0
> -	get_supported_tables
> -	echo -n "Restoring ebtables rulesets: "
> -	for table in $EBTABLES_SUPPORTED_TABLES; do
> -		echo -n "$table "
> -		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
> -			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$tab=
le --atomic-commit
> -			RET=3D$?
> -			if [ $RET -ne 0 ]; then
> -				echo -n "(failed) "
> -				RETVAL=3D$RET
> -			fi
> -		else
> -			echo -n "(no saved state) "
> -		fi
> -	done
> -	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -		echo -n "no kernel support. "
> -	else
> -		echo -n "done. "
> -	fi
> -	if [ $RETVAL -eq 0 ]; then
> -		echo "ok"
> -	else
> -		echo "fail"
> -	fi
> -}
> -
> -function clear() {
> -	RETVAL=3D0
> -	get_supported_tables
> -	echo -n "Clearing ebtables rulesets: "
> -	for table in $EBTABLES_SUPPORTED_TABLES; do
> -		echo -n "$table "
> -		/sbin/ebtables -t $table --init-table
> -	done
> -
> -	if [ "$EBTABLES_MODULES_UNLOAD" =3D "yes" ]; then
> -		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) =
ebtables; do
> -			rmmod $mod 2> /dev/null
> -		done
> -	fi
> -	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -		echo -n "no kernel support. "
> -	else
> -		echo -n "done. "
> -	fi
> -	if [ $RETVAL -eq 0 ]; then
> -		echo "ok"
> -	else
> -		echo "fail"
> -	fi
> -}
> -
> -function save() {
> -	RETVAL=3D0
> -	get_supported_tables
> -	echo -n "Saving ebtables rulesets: "
> -	for table in $EBTABLES_SUPPORTED_TABLES; do
> -		echo -n "$table "
> -		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$ta=
ble ] && \
> -		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table=
$EBTABLES_BACKUP_SUFFIX
> -		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$tabl=
e --atomic-save
> -		RET=3D$?
> -		if [ $RET -ne 0 ]; then
> -			echo -n "(failed) "
> -			RETVAL=3D$RET
> -		else
> -			if [ "$EBTABLES_SAVE_COUNTER" =3D "no" ]; then
> -				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$ta=
ble -Z
> -			fi
> -		fi
> -	done
> -	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -		echo -n "no kernel support. "
> -	else
> -		echo -n "done. "
> -	fi
> -	if [ $RETVAL -eq 0 ]; then
> -		echo "ok"
> -	else
> -		echo "fail"
> -	fi
> -}
> -
> -case "$1" in
> -  start)
> -	[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> -	;;
> -  stop)
> -	[ "$EBTABLES_SAVE_ON_STOP" =3D "yes" ] && save
> -	clear
> -	;;
> -  restart|reload|force-reload)
> -	[ "$EBTABLES_SAVE_ON_RESTART" =3D "yes" ] && save
> -	clear
> -	[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> -	;;
> -  load)
> -	load
> -	;;
> -  save)
> -	save
> -	;;
> -  status)
> -	get_supported_tables
> -	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -		echo "No kernel support for ebtables."
> -		RETVAL=3D1
> -	else
> -		echo -n "Ebtables support available, number of installed rules: "
> -		for table in $EBTABLES_SUPPORTED_TABLES; do
> -			COUNT=3D$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! =
d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
> -			echo -n "$table($COUNT) "
> -		done
> -		echo ok
> -		RETVAL=3D0
> -	fi
> -	;;
> -  *)
> -	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|statu=
s}" >&2
> -	RETVAL=3D1
> -esac
> -
> -exit $RETVAL
> +/usr/sbin/ebtables.common $1
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/eb=
tables.service b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/=
ebtables.service
> new file mode 100644
> index 0000000..3abd1fe
> --- /dev/null
> +++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.=
service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DEthernet Bridge Filtering Tables
> +
> +[Service]
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +ExecStart=3D@SBINDIR@/ebtables.common start
> +ExecStop=3D@SBINDIR@/ebtables.common stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb=
 b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 9222b2d..32cfc75 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -15,6 +15,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v$=
{PV}.tar.gz \
>             file://installnonroot.patch \
>             file://01debian_defaultconfig.patch \
>             file://ebtables.init \
> +           file://ebtables.common \
> +           file://ebtables.service \
>             file://no-as-needed.patch \
>  "
> =20
> @@ -23,7 +25,7 @@ SRC_URI[sha256sum] =3D "dc6f7b484f207dc712bfca81645f451=
20cb6aee3380e77a1771e9c34a9
> =20
>  S =3D "${WORKDIR}/ebtables-v${PV}"
> =20
> -inherit update-rc.d
> +inherit update-rc.d systemd
> =20
>  EXTRA_OEMAKE =3D " \
>          BINDIR=3D${base_sbindir} \
> @@ -39,21 +41,29 @@ EXTRA_OEMAKE =3D " \
>  "
> =20
>  do_install () {
> +    install -d ${D}${sbindir}
> +    install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.c=
ommon
> +    # Fix hardcoded paths in scripts
> +    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${sbindir}/ebtables.common
> +    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sbindir}/ebtables.common
> +
>      install -d ${D}${sysconfdir}/init.d
>      install -d ${D}${sysconfdir}/default
>      install -d ${D}${sysconfdir}/ebtables
>      oe_runmake DESTDIR=3D'${D}' install
>      install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/e=
btables
>      mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir}/defau=
lt/ebtables
> -
> -    # Fix hardcoded paths in scripts
> -    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}/${sysconfdir}/init.d/ebtab=
les
> -    sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/ebtables
> +    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ebtables
> =20
>      # The script ebtables-save refernces perl in exec_prefix, so
>      # move it to sbindir to avoid QA issue
>      install -d ${D}/${sbindir}
>      mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
> +
> +    # Install systemd service files
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/s=
ystem
> +    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/e=
btables.service
>  }
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/default/ebtables"
> @@ -61,5 +71,7 @@ CONFFILES_${PN} +=3D "${sysconfdir}/default/ebtables"
>  INITSCRIPT_NAME =3D "ebtables"
>  INITSCRIPT_PARAMS =3D "start 41 S . stop 41 6 ."
> =20
> +SYSTEMD_SERVICE_${PN} =3D "ebtables.service"
> +
>  FILES_${PN}-dbg +=3D "${base_libdir}/ebtables/.debug"
>  FILES_${PN} +=3D "${base_libdir}/ebtables/*.so"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJURqIwAAoJEEn8ffcsOfaWBioH/jtQoO/OjN4ARFMQNXuAJdwI
fWUadUf1idt7czuGU8fjk6358eaTKOLi7aAx3QaMyhZ6DiNXI7k1/UXVeKExf7Sl
FwWe9IHdZ1MC8eYm+WXfwOU+Ak+1q62Fb6VGjRoC24/eh3sLPqd6LxAirTMSyXsU
9D3gsu/C7+E8b3YxXrtMxmWjCVKaVfokYsMcS4FHZRGqsV4NPNkSADi0912oIgVG
FS+jz4wecrTKANN8+vpoyek4JwLkiwM1BllsHQ9VofzXgAP2+L49l0Wf8k5jaANE
uryiWqcWIV0wsd7L+UXgRv4Gr7E9Lo7WF9X0HSOOiif67yaowORUUcBxmDAWTY0=
=s/6f
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
