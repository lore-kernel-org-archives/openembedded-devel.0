Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9895B76FE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 18:21:44 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so8510660wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B2FyVw6ZCvgu1jLEhHFnAUyKHnkL0U3Ep5bEugQulqs=;
	b=ZHObSX8g4g8+xz9CSKBIdHv3XBePF2gSbcDDVTTzdE/QmPEqOaP3pGsxSJtSEpOiXp
	47gxeLOq/kZRsJjS1ybSRQ5QxfQm74Wy6HdImKIHrwn4pS6qSb7fzbKAaJzVcUdCLCA6
	9+IYHJT5eLNS9if8wtC2u7rTwIOQ9SDUY3mesr3pNa98FUIvh4D8VBQcxLwkmtJpKg91
	scoCaiKNj8NZDYTnzeewAxyNlLaTAGsfCqovDXaD8rf16zVQ2JOSeoniW/TccoP5ZOgW
	GNSK1wyrPqh2axonFOBBCsVPCPP420hb/2HXV61Cdi40zyIHN1hPPmu0KLkeqFfZTnU/
	qQ4Q==
X-Received: by 10.180.99.5 with SMTP id em5mr21794965wib.43.1441045303762;
	Mon, 31 Aug 2015 11:21:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fs7sm15871747wib.8.2015.08.31.11.21.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 11:21:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 20:21:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150831182149.GE2465@jama>
References: <1441043247-5310-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
In-Reply-To: <1441043247-5310-1-git-send-email-alejandro.delcastillo@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] opkg: upgrade to v0.3.0
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
X-List-Received-Date: Mon, 31 Aug 2015 18:21:45 -0000
X-Groupsio-MsgNum: 57140
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline

--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 12:47:27PM -0500, Alejandro del Castillo wrote:
> Changes required:
> - Rename opkg-cl to opkg
> - Add libarchive dependency
> - Drop backport patches
> - Drop obsolete directory options
> - Add patch to handle empty index files
>=20
> Based on initial work by Paul Barker.
>=20
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> CC: Paul Barker <paul@paulbarker.me.uk>

Wrong ML, this belongs to openembedded-core@lists.openembedded.org

