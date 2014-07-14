Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E603703A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 02:18:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E2ITDa020642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2014 19:18:29 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.241]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Sun, 13 Jul 2014 19:18:29 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] postfix: add new recipe
Thread-Index: AQHPnO9EoVWqJBjjQEKYAHsIeWcKlJue2U0A
Date: Mon, 14 Jul 2014 02:18:28 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA8244E@ALA-MBB.corp.ad.wrs.com>
References: <1405072966-9276-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1405072966-9276-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.143]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] postfix: add new recipe
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
X-List-Received-Date: Mon, 14 Jul 2014 02:18:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will resend to meta-networking according to comments in oe-core.

Thanks,
Jackie

> -----Original Message-----
> From: jackie.huang@windriver.com [mailto:jackie.huang@windriver.com]
> Sent: Friday, July 11, 2014 6:03 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Huang, Jie (Jackie)
> Subject: [meta-oe][PATCH] postfix: add new recipe
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Postfix is Wietse Venema's mail server that started life at IBM research =
as an alternative to the widely-
> used Sendmail program.
>=20
> Postfix attempts to be fast, easy to administer, and secure.
> The outside has a definite Sendmail-ish flavor, but the inside is complet=
ely different.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/postfix/files/install.patch   |  66 ++++++
>  .../postfix/files/internal_recipient               |   1 +
>  meta-oe/recipes-extended/postfix/files/main.cf_2.0 | 102 +++++++++  .../=
recipes-
> extended/postfix/files/makedefs.patch  | 116 +++++++++++
>  meta-oe/recipes-extended/postfix/files/postfix     |  85 ++++++++
>  .../postfix/files/postfix-add-db6-support.patch    |  26 +++
>  .../recipes-extended/postfix/files/postfix.service |  14 ++
>  meta-oe/recipes-extended/postfix/postfix.inc       | 230 +++++++++++++++=
++++++
>  meta-oe/recipes-extended/postfix/postfix_2.11.1.bb |   6 +
>  9 files changed, 646 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/postfix/files/install.patch
>  create mode 100644 meta-oe/recipes-extended/postfix/files/internal_recip=
ient
>  create mode 100644 meta-oe/recipes-extended/postfix/files/main.cf_2.0
>  create mode 100644 meta-oe/recipes-extended/postfix/files/makedefs.patch
>  create mode 100755 meta-oe/recipes-extended/postfix/files/postfix
>  create mode 100644 meta-oe/recipes-extended/postfix/files/postfix-add-db=
6-support.patch
>  create mode 100644 meta-oe/recipes-extended/postfix/files/postfix.servic=
e
>  create mode 100644 meta-oe/recipes-extended/postfix/postfix.inc
>  create mode 100644 meta-oe/recipes-extended/postfix/postfix_2.11.1.bb
>=20
> diff --git a/meta-oe/recipes-extended/postfix/files/install.patch b/meta-=
oe/recipes-
> extended/postfix/files/install.patch
> new file mode 100644
> index 0000000..a3fe089
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/install.patch
> @@ -0,0 +1,66 @@
> +Change fixed postconf to a variable for cross-compiling
> +
> +Upstreamstatus: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> +---
> +diff --git a/postfix-install b/postfix-install index 49225ac..2e4c292
> +100644
> +--- a/postfix-install
> ++++ b/postfix-install
> +@@ -201,8 +201,8 @@ test -z "$non_interactive" -a ! -t 0 && {
> +     exit 1
> + }
> +
> +-test -x bin/postconf || {
> +-    echo $0: Error: no bin/postconf file. Did you forget to run \"make\=
"? 1>&2
> ++test -x "$POSTCONF" || {
> ++    echo $0: Error: no $POSTCONF file. Did you forget to run \"make\"?
> ++1>&2
> +     exit 1
> + }
> +
> +@@ -363,7 +363,7 @@ HTML files. Specify \"no\" if you do not want to ins=
tall these files."
> +
> + : ${install_root=3D/}
> + : ${tempdir=3D`pwd`}
> +-: ${config_directory=3D`bin/postconf -c conf -h -d config_directory`}
> ++: ${config_directory=3D`$POSTCONF -c conf -h -d config_directory`}
> +
> + # Find out the location of installed configuration files.
> +
> +@@ -433,7 +433,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
> + 	case "$junk" in
> + 	"") eval unset $name;;
> + 	esac
> +-	eval : \${$name=3D\`bin/postconf -c $CONFIG_DIRECTORY -h $name\`} ||
> ++	eval : \${$name=3D\`$POSTCONF -c $CONFIG_DIRECTORY -h $name\`} ||
> + 	    exit 1
> +     done
> + }
> +@@ -446,7 +446,7 @@ do
> +     case "$junk" in
> +     "") eval unset $name;;
> +     esac
> +-    eval : \${$name=3D\`bin/postconf -c conf -d -h $name\`} || exit 1
> ++    eval : \${$name=3D\`$POSTCONF -c conf -d -h $name\`} || exit 1
> + done
> +
> + # Override settings manually.
> +@@ -565,6 +565,8 @@ HTML_DIRECTORY=3D$install_root$html_directory
> + MANPAGE_DIRECTORY=3D$install_root$manpage_directory
> + README_DIRECTORY=3D$install_root$readme_directory
> +
> ++test "x$POSTCONF" !=3D "x" || POSTCONF=3D"bin/postconf"
> ++
> + # Avoid repeated tests for existence of these; default permissions suff=
ice.
> +
> + test -d $DAEMON_DIRECTORY || mkdir -p $DAEMON_DIRECTORY || exit 1 @@
> +-724,7 +726,7 @@ do  # Postfix releases, and software should not
> +suddenly be installed in  # the wrong place when Postfix is being
> +upgraded.
> +
> +-bin/postconf -c $CONFIG_DIRECTORY -e \
> ++"$POSTCONF" -c $CONFIG_DIRECTORY -e \
> +     "daemon_directory =3D $daemon_directory" \
> +     "data_directory =3D $data_directory" \
> +     "command_directory =3D $command_directory" \
> diff --git a/meta-oe/recipes-extended/postfix/files/internal_recipient b/=
meta-oe/recipes-
> extended/postfix/files/internal_recipient
> new file mode 100644
> index 0000000..6a8f268
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/internal_recipient
> @@ -0,0 +1 @@
> +root@   permit_mynetworks,reject
> diff --git a/meta-oe/recipes-extended/postfix/files/main.cf_2.0 b/meta-oe=
/recipes-
> extended/postfix/files/main.cf_2.0
> new file mode 100644
> index 0000000..a128faa
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/main.cf_2.0
> @@ -0,0 +1,102 @@
> +# Configure your domain and accounts
> +#mydomain=3Dsample.com
> +#FQDN from gethostname
> +#myhostname =3D
> +mydomain=3Dlocaldomain
> +mydestination =3D $myhostname, localhost.localdomain localhost mynetwork=
s
> +=3D 127.0.0.1/8 inet_interfaces =3D 127.0.0.1
> +
> +virtual_mailbox_domains =3D sample.com, other.net virtual_mailbox_maps =
=3D
> +hash:/etc/postfix/virtual virtual_alias_maps =3D
> +hash:/etc/postfix/virtual_alias
> +
> +alias_maps =3D hash:/etc/aliases
> +
> +# You'll start with the following lines for maildir storage
> +virtual_mailbox_base =3D /var/spool/vmail virtual_uid_maps =3D static:`g=
rep
> +vmail /etc/passwd | cut -d ":" -f 3` virtual_gid_maps =3D static:`grep
> +vmail /etc/passwd | cut -d ":" -f 4`
> +
> +
> +# You'll start with the following lines for IMAP storage
> +#virtual_transport =3D lmtp:unix:/var/lib/cyrus/socket/lmtp
> +
> +
> +# General stuff here again
> +config_directory =3D /etc/postfix
> +sample_directory =3D /etc/postfix
> +queue_directory =3D /var/spool/postfix
> +mail_spool_directory =3D /var/spool/mail
> +readme_directory =3D no
> +command_directory =3D /usr/sbin
> +daemon_directory =3D /usr/libexec/postfix mail_owner =3D postfix
> +setgid_group =3D postdrop unknown_local_recipient_reject_code =3D 450
> +mynetworks_style =3D host debug_peer_level =3D 2 sendmail_path =3D
> +/usr/sbin/sendmail newaliases_path =3D /usr/bin/newaliases mailq_path =
=3D
> +/usr/bin/mailq
> +
> +smtpd_data_restrictions =3D
> +        permit_mynetworks,
> +        reject_unauth_pipelining,
> +        permit
> +
> +smtpd_client_restrictions =3D
> +        permit_mynetworks,
> +        # reject_unknown_client, # This can cause a lot of false rejects=
.
> +        reject_invalid_hostname,
> +        reject_rbl_client list.dsbl.org,
> +        reject_rbl_client sbl.spamhaus.org,
> +        reject_rbl_client cbl.abuseat.org,
> +        reject_rbl_client dul.dnsbl.sorbs.net,
> +        permit
> +
> +smtpd_helo_required =3D yes
> +smtpd_helo_restrictions =3D
> +        permit_mynetworks,
> +        reject_unauth_pipelining,
> +        # reject_non_fqdn_hostname, # This can cause a lot of false reje=
cts.
> +        # reject_unknown_hostname, # This can cause a lot of false rejec=
ts.
> +        reject_invalid_hostname,
> +        permit
> +
> +smtpd_sender_restrictions =3D
> +        permit_mynetworks,
> +        reject_non_fqdn_sender,
> +        # check_sender_access hash:/etc/postfix/access_domains,
> +        reject_unknown_sender_domain,
> +        permit
> +
> +smtpd_recipient_restrictions =3D
> +        permit_mynetworks,
> +        permit_sasl_authenticated,
> +        reject_unauth_destination,
> +
> +        # check_recipient_access pcre:/etc/postfix/recipient_checks.pcre=
,
> +        # check_helo_access pcre:/etc/postfix/helo_checks.pcre,
> +
> +        # check_client_access hash:/etc/postfix/maps/access_client,
> +        # check_client_access hash:/etc/postfix/maps/exceptions_client,
> +        # check_helo_access hash:/etc/postfix/maps/access_helo,
> +        # check_helo_access hash:/etc/postfix/maps/verify_helo,
> +        # check_sender_access hash:/etc/postfix/maps/access_sender,
> +        # check_sender_access hash:/etc/postfix/maps/verify_sender,
> +        # check_recipient_access
> + hash:/etc/postfix/maps/access_recipient,
> +
> +        # reject_multi_recipient_bounce,
> +        reject_non_fqdn_recipient,
> +        reject_unknown_recipient_domain,
> +        # reject_unlisted_recipient,
> +        #check_policy_service unix:private/policy,
> +
> +        # check_sender_access hash:/etc/postfix/maps/no_verify_sender,
> +        # check_sender_access hash:/etc/postfix/access_domains,
> +        # reject_unverified_sender,
> +        # reject_unverified_recipient
> +        check_recipient_access hash:/etc/postfix/internal_recipient
> +
> +disable_vrfy_command =3D yes
> diff --git a/meta-oe/recipes-extended/postfix/files/makedefs.patch b/meta=
-oe/recipes-
> extended/postfix/files/makedefs.patch
> new file mode 100644
> index 0000000..32c31b0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/makedefs.patch
> @@ -0,0 +1,116 @@
> +1)remove RANLIB, SYSLIBS, AR and get them from env.
> +
> +2)reference sysroot when searching header files 3)include sysroot path
> +instead of absolute include path for Linux2 and Linux3 systems.
> +4)for non-native build, search STAGING_BASELIBDIR/LIBDIR
> +  native build, search host library path for nsl and resolv library
> +  which comes from libc
> +
> +Upstreamstatus: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> +---
> + makedefs |   27 +++++++++++----------------
> + 1 files changed, 11 insertions(+), 16 deletions(-)
> +
> +diff --git a/makedefs b/makedefs
> +index dd5f256..e6fb795 100644
> +--- a/makedefs
> ++++ b/makedefs
> +@@ -87,9 +87,6 @@
> +
> + # Defaults for most sane systems
> +
> +-RANLIB=3Dranlib
> +-SYSLIBS=3D
> +-AR=3Dar
> + ARFL=3Drv
> +
> + # Ugly function to make our error message more visible among the @@
> +-293,12 +290,12 @@ case "$SYSTEM.$RELEASE" in
> + 		case "$CCARGS" in
> + 		 *-DNO_DB*) ;;
> + 		 *-DHAS_DB*) ;;
> +-		 *) if [ -f /usr/include/db.h ]
> ++		 *) if [ -f "$BUILD_SYSROOT"/usr/include/db.h ]
> + 		    then
> + 			: we are all set
> +-		    elif [ -f /usr/include/db/db.h ]
> ++		    elif [ -f "$BUILD_SYSROOT"/usr/include/db/db.h ]
> + 		    then
> +-			CCARGS=3D"$CCARGS -I/usr/include/db"
> ++			CCARGS=3D"$CCARGS -I"$BUILD_SYSROOT"/usr/include/db"
> + 		    else
> + 			# No, we're not going to try db1 db2 db3 etc.
> + 			# On a properly installed system, Postfix builds @@ -307,12 +304,12
> +@@ case "$SYSTEM.$RELEASE" in
> + 			echo "Install the appropriate db*-devel package first." 1>&2
> + 			exit 1
> + 		    fi
> +-		    SYSLIBS=3D"-ldb"
> ++		    SYSLIBS=3D"$SYSLIBS -ldb"
> + 		    ;;
> + 		esac
> + 		for name in nsl resolv $GDBM_LIBS
> + 		do
> +-		    for lib in /usr/lib64 /lib64 /usr/lib /lib
> ++		    for lib in $BUILD_SYSROOT_NSL_PATH
> + 		    do
> + 			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
> + 			    SYSLIBS=3D"$SYSLIBS -l$name"
> +@@ -332,7 +329,7 @@ case "$SYSTEM.$RELEASE" in
> + 		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
> + 		       then
> + 			   :
> +-		       elif [ ! -e /usr/include/sys/epoll.h ]
> ++		       elif [ ! -e "$BUILD_SYSROOT"/usr/include/sys/epoll.h ]
> + 		       then
> + 			   echo CCARGS=3D"$CCARGS -DNO_EPOLL"
> + 		       else
> +@@ -356,8 +353,6 @@ int     main(int argc, char **argv)
> + }
> + EOF
> + 			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
> +-			   ./makedefs.test 2>/dev/null ||
> +-				CCARGS=3D"$CCARGS -DNO_EPOLL"
> + 			   rm -f makedefs.test makedefs.test.[co]
> + 		       fi;;
> + 		esac
> +@@ -366,12 +361,12 @@ EOF
> + 		case "$CCARGS" in
> + 		 *-DNO_DB*) ;;
> + 		 *-DHAS_DB*) ;;
> +-		 *) if [ -f /usr/include/db.h ]
> ++		 *) if [ -f "$BUILD_SYSROOT"/usr/include/db.h ]
> + 		    then
> + 			: we are all set
> +-		    elif [ -f /usr/include/db/db.h ]
> ++		    elif [ -f "$BUILD_SYSROOT"/usr/include/db/db.h ]
> + 		    then
> +-			CCARGS=3D"$CCARGS -I/usr/include/db"
> ++			CCARGS=3D"$CCARGS -I"$BUILD_SYSROOT"/usr/include/db"
> + 		    else
> + 			# On a properly installed system, Postfix builds
> + 			# by including <db.h> and by linking with -ldb @@ -379,7 +374,7 @@
> +EOF
> + 			echo "Install the appropriate db*-devel package first." 1>&2
> + 			exit 1
> + 		    fi
> +-		    SYSLIBS=3D"-ldb"
> ++		    SYSLIBS=3D"$SYSLIBS -ldb"
> + 		    ;;
> + 		esac
> + 		for name in nsl resolv
> +@@ -415,7 +410,7 @@ EOF
> + 		esac
> + 		for name in nsl resolv
> + 		do
> +-		    for lib in /usr/lib64 /lib64 /usr/lib /lib
> ++		    for lib in $BUILD_SYSROOT_NSL_PATH
> + 		    do
> + 			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
> + 			    SYSLIBS=3D"$SYSLIBS -l$name"
> +--
> +1.7.1
> +
> diff --git a/meta-oe/recipes-extended/postfix/files/postfix b/meta-oe/rec=
ipes-
> extended/postfix/files/postfix
> new file mode 100755
> index 0000000..7bcc816
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/postfix
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +
> +success() {
> +        echo " Successful"
> +        exit 0
> +}
> +
> +fail() {
> +        echo " Failed"
> +        exit 1
> +
> +}
> +
> +check_return () {
> +        local ret=3D"$1"
> +
> +        if [ "$ret" =3D "0" ]; then
> +          success
> +        else
> +          fail
> +        fi
> +}
> +
> +PIDFile=3D/var/spool/postfix/pid/master.pid
> +case "$1" in
> +
> +        start)
> +        echo -n "Starting Postfix..."
> +        if [ ! -e /etc/aliases.db ]; then
> +          # The alias database is necessary for postfix to work correctl=
y.
> +          echo "Creating aliases database ..."
> +          newaliases
> +        fi
> +        if ! postfix status >/dev/null 2>&1; then
> +          postfix start
> +          check_return $?
> +        else
> +          success
> +        fi
> +        ;;
> +
> +        stop)
> +        echo -n  "Stopping Postfix..."
> +        if postfix status >/dev/null 2>&1; then
> +          postfix stop
> +          check_return $?
> +        else
> +          success
> +        fi
> +        ;;
> +
> +        reload)
> +        echo -n "Reloading Postfix..."
> +        if postfix status >/dev/null 2>&1; then
> +          postfix reload
> +          check_return $?
> +        else
> +          postfix start
> +          check_return $?
> +        fi
> +        ;;
> +
> +        restart)
> +        $0 stop
> +        sleep 1
> +        $0 start
> +        ;;
> +
> +        status)
> +        if postfix status >/dev/null 2>&1; then
> +          pid=3D`sed -e 's/\s//g' $PIDFile`
> +          echo "The Postfix mail system is running (PID: $pid)"
> +          exit 0
> +        else
> +          echo "The Postfix mail system is not running"
> +          exit 1
> +        fi
> +        ;;
> +
> +        *)
> +        echo "Usage: $0 {start|stop|status|reload|restart}"
> +        exit 1
> +        ;;
> +esac
> +
> diff --git a/meta-oe/recipes-extended/postfix/files/postfix-add-db6-suppo=
rt.patch b/meta-
> oe/recipes-extended/postfix/files/postfix-add-db6-support.patch
> new file mode 100644
> index 0000000..e3e28c8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/postfix-add-db6-support.pat
> +++ ch
> @@ -0,0 +1,26 @@
> +Subject: [PATCH] add db6 support db6
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + src/util/dict_db.c |    3 ++-
> + 1 files changed, 2 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/util/dict_db.c b/src/util/dict_db.c index
> +93ee480..f1ae66b 100644
> +--- a/src/util/dict_db.c
> ++++ b/src/util/dict_db.c
> +@@ -693,7 +693,8 @@ static DICT *dict_db_open(const char *class, const c=
har *path, int open_flags,
> + 	msg_fatal("set DB cache size %d: %m", dict_db_cache_size);
> +     if (type =3D=3D DB_HASH && db->set_h_nelem(db, DICT_DB_NELM) !=3D 0=
)
> + 	msg_fatal("set DB hash element count %d: %m", DICT_DB_NELM); -#if
> +DB_VERSION_MAJOR =3D=3D 5 || (DB_VERSION_MAJOR =3D=3D 4 && DB_VERSION_MI=
NOR >
> +0)
> ++#if DB_VERSION_MAJOR =3D=3D 6 || DB_VERSION_MAJOR =3D=3D 5 || \
> ++    (DB_VERSION_MAJOR =3D=3D 4 && DB_VERSION_MINOR > 0)
> +     if ((errno =3D db->open(db, 0, db_path, 0, type, db_flags, 0644)) !=
=3D 0)
> + 	FREE_RETURN(dict_surrogate(class, path, open_flags, dict_flags,
> + 				   "open database %s: %m", db_path));
> +--
> +1.7.1
> +
> diff --git a/meta-oe/recipes-extended/postfix/files/postfix.service b/met=
a-oe/recipes-
> extended/postfix/files/postfix.service
> new file mode 100644
> index 0000000..6ea9214
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/files/postfix.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DPostfix Mail Transport Agent After=3Dsyslog.target
> +network.target Conflicts=3Dsendmail.service exim.service
> +
> +[Service]
> +Type=3Dforking
> +PIDFile=3D/var/spool/postfix/pid/master.pid
> +ExecStart=3D/usr/sbin/postfix start
> +ExecReload=3D/usr/sbin/postfix reload
> +ExecStop=3D/usr/sbin/postfix stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-extended/postfix/postfix.inc b/meta-oe/recip=
es-
> extended/postfix/postfix.inc
> new file mode 100644
> index 0000000..c58787e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/postfix.inc
> @@ -0,0 +1,230 @@
> +SUMMARY =3D "Postfix Mail Transport Agent"
> +DESCRIPTION =3D "Postfix is Wietse Venema's mail server that started lif=
e
> +at \ IBM research as an alternative to the widely-used Sendmail
> +program. \ Postfix attempts to be fast, easy to administer, and secure.
> +The outsidei \ has a definite Sendmail-ish flavor, but the inside is com=
pletely different."
> +
> +HOMEPAGE=3D "http://www.postfix.org"
> +SECTION =3D "console/network"
> +DEPENDS =3D "virtual/db libpcre openssl postfix-native \
> +	${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
> +	${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \ "
> +DEPENDS_virtclass-native =3D "virtual/db-native openssl-native libpcre-n=
ative"
> +
> +LICENSE =3D "IPL-1.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64375f37431336ea1b1b3005fe3fa=
354"
> +
> +SRC_URI =3D "ftp://ftp.porcupine.org/mirrors/postfix-release/official/po=
stfix-${PV}.tar.gz \
> +	   file://makedefs.patch \
> +	   file://install.patch \
> +	   file://main.cf_2.0 \
> +	   file://postfix \
> +	   file://internal_recipient \
> +	   file://postfix.service \
> +	   "
> +
> +S =3D "${WORKDIR}/postfix-${PV}"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +inherit update-rc.d useradd update-alternatives systemd
> +
> +INITSCRIPT_NAME =3D "postfix"
> +INITSCRIPT_PARAMS =3D "start 58 3 4 5 . stop 13 0 1 6 ."
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D \
> +"-d /var/spool/postfix -r -g postfix --shell /bin/false postfix; \  -d
> +/var/spool/vmail -r -u 5000 -g vmail --shell /bin/false vmail \ "
> +GROUPADD_PARAM_${PN} =3D "--system postfix;--system postdrop;-g 5000 --s=
ystem vmail"
> +
> +export SYSLIBS =3D "${LDFLAGS}"
> +
> +# CCARGS specifies includes, defines
> +# AUXLIBS specifies libraries
> +# Linux2/Linux3 has HAS_DB defined
> +# makedefs will make CC to be CC+CCARGS
> +
> +# ldap support
> +export CCARGS-ldap  =3D "\
> +	${@base_contains('DISTRO_FEATURES', 'ldap', '-DHAS_LDAP', '', d)}"
> +export AUXLIBS-ldap =3D "\
> +	${@base_contains('DISTRO_FEATURES', 'ldap', '-lldap -llber', '', d)}"
> +
> +# no native openldap
> +export CCARGS-ldap_virtclass-native =3D ""
> +export AUXLIBS-ldap_virtclass-native =3D ""
> +
> +# SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH # current openldap
> +didn't enable SASL export CCARGS-sasl  =3D "\
> +	${@base_contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRU=
S_SASL -
> I=3D/usr/include/sasl', '', d)}"
> +export AUXLIBS-sasl =3D "\
> +	${@base_contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
> +export CCARGS-sasl_virtclass-native =3D ""
> +export AUXLIBS-sasl_virtclass-native =3D ""
> +
> +# PCRE, TLS support default
> +export CCARGS  =3D "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCAR=
GS-sasl}"
> +export AUXLIBS =3D "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap=
}"
> +export POSTCONF =3D "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
> +
> +# OPT,DEBUG is aready in CFLAGS
> +# ignore the OPTS=3D"CC=3D$CC" in Makefile it will not use the CC=3D$CC
> +$CCARGS EXTRA_OEMAKE +=3D "OPT=3D DEBUG=3D OPTS=3D "
> +
> +do_compile () {
> +	unset CFLAGS CPPFLAGS CXXFLAGS
> +	local native_build
> +
> +	native_build=3D"${@['0', '1'][bb.data.inherits_class('native', d) or
> bb.data.inherits_class('nativesdk', d)]}"
> +
> +	# if not native build, then pass SYSTEM and RELEASE to makedefs
> +	if [ "${native_build}" !=3D "1" ]; then
> +		# uname -s for target
> +		SYSTEM=3D"Linux"
> +
> +		# uname -r, use 2.6 as bottomline, even target kernel ver > 2.6
> +		RELEASE=3D"2.6.34"
> +		sed -i -e \
> +		    "s:\$(SHELL) makedefs):\$(SHELL) makedefs $SYSTEM $RELEASE):" \
> +		    ${S}/Makefile.in
> +		export BUILD_SYSROOT=3D"${STAGING_DIR_HOST}"
> +		export BUILD_SYSROOT_NSL_PATH=3D"${STAGING_BASELIBDIR} \
> +		                               ${STAGING_LIBDIR}"
> +	else
> +		# native build
> +		export BUILD_SYSROOT=3D"${STAGING_DIR_NATIVE}"
> +
> +		# ubuntu x86 host: /lib/x86_64-linux-gnu(64) /lib/i386-linux-gnu (32)
> +		#             on 64 bits, 32 libs in i386-linux-gnu
> +		# let makedefs finds nsl and resolv libs, host CC will link
> +		# the correct libraries
> +		BUILD_SYSROOT_NSL_PATH=3D"$(${CC} -print-search-dirs 2>/dev/null | \
> +	                  sed -n '/^libraries: =3D/s/libraries: =3D//p' | \
> +	                  sed -e 's/:/\n/g' | xargs -n1 readlink -f | \
> +	                  grep -v 'gcc\|/[0-9.]\+$' | sort -u)"
> +		if [ -z "$BUILD_SYSROOT_NSL_PATH" ]; then
> +			BUILD_SYSROOT_NSL_PATH=3D"/usr/lib64 /lib64 \
> +		                                /lib/x86_64-linux-gnu \
> +		                                /usr/lib   /lib \
> +		                                /lib/i386-linux-gnu"
> +		fi
> +		export BUILD_SYSROOT_NSL_PATH
> +	fi
> +
> +	oe_runmake makefiles
> +	oe_runmake
> +}
> +
> +do_install_prepend_virtclass-native() {
> +	export POSTCONF=3D"bin/postconf"
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "postfix.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install () {
> +	sh ./postfix-install 'install_root=3D${D}' \
> +		'config_directory=3D${sysconfdir}/postfix' \
> +		'daemon_directory=3D${exec_prefix}/libexec/postfix' \
> +		'command_directory=3D${sbindir}' \
> +		'queue_directory=3D${localstatedir}/spool/postfix' \
> +		'sendmail_path=3D${sbindir}/sendmail.postfix' \
> +		'newaliases_path=3D${bindir}/newaliases' \
> +		'mailq_path=3D${bindir}/mailq' \
> +		'manpage_directory=3D${mandir}' \
> +		'readme_directory=3D${datadir}/doc/postfix' \
> +		'data_directory=3D${localstatedir}/lib/postfix' \
> +		-non-interactive
> +	rm -rf ${D}${localstatedir}/spool/postfix
> +	mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-m=
ain.cf
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
> +	install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
> +	install -m 644 ${WORKDIR}/internal_recipient
> +${D}${sysconfdir}/postfix/internal_recipient
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/syste=
m
> +	sed -i 's,/usr/sbin/,${sbindir}/,g'
> +${D}${systemd_unitdir}/system/postfix.service
> +
> +	install -m 770 -d ${D}${localstatedir}/spool/postfix
> +	chown postfix:postfix ${D}${localstatedir}/spool/postfix
> +	chown postfix:postfix ${D}${localstatedir}/lib/postfix
> +
> +	install -m 2755 -d ${D}${localstatedir}/spool/mail
> +	chown postfix:nogroup ${D}${localstatedir}/spool/mail
> +	install -m 0755 -d ${D}${localstatedir}/lib/postfix
> +	chown postfix:nogroup ${D}${localstatedir}/lib/postfix
> +	install -m 0755 -d ${D}${localstatedir}/spool/postfix
> +	chown root:postfix ${D}${localstatedir}/spool/postfix
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/active
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/active
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/bounce
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/bounce
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/corrupt
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/corrupt
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/defer
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/defer
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/deferred
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/deferred
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/flush
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/flush
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/hold
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/hold
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/incoming
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/incoming
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/saved
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/saved
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/trace
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/trace
> +	install -m 0730 -d ${D}${localstatedir}/spool/postfix/maildrop
> +	chown postfix:postdrop ${D}${localstatedir}/spool/postfix/maildrop
> +	install -m 0755 -d ${D}${localstatedir}/spool/postfix/pid
> +	chown root:root ${D}${localstatedir}/spool/postfix/pid
> +	install -m 0700 -d ${D}${localstatedir}/spool/postfix/private
> +	chown postfix:root ${D}${localstatedir}/spool/postfix/private
> +	install -m 0710 -d ${D}${localstatedir}/spool/postfix/public
> +	chown postfix:postdrop ${D}${localstatedir}/spool/postfix/public
> +	install -m 0755 -d ${D}${localstatedir}/spool/vmail
> +	chown vmail:vmail ${D}${localstatedir}/spool/vmail
> +
> +	chown :postdrop ${D}${sbindir}/postqueue
> +	chown :postdrop ${D}${sbindir}/postdrop
> +	chmod g+s ${D}${sbindir}/postqueue
> +	chmod g+s ${D}${sbindir}/postdrop
> +}
> +
> +do_install_append_class-native() {
> +	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/newaliases
> +	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq }
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> +
> +ALTERNATIVE_${PN} =3D "sendmail"
> +ALTERNATIVE_TARGET[sendmail] =3D "${sbindir}/sendmail.postfix"
> +ALTERNATIVE_LINK_NAME[sendmail] =3D "${sbindir}/sendmail"
> +ALTERNATIVE_PRIORITY =3D "120"
> +
> +pkg_postinst_${PN} () {
> +	if [ "x$D" =3D "x" ]; then
> +		touch /etc/aliases
> +		newaliases
> +
> +		# generate virtual_alias, default is hash
> +		touch /etc/postfix/virtual_alias
> +		postmap /etc/postfix/virtual_alias
> +	else
> +		touch $D/etc/aliases
> +		newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
> +		touch $D/etc/postfix/virtual_alias
> +		postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
> +	fi
> +}
> +
> +# Exclude .debug directories from the main package FILES_${PN} =3D
> +"${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
> +               ${exec_prefix}/libexec/postfix/* ${systemd_unitdir}/*"
> +FILES_${PN}-dbg +=3D "${exec_prefix}/libexec/postfix/.debug"
> diff --git a/meta-oe/recipes-extended/postfix/postfix_2.11.1.bb b/meta-oe=
/recipes-
> extended/postfix/postfix_2.11.1.bb
> new file mode 100644
> index 0000000..8f237dc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/postfix/postfix_2.11.1.bb
> @@ -0,0 +1,6 @@
> +require postfix.inc
> +
> +SRC_URI +=3D "file://postfix-add-db6-support.patch"
> +
> +SRC_URI[md5sum] =3D "56ac1f1a79737c4ac1e24535a122a4a6"
> +SRC_URI[sha256sum] =3D "487f98a73b95a5799409caf21ec065efea91c1dcdfb84c03=
8a0e3a265d6489e2"
> --
> 2.0.0


