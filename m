Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHwEr-00085F-GB
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 14:06:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2JCnBhX026034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 05:49:11 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 05:49:10 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 62F647FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 08:48:31 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 18DAB208E6; Tue,
	19 Mar 2013 08:49:10 -0400 (EDT)
Date: Tue, 19 Mar 2013 08:49:10 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130319124909.GA6165@windriver.com>
References: <1363688659-2222-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363688659-2222-1-git-send-email-obi@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: update to current patchlevel
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
X-List-Received-Date: Tue, 19 Mar 2013 13:06:23 -0000
X-Groupsio-MsgNum: 43597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] autofs: update to current patchlevel] On 13.=
03.19 (Tue 11:24) Andreas Oberritter wrote:

> * Apply all patches from ftp.kernel.org/pub/linux/daemons/autofs/v5/patch=
es-5.0.8/
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../autofs-5.0.7-add-symlink-pseudo-option.patch   |  217 +++++++++
>  ...witch_conf-to-not-contain-automount-lines.patch |   50 +++
>  ...s-5.0.7-depricate-nosymlink-pseudo-option.patch |   40 ++
>  ...-5.0.7-document-browse-option-in-man-page.patch |   46 ++
>  ....0.7-dont-fail-on-master-map-self-include.patch |   59 +++
>  ....7-dont-schedule-new-alarms-after-readmap.patch |   69 +++
>  ...ent-d_type-to-filter-out-files-in-scandir.patch |   41 ++
>  ...s-5.0.7-fix-automounter-support-on-parisc.patch |   24 +
>  ...descriptor-leak-when-reloading-the-daemon.patch |  179 ++++++++
>  ...utofs-5.0.7-fix-init-script-status-return.patch |   39 ++
>  .../autofs-5.0.7-fix-libtirpc-build-option.patch   |   66 +++
>  ...-fix-map-entry-duplicate-offset-detection.patch |   37 ++
>  ...ofs-5.0.7-fix-nobind-man-page-description.patch |   46 ++
>  .../autofs-5.0.7-fix-requires-in-spec-file.patch   |   37 ++
>  .../autofs-5.0.7-fix-submount-offset-delete.patch  |   45 ++
>  ...ofs-5.0.7-fix-systemd-unidir-in-spec-file.patch |   72 +++
>  ....7-fix-use-get_proximity-without-libtirpc.patch |   54 +++
>  ...s-5.0.7-fix-wildcard-multi-map-regression.patch |  225 ++++++++++
>  ...e-WITH_LDAP-conditional-around-LDAP-types.patch |  448 ++++++++++++++=
+++++
>  ...-5.0.7-make-yellow-pages-support-optional.patch |   15 +-
>  ...odules-replicated-use-sin6.addr-s6_addr32.patch |   39 ++
>  .../autofs-5.0.7-update-kernel-include-files.patch |   92 ++++
>  ...-protocol-ids-instead-of-protoent-structs.patch |  471 ++++++++++++++=
++++++
>  ...karound-missing-GNU-versionsort-extension.patch |  149 +++++++
>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |   25 +-
>  25 files changed, 2582 insertions(+), 3 deletions(-)

I had started to ask why we wouldn't just update to 5.0.8 directly
instead of patching our way there.  Then I thought I'd look myself and
now I know.  :-)

This is just a simple (and wholesale) integration of the patches already
upstream?  That seems reasonable to me.

-J.