> ---
>  meta/lib/oe/package_manager.py                     |   6 +-
>  .../installer/adt-installer/adt_installer          |   2 +-
>  .../adt-installer/scripts/adt_installer_internal   |   4 +-
>  .../opkg/0001-opkg-key-Backport-improvements.patch |  78 ------------
>  ...ve-add-support-for-empty-compressed-files.patch |  64 ++++++++++
>  meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 131 ---------------=
------
>  .../opkg/opkg/no-install-recommends.patch          |  91 --------------
>  .../opkg/opkg/opkg-configure.service               |   2 +-
>  .../opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch |  32 -----
>  meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  84 -------------
>  meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  72 +++++++++++
>  .../run-postinsts/run-postinsts/run-postinsts      |   2 +-
>  12 files changed, 144 insertions(+), 424 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backpor=
t-improvements.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add=
-support-for-empty-compressed-files.patch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends=
=2Epatch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAG=
S-I-shave-I-m4.patch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg_0.2.4.bb
>  create mode 100644 meta/recipes-devtools/opkg/opkg_0.3.0.bb
>=20
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
=2Epy
> index 2ab1d78..4986bf9 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -376,7 +376,7 @@ class OpkgPkgsList(PkgsList):
>      def __init__(self, d, rootfs_dir, config_file):
>          super(OpkgPkgsList, self).__init__(d, rootfs_dir)
> =20
> -        self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg-cl")
> +        self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
>          self.opkg_args =3D "-f %s -o %s " % (config_file, rootfs_dir)
>          self.opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
> =20
> @@ -1228,8 +1228,8 @@ class OpkgPM(PackageManager):
> =20
>          self.deploy_dir =3D self.d.getVar("DEPLOY_DIR_IPK", True)
>          self.deploy_lock_file =3D os.path.join(self.deploy_dir, "deploy.=
lock")
> -        self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg-cl")
> -        self.opkg_args =3D "-f %s -o %s " % (self.config_file, target_ro=
otfs)
> +        self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
> +        self.opkg_args =3D "--volatile-cache -f %s -o %s " % (self.confi=
g_file, target_rootfs)
>          self.opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
> =20
>          opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR', True)
> diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer =
b/meta/recipes-devtools/installer/adt-installer/adt_installer
> index 24db247..3172de7 100755
> --- a/meta/recipes-devtools/installer/adt-installer/adt_installer
> +++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
> @@ -156,7 +156,7 @@ validate_config()
>  #this installed local opkg
>  install_opkg()
>  {
> -if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
> +if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg" ]; then
>    echo_info "OPKG is not setup, setting up opkg in local, which is requi=
red for installing yocto ADT...\n"
> =20
>    if [ -d $LOCAL_OPKG_LOC ]; then
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_in=
staller_internal b/meta/recipes-devtools/installer/adt-installer/scripts/ad=
t_installer_internal
> index 2a8a30c..6f5fb49 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> @@ -124,9 +124,9 @@ fi
> =20
>  #first update repository
>  if [ "x$SUDO" =3D "x" ]; then
> -    OPKG_CMD=3D"$LOCAL_OPKG_LOC/bin/opkg-cl"
> +    OPKG_CMD=3D"$LOCAL_OPKG_LOC/bin/opkg"
>  else
> -    OPKG_CMD=3D"sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
> +    OPKG_CMD=3D"sudo -E $LOCAL_OPKG_LOC/bin/opkg"
>  fi
> =20
>  echo_info "Updating opkg..."
> diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-impro=
vements.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-impr=
ovements.patch
> deleted file mode 100644
> index ae319ce..0000000
> --- a/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements=
=2Epatch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 87bec8300a1122829b2ed565db7da5bacfa88919 Mon Sep 17 00:00:00 2001
> -From: Paul Barker <paul@paulbarker.me.uk>
> -Date: Sun, 12 Oct 2014 09:59:53 +0000
> -Subject: [PATCH] opkg-key: Backport improvements
> -
> -The improvements to opkg-key made for v0.3.0 are backported. The rest of=
 v0.3.0
> -needs further testing and bugfixing prior to release, but the improvemen=
ts to
> -opkg-key have been tested and work well.
> -
> -    1) opkg-key: Add 'reset' option
> -
> -        This option removes the keyrings used to verify package signatur=
es,
> -        effectively resetting opkg to the initial state where it recogni=
ses no
> -        keys.
> -
> -    2) opkg-key: Add 'populate' option
> -
> -        This option causes all keyrings in /usr/share/opkg/keyrings to be
> -        imported. Thus distributions may install their keys into this di=
rectory
> -        and use 'opkg-key populate' to ensure the correct keys are loade=
d.
> -
> -    3) opkg-key: Improve usage output
> -
> -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> -Upstream-status: Backport
> ----
> - utils/opkg-key | 26 ++++++++++++++++++++++----
> - 1 file changed, 22 insertions(+), 4 deletions(-)
> -
> -diff --git a/utils/opkg-key b/utils/opkg-key
> -index 266bb66..085f1e8 100755
> ---- a/utils/opkg-key
> -+++ b/utils/opkg-key
> -@@ -10,12 +10,17 @@ usage() {
> -     echo
> -     echo "Manage opkg's list of trusted keys"
> -     echo
> --    echo "  opkg-key add <file>          - add the key contained in <fi=
le> ('-' for stdin)"
> --    echo "  opkg-key del <keyid>         - remove the key <keyid>"
> --    echo "  opkg-key list                - list keys"
> -+    echo "Commands and arguments:"
> -+    echo "  add <file>          - Add the key contained in <file> ('-' =
for stdin)"
> -+    echo "  del <keyid>         - Remove the key <keyid>"
> -+    echo "  list                - List keys"
> -+    echo "  fingerprint         - List keys with fingerprints"
> -+    echo "  reset               - Remove all keys, resetting the keyrin=
g"
> -+    echo "  populate            - Import keys from /usr/share/opkg/keyr=
ings"
> -+    echo "  help                - Print this usage message and exit"
> -     echo
> -     echo "Options:"
> --    echo "  -o <root>  Use <root> as the offline root directory"
> -+    echo "  -o <root>           - Use <root> as the offline root direct=
ory"
> -     echo
> - }
> -=20
> -@@ -64,6 +69,19 @@ case "$command" in
> -         echo "Executing: $GPG $*"
> -         $GPG $*
> -         ;;
> -+    reset)
> -+        rm -f $ROOT/etc/opkg/trusted.gpg $ROOT/etc/opkg/trusted.gpg~
> -+        rm -f $ROOT/etc/opkg/secring.gpg $ROOT/etc/opkg/secring.gpg~
> -+        rm -f $ROOT/etc/opkg/trustdb.gpg $ROOT/etc/opkg/trustdb.gpg~
> -+        echo "OK"
> -+        ;;
> -+    populate)
> -+        for f in $ROOT/usr/share/opkg/keyrings/*.gpg; do
> -+            echo "Importing keys from '`basename $f`'..."
> -+            $GPG --quiet --batch --import "$f"
> -+        done
> -+        echo "OK"
> -+        ;;
> -     help)
> -         usage
> -         ;;
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-suppor=
t-for-empty-compressed-files.patch b/meta/recipes-devtools/opkg/opkg/0001-o=
pkg_archive-add-support-for-empty-compressed-files.patch
> new file mode 100644
> index 0000000..dabd196
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-e=
mpty-compressed-files.patch
> @@ -0,0 +1,64 @@
> +From bd32bb8646459508bb0b0ce54a14bd6fe0e19b75 Mon Sep 17 00:00:00 2001
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Date: Thu, 27 Aug 2015 15:52:16 -0500
> +Subject: [PATCH] opkg_archive: add support for empty compressed files
> +
> +Regression from 0.2.x: opkg used to support empty Package.gz files.
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +
> +Upstream-Status: Accepted
> +---
> + libopkg/opkg_archive.c | 15 +++++++++++++--
> + 1 file changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
> +index be903e4..7e91e48 100644
> +--- a/libopkg/opkg_archive.c
> ++++ b/libopkg/opkg_archive.c
> +@@ -121,6 +121,9 @@ static int copy_to_stream(struct archive *a, FILE * =
stream)
> +     int eof;
> +     size_t len =3D EXTRACT_BUFFER_LEN;
> +=20
> ++    if (archive_format(a) =3D=3D ARCHIVE_FORMAT_EMPTY)
> ++        return 0;
> ++
> +     buffer =3D xmalloc(len);
> +=20
> +     while (1) {
> +@@ -654,6 +657,13 @@ static struct archive *open_compressed_file(const c=
har *filename)
> +         goto err_cleanup;
> +     }
> +=20
> ++    r =3D archive_read_support_format_empty(ar);
> ++    if (r !=3D ARCHIVE_OK) {
> ++        opkg_msg(ERROR, "Empty format not supported: %s\n",
> ++                 archive_error_string(ar));
> ++        goto err_cleanup;
> ++    }
> ++
> +     /* Open input file and prepare for reading. */
> +     r =3D archive_read_open_filename(ar, filename, EXTRACT_BUFFER_LEN);
> +     if (r !=3D ARCHIVE_OK) {
> +@@ -723,6 +733,7 @@ struct opkg_ar *ar_open_compressed_file(const char *=
filename)
> + {
> +     struct opkg_ar *ar;
> +     struct archive_entry *entry;
> ++    int eof;
> +=20
> +     ar =3D (struct opkg_ar *)xmalloc(sizeof(struct opkg_ar));
> +=20
> +@@ -737,8 +748,8 @@ struct opkg_ar *ar_open_compressed_file(const char *=
filename)
> +      * header. We skip over this header here so that the caller doesn't=
 need
> +      * to know about it.
> +      */
> +-    entry =3D read_header(ar->ar, NULL);
> +-    if (!entry)
> ++    entry =3D read_header(ar->ar, &eof);
> ++    if (!entry && !eof)
> +         goto err_cleanup;
> +=20
> +     return ar;
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/rec=
ipes-devtools/opkg/opkg/add-exclude.patch
> deleted file mode 100644
> index 48de923..0000000
> --- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -From 60c3f93e95a3ca54ef0a7eebc5ef29a5d92d3110 Mon Sep 17 00:00:00 2001
> -From: Paul Barker <paul@paulbarker.me.uk>
> -Date: Fri, 28 Mar 2014 15:20:22 +0000
> -Subject: [PATCH 2/2] opkg-0.2.x: add-exclude
> -
> -Add a way to exclude specific packages from the install
> -
> -When an excluded package is required by another package an error
> -will be generated.  If the excluded package is only recommended,
> -no error will be generated.
> -
> -The lifespan of the exclude_list covers the execution of the process,
> -so there is no need to free the data.
> -
> -v2: Use xmalloc instead of malloc and xrealloc instead of realloc. In op=
kg,
> -these functions are guaranteed not to return NULL.
> -
> -Upstream-Status: Accepted for v0.3.0 release with modifications
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ----
> - libopkg/opkg_conf.c   |  1 +
> - libopkg/opkg_conf.h   |  2 ++
> - libopkg/pkg_depends.c | 16 ++++++++++++++++
> - src/opkg-cl.c         | 15 +++++++++++++++
> - 4 files changed, 34 insertions(+)
> -
> -diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
> -index 4eee37b..1ab63fb 100644
> ---- a/libopkg/opkg_conf.c
> -+++ b/libopkg/opkg_conf.c
> -@@ -447,6 +447,7 @@ opkg_conf_init(void)
> - 	pkg_dest_list_init(&conf->pkg_dest_list);
> - 	pkg_dest_list_init(&conf->tmp_dest_list);
> - 	nv_pair_list_init(&conf->arch_list);
> -+	conf->exclude_list =3D NULL;
> -=20
> - 	return 0;
> - }
> -diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> -index 2f189e0..6d6e613 100644
> ---- a/libopkg/opkg_conf.h
> -+++ b/libopkg/opkg_conf.h
> -@@ -51,6 +51,8 @@ struct opkg_conf
> -      pkg_dest_list_t pkg_dest_list;
> -      pkg_dest_list_t tmp_dest_list;
> -      nv_pair_list_t arch_list;
> -+     size_t exclude_count;
> -+     char ** exclude_list;
> -=20
> -      int restrict_to_default_dest;
> -      pkg_dest_t *default_dest;
> -diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> -index 41bf206..eb630d1 100644
> ---- a/libopkg/pkg_depends.c
> -+++ b/libopkg/pkg_depends.c
> -@@ -204,6 +204,22 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg=
, pkg_vec_t *unsatisfied,
> - 			 continue;
> - 		    }
> -=20
> -+		    /* Check for excluded packages */
> -+		    if (satisfying_pkg !=3D NULL && conf->exclude_list) {
> -+			int i, exclude =3D 0;
> -+			for (i =3D 0; i < conf->exclude_count; i++) {
> -+			    if (!strcmp(satisfying_pkg->name, conf->exclude_list[i])) {
> -+				opkg_msg(NOTICE, "%s: exclude required package %s"
> -+					"at users request\n",
> -+					pkg->name, satisfying_pkg->name);
> -+				exclude =3D 1;
> -+				break;
> -+			    }
> -+			}
> -+			if (exclude)
> -+			    continue;
> -+		    }
> -+
> - 		    opkg_msg(DEBUG, "satisfying_pkg=3D%p\n", satisfying_pkg);
> - 		    if (satisfying_pkg !=3D NULL) {
> - 			 satisfier_entry_pkg =3D satisfying_pkg;
> -diff --git a/src/opkg-cl.c b/src/opkg-cl.c
> -index 6378380..f10d10b 100644
> ---- a/src/opkg-cl.c
> -+++ b/src/opkg-cl.c
> -@@ -45,6 +45,7 @@ enum {
> - 	ARGS_OPT_PREFER_ARCH_TO_VERSION,
> - 	ARGS_OPT_ADD_ARCH,
> - 	ARGS_OPT_ADD_DEST,
> -+	ARGS_OPT_ADD_EXCLUDE,
> - 	ARGS_OPT_NOACTION,
> - 	ARGS_OPT_DOWNLOAD_ONLY,
> - 	ARGS_OPT_NODEPS,
> -@@ -97,6 +98,7 @@ static struct option long_options[] =3D {
> - 	{"offline-root", 1, 0, 'o'},
> - 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
> - 	{"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
> -+	{"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
> - 	{"test", 0, 0, ARGS_OPT_NOACTION},
> - 	{"tmp-dir", 1, 0, 't'},
> - 	{"tmp_dir", 1, 0, 't'},
> -@@ -200,6 +202,18 @@ args_parse(int argc, char *argv[])
> - 			}
> - 			free(tuple);
> - 			break;
> -+		case ARGS_OPT_ADD_EXCLUDE:
> -+			tuple =3D xstrdup(optarg);
> -+			if (!conf->exclude_list) {
> -+				conf->exclude_count =3D 1;
> -+				conf->exclude_list =3D xmalloc(sizeof(char *) * conf->exclude_count=
);
> -+				conf->exclude_list[conf->exclude_count - 1] =3D tuple;
> -+			} else {
> -+				conf->exclude_count++;
> -+				conf->exclude_list =3D xrealloc(conf->exclude_list, sizeof(char *) =
* conf->exclude_count);
> -+				conf->exclude_list[conf->exclude_count - 1] =3D tuple;
> -+			}
> -+			break;
> - 		case ARGS_OPT_NOACTION:
> - 			conf->noaction =3D 1;
> - 			break;
> -@@ -287,6 +301,7 @@ usage()
> - 	printf("\t--offline-root <dir>            offline installation of pack=
ages.\n");
> - 	printf("\t--add-arch <arch>:<prio>        Register architecture with g=
iven priority\n");
> - 	printf("\t--add-dest <name>:<path>        Register destination with gi=
ven path\n");
> -+	printf("\t--add-exclude <name>		  Register package to be excluded from=
 install\n");
> - 	printf("\t--prefer-arch-to-version        Use the architecture priorit=
y package rather\n");
> - 	printf("\t                                than the higher version one =
if more\n");
> - 	printf("\t                                than one candidate is found.=
\n");
> ---=20
> -2.1.3
> -
> diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch =
b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
> deleted file mode 100644
> index c2d244d..0000000
> --- a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From 2e2ccc7e7fc81a7eee2d004d3644efbc1be1ad73 Mon Sep 17 00:00:00 2001
> -From: Paul Barker <paul@paulbarker.me.uk>
> -Date: Fri, 28 Mar 2014 15:19:08 +0000
> -Subject: [PATCH 1/2] opkg-0.2.x: no-install-recommends
> -
> -Add the ability to not install ANY recommended packages.
> -
> -Upstream-Status: Accepted for v0.3.0 release with modifications
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ----
> - libopkg/opkg_conf.h   | 1 +
> - libopkg/pkg_depends.c | 3 ++-
> - src/opkg-cl.c         | 7 +++++++
> - 3 files changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> -index e0e045a..2f189e0 100644
> ---- a/libopkg/opkg_conf.h
> -+++ b/libopkg/opkg_conf.h
> -@@ -82,6 +82,7 @@ struct opkg_conf
> -      int prefer_arch_to_version;
> -      int check_signature;
> -      int nodeps; /* do not follow dependencies */
> -+     int noinstall_recommends;
> -      char *offline_root;
> -      char *overlay_root;
> -      int query_all;
> -diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> -index 8ab6508..41bf206 100644
> ---- a/libopkg/pkg_depends.c
> -+++ b/libopkg/pkg_depends.c
> -@@ -21,6 +21,7 @@
> - #include <ctype.h>
> -=20
> - #include "pkg.h"
> -+#include "opkg_conf.h"
> - #include "opkg_utils.h"
> - #include "pkg_hash.h"
> - #include "opkg_message.h"
> -@@ -196,7 +197,7 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg,=
 pkg_vec_t *unsatisfied,
> - 		    /* user request overrides package recommendation */
> - 		    if (satisfying_pkg !=3D NULL
> - 			&& (compound_depend->type =3D=3D RECOMMEND || compound_depend->type =
=3D=3D SUGGEST)
> --			&& (satisfying_pkg->state_want =3D=3D SW_DEINSTALL || satisfying_pkg=
->state_want =3D=3D SW_PURGE)) {
> -+			&& (satisfying_pkg->state_want =3D=3D SW_DEINSTALL || satisfying_pkg=
->state_want =3D=3D SW_PURGE || conf->noinstall_recommends)) {
> - 			 opkg_msg(NOTICE, "%s: ignoring recommendation for "
> - 					"%s at user request\n",
> - 					pkg->name, satisfying_pkg->name);
> -diff --git a/src/opkg-cl.c b/src/opkg-cl.c
> -index a1d121f..6378380 100644
> ---- a/src/opkg-cl.c
> -+++ b/src/opkg-cl.c
> -@@ -51,6 +51,7 @@ enum {
> - 	ARGS_OPT_AUTOREMOVE,
> - 	ARGS_OPT_CACHE,
> -         ARGS_OPT_COMBINE,
> -+	ARGS_OPT_NOINSTALL_RECOMMENDS,
> - };
> -=20
> - static struct option long_options[] =3D {
> -@@ -91,6 +92,7 @@ static struct option long_options[] =3D {
> - 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
> - 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
> - 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
> -+	{"no-install-recommends", 0, 0, ARGS_OPT_NOINSTALL_RECOMMENDS},
> - 	{"offline", 1, 0, 'o'},
> - 	{"offline-root", 1, 0, 'o'},
> - 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
> -@@ -201,6 +203,9 @@ args_parse(int argc, char *argv[])
> - 		case ARGS_OPT_NOACTION:
> - 			conf->noaction =3D 1;
> - 			break;
> -+		case ARGS_OPT_NOINSTALL_RECOMMENDS:
> -+			conf->noinstall_recommends =3D 1;
> -+			break;
> -         case ARGS_OPT_DOWNLOAD_ONLY:
> - 			conf->download_only =3D 1;
> - 			break;
> -@@ -300,6 +305,8 @@ usage()
> - 	printf("\t--noaction                      No action -- test only\n");
> - 	printf("\t--download-only                 No action -- download only\n=
");
> - 	printf("\t--nodeps                        Do not follow dependencies\n=
");
> -+	printf("\t--no-install-recommends\n");
> -+	printf("\t                                Do not install any recommend=
ed packages\n");
> - 	printf("\t--force-removal-of-dependent-packages\n");
> - 	printf("\t                                Remove package and all depen=
dencies\n");
> - 	printf("\t--autoremove                    Remove packages that were in=
stalled\n");
> ---=20
> -2.1.3
> -
> diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/met=
a/recipes-devtools/opkg/opkg/opkg-configure.service
> index b18295b..8e74026 100644
> --- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> +++ b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> @@ -7,7 +7,7 @@ Before=3Dsysinit.target
>  [Service]
>  Type=3Doneshot
>  EnvironmentFile=3D-@SYSCONFDIR@/default/postinst
> -ExecStart=3D-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING =3D '1' ]; the=
n @BINDIR@/opkg-cl configure > $LOGFILE 2>&1; else @BINDIR@/opkg-cl configu=
re; fi"
> +ExecStart=3D-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING =3D '1' ]; the=
n @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure; fi"
>  ExecStartPost=3D@BASE_BINDIR@/systemctl disable opkg-configure.service
>  StandardOutput=3Dsyslog
>  RemainAfterExit=3DNo
> diff --git a/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-sha=
ve-I-m4.patch b/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-sh=
ave-I-m4.patch
> deleted file mode 100644
> index 8bde02a..0000000
> --- a/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4=
=2Epatch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From d480d837ff57e855d1cf0b63054d6b1ad7aaf2ee Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Tue, 6 Jan 2015 17:54:43 -0800
> -Subject: [PATCH] Makefile.am: remove ACLOCAL_AMFLAGS =3D -I shave -I m4
> -
> -Fixed:
> -libtoolize:   error: AC_CONFIG_MACRO_DIRS([m4]) conflicts with ACLOCAL_A=
MFLAGS=3D-I shave.
> -
> -They are already included by configure.ac:
> -AC_CONFIG_MACRO_DIR([m4])
> -AC_CONFIG_MACRO_DIR([shave])
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - Makefile.am |    2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 8baa62c..6679f77 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,5 +1,3 @@
> --ACLOCAL_AMFLAGS =3D -I shave -I m4
> --
> - SUBDIRS =3D libbb libopkg src tests utils man
> -=20
> -=20
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devt=
ools/opkg/opkg_0.2.4.bb
> deleted file mode 100644
> index b7574e5..0000000
> --- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -SUMMARY =3D "Open Package Manager"
> -SUMMARY_libopkg =3D "Open Package Manager library"
> -SECTION =3D "base"
> -HOMEPAGE =3D "http://code.google.com/p/opkg/"
> -BUGTRACKER =3D "http://code.google.com/p/opkg/issues/list"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> -                    file://src/opkg-cl.c;beginline=3D1;endline=3D20;md5=
=3D321f658c3f6b6c832e25c8850b5dffba"
> -
> -PE =3D "1"
> -
> -SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${=
PV}.tar.gz \
> -           file://no-install-recommends.patch \
> -           file://add-exclude.patch \
> -           file://remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch \
> -           file://opkg-configure.service \
> -           file://opkg.conf \
> -           file://0001-opkg-key-Backport-improvements.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "40ed2aee15abc8d550539449630091bd"
> -SRC_URI[sha256sum] =3D "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef959=
99faece015453086"
> -
> -inherit autotools pkgconfig systemd
> -
> -SYSTEMD_SERVICE_${PN} =3D "opkg-configure.service"
> -
> -target_localstatedir :=3D "${localstatedir}"
> -OPKGLIBDIR =3D "${target_localstatedir}/lib"
> -
> -PACKAGECONFIG ??=3D ""
> -
> -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error,gn=
upg"
> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl o=
penssl"
> -PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
> -PACKAGECONFIG[pathfinder] =3D "--enable-pathfinder,--disable-pathfinder,=
pathfinder"
> -
> -EXTRA_OECONF =3D "\
> -  --with-opkgetcdir=3D${sysconfdir} \
> -  --with-opkglibdir=3D${OPKGLIBDIR} \
> -"
> -
> -do_install_append () {
> -	install -d ${D}${sysconfdir}/opkg
> -	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
> -	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/op=
kg/opkg.conf
> -
> -	# We need to create the lock directory
> -	install -d ${D}${OPKGLIBDIR}/opkg
> -
> -	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
then
> -		install -d ${D}${systemd_unitdir}/system
> -		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdi=
r}/system/
> -		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> -			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -			-e 's,@BINDIR@,${bindir},g' \
> -			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
> -			${D}${systemd_unitdir}/system/opkg-configure.service
> -	fi
> -
> -	# The installed binary is 'opkg-cl' but people and scripts often expect
> -	# it to just be 'opkg'
> -	ln -sf opkg-cl ${D}${bindir}/opkg
> -
> -	rm ${D}${bindir}/update-alternatives
> -}
> -
> -RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-con=
fig run-postinsts"
> -RDEPENDS_${PN}_class-native =3D ""
> -RDEPENDS_${PN}_class-nativesdk =3D ""
> -RREPLACES_${PN} =3D "opkg-nogpg opkg-collateral"
> -RCONFLICTS_${PN} =3D "opkg-collateral"
> -RPROVIDES_${PN} =3D "opkg-collateral"
> -
> -PACKAGES =3D+ "libopkg"
> -
> -FILES_libopkg =3D "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
> -FILES_${PN} +=3D "${systemd_unitdir}/system/"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/opkg/opkg.conf"
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.3.0.bb
> new file mode 100644
> index 0000000..f4dbb2d
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
> @@ -0,0 +1,72 @@
> +SUMMARY =3D "Open Package Manager"
> +SUMMARY_libopkg =3D "Open Package Manager library"
> +SECTION =3D "base"
> +HOMEPAGE =3D "http://code.google.com/p/opkg/"
> +BUGTRACKER =3D "http://code.google.com/p/opkg/issues/list"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> +                    file://src/opkg.c;beginline=3D2;endline=3D21;md5=3D9=
0435a519c6ea69ef22e4a88bcc52fa0"
> +
> +DEPENDS =3D "libarchive"
> +
> +PE =3D "1"
> +
> +SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${=
PV}.tar.gz \
> +           file://opkg-configure.service \
> +           file://opkg.conf \
> +           file://0001-opkg_archive-add-support-for-empty-compressed-fil=
es.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "3412cdc71d78b98facc84b19331ec64e"
> +SRC_URI[sha256sum] =3D "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37=
a6d2f9474f54988f"
> +
> +inherit autotools pkgconfig systemd
> +
> +SYSTEMD_SERVICE_${PN} =3D "opkg-configure.service"
> +
> +target_localstatedir :=3D "${localstatedir}"
> +OPKGLIBDIR =3D "${target_localstatedir}/lib"
> +
> +PACKAGECONFIG ??=3D ""
> +
> +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error,gn=
upg"
> +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> +PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl o=
penssl"
> +PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> +PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
> +PACKAGECONFIG[pathfinder] =3D "--enable-pathfinder,--disable-pathfinder,=
pathfinder"
> +
> +do_install_append () {
> +	install -d ${D}${sysconfdir}/opkg
> +	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
> +	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/op=
kg/opkg.conf
> +
> +	# We need to create the lock directory
> +	install -d ${D}${OPKGLIBDIR}/opkg
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
then
> +		install -d ${D}${systemd_unitdir}/system
> +		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdi=
r}/system/
> +		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +			-e 's,@BINDIR@,${bindir},g' \
> +			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
> +			${D}${systemd_unitdir}/system/opkg-configure.service
> +	fi
> +}
> +
> +RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-con=
fig run-postinsts libarchive"
> +RDEPENDS_${PN}_class-native =3D ""
> +RDEPENDS_${PN}_class-nativesdk =3D ""
> +RREPLACES_${PN} =3D "opkg-nogpg opkg-collateral"
> +RCONFLICTS_${PN} =3D "opkg-collateral"
> +RPROVIDES_${PN} =3D "opkg-collateral"
> +
> +PACKAGES =3D+ "libopkg"
> +
> +FILES_libopkg =3D "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
> +FILES_${PN} +=3D "${systemd_unitdir}/system/"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/opkg/opkg.conf"
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postin=
sts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> index 58ea85e..53a8e1d 100755
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> @@ -73,7 +73,7 @@ remove_pi_dir=3D1
>  if $pm_installed; then
>  	case $pm in
>  		"ipk")
> -			eval opkg-cl configure $append_log
> +			eval opkg configure $append_log
>  			;;
> =20
>  		"deb")
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkmzwACgkQN1Ujt2V2gBxqzQCfaFVwPkVCeLNC4osG1dG0EhCu
X2IAn1/kUoAC/F9YodgyffbsEdnH/zi7
=iDwr
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