>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-add-symlink-pseudo-option.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-depricate-nosymlink-pseudo-option.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-document-browse-option-in-man-page.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-dont-fail-on-master-map-self-include.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-automounter-support-on-parisc.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-init-script-status-return.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-libtirpc-build-option.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-nobind-man-page-description.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-requires-in-spec-file.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-submount-offset-delete.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-systemd-unidir-in-spec-file.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-fix-wildcard-multi-map-regression.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-update-kernel-include-files.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-add-symlink-pseudo-option.patch b/meta-networking/recipes-daemons/au=
tofs/autofs-5.0.7/autofs-5.0.7-add-symlink-pseudo-option.patch
> new file mode 100644
> index 0000000..b0440f4
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-ad=
d-symlink-pseudo-option.patch
> @@ -0,0 +1,217 @@
> +autofs-5.0.7 - add symlink pseudo option
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +Add a "symlink" pseudo option to tell the bind mount module to symlink
> +instead of bind when mounting mounts other than direct mounts and
> +non-root indirect mount offset mounts (aka. non-root multi-mount
> +entries).
> +---
> + CHANGELOG              |    1 +
> + include/automount.h    |    3 +++
> + lib/master_parse.y     |    8 +++++++-
> + lib/master_tok.l       |    1 +
> + man/auto.master.5.in   |    8 ++++++++
> + modules/mount_autofs.c |    5 +++++
> + modules/mount_bind.c   |   36 +++++++++++++++++++++++++++++++++++-
> + 7 files changed, 60 insertions(+), 2 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index c189483..247d334 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -32,6 +32,7 @@
> + - fix wildcard multi map regression.
> + - fix file descriptor leak when reloading the daemon.
> + - depricate nosymlink pseudo option.
> ++- add symlink pseudo option.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/include/automount.h b/include/automount.h
> +index 37541f5..e72fa0d 100644
> +--- a/include/automount.h
> ++++ b/include/automount.h
> +@@ -455,6 +455,9 @@ struct kernel_mod_version {
> + /* Don't use bind mounts even when system supports them */
> + #define MOUNT_FLAG_NOBIND		0x0020
> +=20
> ++/* Use symlinks instead of bind mounting local mounts */
> ++#define MOUNT_FLAG_SYMLINK		0x0040
> ++
> + struct autofs_point {
> + 	pthread_t thid;
> + 	char *path;			/* Mount point name */
> +diff --git a/lib/master_parse.y b/lib/master_parse.y
> +index f925b5a..11caf5b 100644
> +--- a/lib/master_parse.y
> ++++ b/lib/master_parse.y
> +@@ -57,6 +57,7 @@ static char *type;
> + static char *format;
> + static long timeout;
> + static long negative_timeout;
> ++static unsigned symlnk;
> + static unsigned nobind;
> + static unsigned ghost;
> + extern unsigned global_selection_options;
> +@@ -100,7 +101,7 @@ static int master_fprintf(FILE *, char *, ...);
> + %token COMMENT
> + %token MAP
> + %token OPT_TIMEOUT OPT_NTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VE=
RBOSE
> +-%token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT
> ++%token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK
> + %token COLON COMMA NL DDASH
> + %type <strtype> map
> + %type <strtype> options
> +@@ -186,6 +187,7 @@ line:
> + 	| PATH OPT_USE_WEIGHT { master_notify($1); YYABORT; }
> + 	| PATH OPT_DEBUG { master_notify($1); YYABORT; }
> + 	| PATH OPT_TIMEOUT { master_notify($1); YYABORT; }
> ++	| PATH OPT_SYMLINK { master_notify($1); YYABORT; }
> + 	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
> + 	| PATH OPT_GHOST { master_notify($1); YYABORT; }
> + 	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
> +@@ -557,6 +559,7 @@ option: daemon_option
> +=20
> + daemon_option: OPT_TIMEOUT NUMBER { timeout =3D $2; }
> + 	| OPT_NTIMEOUT NUMBER { negative_timeout =3D $2; }
> ++	| OPT_SYMLINK	{ symlnk =3D 1; }
> + 	| OPT_NOBIND	{ nobind =3D 1; }
> + 	| OPT_NOGHOST	{ ghost =3D 0; }
> + 	| OPT_GHOST	{ ghost =3D 1; }
> +@@ -627,6 +630,7 @@ static void local_init_vars(void)
> + 	debug =3D 0;
> + 	timeout =3D -1;
> + 	negative_timeout =3D 0;
> ++	symlnk =3D 0;
> + 	nobind =3D 0;
> + 	ghost =3D defaults_get_browse_mode();
> + 	random_selection =3D global_selection_options & MOUNT_FLAG_RANDOM_SELE=
CT;
> +@@ -811,6 +815,8 @@ int master_parse_entry(const char *buffer, unsigned =
int default_timeout, unsigne
> + 		entry->ap->flags |=3D MOUNT_FLAG_RANDOM_SELECT;
> + 	if (use_weight)
> + 		entry->ap->flags |=3D MOUNT_FLAG_USE_WEIGHT_ONLY;
> ++	if (symlnk)
> ++		entry->ap->flags |=3D MOUNT_FLAG_SYMLINK;
> + 	if (negative_timeout)
> + 		entry->ap->negative_timeout =3D negative_timeout;
> +=20
> +diff --git a/lib/master_tok.l b/lib/master_tok.l
> +index 30abb15..f9b4e55 100644
> +--- a/lib/master_tok.l
> ++++ b/lib/master_tok.l
> +@@ -361,6 +361,7 @@ OPTNTOUT	(-n{OPTWS}|-n{OPTWS}=3D{OPTWS}|--negative-t=
imeout{OPTWS}|--negative-timeo
> + 		return(NUMBER);
> + 	}
> +=20
> ++	-?symlink		{ return(OPT_SYMLINK); }
> + 	-?nobind		{ return(OPT_NOBIND); }
> + 	-?nobrowse		{ return(OPT_NOGHOST); }
> + 	-g|--ghost|-?browse	{ return(OPT_GHOST); }
> +diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> +index 8007542..bbea43a 100644
> +--- a/man/auto.master.5.in
> ++++ b/man/auto.master.5.in
> +@@ -159,6 +159,14 @@ on individual map entries of both types. Bind mount=
ing of NFS file
> + systems can also be prevented for specific map entrys by adding the
> + "port=3D" mount option to the entries.
> + .TP
> ++.I "symlink"
> ++This option makes bind mounting use a symlink instead of an actual bind
> ++mount. It is an autofs specific option that is a pseudo mount option and
> ++so is given without a leading dash. It may be used with indirect map
> ++entries only, either in the master map (so it effects all map entries)
> ++or with individual map entries. The option is ignored for direct mounts
> ++and non-root offest mount entries.
> ++.TP
> + .I "\-r, \-\-random-multimount-selection"
> + Enables the use of ramdom selection when choosing a host from a
> + list of replicated servers. This option is applied to this mount
> +diff --git a/modules/mount_autofs.c b/modules/mount_autofs.c
> +index ef16020..8c1e600 100644
> +--- a/modules/mount_autofs.c
> ++++ b/modules/mount_autofs.c
> +@@ -51,6 +51,7 @@ int mount_mount(struct autofs_point *ap, const char *r=
oot, const char *name,
> + 	int argc, status;
> + 	int nobind =3D ap->flags & MOUNT_FLAG_NOBIND;
> + 	int ghost =3D ap->flags & MOUNT_FLAG_GHOST;
> ++	int symlnk =3D ap->flags & MOUNT_FLAG_SYMLINK;
> + 	time_t timeout =3D ap->entry->maps->exp_timeout;
> + 	unsigned logopt =3D ap->logopt;
> + 	struct map_type_info *info;
> +@@ -120,6 +121,8 @@ int mount_mount(struct autofs_point *ap, const char =
*root, const char *name,
> + 				nobind =3D 1;
> + 			else if (strncmp(cp, "browse", 6) =3D=3D 0)
> + 				ghost =3D 1;
> ++			else if (strncmp(cp, "symlink", 7) =3D=3D 0)
> ++				symlnk =3D 1;
> + 			else if (strncmp(cp, "timeout=3D", 8) =3D=3D 0) {
> + 				char *val =3D strchr(cp, '=3D');
> + 				unsigned tout;
> +@@ -158,6 +161,8 @@ int mount_mount(struct autofs_point *ap, const char =
*root, const char *name,
> + 	}
> + 	nap =3D entry->ap;
> + 	nap->parent =3D ap;
> ++	if (symlnk)
> ++		nap->flags |=3D MOUNT_FLAG_SYMLINK;
> +=20
> + 	argc =3D 1;
> +=20
> +diff --git a/modules/mount_bind.c b/modules/mount_bind.c
> +index 9bce686..4975294 100644
> +--- a/modules/mount_bind.c
> ++++ b/modules/mount_bind.c
> +@@ -73,10 +73,44 @@ int mount_mount(struct autofs_point *ap, const char =
*root, const char *name, int
> + 	char buf[MAX_ERR_BUF];
> + 	int err;
> + 	int i, len;
> ++	int symlnk =3D (*name !=3D '/' && (ap->flags & MOUNT_FLAG_SYMLINK));
> +=20
> + 	if (ap->flags & MOUNT_FLAG_REMOUNT)
> + 		return 0;
> +=20
> ++	/* Extract "symlink" pseudo-option which forces local filesystems
> ++	 * to be symlinked instead of bound.
> ++	 */
> ++	if (*name !=3D '/' && !symlnk && options) {
> ++		const char *comma;
> ++		int o_len =3D strlen(options) + 1;
> ++
> ++		for (comma =3D options; *comma !=3D '\0';) {
> ++			const char *cp;
> ++			const char *end;
> ++
> ++			while (*comma =3D=3D ',')
> ++				comma++;
> ++
> ++			/* Skip leading white space */
> ++			while (*comma =3D=3D ' ' || *comma =3D=3D '\t')
> ++				comma++;
> ++
> ++			cp =3D comma;
> ++			while (*comma !=3D '\0' && *comma !=3D ',')
> ++				comma++;
> ++
> ++			/* Skip trailing white space */
> ++			end =3D comma - 1;
> ++			while (*comma =3D=3D ' ' || *comma =3D=3D '\t')
> ++				end--;
> ++
> ++			o_len =3D end - cp + 1;
> ++			if (strncmp("symlink", cp, o_len) =3D=3D 0)
> ++				symlnk =3D 1;
> ++		}
> ++	}
> ++
> + 	/* Root offset of multi-mount */
> + 	len =3D strlen(root);
> + 	if (root[len - 1] =3D=3D '/') {
> +@@ -100,7 +134,7 @@ int mount_mount(struct autofs_point *ap, const char =
*root, const char *name, int
> + 	if (options =3D=3D NULL || *options =3D=3D '\0')
> + 		options =3D "defaults";
> +=20
> +-	if (bind_works) {
> ++	if (!symlnk && bind_works) {
> + 		int status, existed =3D 1;
> +=20
> + 		debug(ap->logopt, MODPREFIX "calling mkdir_path %s", fullpath);
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch b/meta-netw=
orking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-nsswitch_conf=
-to-not-contain-automount-lines.patch
> new file mode 100644
> index 0000000..c342d10
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-al=
low-nsswitch_conf-to-not-contain-automount-lines.patch
> @@ -0,0 +1,50 @@
> +autofs-5.0.7 - Allow nsswitch.conf to not contain "automount:" lines
> +
> +From: Michael Tokarev <mjt@tls.msk.ru>
> +
> +Current code does not allow a case when nsswitch.conf
> +does not mention automount map at all, like all new
> +installations.  It logs a rather unpleasant error
> +message instead:
> +
> + syntax error in nsswitch config near [ syntax error ]
> +
> +this patch has a minimal fix, to allo "file" to be empty.
> +
> +Whole parser in C is about 25 lines of code, the "grammar"
> +is trivial, and it is better to ditch all this yacc/lex
> +stuff, but that will be much more intrusive change.
> +
> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> +Cc: 682266@bugs.debian.org
> +---
> +
> + CHANGELOG       |    1 +
> + lib/nss_parse.y |    1 +
> + 2 files changed, 2 insertions(+), 0 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index bd0dd82..16ac2a0 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -16,6 +16,7 @@
> + - increase file map read buffer size.
> + - handle new location of systemd.
> + - fix map entry duplicate offset detection.
> ++- Allow nsswitch.conf to not contain "automount:" lines.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/lib/nss_parse.y b/lib/nss_parse.y
> +index a39fda4..055e9d7 100644
> +--- a/lib/nss_parse.y
> ++++ b/lib/nss_parse.y
> +@@ -72,6 +72,7 @@ file: {
> + 		nss_debug =3D YYDEBUG;
> + #endif
> + 	} sources NL
> ++	| /* empty */
> + 	;
> +=20
> + sources: nss_source
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-depricate-nosymlink-pseudo-option.patch b/meta-networking/recipes-da=
emons/autofs/autofs-5.0.7/autofs-5.0.7-depricate-nosymlink-pseudo-option.pa=
tch
> new file mode 100644
> index 0000000..c784de7
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-de=
pricate-nosymlink-pseudo-option.patch
> @@ -0,0 +1,40 @@
> +autofs-5.0.7 - depricate nosymlink pseudo option
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +The undocumented "nosymlink" option was the only way to force local
> +NFS mounting until the more descriptive "nobind" option was added.
> +
> +So depricate the "nosymlink" option in favour of the "nobind" option.
> +---
> + CHANGELOG           |    1 +
> + modules/mount_nfs.c |    4 ++++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index a7ed212..c189483 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -31,6 +31,7 @@
> + - dont fail on master map self include.
> + - fix wildcard multi map regression.
> + - fix file descriptor leak when reloading the daemon.
> ++- depricate nosymlink pseudo option.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
> +index bbbb1de..e61320b 100644
> +--- a/modules/mount_nfs.c
> ++++ b/modules/mount_nfs.c
> +@@ -125,6 +125,10 @@ int mount_mount(struct autofs_point *ap, const char=
 *root, const char *name, int
> +=20
> + 			o_len =3D end - cp + 1;
> + 			if (strncmp("nosymlink", cp, o_len) =3D=3D 0) {
> ++				warn(ap->logopt, MODPREFIX
> ++				     "the \"nosymlink\" option is depricated "
> ++				     "and will soon be removed, "
> ++				     "use the \"nobind\" option instead");
> + 				nosymlink =3D 1;
> + 			} else if (strncmp("nobind", cp, o_len) =3D=3D 0) {
> + 				nobind =3D 1;
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-document-browse-option-in-man-page.patch b/meta-networking/recipes-d=
aemons/autofs/autofs-5.0.7/autofs-5.0.7-document-browse-option-in-man-page.=
patch
> new file mode 100644
> index 0000000..4641342
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do=
cument-browse-option-in-man-page.patch
> @@ -0,0 +1,46 @@
> +autofs-5.0.7 - document browse option in man page
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +The "browse" option has remained undocumented for a long time.
> +Finally add a section for it to auto.master(5) making special
> +note of the potential performance implications.
> +---
> + CHANGELOG            |    1 +
> + man/auto.master.5.in |   11 +++++++++++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index ecdea0b..d8e4049 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -36,6 +36,7 @@
> + - fix requires in spec file.
> + - fix libtirpc build option to require libtirpc-devel if needed.
> + - fix systemd unidir in spec file.
> ++- document browse option in man page.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> +index bbea43a..c552e56 100644
> +--- a/man/auto.master.5.in
> ++++ b/man/auto.master.5.in
> +@@ -147,6 +147,17 @@ multiple file systems should be mounted (`multimoun=
ts'). If this option
> + is given, no file system is mounted at all if at least one file system
> + can't be mounted.
> + .TP
> ++.I "[no]browse"
> ++This is an autofs specific option that is a pseudo mount option and
> ++so is given without a leading dash. Use of the browse option pre-creates
> ++mount point directories for indirect mount maps so the map keys can be
> ++seen in a directory listing without being mounted. Use of this option
> ++can cause performance problem if the indirect map is large so it should
> ++be used with caution. The internal program default is to enable browse
> ++mode for indirect mounts but the default installed configuration overri=
des
> ++this by setting BROWSE_MODE to "no" because of the potential performance
> ++problem.
> ++.TP
> + .I "nobind"
> + This is an autofs specific option that is a pseudo mount option and
> + so is given without a leading dash. It may be used either in the master
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-dont-fail-on-master-map-self-include.patch b/meta-networking/recipes=
-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-fail-on-master-map-self-incl=
ude.patch
> new file mode 100644
> index 0000000..afb908b
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do=
nt-fail-on-master-map-self-include.patch
> @@ -0,0 +1,59 @@
> +autofs-5.0.7 - dont fail on master map self include
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +When reading the master map a self included file map should skip the sou=
rce
> +and proceed to the next so, in this case, return an nss status that will
> +allow the map read to continue. In particular not NSS_STATUS_UNAVAIL whi=
ch
> +causes the lookup to record a failure or NSS_STATUS_SUCCESS which indica=
tes
> +a successful lookup and termintes the reading of sources.
> +---
> + CHANGELOG             |    1 +
> + modules/lookup_file.c |    7 ++++---
> + 2 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 39388a5..97d6f48 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -28,6 +28,7 @@
> + - make yellow pages support optional.
> + - modules/replicated.c: use sin6_addr.s6_addr32.
> + - workaround missing GNU versionsort extension.
> ++- dont fail on master map self include.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/lookup_file.c b/modules/lookup_file.c
> +index facb305..f37bed9 100644
> +--- a/modules/lookup_file.c
> ++++ b/modules/lookup_file.c
> +@@ -397,8 +397,9 @@ int lookup_read_master(struct master *master, time_t=
 age, void *context)
> + 	unsigned int path_len, ent_len;
> + 	int entry, cur_state;
> +=20
> ++	/* Don't return fail on self include, skip source */
> + 	if (master->recurse)
> +-		return NSS_STATUS_UNAVAIL;
> ++		return NSS_STATUS_TRYAGAIN;
> +=20
> + 	if (master->depth > MAX_INCLUDE_DEPTH) {
> + 		error(logopt, MODPREFIX
> +@@ -443,7 +444,7 @@ int lookup_read_master(struct master *master, time_t=
 age, void *context)
> +=20
> + 			inc =3D check_master_self_include(master, ctxt);
> + 			if (inc)=20
> +-				master->recurse =3D 1;;
> ++				master->recurse =3D 1;
> + 			master->depth++;
> + 			status =3D lookup_nss_read_master(master, age);
> + 			if (!status) {
> +@@ -645,7 +646,7 @@ int lookup_read_map(struct autofs_point *ap, time_t =
age, void *context)
> + 	mc =3D source->mc;
> +=20
> + 	if (source->recurse)
> +-		return NSS_STATUS_UNAVAIL;
> ++		return NSS_STATUS_TRYAGAIN;
> +=20
> + 	if (source->depth > MAX_INCLUDE_DEPTH) {
> + 		error(ap->logopt,
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-dont-schedule-new-alarms-after-readmap.patch b/meta-networking/recip=
es-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-schedule-new-alarms-after-=
readmap.patch
> new file mode 100644
> index 0000000..6444687
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do=
nt-schedule-new-alarms-after-readmap.patch
> @@ -0,0 +1,69 @@
> +autofs-5.0.7 - don't schedule new alarms after readmap
> +
> +From: Leonardo Chiquitto <leonardo.lists@gmail.com>
> +
> +Currently, a new alarm is scheduled every time the daemon receives
> +a SIGHUP (map re-read) or SIGUSR1 (forced expiration). Besides that,
> +map re-reads started on demand when a map is found to be outdated
> +also generate a new alarm.
> +
> +Once added, these alarms are never deleted and hence increase the
> +number of times the daemon wakes up to run the expiration procedure.
> +After a couple of months, in setups with many mount points, it's
> +normal to see automount waking up every second to handle the
> +expiration timer.
> +
> +This patch removes the alarm scheduling from the readmap cleanup
> +routine and makes sure the alarm is re-added after the expiration
> +process only when it was not triggered by SIGUSR1.
> +
> +I couldn't think of any use case to justify keeping these alarms:
> +it's critical to have the alarm ticking every timeout/4 seconds,
> +but more than one periodic alarm running doesn't seem to make
> +sense.
> +---
> +
> + CHANGELOG      |    1 +
> + daemon/state.c |    6 +-----
> + 2 files changed, 2 insertions(+), 5 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index c9be73e..4cf5621 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -22,6 +22,7 @@
> + - fix init script status return.
> + - fix use get_proximity() without libtirpc.
> + - don't use dirent d_type to filter out files in scandir()
> ++- don't schedule new alarms after readmap.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/daemon/state.c b/daemon/state.c
> +index b451c56..6e23022 100644
> +--- a/daemon/state.c
> ++++ b/daemon/state.c
> +@@ -144,7 +144,7 @@ void expire_cleanup(void *arg)
> + 					ap->submount =3D 2;
> + 			}
> +=20
> +-			if (!ap->submount)
> ++			if (ap->state =3D=3D ST_EXPIRE && !ap->submount)
> + 				alarm_add(ap, ap->exp_runfreq);
> +=20
> + 			/* FALLTHROUGH */
> +@@ -330,13 +330,9 @@ static void do_readmap_cleanup(void *arg)
> + 	ap =3D ra->ap;
> +=20
> + 	st_mutex_lock();
> +-
> + 	ap->readmap_thread =3D 0;
> + 	st_set_done(ap);
> +-	if (!ap->submount)
> +-		alarm_add(ap, ap->exp_runfreq);
> + 	st_ready(ap);
> +-
> + 	st_mutex_unlock();
> +=20
> + 	free(ra);
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch b/meta-n=
etworking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-use-dirent-=
d_type-to-filter-out-files-in-scandir.patch
> new file mode 100644
> index 0000000..9c9d99b
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do=
nt-use-dirent-d_type-to-filter-out-files-in-scandir.patch
> @@ -0,0 +1,41 @@
> +autofs-5.0.7 - don't use dirent d_type to filter out files in scandir()
> +
> +From: Leonardo Chiquitto <leonardo.lists@gmail.com>
> +
> +The "d_type" field of a dirent structure is not filled in by all
> +file systems (XFS being one example), so we can't rely on it to
> +check file types.
> +---
> +
> + CHANGELOG            |    1 +
> + modules/lookup_dir.c |    4 ----
> + 2 files changed, 1 insertions(+), 4 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 460bd27..c9be73e 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -21,6 +21,7 @@
> + - fix submount offset delete.
> + - fix init script status return.
> + - fix use get_proximity() without libtirpc.
> ++- don't use dirent d_type to filter out files in scandir()
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/lookup_dir.c b/modules/lookup_dir.c
> +index 658cc29..33901c0 100644
> +--- a/modules/lookup_dir.c
> ++++ b/modules/lookup_dir.c
> +@@ -103,10 +103,6 @@ static int acceptable_dirent_p(const struct dirent =
*e)
> + {
> +   size_t namesz;
> +=20
> +-
> +-  if (!(e->d_type =3D=3D DT_REG || e->d_type =3D=3D DT_LNK))
> +-	  return 0;
> +-
> +   namesz =3D strlen(e->d_name);
> +   if (!namesz)
> + 	  return 0;
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-automounter-support-on-parisc.patch b/meta-networking/recipes-da=
emons/autofs/autofs-5.0.7/autofs-5.0.7-fix-automounter-support-on-parisc.pa=
tch
> new file mode 100644
> index 0000000..e00fdc1
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-automounter-support-on-parisc.patch
> @@ -0,0 +1,24 @@
> +autofs-5.0.7 - fix automounter support on parisc
> +
> +From: Helge Deller <deller@gmx.de>
> +
> +This patch fixes automounter support on the parisc architecture with
> +64-bit kernel and 32-bit userspace.
> +
> +Signed-off-by: Helge Deller <deller@gmx.de>
> +---
> + daemon/automount.c |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/daemon/automount.c b/daemon/automount.c
> +index 4a3eb3d..4c651cf 100644
> +--- a/daemon/automount.c
> ++++ b/daemon/automount.c
> +@@ -610,6 +610,7 @@ static size_t get_kpkt_len(void)
> + 		if (strcmp(un.machine, "alpha") =3D=3D 0 ||
> + 		    strcmp(un.machine, "ia64") =3D=3D 0 ||
> + 		    strcmp(un.machine, "x86_64") =3D=3D 0 ||
> ++		    strcmp(un.machine, "parisc64") =3D=3D 0 ||
> + 		    strcmp(un.machine, "ppc64") =3D=3D 0)
> + 			pkt_len +=3D 4;
> +=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch b/meta-netw=
orking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-file-descriptor=
-leak-when-reloading-the-daemon.patch
> new file mode 100644
> index 0000000..8ce6c0f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-file-descriptor-leak-when-reloading-the-daemon.patch
> @@ -0,0 +1,179 @@
> +autofs-5.0.7 - fix file descriptor leak when reloading the daemon
> +
> +From: Leonardo Chiquitto <leonardo.lists@gmail.com>
> +
> +A customer reported that AutoFS may leak file descriptors when some
> +maps are modified and the daemon reloaded. I'm able to reproduce the
> +problem on 5.0.7 by following these steps:
> +
> +1. Configure a simple direct mount:
> +
> +# cat /etc/auto.master
> +/-	/etc/auto.direct
> +
> +# cat /etc/auto.direct
> +/nfs   server:/nfs
> +
> +2. Start the automounter and do NOT trigger the mount
> +
> +3. Replace /etc/auto.direct with:
> +
> +# cat /etc/auto.direct
> +/nfs/1  server:/nfs
> +/nfs/2  server:/nfs
> +
> +4. Reload:
> +
> +# kill -HUP $(pidof automount)
> +
> +>From now on, every reload will leak a file descriptor:
> +
> +# ls -la /proc/$(pidof automount)/fd | grep /nfs
> +lr-x------ 1 root root 64 Aug 14 22:08 11 -> /nfs
> +lr-x------ 1 root root 64 Aug 14 22:08 12 -> /nfs
> +lr-x------ 1 root root 64 Aug 14 22:08 13 -> /nfs
> +lr-x------ 1 root root 64 Aug 14 22:08 14 -> /nfs
> +lr-x------ 1 root root 64 Aug 14 22:08 5 -> /nfs
> +
> +I've investigated the problem and discovered that the leak happens in
> +do_umount_autofs_direct():
> +
> +- edit imk
> +The same leak is present in umount_autofs_offset() also.
> +Updated patch to cover that too.
> +- end edit
> +
> +int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list
> +*mnts, struct mapent *me)
> +{
> +(...)
> +	if (me->ioctlfd !=3D -1) {
> +		if (tree_is_mounted(mnts, me->key, MNTS_REAL)) {
> +			error(ap->logopt,
> +			      "attempt to umount busy direct mount %s",
> +			      me->key);
> +			return 1;
> +		}
> +		ioctlfd =3D me->ioctlfd;
> +	} else	// ioctlfd =3D=3D -1
> +		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);  <=3D we open it he=
re
> +
> +	if (ioctlfd >=3D 0) {
> +		unsigned int status =3D 1;
> +
> +		rv =3D ops->askumount(ap->logopt, ioctlfd, &status);
> +				/// at this point, rv =3D=3D 0 and status =3D=3D 0
> +		if (rv) {
> +			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
> +			error(ap->logopt, "ioctl failed: %s", estr);
> +			return 1;
> +		} else if (!status) {
> +				/// at this point, ap->state =3D=3D ST_READMAP
> +			if (ap->state !=3D ST_SHUTDOWN_FORCE) {
> +				error(ap->logopt,
> +				      "ask umount returned busy for %s",
> +				      me->key);
> +				return 1;			<=3D we return here, without closing the fd
> +			} else {
> +				me->ioctlfd =3D -1;
> +				ops->catatonic(ap->logopt, ioctlfd);
> +				ops->close(ap->logopt, ioctlfd);
> +				goto force_umount;
> +			}
> +(...)
> +---
> + CHANGELOG       |    1 +
> + daemon/direct.c |   19 ++++++++++++++++---
> + 2 files changed, 17 insertions(+), 3 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 46ef335..a7ed212 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -30,6 +30,7 @@
> + - workaround missing GNU versionsort extension.
> + - dont fail on master map self include.
> + - fix wildcard multi map regression.
> ++- fix file descriptor leak when reloading the daemon.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/daemon/direct.c b/daemon/direct.c
> +index 3e09c5d..228a666 100644
> +--- a/daemon/direct.c
> ++++ b/daemon/direct.c
> +@@ -86,7 +86,8 @@ int do_umount_autofs_direct(struct autofs_point *ap, s=
truct mnt_list *mnts, stru
> + {
> + 	struct ioctl_ops *ops =3D get_ioctl_ops();
> + 	char buf[MAX_ERR_BUF];
> +-	int ioctlfd, rv, left, retries;
> ++	int ioctlfd =3D -1, rv, left, retries;
> ++	int opened =3D 0;
> +=20
> + 	left =3D umount_multi(ap, me->key, 0);
> + 	if (left) {
> +@@ -103,8 +104,10 @@ int do_umount_autofs_direct(struct autofs_point *ap=
, struct mnt_list *mnts, stru
> + 			return 1;
> + 		}
> + 		ioctlfd =3D me->ioctlfd;
> +-	} else
> ++	} else {
> + 		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);
> ++		opened =3D 1;
> ++	}
> +=20
> + 	if (ioctlfd >=3D 0) {
> + 		unsigned int status =3D 1;
> +@@ -113,12 +116,16 @@ int do_umount_autofs_direct(struct autofs_point *a=
p, struct mnt_list *mnts, stru
> + 		if (rv) {
> + 			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
> + 			error(ap->logopt, "ioctl failed: %s", estr);
> ++			if (opened && ioctlfd !=3D -1)
> ++				ops->close(ap->logopt, ioctlfd);
> + 			return 1;
> + 		} else if (!status) {
> + 			if (ap->state !=3D ST_SHUTDOWN_FORCE) {
> + 				error(ap->logopt,
> + 				      "ask umount returned busy for %s",
> + 				      me->key);
> ++				if (opened && ioctlfd !=3D -1)
> ++					ops->close(ap->logopt, ioctlfd);
> + 				return 1;
> + 			} else {
> + 				me->ioctlfd =3D -1;
> +@@ -536,7 +543,8 @@ int umount_autofs_offset(struct autofs_point *ap, st=
ruct mapent *me)
> + {
> + 	struct ioctl_ops *ops =3D get_ioctl_ops();
> + 	char buf[MAX_ERR_BUF];
> +-	int ioctlfd, rv =3D 1, retries;
> ++	int ioctlfd =3D -1, rv =3D 1, retries;
> ++	int opened =3D 0;
> +=20
> + 	if (me->ioctlfd !=3D -1) {
> + 		if (is_mounted(_PATH_MOUNTED, me->key, MNTS_REAL)) {
> +@@ -554,6 +562,7 @@ int umount_autofs_offset(struct autofs_point *ap, st=
ruct mapent *me)
> + 			return 0;
> + 		}
> + 		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);
> ++		opened =3D 1;
> + 	}
> +=20
> + 	if (ioctlfd >=3D 0) {
> +@@ -563,6 +572,8 @@ int umount_autofs_offset(struct autofs_point *ap, st=
ruct mapent *me)
> + 		if (rv) {
> + 			char *estr =3D strerror_r(errno, buf, MAX_ERR_BUF);
> + 			logerr("ioctl failed: %s", estr);
> ++			if (opened && ioctlfd !=3D -1)
> ++				ops->close(ap->logopt, ioctlfd);
> + 			return 1;
> + 		} else if (!status) {
> + 			if (ap->state !=3D ST_SHUTDOWN_FORCE) {
> +@@ -570,6 +581,8 @@ int umount_autofs_offset(struct autofs_point *ap, st=
ruct mapent *me)
> + 					error(ap->logopt,
> + 					     "ask umount returned busy for %s",
> + 					     me->key);
> ++				if (opened && ioctlfd !=3D -1)
> ++					ops->close(ap->logopt, ioctlfd);
> + 				return 1;
> + 			} else {
> + 				me->ioctlfd =3D -1;
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-init-script-status-return.patch b/meta-networking/recipes-daemon=
s/autofs/autofs-5.0.7/autofs-5.0.7-fix-init-script-status-return.patch
> new file mode 100644
> index 0000000..a08d62f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-init-script-status-return.patch
> @@ -0,0 +1,39 @@
> +autofs-5.0.7 - fix init script status return
> +
> +From: Ian Kent <ikent@redhat.com>
> +
> +The patch that added the piddir to configure to fix incorrect init
> +script status() function returns failed to actually return the value
> +to the user.
> +---
> +
> + CHANGELOG             |    1 +
> + redhat/autofs.init.in |    2 +-
> + 2 files changed, 2 insertions(+), 1 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 76c1f73..5bcb1af 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -19,6 +19,7 @@
> + - Allow nsswitch.conf to not contain "automount:" lines.
> + - fix nobind man page description.
> + - fix submount offset delete.
> ++- fix init script status return.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
> +index fe18b3e..9d008ff 100644
> +--- a/redhat/autofs.init.in
> ++++ b/redhat/autofs.init.in
> +@@ -172,7 +172,7 @@ RETVAL=3D0
> + case "$1" in
> + 	status)
> + 		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
> +-		exit 0;
> ++		exit $?;
> + 		;;
> + 	usage)
> + 		usage_message
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-libtirpc-build-option.patch b/meta-networking/recipes-daemons/au=
tofs/autofs-5.0.7/autofs-5.0.7-fix-libtirpc-build-option.patch
> new file mode 100644
> index 0000000..8ad2afa
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-libtirpc-build-option.patch
> @@ -0,0 +1,66 @@
> +autofs-5.0.7 - fix libtirpc build option
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +
> +---
> + CHANGELOG   |    1 +
> + autofs.spec |   17 ++++++++++++++++-
> + 2 files changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index e848bcd..b6b2679 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -34,6 +34,7 @@
> + - depricate nosymlink pseudo option.
> + - add symlink pseudo option.
> + - fix requires in spec file.
> ++- fix libtirpc build option to require libtirpc-devel if needed.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/autofs.spec b/autofs.spec
> +index 703f7a9..f77acc1 100644
> +--- a/autofs.spec
> ++++ b/autofs.spec
> +@@ -12,6 +12,10 @@
> + # disable them.
> + %define with_systemd        %{?_without_systemd:        0} %{?!_without=
_systemd:        1}
> +=20
> ++# Use --without libtirpc in your rpmbuild command or force values to 0 =
to
> ++# disable them.
> ++%define with_libtirpc        %{?_without_libtirpc:        0} %{?!_witho=
ut_libtirpc:        1}
> ++
> + Summary: A tool from automatically mounting and umounting filesystems.
> + Name: autofs
> + %define version 5.0.7
> +@@ -25,6 +29,9 @@ Buildroot: %{_tmppath}/%{name}-tmp
> + %if %{with_systemd}
> + BuildRequires: systemd-units
> + %endif
> ++%if %{with_libtirpc}
> ++BuildRequires: libtirpc-devel
> ++%endif
> + BuildRequires: autoconf, hesiod-devel, openldap-devel, bison, flex, cyr=
us-sasl-devel
> + Requires: chkconfig
> + Requires: /bin/bash mktemp sed textutils sh-utils grep /bin/ps
> +@@ -72,9 +79,17 @@ echo %{version}-%{release} > .version
> +   %define _unitdir %{?_unitdir:/lib/systemd/system}
> +   %define systemd_configure_arg --with-systemd
> + %endif
> ++%if %{with_libtirpc}
> ++  %define libtirpc_configure_arg --with-libtirpc
> ++%endif
> +=20
> + %build
> +-CFLAGS=3D"$RPM_OPT_FLAGS -Wall" ./configure --libdir=3D%{_libdir} --dis=
able-mount-locking --enable-ignore-busy --with-libtirpc %{?systemd_configur=
e_arg:}
> ++CFLAGS=3D"$RPM_OPT_FLAGS -Wall" \
> ++./configure --libdir=3D%{_libdir} \
> ++	--disable-mount-locking \
> ++	--enable-ignore-busy \
> ++	%{?systemd_configure_arg:} \
> ++	%{?libtirpc_configure_arg:}
> + CFLAGS=3D"$RPM_OPT_FLAGS -Wall" make initdir=3D/etc/rc.d/init.d DONTSTR=
IP=3D1
> +=20
> + %install
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-map-entry-duplicate-offset-detection.patch b/meta-networking/rec=
ipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-map-entry-duplicate-offse=
t-detection.patch
> new file mode 100644
> index 0000000..126d9a2
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-map-entry-duplicate-offset-detection.patch
> @@ -0,0 +1,37 @@
> +autofs-5.0.7 - fix map entry duplicate offset detection
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +Recent changes broke the detection of duplicate offsets in map entries.
> +---
> +
> + CHANGELOG   |    1 +
> + lib/cache.c |    2 +-
> + 2 files changed, 2 insertions(+), 1 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 8f6bb3a..bd0dd82 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -15,6 +15,7 @@
> + - fix recursive mount deadlock.
> + - increase file map read buffer size.
> + - handle new location of systemd.
> ++- fix map entry duplicate offset detection.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/lib/cache.c b/lib/cache.c
> +index 9179ad5..1e05a99 100644
> +--- a/lib/cache.c
> ++++ b/lib/cache.c
> +@@ -659,7 +659,7 @@ int cache_update_offset(struct mapent_cache *mc, con=
st char *mkey, const char *k
> +=20
> + 	me =3D cache_lookup_distinct(mc, key);
> + 	if (me && me->age =3D=3D age) {
> +-		if (me->multi !=3D owner)
> ++		if (me->multi =3D=3D owner)
> + 			return CHE_DUPLICATE;
> + 	}
> +=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-nobind-man-page-description.patch b/meta-networking/recipes-daem=
ons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-man-page-description.patch
> new file mode 100644
> index 0000000..41328a0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-nobind-man-page-description.patch
> @@ -0,0 +1,46 @@
> +autofs-5.0.7 - fix nobind man page description
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +Update auto.master(5) to better describe the behavior of the "nobind"
> +option when used with direct mounts maps.
> +---
> +
> + CHANGELOG            |    1 +
> + man/auto.master.5.in |   10 +++++++---
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 16ac2a0..7eb7235 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -17,6 +17,7 @@
> + - handle new location of systemd.
> + - fix map entry duplicate offset detection.
> + - Allow nsswitch.conf to not contain "automount:" lines.
> ++- fix nobind man page description.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/man/auto.master.5.in b/man/auto.master.5.in
> +index 21d7544..8007542 100644
> +--- a/man/auto.master.5.in
> ++++ b/man/auto.master.5.in
> +@@ -151,9 +151,13 @@ can't be mounted.
> + This is an autofs specific option that is a pseudo mount option and
> + so is given without a leading dash. It may be used either in the master
> + map entry (so it effects all the map entries) or with individual map
> +-entries to prevent bind mounting of local NFS filesystems. Bind mounting
> +-of NFS file systems can also be prevented for specific map entrys by
> +-adding the "port=3D" mount option to the entries.
> ++entries to prevent bind mounting of local NFS filesystems. For direct
> ++mount maps the option is only effective if specified on the first direct
> ++map entry and is applied to all direct mount maps in the master map. It
> ++is ignored if given on subsequent direct map entries. It may be used
> ++on individual map entries of both types. Bind mounting of NFS file
> ++systems can also be prevented for specific map entrys by adding the
> ++"port=3D" mount option to the entries.
> + .TP
> + .I "\-r, \-\-random-multimount-selection"
> + Enables the use of ramdom selection when choosing a host from a
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-requires-in-spec-file.patch b/meta-networking/recipes-daemons/au=
tofs/autofs-5.0.7/autofs-5.0.7-fix-requires-in-spec-file.patch
> new file mode 100644
> index 0000000..404c848
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-requires-in-spec-file.patch
> @@ -0,0 +1,37 @@
> +autofs-5.0.7 - fix requires in spec file
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +Fix the use of depricated reqires in tar spec file.
> +---
> + CHANGELOG   |    1 +
> + autofs.spec |    4 ++--
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 247d334..e848bcd 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -33,6 +33,7 @@
> + - fix file descriptor leak when reloading the daemon.
> + - depricate nosymlink pseudo option.
> + - add symlink pseudo option.
> ++- fix requires in spec file.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/autofs.spec b/autofs.spec
> +index b8a3b7a..703f7a9 100644
> +--- a/autofs.spec
> ++++ b/autofs.spec
> +@@ -25,8 +25,8 @@ Buildroot: %{_tmppath}/%{name}-tmp
> + %if %{with_systemd}
> + BuildRequires: systemd-units
> + %endif
> +-BuildPrereq: autoconf, hesiod-devel, openldap-devel, bison, flex, cyrus=
-sasl-devel
> +-Prereq: chkconfig
> ++BuildRequires: autoconf, hesiod-devel, openldap-devel, bison, flex, cyr=
us-sasl-devel
> ++Requires: chkconfig
> + Requires: /bin/bash mktemp sed textutils sh-utils grep /bin/ps
> + %if %{with_systemd}
> + Requires(post): systemd-sysv
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-submount-offset-delete.patch b/meta-networking/recipes-daemons/a=
utofs/autofs-5.0.7/autofs-5.0.7-fix-submount-offset-delete.patch
> new file mode 100644
> index 0000000..b38e214
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-submount-offset-delete.patch
> @@ -0,0 +1,45 @@
> +autofs-5.0.7 - fix submount offset delete
> +
> +From: Ian Kent <ikent@redhat.com>
> +
> +As part of the implementation to allow for limited update of
> +the internal hosts map by using a HUP signal some code that
> +deleted any offset entries from the cache on lookup was removed
> +as it appeared to not be needed.
> +
> +There is however a case where it is needed to avoid a duplicate
> +cache entry failure on lookup.
> +---
> +
> + CHANGELOG          |    1 +
> + daemon/automount.c |    4 ++--
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 7eb7235..76c1f73 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -18,6 +18,7 @@
> + - fix map entry duplicate offset detection.
> + - Allow nsswitch.conf to not contain "automount:" lines.
> + - fix nobind man page description.
> ++- fix submount offset delete.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/daemon/automount.c b/daemon/automount.c
> +index e56f9e1..4a3eb3d 100644
> +--- a/daemon/automount.c
> ++++ b/daemon/automount.c
> +@@ -544,8 +544,8 @@ int umount_multi(struct autofs_point *ap, const char=
 *path, int incl)
> + 	 * If we are a submount we need to umount any offsets our
> + 	 * parent may have mounted over top of us.
> + 	 */
> +-	/*if (ap->submount)
> +-		left +=3D umount_subtree_mounts(ap->parent, path, is_autofs_fs);*/
> ++	if (ap->submount)
> ++		left +=3D umount_subtree_mounts(ap->parent, path, is_autofs_fs);
> +=20
> + 	left +=3D umount_subtree_mounts(ap, path, is_autofs_fs);
> +=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-systemd-unidir-in-spec-file.patch b/meta-networking/recipes-daem=
ons/autofs/autofs-5.0.7/autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch
> new file mode 100644
> index 0000000..d856faf
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-systemd-unidir-in-spec-file.patch
> @@ -0,0 +1,72 @@
> +autofs-5.0.7 - fix systemd unidir in spec file
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +
> +---
> + CHANGELOG   |    1 +
> + autofs.spec |   16 ++++++++--------
> + 2 files changed, 9 insertions(+), 8 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index b6b2679..ecdea0b 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -35,6 +35,7 @@
> + - add symlink pseudo option.
> + - fix requires in spec file.
> + - fix libtirpc build option to require libtirpc-devel if needed.
> ++- fix systemd unidir in spec file.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/autofs.spec b/autofs.spec
> +index f77acc1..a768e44 100644
> +--- a/autofs.spec
> ++++ b/autofs.spec
> +@@ -76,7 +76,7 @@ inkludera n
> + %setup -q
> + echo %{version}-%{release} > .version
> + %if %{with_systemd}
> +-  %define _unitdir %{?_unitdir:/lib/systemd/system}
> ++  %define unitdir %{?_unitdir:/lib/systemd/system}
> +   %define systemd_configure_arg --with-systemd
> + %endif
> + %if %{with_libtirpc}
> +@@ -95,7 +95,7 @@ CFLAGS=3D"$RPM_OPT_FLAGS -Wall" make initdir=3D/etc/rc=
=2Ed/init.d DONTSTRIP=3D1
> + %install
> + rm -rf $RPM_BUILD_ROOT
> + %if %{with_systemd}
> +-install -d -m 755 $RPM_BUILD_ROOT%{_unitdir}
> ++install -d -m 755 $RPM_BUILD_ROOT%{unitdir}
> + %else
> + mkdir -p -m755 $RPM_BUILD_ROOT/etc/rc.d/init.d
> + %endif
> +@@ -109,9 +109,13 @@ make install mandir=3D%{_mandir} initdir=3D/etc/rc.=
d/init.d INSTALLROOT=3D$RPM_BUILD_R
> + echo make -C redhat
> + make -C redhat
> + %if %{with_systemd}
> +-install -m 644 redhat/autofs.service $RPM_BUILD_ROOT%{_unitdir}/autofs.=
service
> ++# Configure can get this wrong when the unit files appear under /lib an=
d /usr/lib
> ++find $RPM_BUILD_ROOT -type f -name autofs.service -exec rm -f {} \;
> ++install -m 644 redhat/autofs.service $RPM_BUILD_ROOT%{unitdir}/autofs.s=
ervice
> ++%define init_file_name %{unitdir}/autofs.service
> + %else
> + install -m 755 redhat/autofs.init $RPM_BUILD_ROOT/etc/rc.d/init.d/autofs
> ++%define init_file_name /etc/rc.d/init.d/autofs
> + %endif
> + install -m 644 redhat/autofs.sysconfig $RPM_BUILD_ROOT/etc/sysconfig/au=
tofs
> +=20
> +@@ -170,11 +174,7 @@ fi
> + %files
> + %defattr(-,root,root)
> + %doc CREDITS CHANGELOG INSTALL COPY* README* samples/ldap* samples/auto=
fs.schema samples/autofs_ldap_auth.conf
> +-%if %{with_systemd}
> +-%{_unitdir}/autofs.service
> +-%else
> +-%config /etc/rc.d/init.d/autofs
> +-%endif
> ++%config %{init_file_name}
> + %config(noreplace) /etc/auto.master
> + %config(noreplace,missingok) /etc/auto.misc
> + %config(noreplace,missingok) /etc/auto.net
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-use-get_proximity-without-libtirpc.patch b/meta-networking/recip=
es-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-get_proximity-without-l=
ibtirpc.patch
> new file mode 100644
> index 0000000..74ed8fa
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-use-get_proximity-without-libtirpc.patch
> @@ -0,0 +1,54 @@
> +autofs-5.0.7 - fix use get_proximity() without libtirpc
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +If autofs is not using libtirpc and there are any configured IPv6
> +interfaces then get_proximity() will fail with PROXIMITY_UNSUPPORTED.
> +
> +In this case when checking interfaces the IPv6 interfaces need to be
> +ignored.
> +---
> +
> + CHANGELOG            |    1 +
> + modules/replicated.c |    8 ++------
> + 2 files changed, 3 insertions(+), 6 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 5bcb1af..460bd27 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -20,6 +20,7 @@
> + - fix nobind man page description.
> + - fix submount offset delete.
> + - fix init script status return.
> ++- fix use get_proximity() without libtirpc.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/replicated.c b/modules/replicated.c
> +index bd6003b..6b96320 100644
> +--- a/modules/replicated.c
> ++++ b/modules/replicated.c
> +@@ -184,9 +184,7 @@ static unsigned int get_proximity(struct sockaddr *h=
ost_addr)
> + 			break;
> +=20
> + 		case AF_INET6:
> +-#ifndef WITH_LIBTIRPC
> +-			return PROXIMITY_UNSUPPORTED;
> +-#else
> ++#ifdef WITH_LIBTIRPC
> + 			if (host_addr->sa_family =3D=3D AF_INET)
> + 				break;
> + 			if6_addr =3D (struct sockaddr_in6 *) this->ifa_addr;
> +@@ -251,9 +249,7 @@ static unsigned int get_proximity(struct sockaddr *h=
ost_addr)
> + 			break;
> +=20
> + 		case AF_INET6:
> +-#ifndef WITH_LIBTIRPC
> +-			return PROXIMITY_UNSUPPORTED;
> +-#else
> ++#ifdef WITH_LIBTIRPC
> + 			if (host_addr->sa_family =3D=3D AF_INET)
> + 				break;
> + 			if6_addr =3D (struct sockaddr_in6 *) this->ifa_addr;
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-fix-wildcard-multi-map-regression.patch b/meta-networking/recipes-da=
emons/autofs/autofs-5.0.7/autofs-5.0.7-fix-wildcard-multi-map-regression.pa=
tch
> new file mode 100644
> index 0000000..44e4a18
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fi=
x-wildcard-multi-map-regression.patch
> @@ -0,0 +1,225 @@
> +autofs-5.0.7 - fix wildcard multi map regression
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +A recent patch that removed code to add the current map entry when
> +being parsed if it didn't already exist cause wildcard indirect
> +multi-mount map entries to fail to mount.
> +
> +Indirect multi-mount map entries need the entry matched by a wildcard
> +lookup to be added to the map entry cache because subsequent operations
> +expect a distinct map entry to be present or they will fail. This is
> +what the code that was removed did but it did so in the wrong place
> +which caused a deadlock situation.
> +---
> + CHANGELOG                |    1 +
> + modules/lookup_file.c    |   23 ++++++++++++++++-------
> + modules/lookup_ldap.c    |   19 +++++++++++++++----
> + modules/lookup_nisplus.c |   21 ++++++++++++++++-----
> + modules/lookup_sss.c     |   17 ++++++++++++++---
> + modules/lookup_yp.c      |   21 ++++++++++++++++-----
> + 6 files changed, 78 insertions(+), 24 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 97d6f48..46ef335 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -29,6 +29,7 @@
> + - modules/replicated.c: use sin6_addr.s6_addr32.
> + - workaround missing GNU versionsort extension.
> + - dont fail on master map self include.
> ++- fix wildcard multi map regression.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/lookup_file.c b/modules/lookup_file.c
> +index f37bed9..65e5ee6 100644
> +--- a/modules/lookup_file.c
> ++++ b/modules/lookup_file.c
> +@@ -1040,7 +1040,7 @@ int lookup_mount(struct autofs_point *ap, const ch=
ar *name, int name_len, void *
> + 			return NSS_STATUS_UNAVAIL;
> + 		}
> +=20
> +-		cache_readlock(mc);
> ++		cache_writelock(mc);
> + 		me =3D cache_lookup_first(mc);
> + 		if (me && st.st_mtime <=3D me->age) {
> + 			/*
> +@@ -1082,7 +1082,7 @@ int lookup_mount(struct autofs_point *ap, const ch=
ar *name, int name_len, void *
> + 		}
> + 	}
> +=20
> +-	cache_readlock(mc);
> ++	cache_writelock(mc);
> + do_cache_lookup:
> + 	me =3D cache_lookup(mc, key);
> + 	/*
> +@@ -1098,11 +1098,20 @@ do_cache_lookup:
> + 		if (!me)
> + 			me =3D cache_lookup_distinct(mc, "*");
> + 	}
> +-	if (me && me->mapent && (me->source =3D=3D source || *me->key =3D=3D '=
/')) {
> +-		pthread_cleanup_push(cache_lock_cleanup, mc);
> +-		strcpy(mapent_buf, me->mapent);
> +-		mapent =3D mapent_buf;
> +-		pthread_cleanup_pop(0);
> ++	if (me && me->mapent) {
> ++		/*
> ++		 * Add wildcard match for later validation checks and
> ++		 * negative cache lookups.
> ++		 */
> ++		if (ap->type =3D=3D LKP_INDIRECT && *me->key =3D=3D '*') {
> ++			ret =3D cache_update(mc, source, key, me->mapent, me->age);
> ++			if (!(ret & (CHE_OK | CHE_UPDATED)))
> ++				me =3D NULL;
> ++		}
> ++		if (me && (me->source =3D=3D source || *me->key =3D=3D '/')) {
> ++			strcpy(mapent_buf, me->mapent);
> ++			mapent =3D mapent_buf;
> ++		}
> + 	}
> + 	cache_unlock(mc);
> +=20
> +diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> +index 431e50d..83e3215 100644
> +--- a/modules/lookup_ldap.c
> ++++ b/modules/lookup_ldap.c
> +@@ -2969,7 +2969,7 @@ int lookup_mount(struct autofs_point *ap, const ch=
ar *name, int name_len, void *
> + 			return status;
> + 	}
> +=20
> +-	cache_readlock(mc);
> ++	cache_writelock(mc);
> + 	me =3D cache_lookup(mc, key);
> + 	/* Stale mapent =3D> check for entry in alternate source or wildcard */
> + 	if (me && !me->mapent) {
> +@@ -2979,9 +2979,20 @@ int lookup_mount(struct autofs_point *ap, const c=
har *name, int name_len, void *
> + 		if (!me)
> + 			me =3D cache_lookup_distinct(mc, "*");
> + 	}
> +-	if (me && me->mapent && (me->source =3D=3D source || *me->key =3D=3D '=
/')) {
> +-		strcpy(mapent_buf, me->mapent);
> +-		mapent =3D mapent_buf;
> ++	if (me && me->mapent) {
> ++		/*
> ++		 * Add wildcard match for later validation checks and
> ++		 * negative cache lookups.
> ++		 */
> ++		if (ap->type =3D=3D LKP_INDIRECT && *me->key =3D=3D '*') {
> ++			ret =3D cache_update(mc, source, key, me->mapent, me->age);
> ++			if (!(ret & (CHE_OK | CHE_UPDATED)))
> ++				me =3D NULL;
> ++		}
> ++		if (me && (me->source =3D=3D source || *me->key =3D=3D '/')) {
> ++			strcpy(mapent_buf, me->mapent);
> ++			mapent =3D mapent_buf;
> ++		}
> + 	}
> + 	cache_unlock(mc);
> +=20
> +diff --git a/modules/lookup_nisplus.c b/modules/lookup_nisplus.c
> +index 9fced96..8237a1e 100644
> +--- a/modules/lookup_nisplus.c
> ++++ b/modules/lookup_nisplus.c
> +@@ -561,7 +561,7 @@ int lookup_mount(struct autofs_point *ap, const char=
 *name, int name_len, void *
> + 			return status;
> + 	}
> +=20
> +-	cache_readlock(mc);
> ++	cache_writelock(mc);
> + 	me =3D cache_lookup(mc, key);
> + 	/* Stale mapent =3D> check for entry in alternate source or wildcard */
> + 	if (me && !me->mapent) {
> +@@ -571,10 +571,21 @@ int lookup_mount(struct autofs_point *ap, const ch=
ar *name, int name_len, void *
> + 		if (!me)
> + 			me =3D cache_lookup_distinct(mc, "*");
> + 	}
> +-	if (me && me->mapent && (me->source =3D=3D source || *me->key =3D=3D '=
/')) {
> +-		mapent_len =3D strlen(me->mapent);
> +-		mapent =3D malloc(mapent_len + 1);
> +-		strcpy(mapent, me->mapent);
> ++	if (me && me->mapent) {
> ++		/*
> ++		 * Add wildcard match for later validation checks and
> ++		 * negative cache lookups.
> ++		 */
> ++		if (ap->type =3D=3D LKP_INDIRECT && *me->key =3D=3D '*') {
> ++			ret =3D cache_update(mc, source, key, me->mapent, me->age);
> ++			if (!(ret & (CHE_OK | CHE_UPDATED)))
> ++				me =3D NULL;
> ++		}
> ++		if (me && (me->source =3D=3D source || *me->key =3D=3D '/')) {
> ++			mapent_len =3D strlen(me->mapent);
> ++			mapent =3D malloc(mapent_len + 1);
> ++			strcpy(mapent, me->mapent);
> ++		}
> + 	}
> + 	cache_unlock(mc);
> +=20
> +diff --git a/modules/lookup_sss.c b/modules/lookup_sss.c
> +index e0b84cc..5c2ed0a 100644
> +--- a/modules/lookup_sss.c
> ++++ b/modules/lookup_sss.c
> +@@ -645,9 +645,20 @@ int lookup_mount(struct autofs_point *ap, const cha=
r *name, int name_len, void *
> + 		if (!me)
> + 			me =3D cache_lookup_distinct(mc, "*");
> + 	}
> +-	if (me && me->mapent && (me->source =3D=3D source || *me->key =3D=3D '=
/')) {
> +-		strcpy(mapent_buf, me->mapent);
> +-		mapent =3D mapent_buf;
> ++	if (me && me->mapent) {
> ++		/*
> ++		 * Add wildcard match for later validation checks and
> ++		 * negative cache lookups.
> ++		 */
> ++		if (ap->type =3D=3D LKP_INDIRECT && *me->key =3D=3D '*') {
> ++			ret =3D cache_update(mc, source, key, me->mapent, me->age);
> ++			if (!(ret & (CHE_OK | CHE_UPDATED)))
> ++				me =3D NULL;
> ++		}
> ++		if (me && (me->source =3D=3D source || *me->key =3D=3D '/')) {
> ++			strcpy(mapent_buf, me->mapent);
> ++			mapent =3D mapent_buf;
> ++		}
> + 	}
> + 	cache_unlock(mc);
> +=20
> +diff --git a/modules/lookup_yp.c b/modules/lookup_yp.c
> +index 720df2e..a716e1f 100644
> +--- a/modules/lookup_yp.c
> ++++ b/modules/lookup_yp.c
> +@@ -662,7 +662,7 @@ int lookup_mount(struct autofs_point *ap, const char=
 *name, int name_len, void *
> + 			return status;
> + 	}
> +=20
> +-	cache_readlock(mc);
> ++	cache_writelock(mc);
> + 	me =3D cache_lookup(mc, key);
> + 	/* Stale mapent =3D> check for entry in alternate source or wildcard */
> + 	if (me && !me->mapent) {
> +@@ -672,10 +672,21 @@ int lookup_mount(struct autofs_point *ap, const ch=
ar *name, int name_len, void *
> + 		if (!me)
> + 			me =3D cache_lookup_distinct(mc, "*");
> + 	}
> +-	if (me && me->mapent && (me->source =3D=3D source || *me->key =3D=3D '=
/')) {
> +-		mapent_len =3D strlen(me->mapent);
> +-		mapent =3D alloca(mapent_len + 1);
> +-		strcpy(mapent, me->mapent);
> ++	if (me && me->mapent) {
> ++		/*
> ++		 * Add wildcard match for later validation checks and
> ++		 * negative cache lookups.
> ++		 */
> ++		if (ap->type =3D=3D LKP_INDIRECT && *me->key =3D=3D '*') {
> ++			ret =3D cache_update(mc, source, key, me->mapent, me->age);
> ++			if (!(ret & (CHE_OK | CHE_UPDATED)))
> ++				me =3D NULL;
> ++		}
> ++		if (me && (me->source =3D=3D source || *me->key =3D=3D '/')) {
> ++			mapent_len =3D strlen(me->mapent);
> ++			mapent =3D alloca(mapent_len + 1);
> ++			strcpy(mapent, me->mapent);
> ++		}
> + 	}
> + 	cache_unlock(mc);
> +=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch b/met=
a-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-lib-defaults-=
use-WITH_LDAP-conditional-around-LDAP-types.patch
> new file mode 100644
> index 0000000..22e0418
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-li=
b-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch
> @@ -0,0 +1,448 @@
> +autofs-5.0.7 - lib/defaults.c: use WITH_LDAP conditional around LDAP typ=
es
> +
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +Wrap the inclusion of lookup_ldap.h and functions that use ldap_uri or
> +ldap_schema with the WITH_LDAP conditional. WITH_LDAP is set by the
> +configure step when LDAP support is not desired. This also allows
> +compilation on a system that doesn't have any LDAP libraries.
> +---
> +
> + CHANGELOG             |    1=20
> + include/defaults.h    |   14 +-
> + include/lookup_ldap.h |    1=20
> + lib/defaults.c        |  325 +++++++++++++++++++++++++-----------------=
-------
> + modules/lookup_ldap.c |    1=20
> + 5 files changed, 175 insertions(+), 167 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index ba1d65b..1130db6 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -24,6 +24,7 @@
> + - don't use dirent d_type to filter out files in scandir()
> + - don't schedule new alarms after readmap.
> + - use numeric protocol ids instead of protoent structs.
> ++- lib/defaults.c: use WITH_LDAP conditional around LDAP types.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/include/defaults.h b/include/defaults.h
> +index cda2174..871e14b 100644
> +--- a/include/defaults.h
> ++++ b/include/defaults.h
> +@@ -44,8 +44,16 @@
> +=20
> + #define DEFAULT_MAP_HASH_TABLE_SIZE	1024
> +=20
> ++#ifdef WITH_LDAP
> + struct ldap_schema;
> + struct ldap_searchdn;
> ++void defaults_free_uris(struct list_head *);
> ++struct list_head *defaults_get_uris(void);
> ++struct ldap_schema *defaults_get_default_schema(void);
> ++void defaults_free_searchdns(struct ldap_searchdn *);
> ++struct ldap_searchdn *defaults_get_searchdns(void);
> ++struct ldap_schema *defaults_get_schema(void);
> ++#endif
> +=20
> + unsigned int defaults_read_config(unsigned int);
> + const char *defaults_get_master_map(void);
> +@@ -57,12 +65,6 @@ unsigned int defaults_get_logging(void);
> + const char *defaults_get_ldap_server(void);
> + unsigned int defaults_get_ldap_timeout(void);
> + unsigned int defaults_get_ldap_network_timeout(void);
> +-struct list_head *defaults_get_uris(void);
> +-void defaults_free_uris(struct list_head *);
> +-struct ldap_schema *defaults_get_default_schema(void);
> +-struct ldap_schema *defaults_get_schema(void);
> +-struct ldap_searchdn *defaults_get_searchdns(void);
> +-void defaults_free_searchdns(struct ldap_searchdn *);
> + unsigned int defaults_get_mount_nfs_default_proto(void);
> + unsigned int defaults_get_append_options(void);
> + unsigned int defaults_get_mount_wait(void);
> +diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
> +index e441a61..9a4ce73 100644
> +--- a/include/lookup_ldap.h
> ++++ b/include/lookup_ldap.h
> +@@ -8,7 +8,6 @@
> + #include <openssl/evp.h>
> + #include <openssl/err.h>
> + #include <sasl/sasl.h>
> +-#include <libxml/tree.h>
> + #include <krb5.h>
> + #endif
> +=20
> +diff --git a/lib/defaults.c b/lib/defaults.c
> +index 5ce71b7..ae1162f 100644
> +--- a/lib/defaults.c
> ++++ b/lib/defaults.c
> +@@ -17,9 +17,12 @@
> + #include <ctype.h>
> + #include <string.h>
> +=20
> ++#include "config.h"
> + #include "list.h"
> + #include "defaults.h"
> ++#ifdef WITH_LDAP
> + #include "lookup_ldap.h"
> ++#endif
> + #include "log.h"
> + #include "automount.h"
> +=20
> +@@ -197,6 +200,7 @@ static int parse_line(char *line, char **res, char *=
*value)
> + 	return 1;
> + }
> +=20
> ++#ifdef WITH_LDAP
> + void defaults_free_uris(struct list_head *list)
> + {
> + 	struct list_head *next;
> +@@ -290,166 +294,6 @@ struct list_head *defaults_get_uris(void)
> + 	return list;
> + }
> +=20
> +-/*
> +- * Read config env variables and check they have been set.
> +- *
> +- * This simple minded routine assumes the config file
> +- * is valid bourne shell script without spaces around "=3D"
> +- * and that it has valid values.
> +- */
> +-unsigned int defaults_read_config(unsigned int to_syslog)
> +-{
> +-	FILE *f;
> +-	char buf[MAX_LINE_LEN];
> +-	char *res;
> +-
> +-	f =3D open_fopen_r(DEFAULTS_CONFIG_FILE);
> +-	if (!f)
> +-		return 0;
> +-
> +-	while ((res =3D fgets(buf, MAX_LINE_LEN, f))) {
> +-		char *key, *value;
> +-
> +-		if (!parse_line(res, &key, &value))
> +-			continue;
> +-
> +-		if (check_set_config_value(key, ENV_NAME_MASTER_MAP, value, to_syslog=
) ||
> +-		    check_set_config_value(key, ENV_NAME_TIMEOUT, value, to_syslog) ||
> +-		    check_set_config_value(key, ENV_NAME_NEGATIVE_TIMEOUT, value, to_=
syslog) ||
> +-		    check_set_config_value(key, ENV_NAME_BROWSE_MODE, value, to_syslo=
g) ||
> +-		    check_set_config_value(key, ENV_NAME_LOGGING, value, to_syslog) ||
> +-		    check_set_config_value(key, ENV_LDAP_TIMEOUT, value, to_syslog) ||
> +-		    check_set_config_value(key, ENV_LDAP_NETWORK_TIMEOUT, value, to_s=
yslog) ||
> +-		    check_set_config_value(key, ENV_NAME_MAP_OBJ_CLASS, value, to_sys=
log) ||
> +-		    check_set_config_value(key, ENV_NAME_ENTRY_OBJ_CLASS, value, to_s=
yslog) ||
> +-		    check_set_config_value(key, ENV_NAME_MAP_ATTR, value, to_syslog) =
||
> +-		    check_set_config_value(key, ENV_NAME_ENTRY_ATTR, value, to_syslog=
) ||
> +-		    check_set_config_value(key, ENV_NAME_VALUE_ATTR, value, to_syslog=
) ||
> +-		    check_set_config_value(key, ENV_APPEND_OPTIONS, value, to_syslog)=
 ||
> +-		    check_set_config_value(key, ENV_MOUNT_WAIT, value, to_syslog) ||
> +-		    check_set_config_value(key, ENV_UMOUNT_WAIT, value, to_syslog) ||
> +-		    check_set_config_value(key, ENV_AUTH_CONF_FILE, value, to_syslog)=
 ||
> +-		    check_set_config_value(key, ENV_MAP_HASH_TABLE_SIZE, value, to_sy=
slog) ||
> +-		    check_set_config_value(key, ENV_MOUNT_NFS_DEFAULT_PROTOCOL, value=
, to_syslog))
> +-			;
> +-	}
> +-
> +-	if (!feof(f) || ferror(f)) {
> +-		if (!to_syslog) {
> +-			fprintf(stderr,
> +-				"fgets returned error %d while reading %s\n",
> +-				ferror(f), DEFAULTS_CONFIG_FILE);
> +-		} else {
> +-			logmsg("fgets returned error %d while reading %s",
> +-			      ferror(f), DEFAULTS_CONFIG_FILE);
> +-		}
> +-		fclose(f);
> +-		return 0;
> +-	}
> +-
> +-	fclose(f);
> +-	return 1;
> +-}
> +-
> +-const char *defaults_get_master_map(void)
> +-{
> +-	char *master;
> +-
> +-	master =3D get_env_string(ENV_NAME_MASTER_MAP);
> +-	if (!master)
> +-		return strdup(default_master_map_name);
> +-
> +-	return (const char *) master;
> +-}
> +-
> +-int defaults_master_set(void)
> +-{
> +-	char *val =3D getenv(ENV_NAME_MASTER_MAP);
> +-	if (!val)
> +-		return 0;
> +-
> +-	return 1;
> +-}
> +-
> +-unsigned int defaults_get_timeout(void)
> +-{
> +-	long timeout;
> +-
> +-	timeout =3D get_env_number(ENV_NAME_TIMEOUT);
> +-	if (timeout < 0)
> +-		timeout =3D DEFAULT_TIMEOUT;
> +-
> +-	return (unsigned int) timeout;
> +-}
> +-
> +-unsigned int defaults_get_negative_timeout(void)
> +-{
> +-	long n_timeout;
> +-
> +-	n_timeout =3D get_env_number(ENV_NAME_NEGATIVE_TIMEOUT);
> +-	if (n_timeout <=3D 0)
> +-		n_timeout =3D DEFAULT_NEGATIVE_TIMEOUT;
> +-
> +-	return (unsigned int) n_timeout;
> +-}
> +-
> +-unsigned int defaults_get_browse_mode(void)
> +-{
> +-	int res;
> +-
> +-	res =3D get_env_yesno(ENV_NAME_BROWSE_MODE);
> +-	if (res < 0)
> +-		res =3D DEFAULT_BROWSE_MODE;
> +-
> +-	return res;
> +-}
> +-
> +-unsigned int defaults_get_logging(void)
> +-{
> +-	char *res;
> +-	unsigned int logging =3D DEFAULT_LOGGING;
> +-
> +-	res =3D get_env_string(ENV_NAME_LOGGING);
> +-	if (!res)
> +-		return logging;
> +-
> +-	if (!strcasecmp(res, "none"))
> +-		logging =3D DEFAULT_LOGGING;
> +-	else {
> +-		if (!strcasecmp(res, "verbose"))
> +-			logging |=3D LOGOPT_VERBOSE;
> +-
> +-		if (!strcasecmp(res, "debug"))
> +-			logging |=3D LOGOPT_DEBUG;
> +-	}
> +-
> +-	free(res);
> +-
> +-	return logging;
> +-}
> +-
> +-unsigned int defaults_get_ldap_timeout(void)
> +-{
> +-	int res;
> +-
> +-	res =3D get_env_number(ENV_LDAP_TIMEOUT);
> +-	if (res < 0)
> +-		res =3D DEFAULT_LDAP_TIMEOUT;
> +-
> +-	return res;
> +-}
> +-
> +-unsigned int defaults_get_ldap_network_timeout(void)
> +-{
> +-	int res;
> +-
> +-	res =3D get_env_number(ENV_LDAP_NETWORK_TIMEOUT);
> +-	if (res < 0)
> +-		res =3D DEFAULT_LDAP_NETWORK_TIMEOUT;
> +-
> +-	return res;
> +-}
> +-
> + struct ldap_schema *defaults_get_default_schema(void)
> + {
> + 	struct ldap_schema *schema;
> +@@ -645,6 +489,167 @@ struct ldap_schema *defaults_get_schema(void)
> +=20
> + 	return schema;
> + }
> ++#endif
> ++
> ++/*
> ++ * Read config env variables and check they have been set.
> ++ *
> ++ * This simple minded routine assumes the config file
> ++ * is valid bourne shell script without spaces around "=3D"
> ++ * and that it has valid values.
> ++ */
> ++unsigned int defaults_read_config(unsigned int to_syslog)
> ++{
> ++	FILE *f;
> ++	char buf[MAX_LINE_LEN];
> ++	char *res;
> ++
> ++	f =3D open_fopen_r(DEFAULTS_CONFIG_FILE);
> ++	if (!f)
> ++		return 0;
> ++
> ++	while ((res =3D fgets(buf, MAX_LINE_LEN, f))) {
> ++		char *key, *value;
> ++
> ++		if (!parse_line(res, &key, &value))
> ++			continue;
> ++
> ++		if (check_set_config_value(key, ENV_NAME_MASTER_MAP, value, to_syslog=
) ||
> ++		    check_set_config_value(key, ENV_NAME_TIMEOUT, value, to_syslog) ||
> ++		    check_set_config_value(key, ENV_NAME_NEGATIVE_TIMEOUT, value, to_=
syslog) ||
> ++		    check_set_config_value(key, ENV_NAME_BROWSE_MODE, value, to_syslo=
g) ||
> ++		    check_set_config_value(key, ENV_NAME_LOGGING, value, to_syslog) ||
> ++		    check_set_config_value(key, ENV_LDAP_TIMEOUT, value, to_syslog) ||
> ++		    check_set_config_value(key, ENV_LDAP_NETWORK_TIMEOUT, value, to_s=
yslog) ||
> ++		    check_set_config_value(key, ENV_NAME_MAP_OBJ_CLASS, value, to_sys=
log) ||
> ++		    check_set_config_value(key, ENV_NAME_ENTRY_OBJ_CLASS, value, to_s=
yslog) ||
> ++		    check_set_config_value(key, ENV_NAME_MAP_ATTR, value, to_syslog) =
||
> ++		    check_set_config_value(key, ENV_NAME_ENTRY_ATTR, value, to_syslog=
) ||
> ++		    check_set_config_value(key, ENV_NAME_VALUE_ATTR, value, to_syslog=
) ||
> ++		    check_set_config_value(key, ENV_APPEND_OPTIONS, value, to_syslog)=
 ||
> ++		    check_set_config_value(key, ENV_MOUNT_WAIT, value, to_syslog) ||
> ++		    check_set_config_value(key, ENV_UMOUNT_WAIT, value, to_syslog) ||
> ++		    check_set_config_value(key, ENV_AUTH_CONF_FILE, value, to_syslog)=
 ||
> ++		    check_set_config_value(key, ENV_MAP_HASH_TABLE_SIZE, value, to_sy=
slog) ||
> ++		    check_set_config_value(key, ENV_MOUNT_NFS_DEFAULT_PROTOCOL, value=
, to_syslog))
> ++			;
> ++	}
> ++
> ++	if (!feof(f) || ferror(f)) {
> ++		if (!to_syslog) {
> ++			fprintf(stderr,
> ++				"fgets returned error %d while reading %s\n",
> ++				ferror(f), DEFAULTS_CONFIG_FILE);
> ++		} else {
> ++			logmsg("fgets returned error %d while reading %s",
> ++			      ferror(f), DEFAULTS_CONFIG_FILE);
> ++		}
> ++		fclose(f);
> ++		return 0;
> ++	}
> ++
> ++	fclose(f);
> ++	return 1;
> ++}
> ++
> ++const char *defaults_get_master_map(void)
> ++{
> ++	char *master;
> ++
> ++	master =3D get_env_string(ENV_NAME_MASTER_MAP);
> ++	if (!master)
> ++		return strdup(default_master_map_name);
> ++
> ++	return (const char *) master;
> ++}
> ++
> ++int defaults_master_set(void)
> ++{
> ++	char *val =3D getenv(ENV_NAME_MASTER_MAP);
> ++	if (!val)
> ++		return 0;
> ++
> ++	return 1;
> ++}
> ++
> ++unsigned int defaults_get_timeout(void)
> ++{
> ++	long timeout;
> ++
> ++	timeout =3D get_env_number(ENV_NAME_TIMEOUT);
> ++	if (timeout < 0)
> ++		timeout =3D DEFAULT_TIMEOUT;
> ++
> ++	return (unsigned int) timeout;
> ++}
> ++
> ++unsigned int defaults_get_negative_timeout(void)
> ++{
> ++	long n_timeout;
> ++
> ++	n_timeout =3D get_env_number(ENV_NAME_NEGATIVE_TIMEOUT);
> ++	if (n_timeout <=3D 0)
> ++		n_timeout =3D DEFAULT_NEGATIVE_TIMEOUT;
> ++
> ++	return (unsigned int) n_timeout;
> ++}
> ++
> ++unsigned int defaults_get_browse_mode(void)
> ++{
> ++	int res;
> ++
> ++	res =3D get_env_yesno(ENV_NAME_BROWSE_MODE);
> ++	if (res < 0)
> ++		res =3D DEFAULT_BROWSE_MODE;
> ++
> ++	return res;
> ++}
> ++
> ++unsigned int defaults_get_logging(void)
> ++{
> ++	char *res;
> ++	unsigned int logging =3D DEFAULT_LOGGING;
> ++
> ++	res =3D get_env_string(ENV_NAME_LOGGING);
> ++	if (!res)
> ++		return logging;
> ++
> ++	if (!strcasecmp(res, "none"))
> ++		logging =3D DEFAULT_LOGGING;
> ++	else {
> ++		if (!strcasecmp(res, "verbose"))
> ++			logging |=3D LOGOPT_VERBOSE;
> ++
> ++		if (!strcasecmp(res, "debug"))
> ++			logging |=3D LOGOPT_DEBUG;
> ++	}
> ++
> ++	free(res);
> ++
> ++	return logging;
> ++}
> ++
> ++unsigned int defaults_get_ldap_timeout(void)
> ++{
> ++	int res;
> ++
> ++	res =3D get_env_number(ENV_LDAP_TIMEOUT);
> ++	if (res < 0)
> ++		res =3D DEFAULT_LDAP_TIMEOUT;
> ++
> ++	return res;
> ++}
> ++
> ++unsigned int defaults_get_ldap_network_timeout(void)
> ++{
> ++	int res;
> ++
> ++	res =3D get_env_number(ENV_LDAP_NETWORK_TIMEOUT);
> ++	if (res < 0)
> ++		res =3D DEFAULT_LDAP_NETWORK_TIMEOUT;
> ++
> ++	return res;
> ++}
> +=20
> + unsigned int defaults_get_mount_nfs_default_proto(void)
> + {
> +diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
> +index 3bc4dc5..431e50d 100644
> +--- a/modules/lookup_ldap.c
> ++++ b/modules/lookup_ldap.c
> +@@ -28,6 +28,7 @@
> + #include <arpa/nameser.h>
> + #include <resolv.h>
> + #include <lber.h>
> ++#include <libxml/tree.h>
> +=20
> + #define MODULE_LOOKUP
> + #include "automount.h"
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-make-yellow-pages-support-optional.patch b/meta-networking/recipes-d=
aemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.=
patch
> index 9504d8e..4199690 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-ma=
ke-yellow-pages-support-optional.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-ma=
ke-yellow-pages-support-optional.patch
> @@ -1,5 +1,3 @@
> -Upstream-Status: Backport
> -
>  autofs-5.0.7 - make yellow pages support optional
> =20
>  From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> @@ -8,6 +6,7 @@ If rpcsvc/ypclnt.h is not available don't compile in Yell=
ow Pages
>  support.
>  ---
> =20
> + CHANGELOG           |    1 +
>   Makefile.conf.in    |    3 +++
>   configure           |   16 ++++++++++++++++
>   configure.in        |    9 +++++++++
> @@ -17,6 +16,18 @@ support.
>   7 files changed, 39 insertions(+), 3 deletions(-)
> =20
> =20
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 1130db6..ed17163 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -25,6 +25,7 @@
> + - don't schedule new alarms after readmap.
> + - use numeric protocol ids instead of protoent structs.
> + - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
> ++- make yellow pages support optional.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  diff --git a/Makefile.conf.in b/Makefile.conf.in
>  index 802318b..3766d45 100644
>  --- a/Makefile.conf.in
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-modules-replicated-use-sin6.addr-s6_addr32.patch b/meta-networking/r=
ecipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-modules-replicated-use-sin6=
=2Eaddr-s6_addr32.patch
> new file mode 100644
> index 0000000..4516bc5
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-mo=
dules-replicated-use-sin6.addr-s6_addr32.patch
> @@ -0,0 +1,39 @@
> +autofs-5.0.7 -  modules/replicated.c: use sin6_addr.s6_addr32
> +
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +The exported in6.h kernel header provides a convenience macro s6_addr32
> +for accessing the 32bit words of an ipv6 address. Use this instead of
> +__in6_u.__u6_addr32.
> +---
> +
> + CHANGELOG            |    1 +
> + modules/replicated.c |    2 +-
> + 2 files changed, 2 insertions(+), 1 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index ed17163..4eaa9f9 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -26,6 +26,7 @@
> + - use numeric protocol ids instead of protoent structs.
> + - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
> + - make yellow pages support optional.
> ++- modules/replicated.c: use sin6_addr.s6_addr32.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/modules/replicated.c b/modules/replicated.c
> +index dbd5513..26f64b8 100644
> +--- a/modules/replicated.c
> ++++ b/modules/replicated.c
> +@@ -1146,7 +1146,7 @@ try_name:
> + 				rr4++;
> + 		} else if (this->ai_family =3D=3D AF_INET6) {
> + 			struct sockaddr_in6 *addr =3D (struct sockaddr_in6 *) this->ai_addr;
> +-			if (!IN6_IS_ADDR_LOOPBACK(addr->sin6_addr.__in6_u.__u6_addr32))
> ++			if (!IN6_IS_ADDR_LOOPBACK(addr->sin6_addr.s6_addr32))
> + 				rr6++;
> + 		}
> + 		this =3D this->ai_next;
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-update-kernel-include-files.patch b/meta-networking/recipes-daemons/=
autofs/autofs-5.0.7/autofs-5.0.7-update-kernel-include-files.patch
> new file mode 100644
> index 0000000..3b6bb92
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-up=
date-kernel-include-files.patch
> @@ -0,0 +1,92 @@
> +autofs-5.0.7 - update kernel include files
> +
> +From: Ian Kent <raven@themaw.net>
> +
> +Update autofs include files to include the latest changes.
> +---
> + include/linux/auto_fs.h  |   33 ++++++++++-----------------------
> + include/linux/auto_fs4.h |    3 ++-
> + 2 files changed, 12 insertions(+), 24 deletions(-)
> +
> +diff --git a/include/linux/auto_fs.h b/include/linux/auto_fs.h
> +index 91d414f..64df1a6 100644
> +--- a/include/linux/auto_fs.h
> ++++ b/include/linux/auto_fs.h
> +@@ -14,13 +14,8 @@
> + #ifndef _LINUX_AUTO_FS_H
> + #define _LINUX_AUTO_FS_H
> +=20
> +-#ifdef __KERNEL__
> +-#include <linux/fs.h>
> +-#include <linux/limits.h>
> + #include <linux/types.h>
> +-#include <linux/ioctl.h>
> +-#else
> +-#include <asm/types.h>
> ++#ifndef __KERNEL__
> + #include <sys/ioctl.h>
> + #endif /* __KERNEL__ */
> +=20
> +@@ -32,25 +27,16 @@
> + #define AUTOFS_MIN_PROTO_VERSION	AUTOFS_PROTO_VERSION
> +=20
> + /*
> +- * Architectures where both 32- and 64-bit binaries can be executed
> +- * on 64-bit kernels need this.  This keeps the structure format
> +- * uniform, and makes sure the wait_queue_token isn't too big to be
> +- * passed back down to the kernel.
> +- *
> +- * This assumes that on these architectures:
> +- * mode     32 bit    64 bit
> +- * -------------------------
> +- * int      32 bit    32 bit
> +- * long     32 bit    64 bit
> +- *
> +- * If so, 32-bit user-space code should be backwards compatible.
> ++ * The wait_queue_token (autofs_wqt_t) is part of a structure which is =
passed
> ++ * back to the kernel via ioctl from userspace. On architectures where =
32- and
> ++ * 64-bit userspace binaries can be executed it's important that the si=
ze of
> ++ * autofs_wqt_t stays constant between 32- and 64-bit Linux kernels so =
that we
> ++ * do not break the binary ABI interface by changing the structure size.
> +  */
> +-
> +-#if defined(__sparc__) || defined(__mips__) || defined(__x86_64__) \
> +- || defined(__powerpc__) || defined(__s390__)
> +-typedef unsigned int autofs_wqt_t;
> +-#else
> ++#if defined(__ia64__) || defined(__alpha__) /* pure 64bit architectures=
 */
> + typedef unsigned long autofs_wqt_t;
> ++#else
> ++typedef unsigned int autofs_wqt_t;
> + #endif
> +=20
> + /* Packet types */
> +@@ -81,6 +67,7 @@ struct autofs_packet_expire {
> + #define AUTOFS_IOC_FAIL       _IO(0x93,0x61)
> + #define AUTOFS_IOC_CATATONIC  _IO(0x93,0x62)
> + #define AUTOFS_IOC_PROTOVER   _IOR(0x93,0x63,int)
> ++#define AUTOFS_IOC_SETTIMEOUT32 _IOWR(0x93,0x64,compat_ulong_t)
> + #define AUTOFS_IOC_SETTIMEOUT _IOWR(0x93,0x64,unsigned long)
> + #define AUTOFS_IOC_EXPIRE     _IOR(0x93,0x65,struct autofs_packet_expir=
e)
> +=20
> +diff --git a/include/linux/auto_fs4.h b/include/linux/auto_fs4.h
> +index 55fa478..e02982f 100644
> +--- a/include/linux/auto_fs4.h
> ++++ b/include/linux/auto_fs4.h
> +@@ -12,6 +12,7 @@
> + #define _LINUX_AUTO_FS4_H
> +=20
> + /* Include common v3 definitions */
> ++#include <linux/types.h>
> + #include <linux/auto_fs.h>
> +=20
> + /* autofs v4 definitions */
> +@@ -23,7 +24,7 @@
> + #define AUTOFS_MIN_PROTO_VERSION	3
> + #define AUTOFS_MAX_PROTO_VERSION	5
> +=20
> +-#define AUTOFS_PROTO_SUBVERSION		1
> ++#define AUTOFS_PROTO_SUBVERSION		2
> +=20
> + /* Mask for expire behaviour */
> + #define AUTOFS_EXP_IMMEDIATE		1
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch b/meta-ne=
tworking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-use-numeric-proto=
col-ids-instead-of-protoent-structs.patch
> new file mode 100644
> index 0000000..113b0a0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-us=
e-numeric-protocol-ids-instead-of-protoent-structs.patch
> @@ -0,0 +1,471 @@
> +autofs-5.0.7 - use numeric protocol ids instead of protoent structs
> +
> +From: Leonardo Chiquitto <leonardo.lists@gmail.com>
> +
> +The function getprotobyname() is not reentrant, so we can't call
> +it simultaneously from multiple threads. Instead of switching to
> +the reentrant version which adds more complexity to the code,
> +lets use numeric protocol IDs instead of protoent structures.
> +---
> +
> + CHANGELOG            |    1 +
> + include/rpc_subs.h   |    4 +--
> + lib/rpc_subs.c       |   80 ++++++++++++++++++-------------------------=
-------
> + modules/replicated.c |   42 +++++++++++---------------
> + 4 files changed, 50 insertions(+), 77 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 4cf5621..ba1d65b 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -23,6 +23,7 @@
> + - fix use get_proximity() without libtirpc.
> + - don't use dirent d_type to filter out files in scandir()
> + - don't schedule new alarms after readmap.
> ++- use numeric protocol ids instead of protoent structs.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/include/rpc_subs.h b/include/rpc_subs.h
> +index ca474d9..b6d59f9 100644
> +--- a/include/rpc_subs.h
> ++++ b/include/rpc_subs.h
> +@@ -54,7 +54,7 @@ struct conn_info {
> + 	unsigned short port;
> + 	unsigned long program;
> + 	unsigned long version;
> +-	struct protoent *proto;
> ++	int proto;
> + 	unsigned int send_sz;
> + 	unsigned int recv_sz;
> + 	struct timeval timeout;
> +@@ -66,7 +66,7 @@ int rpc_udp_getclient(struct conn_info *, unsigned int=
, unsigned int);
> + void rpc_destroy_udp_client(struct conn_info *);
> + int rpc_tcp_getclient(struct conn_info *, unsigned int, unsigned int);
> + void rpc_destroy_tcp_client(struct conn_info *);
> +-int rpc_portmap_getclient(struct conn_info *, const char *, struct sock=
addr *, size_t, const char *, unsigned int);
> ++int rpc_portmap_getclient(struct conn_info *, const char *, struct sock=
addr *, size_t, int, unsigned int);
> + int rpc_portmap_getport(struct conn_info *, struct pmap *, unsigned sho=
rt *);
> + int rpc_ping_proto(struct conn_info *);
> + int rpc_ping(const char *, long, long, unsigned int);
> +diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
> +index d33a3c4..ad1d557 100644
> +--- a/lib/rpc_subs.c
> ++++ b/lib/rpc_subs.c
> +@@ -170,7 +170,7 @@ static int rpc_do_create_client(struct sockaddr *add=
r, struct conn_info *info, i
> +=20
> + 	*client =3D NULL;
> +=20
> +-	proto =3D info->proto->p_proto;
> ++	proto =3D info->proto;
> + 	if (proto =3D=3D IPPROTO_UDP)
> + 		type =3D SOCK_DGRAM;
> + 	else
> +@@ -201,7 +201,7 @@ static int rpc_do_create_client(struct sockaddr *add=
r, struct conn_info *info, i
> + 	in4_raddr =3D (struct sockaddr_in *) addr;
> + 	in4_raddr->sin_port =3D htons(info->port);
> +=20
> +-	switch (info->proto->p_proto) {
> ++	switch (info->proto) {
> + 	case IPPROTO_UDP:
> + 		clnt =3D clntudp_bufcreate(in4_raddr,
> + 					 info->program, info->version,
> +@@ -241,7 +241,7 @@ static int rpc_do_create_client(struct sockaddr *add=
r, struct conn_info *info, i
> +=20
> + 	*client =3D NULL;
> +=20
> +-	proto =3D info->proto->p_proto;
> ++	proto =3D info->proto;
> + 	if (proto =3D=3D IPPROTO_UDP)
> + 		type =3D SOCK_DGRAM;
> + 	else
> +@@ -292,11 +292,11 @@ static int rpc_do_create_client(struct sockaddr *a=
ddr, struct conn_info *info, i
> + 	nb_addr.maxlen =3D nb_addr.len =3D slen;
> + 	nb_addr.buf =3D addr;
> +=20
> +-	if (info->proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (info->proto =3D=3D IPPROTO_UDP)
> + 		clnt =3D clnt_dg_create(*fd, &nb_addr,
> + 				      info->program, info->version,
> + 				      info->send_sz, info->recv_sz);
> +-	else if (info->proto->p_proto =3D=3D IPPROTO_TCP) {
> ++	else if (info->proto =3D=3D IPPROTO_TCP) {
> + 		ret =3D connect_nb(*fd, addr, slen, &info->timeout);
> + 		if (ret < 0)
> + 			return ret;
> +@@ -355,7 +355,7 @@ static int create_client(struct conn_info *info, CLI=
ENT **client)
> + 	memset(&hints, 0, sizeof(hints));
> + 	hints.ai_flags =3D AI_ADDRCONFIG;
> + 	hints.ai_family =3D AF_UNSPEC;
> +-	if (info->proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (info->proto =3D=3D IPPROTO_UDP)
> + 		hints.ai_socktype =3D SOCK_DGRAM;
> + 	else
> + 		hints.ai_socktype =3D SOCK_STREAM;
> +@@ -370,7 +370,7 @@ static int create_client(struct conn_info *info, CLI=
ENT **client)
> +=20
> + 	haddr =3D ai;
> + 	while (haddr) {
> +-		if (haddr->ai_protocol !=3D info->proto->p_proto) {
> ++		if (haddr->ai_protocol !=3D info->proto) {
> + 			haddr =3D haddr->ai_next;
> + 			continue;
> + 		}
> +@@ -417,16 +417,11 @@ out_close:
> + int rpc_udp_getclient(struct conn_info *info,
> + 		      unsigned int program, unsigned int version)
> + {
> +-	struct protoent *pe_proto;
> + 	CLIENT *client;
> + 	int ret;
> +=20
> + 	if (!info->client) {
> +-		pe_proto =3D getprotobyname("udp");
> +-		if (!pe_proto)
> +-			return -ENOENT;
> +-
> +-		info->proto =3D pe_proto;
> ++		info->proto =3D IPPROTO_UDP;
> + 		info->timeout.tv_sec =3D RPC_TOUT_UDP;
> + 		info->timeout.tv_usec =3D 0;
> + 		info->send_sz =3D UDPMSGSIZE;
> +@@ -458,16 +453,11 @@ void rpc_destroy_udp_client(struct conn_info *info)
> + int rpc_tcp_getclient(struct conn_info *info,
> + 		      unsigned int program, unsigned int version)
> + {
> +-	struct protoent *pe_proto;
> + 	CLIENT *client;
> + 	int ret;
> +=20
> + 	if (!info->client) {
> +-		pe_proto =3D getprotobyname("tcp");
> +-		if (!pe_proto)
> +-			return -ENOENT;
> +-
> +-		info->proto =3D pe_proto;
> ++		info->proto =3D IPPROTO_TCP;
> + 		info->timeout.tv_sec =3D RPC_TOUT_TCP;
> + 		info->timeout.tv_usec =3D 0;
> + 		info->send_sz =3D 0;
> +@@ -513,23 +503,18 @@ void rpc_destroy_tcp_client(struct conn_info *info)
> +=20
> + int rpc_portmap_getclient(struct conn_info *info,
> + 			  const char *host, struct sockaddr *addr, size_t addr_len,
> +-			  const char *proto, unsigned int option)
> ++			  int proto, unsigned int option)
> + {
> +-	struct protoent *pe_proto;
> + 	CLIENT *client;
> + 	int ret;
> +=20
> +-	pe_proto =3D getprotobyname(proto);
> +-	if (!pe_proto)
> +-		return -ENOENT;
> +-
> + 	info->host =3D host;
> + 	info->addr =3D addr;
> + 	info->addr_len =3D addr_len;
> + 	info->program =3D PMAPPROG;
> + 	info->port =3D PMAPPORT;
> + 	info->version =3D PMAPVERS;
> +-	info->proto =3D pe_proto;
> ++	info->proto =3D proto;
> + 	info->send_sz =3D RPCSMALLMSGSIZE;
> + 	info->recv_sz =3D RPCSMALLMSGSIZE;
> + 	info->timeout.tv_sec =3D PMAP_TOUT_UDP;
> +@@ -537,7 +522,7 @@ int rpc_portmap_getclient(struct conn_info *info,
> + 	info->close_option =3D option;
> + 	info->client =3D NULL;
> +=20
> +-	if (pe_proto->p_proto =3D=3D IPPROTO_TCP)
> ++	if (info->proto =3D=3D IPPROTO_TCP)
> + 		info->timeout.tv_sec =3D PMAP_TOUT_TCP;
> +=20
> + 	ret =3D create_client(info, &client);
> +@@ -555,7 +540,7 @@ int rpc_portmap_getport(struct conn_info *info,
> + 	struct conn_info pmap_info;
> + 	CLIENT *client;
> + 	enum clnt_stat status;
> +-	int proto =3D info->proto->p_proto;
> ++	int proto =3D info->proto;
> + 	int ret;
> +=20
> + 	memset(&pmap_info, 0, sizeof(struct conn_info));
> +@@ -633,13 +618,13 @@ int rpc_ping_proto(struct conn_info *info)
> + {
> + 	CLIENT *client;
> + 	enum clnt_stat status;
> +-	int proto =3D info->proto->p_proto;
> ++	int proto =3D info->proto;
> + 	int ret;
> +=20
> + 	if (info->client)
> + 		client =3D info->client;
> + 	else {
> +-		if (info->proto->p_proto =3D=3D IPPROTO_UDP) {
> ++		if (info->proto =3D=3D IPPROTO_UDP) {
> + 			info->send_sz =3D UDPMSGSIZE;
> + 			info->recv_sz =3D UDPMSGSIZE;
> + 		}
> +@@ -688,7 +673,7 @@ int rpc_ping_proto(struct conn_info *info)
> +=20
> + static unsigned int __rpc_ping(const char *host,
> + 				unsigned long version,
> +-				char *proto,
> ++				int proto,
> + 				long seconds, long micros,
> + 				unsigned int option)
> + {
> +@@ -696,6 +681,7 @@ static unsigned int __rpc_ping(const char *host,
> + 	struct conn_info info;
> + 	struct pmap parms;
> +=20
> ++	info.proto =3D proto;
> + 	info.host =3D host;
> + 	info.addr =3D NULL;
> + 	info.addr_len =3D 0;
> +@@ -710,13 +696,9 @@ static unsigned int __rpc_ping(const char *host,
> +=20
> + 	status =3D RPC_PING_FAIL;
> +=20
> +-	info.proto =3D getprotobyname(proto);
> +-	if (!info.proto)
> +-		return status;
> +-
> + 	parms.pm_prog =3D NFS_PROGRAM;
> + 	parms.pm_vers =3D version;
> +-	parms.pm_prot =3D info.proto->p_proto;
> ++	parms.pm_prot =3D info.proto;
> + 	parms.pm_port =3D 0;
> +=20
> + 	status =3D rpc_portmap_getport(&info, &parms, &info.port);
> +@@ -734,19 +716,19 @@ int rpc_ping(const char *host, long seconds, long =
micros, unsigned int option)
> + 	unsigned long vers2 =3D NFS2_VERSION;
> + 	unsigned int status;
> +=20
> +-	status =3D __rpc_ping(host, vers2, "udp", seconds, micros, option);
> ++	status =3D __rpc_ping(host, vers2, IPPROTO_UDP, seconds, micros, optio=
n);
> + 	if (status > 0)
> + 		return RPC_PING_V2 | RPC_PING_UDP;
> +=20
> +-	status =3D __rpc_ping(host, vers3, "udp", seconds, micros, option);
> ++	status =3D __rpc_ping(host, vers3, IPPROTO_UDP, seconds, micros, optio=
n);
> + 	if (status > 0)
> + 		return RPC_PING_V3 | RPC_PING_UDP;
> +=20
> +-	status =3D __rpc_ping(host, vers2, "tcp", seconds, micros, option);
> ++	status =3D __rpc_ping(host, vers2, IPPROTO_TCP, seconds, micros, optio=
n);
> + 	if (status > 0)
> + 		return RPC_PING_V2 | RPC_PING_TCP;
> +=20
> +-	status =3D __rpc_ping(host, vers3, "tcp", seconds, micros, option);
> ++	status =3D __rpc_ping(host, vers3, IPPROTO_TCP, seconds, micros, optio=
n);
> + 	if (status > 0)
> + 		return RPC_PING_V3 | RPC_PING_TCP;
> +=20
> +@@ -769,7 +751,7 @@ int rpc_time(const char *host,
> + 	double taken;
> + 	struct timeval start, end;
> + 	struct timezone tz;
> +-	char *proto =3D (ping_proto & RPC_PING_UDP) ? "udp" : "tcp";
> ++	int proto =3D (ping_proto & RPC_PING_UDP) ? IPPROTO_UDP : IPPROTO_TCP;
> + 	unsigned long vers =3D ping_vers;
> +=20
> + 	gettimeofday(&start, &tz);
> +@@ -791,12 +773,12 @@ static int rpc_get_exports_proto(struct conn_info =
*info, exports *exp)
> + {
> + 	CLIENT *client;
> + 	enum clnt_stat status;
> +-	int proto =3D info->proto->p_proto;
> ++	int proto =3D info->proto;
> + 	unsigned int option =3D info->close_option;
> + 	int vers_entry;
> + 	int ret;
> +=20
> +-	if (info->proto->p_proto =3D=3D IPPROTO_UDP) {
> ++	if (info->proto =3D=3D IPPROTO_UDP) {
> + 		info->send_sz =3D UDPMSGSIZE;
> + 		info->recv_sz =3D UDPMSGSIZE;
> + 	}
> +@@ -903,11 +885,9 @@ exports rpc_get_exports(const char *host, long seco=
nds, long micros, unsigned in
> + 	parms.pm_port =3D 0;
> +=20
> + 	/* Try UDP first */
> +-	info.proto =3D getprotobyname("udp");
> +-	if (!info.proto)
> +-		goto try_tcp;
> ++	info.proto =3D IPPROTO_UDP;
> +=20
> +-	parms.pm_prot =3D info.proto->p_proto;
> ++	parms.pm_prot =3D info.proto;
> +=20
> + 	status =3D rpc_portmap_getport(&info, &parms, &info.port);
> + 	if (status < 0)
> +@@ -920,11 +900,9 @@ exports rpc_get_exports(const char *host, long seco=
nds, long micros, unsigned in
> + 		return exportlist;
> +=20
> + try_tcp:
> +-	info.proto =3D getprotobyname("tcp");
> +-	if (!info.proto)
> +-		return NULL;
> ++	info.proto =3D IPPROTO_TCP;
> +=20
> +-	parms.pm_prot =3D info.proto->p_proto;
> ++	parms.pm_prot =3D info.proto;
> +=20
> + 	status =3D rpc_portmap_getport(&info, &parms, &info.port);
> + 	if (status < 0)
> +diff --git a/modules/replicated.c b/modules/replicated.c
> +index 6b96320..dbd5513 100644
> +--- a/modules/replicated.c
> ++++ b/modules/replicated.c
> +@@ -419,7 +419,7 @@ void free_host_list(struct host **list)
> +=20
> + static unsigned int get_nfs_info(unsigned logopt, struct host *host,
> + 			 struct conn_info *pm_info, struct conn_info *rpc_info,
> +-			 const char *proto, unsigned int version, int port)
> ++			 int proto, unsigned int version, int port)
> + {
> + 	unsigned int random_selection =3D host->options & MOUNT_FLAG_RANDOM_SE=
LECT;
> + 	unsigned int use_weight_only =3D host->options & MOUNT_FLAG_USE_WEIGHT=
_ONLY;
> +@@ -433,22 +433,18 @@ static unsigned int get_nfs_info(unsigned logopt, =
struct host *host,
> + 	int status, count =3D 0;
> +=20
> + 	if (host->addr)
> +-		debug(logopt, "called with host %s(%s) proto %s version 0x%x",
> ++		debug(logopt, "called with host %s(%s) proto %d version 0x%x",
> + 		      host->name, get_addr_string(host->addr, buf, len),
> + 		      proto, version);
> + 	else
> + 		debug(logopt,
> +-		      "called for host %s proto %s version 0x%x",
> ++		      "called for host %s proto %d version 0x%x",
> + 		      host->name, proto, version);
> +=20
> +-	rpc_info->proto =3D getprotobyname(proto);
> +-	if (!rpc_info->proto)
> +-		return 0;
> +-
> ++	rpc_info->proto =3D proto;
> + 	memset(&parms, 0, sizeof(struct pmap));
> +-
> + 	parms.pm_prog =3D NFS_PROGRAM;
> +-	parms.pm_prot =3D rpc_info->proto->p_proto;
> ++	parms.pm_prot =3D proto;
> +=20
> + 	if (!(version & NFS4_REQUESTED))
> + 		goto v3_ver;
> +@@ -479,7 +475,7 @@ static unsigned int get_nfs_info(unsigned logopt, st=
ruct host *host,
> + 		}
> + 	}
> +=20
> +-	if (rpc_info->proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (rpc_info->proto =3D=3D IPPROTO_UDP)
> + 		status =3D rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS4_VERSION);
> + 	else
> + 		status =3D rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS4_VERSION);
> +@@ -540,7 +536,7 @@ v3_ver:
> + 			goto v2_ver;
> + 	}
> +=20
> +-	if (rpc_info->proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (rpc_info->proto =3D=3D IPPROTO_UDP)
> + 		status =3D rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS3_VERSION);
> + 	else
> + 		status =3D rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS3_VERSION);
> +@@ -587,7 +583,7 @@ v2_ver:
> + 			goto done_ver;
> + 	}
> +=20
> +-	if (rpc_info->proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (rpc_info->proto =3D=3D IPPROTO_UDP)
> + 		status =3D rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS2_VERSION);
> + 	else
> + 		status =3D rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS2_VERSION);
> +@@ -618,7 +614,7 @@ v2_ver:
> + 	}
> +=20
> + done_ver:
> +-	if (rpc_info->proto->p_proto =3D=3D IPPROTO_UDP) {
> ++	if (rpc_info->proto =3D=3D IPPROTO_UDP) {
> + 		rpc_destroy_udp_client(rpc_info);
> + 		rpc_destroy_udp_client(pm_info);
> + 	} else {
> +@@ -675,7 +671,7 @@ static int get_vers_and_cost(unsigned logopt, struct=
 host *host,
> +=20
> + 	if (version & TCP_REQUESTED) {
> + 		supported =3D get_nfs_info(logopt, host,
> +-				   &pm_info, &rpc_info, "tcp", vers, port);
> ++				   &pm_info, &rpc_info, IPPROTO_TCP, vers, port);
> + 		if (IS_ERR(supported)) {
> + 			if (ERR(supported) =3D=3D EHOSTUNREACH ||
> + 			    ERR(supported) =3D=3D ETIMEDOUT)
> +@@ -688,7 +684,7 @@ static int get_vers_and_cost(unsigned logopt, struct=
 host *host,
> +=20
> + 	if (version & UDP_REQUESTED) {
> + 		supported =3D get_nfs_info(logopt, host,
> +-				   &pm_info, &rpc_info, "udp", vers, port);
> ++				   &pm_info, &rpc_info, IPPROTO_UDP, vers, port);
> + 		if (IS_ERR(supported)) {
> + 			if (!ret && ERR(supported) =3D=3D ETIMEDOUT)
> + 				return ret;
> +@@ -709,7 +705,7 @@ static int get_supported_ver_and_cost(unsigned logop=
t, struct host *host,
> + 	socklen_t len =3D INET6_ADDRSTRLEN;
> + 	char buf[len + 1];
> + 	struct conn_info pm_info, rpc_info;
> +-	const char *proto;
> ++	int proto;
> + 	unsigned int vers;
> + 	struct timeval start, end;
> + 	struct timezone tz;
> +@@ -748,10 +744,10 @@ static int get_supported_ver_and_cost(unsigned log=
opt, struct host *host,
> + 	 *  So, we do the conversion here.
> + 	 */
> + 	if (version & UDP_SELECTED_MASK) {
> +-		proto =3D "udp";
> ++		proto =3D IPPROTO_UDP;
> + 		version >>=3D 8;
> + 	} else
> +-		proto =3D "tcp";
> ++		proto =3D IPPROTO_TCP;
> +=20
> + 	switch (version) {
> + 	case NFS2_SUPPORTED:
> +@@ -768,9 +764,7 @@ static int get_supported_ver_and_cost(unsigned logop=
t, struct host *host,
> + 		return 0;
> + 	}
> +=20
> +-	rpc_info.proto =3D getprotobyname(proto);
> +-	if (!rpc_info.proto)
> +-		return 0;
> ++	rpc_info.proto =3D proto;
> +=20
> + 	if (port > 0)
> + 		rpc_info.port =3D port;
> +@@ -786,14 +780,14 @@ static int get_supported_ver_and_cost(unsigned log=
opt, struct host *host,
> +=20
> + 		memset(&parms, 0, sizeof(struct pmap));
> + 		parms.pm_prog =3D NFS_PROGRAM;
> +-		parms.pm_prot =3D rpc_info.proto->p_proto;
> ++		parms.pm_prot =3D rpc_info.proto;
> + 		parms.pm_vers =3D vers;
> + 		ret =3D rpc_portmap_getport(&pm_info, &parms, &rpc_info.port);
> + 		if (ret < 0)
> + 			goto done;
> + 	}
> +=20
> +-	if (rpc_info.proto->p_proto =3D=3D IPPROTO_UDP)
> ++	if (rpc_info.proto =3D=3D IPPROTO_UDP)
> + 		status =3D rpc_udp_getclient(&rpc_info, NFS_PROGRAM, vers);
> + 	else
> + 		status =3D rpc_tcp_getclient(&rpc_info, NFS_PROGRAM, vers);
> +@@ -815,7 +809,7 @@ static int get_supported_ver_and_cost(unsigned logop=
t, struct host *host,
> + 		}
> + 	}
> + done:
> +-	if (rpc_info.proto->p_proto =3D=3D IPPROTO_UDP) {
> ++	if (rpc_info.proto =3D=3D IPPROTO_UDP) {
> + 		rpc_destroy_udp_client(&rpc_info);
> + 		rpc_destroy_udp_client(&pm_info);
> + 	} else {
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-workaround-missing-GNU-versionsort-extension.patch b/meta-networking=
/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-workaround-missing-GNU-ve=
rsionsort-extension.patch
> new file mode 100644
> index 0000000..6a1a49e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-wo=
rkaround-missing-GNU-versionsort-extension.patch
> @@ -0,0 +1,149 @@
> +autofs-5.0.7 - workaround missing GNU versionsort extension
> +
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +alphasort() and scandir() are specified in POSIX.1-2008, versionsort()
> +is a GNU extension. When versionsort isn't available fallback to using
> +alphasort.
> +---
> +
> + CHANGELOG            |    1 +
> + configure            |   62 +++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + configure.in         |    6 +++++
> + include/config.h.in  |    3 ++
> + modules/lookup_dir.c |    5 ++++
> + 5 files changed, 77 insertions(+), 0 deletions(-)
> +
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 4eaa9f9..39388a5 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -27,6 +27,7 @@
> + - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
> + - make yellow pages support optional.
> + - modules/replicated.c: use sin6_addr.s6_addr32.
> ++- workaround missing GNU versionsort extension.
> +=20
> + 25/07/2012 autofs-5.0.7
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/configure b/configure
> +index cf6428c..c1423d8 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4010,6 +4010,68 @@ $as_echo "yes" >&6; }
> +   KRB5_FLAGS=3D`$KRB5_CONFIG --cflags`
> + fi
> +=20
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for library containin=
g versionsort" >&5
> ++$as_echo_n "checking for library containing versionsort... " >&6; }
> ++if ${ac_cv_search_versionsort+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  ac_func_search_save_LIBS=3D$LIBS
> ++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++/* Override any GCC internal prototype to avoid an error.
> ++   Use char because int might match the return type of a GCC
> ++   builtin and then its argument prototype would still apply.  */
> ++#ifdef __cplusplus
> ++extern "C"
> ++#endif
> ++char versionsort ();
> ++int
> ++main ()
> ++{
> ++return versionsort ();
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++for ac_lib in '' ; do
> ++  if test -z "$ac_lib"; then
> ++    ac_res=3D"none required"
> ++  else
> ++    ac_res=3D-l$ac_lib
> ++    LIBS=3D"-l$ac_lib  $ac_func_search_save_LIBS"
> ++  fi
> ++  if ac_fn_c_try_link "$LINENO"; then :
> ++  ac_cv_search_versionsort=3D$ac_res
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext \
> ++    conftest$ac_exeext
> ++  if ${ac_cv_search_versionsort+:} false; then :
> ++  break
> ++fi
> ++done
> ++if ${ac_cv_search_versionsort+:} false; then :
> ++
> ++else
> ++  ac_cv_search_versionsort=3Dno
> ++fi
> ++rm conftest.$ac_ext
> ++LIBS=3D$ac_func_search_save_LIBS
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_search_versions=
ort" >&5
> ++$as_echo "$ac_cv_search_versionsort" >&6; }
> ++ac_res=3D$ac_cv_search_versionsort
> ++if test "$ac_res" !=3D no; then :
> ++  test "$ac_res" =3D "none required" || LIBS=3D"$ac_res $LIBS"
> ++
> ++fi
> ++
> ++if test "$ac_cv_search_versionsort" =3D "no"; then
> ++
> ++$as_echo "#define WITHOUT_VERSIONSORT 1" >>confdefs.h
> ++
> ++fi
> ++
> + #
> + # glibc/libc 6 new libraries
> + #
> +diff --git a/configure.in b/configure.in
> +index 363c376..4029375 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -163,6 +163,12 @@ AF_SLOPPY_MOUNT()
> + AF_CHECK_LIBXML()
> + AF_CHECK_KRB5()
> +=20
> ++AC_SEARCH_LIBS([versionsort],[])
> ++if test "$ac_cv_search_versionsort" =3D "no"; then
> ++	AC_DEFINE(WITHOUT_VERSIONSORT, 1,
> ++		[Define if your C library does not provide versionsort])
> ++fi
> ++
> + #
> + # glibc/libc 6 new libraries
> + #
> +diff --git a/include/config.h.in b/include/config.h.in
> +index 7f1c5b5..a2a05a8 100644
> +--- a/include/config.h.in
> ++++ b/include/config.h.in
> +@@ -135,6 +135,9 @@
> + /* Define to 1 to use the libtirpc tsd usage workaround */
> + #undef TIRPC_WORKAROUND
> +=20
> ++/* Define if your C library does not provide versionsort */
> ++#undef WITHOUT_VERSIONSORT
> ++
> + /* Define if using the dmalloc debugging malloc package */
> + #undef WITH_DMALLOC
> +=20
> +diff --git a/modules/lookup_dir.c b/modules/lookup_dir.c
> +index 33901c0..07471b7 100644
> +--- a/modules/lookup_dir.c
> ++++ b/modules/lookup_dir.c
> +@@ -39,6 +39,11 @@
> + #define AUTOFS_DIR_EXT ".autofs"
> + #define AUTOFS_DIR_EXTSIZ (sizeof(AUTOFS_DIR_EXT) - 1)
> +=20
> ++/* Work around non-GNU systems that don't provide versionsort */
> ++#ifdef WITHOUT_VERSIONSORT
> ++#define versionsort alphasort
> ++#endif
> ++
> + struct lookup_context {
> +   const char *mapname;
> + };
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 7d8cf17..6751402 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -3,7 +3,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  DEPENDS +=3D "libtirpc flex-native bison-native"
> =20
> @@ -27,7 +27,30 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/=
v5/autofs-${PV}.tar.bz2 \
>             file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
>             file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
>             file://autofs-5.0.7-handle-new-location-of-systemd.patch \
> +           file://autofs-5.0.7-fix-map-entry-duplicate-offset-detection.=
patch \
> +           file://autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automo=
unt-lines.patch \
> +           file://autofs-5.0.7-fix-nobind-man-page-description.patch \
> +           file://autofs-5.0.7-fix-submount-offset-delete.patch \
> +           file://autofs-5.0.7-fix-init-script-status-return.patch \
> +           file://autofs-5.0.7-fix-use-get_proximity-without-libtirpc.pa=
tch \
> +           file://autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-file=
s-in-scandir.patch \
> +           file://autofs-5.0.7-dont-schedule-new-alarms-after-readmap.pa=
tch \
> +           file://autofs-5.0.7-use-numeric-protocol-ids-instead-of-proto=
ent-structs.patch \
> +           file://autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-ar=
ound-LDAP-types.patch \
>             file://autofs-5.0.7-make-yellow-pages-support-optional.patch \
> +           file://autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr3=
2.patch \
> +           file://autofs-5.0.7-workaround-missing-GNU-versionsort-extens=
ion.patch \
> +           file://autofs-5.0.7-dont-fail-on-master-map-self-include.patc=
h \
> +           file://autofs-5.0.7-fix-wildcard-multi-map-regression.patch \
> +           file://autofs-5.0.7-fix-file-descriptor-leak-when-reloading-t=
he-daemon.patch \
> +           file://autofs-5.0.7-depricate-nosymlink-pseudo-option.patch \
> +           file://autofs-5.0.7-add-symlink-pseudo-option.patch \
> +           file://autofs-5.0.7-update-kernel-include-files.patch \
> +           file://autofs-5.0.7-fix-requires-in-spec-file.patch \
> +           file://autofs-5.0.7-fix-libtirpc-build-option.patch \
> +           file://autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch \
> +           file://autofs-5.0.7-document-browse-option-in-man-page.patch \
> +           file://autofs-5.0.7-fix-automounter-support-on-parisc.patch \
>             file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.p=
atch \
>             file://Makefile.rules-cross.patch \
>             file://no-bash.patch \
--=20
-Joe MacDonald.
:wq

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFIXsEACgkQPN8S4W6ZZnehbwCfQpxJ2j19GG2pY44oVzDKqsCp
roQAn1h0ieEpPSZk9H1hqTnIS/tqzElE
=MGB5
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
