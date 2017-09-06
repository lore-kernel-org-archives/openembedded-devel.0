Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id AEE1973123
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 08:09:49 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id x85so10711808vkx.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 01:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Ma24ZTUqaPU8ffIR246SPvZrrVuutOkW5HzFlh9buM=;
	b=KyrTBpQ9/HAuwdi6yGPFdw9+tKrqq7WFOj0LjBTLQ2Auocw4a1POe+VDLwdQ9UqBis
	0ZAY0qwtV0J2tVUJ++NX/jAZEwVCt0n0/8QPfnm694Um0MFiGNfjYsWinkiVRQWiMQtu
	VYgVse2dXf1/V4iI3n+jwjx3N2A/TZeevyWFoPWe9tVMp0a5328LCQAxGi5UJrbBjgtN
	DQap9GOr4wyG17ZJskIurwGIvMQK+dL/i0KRFrTzmxzqtGjxUeLMt0kdyaBErwdmuWsv
	rnze9gd6INhYIUvpcrRF1rs+T1/MKM21qmuGS7yHqkt7UsV6C400sDYgEwKHoVtmu0+i
	KvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Ma24ZTUqaPU8ffIR246SPvZrrVuutOkW5HzFlh9buM=;
	b=kVDxcPGehNMCeRL5J+GT9MZuTbT87kogYVAyy471Udtt1aAO+9JAhg2rhxjy8t0y3q
	Dbs25E0Bt2oBptqSaFDixEpHnJHK9PUdjUIacRACxwzSl8OuLyy9BqVYOROIuuPw46YK
	NOAb2pN2lkr2unTD8Dnt+bEhTO7a06z4x8vGzJ4Dn7DMQV1rbCn4/XzdfSWnuXuWig2n
	ltBTbYCwaOfBRfPc2hiuAoo8AThkwHEBO7JxorKsSWxOzzgWKD2xM5++05TvCtcRJ47V
	bED2JcQVGoG0yUNIR5/Vl0RX3J1qraodPf4RU2WQRO2s6hff6rmgrlz4TpDAGPHCRlNP
	vglg==
X-Gm-Message-State: AHPjjUiVxf+6no2qXTRSI8xaTQoAbmo2VON8PMywPXSoAtx6evvrqUCU
	7SDsTOU4h35+JF2vjcKr+r29801VoA==
X-Google-Smtp-Source: ADKCNb4sKYN3P75dQJdI8Frbxk2m2Ovc/lBZF2SEmKo7w6zWsI28XOqD5NjocqM0xLyUuKpN4iHHUVjYlOcMtzHktes=
X-Received: by 10.31.41.136 with SMTP id p130mr1031578vkp.122.1504685390807;
	Wed, 06 Sep 2017 01:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 6 Sep 2017 01:09:50 -0700 (PDT)
In-Reply-To: <20170902220559.9784-2-raj.khem@gmail.com>
References: <20170902220559.9784-1-raj.khem@gmail.com>
	<20170902220559.9784-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Sep 2017 10:09:50 +0200
Message-ID: <CA+chaQefO7rkJG6eLnWctdow5cZmmKcwZ8xdjG3VWBrd4oyzUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 2/2] xfsprogs: Upgrade to 4.12.0
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
X-List-Received-Date: Wed, 06 Sep 2017 08:09:50 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build (probably due to gold):
http://errors.yoctoproject.org/Errors/Details/155158/

On Sun, Sep 3, 2017 at 12:05 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Fix cross builds with hardening flags
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...Rename-progname-as-it-is-provided-by-libc.patch | 204
> +++++++++++++++++++++
>  .../files/remove_flags_from_build_flags.patch      |  13 ++
>  .../xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch  | 117 ++++++++++++
>  .../{xfsprogs_4.11.0.bb => xfsprogs_4.12.0.bb}     |   7 +-
>  4 files changed, 339 insertions(+), 2 deletions(-)
>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-
> Rename-progname-as-it-is-provided-by-libc.patch
>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/remove_
> flags_from_build_flags.patch
>  create mode 100644 meta-filesystems/recipes-
> utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
>  rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.11.0.bb =>
> xfsprogs_4.12.0.bb} (85%)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> Rename-progname-as-it-is-provided-by-libc.patch
> b/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> Rename-progname-as-it-is-provided-by-libc.patch
> new file mode 100644
> index 000000000..aa13b67be
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> Rename-progname-as-it-is-provided-by-libc.patch
> @@ -0,0 +1,204 @@
> +From 95aaaa800e0dc387875b4e2adad480b72c1632ff Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 2 Sep 2017 14:46:49 -0700
> +Subject: [PATCH] Rename progname as it is provided by libc
> +
> +Rename local variable progname to avoid a clash with libc
> +global symbols
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + io/init.c                 | 10 +++++-----
> + mdrestore/xfs_mdrestore.c | 10 +++++-----
> + quota/init.c              | 10 +++++-----
> + spaceman/init.c           |  8 ++++----
> + 4 files changed, 19 insertions(+), 19 deletions(-)
> +
> +diff --git a/io/init.c b/io/init.c
> +index 20d5f80..e82e101 100644
> +--- a/io/init.c
> ++++ b/io/init.c
> +@@ -23,7 +23,7 @@
> + #include "init.h"
> + #include "io.h"
> +
> +-char  *progname;
> ++char  *io_progname;
> + int   exitcode;
> + int   expert;
> + int   idlethread;
> +@@ -35,7 +35,7 @@ usage(void)
> + {
> +       fprintf(stderr,
> + _("Usage: %s [-adfinrRstVx] [-m mode] [-p prog] [[-c|-C] cmd]...
> file\n"),
> +-              progname);
> ++              io_progname);
> +       exit(1);
> + }
> +
> +@@ -142,7 +142,7 @@ init(
> +       xfs_fsop_geom_t geometry = { 0 };
> +       struct fs_path  fsp;
> +
> +-      progname = basename(argv[0]);
> ++      io_progname = basename(argv[0]);
> +       setlocale(LC_ALL, "");
> +       bindtextdomain(PACKAGE, LOCALEDIR);
> +       textdomain(PACKAGE);
> +@@ -186,7 +186,7 @@ init(
> +                       flags |= IO_NONBLOCK;
> +                       break;
> +               case 'p':
> +-                      progname = optarg;
> ++                      io_progname = optarg;
> +                       break;
> +               case 'r':
> +                       flags |= IO_READONLY;
> +@@ -207,7 +207,7 @@ init(
> +                       expert = 1;
> +                       break;
> +               case 'V':
> +-                      printf(_("%s version %s\n"), progname, VERSION);
> ++                      printf(_("%s version %s\n"), io_progname, VERSION);
> +                       exit(0);
> +               default:
> +                       usage();
> +diff --git a/mdrestore/xfs_mdrestore.c b/mdrestore/xfs_mdrestore.c
> +index 9d1b4e8..b840a54 100644
> +--- a/mdrestore/xfs_mdrestore.c
> ++++ b/mdrestore/xfs_mdrestore.c
> +@@ -19,7 +19,7 @@
> + #include "libxfs.h"
> + #include "xfs_metadump.h"
> +
> +-char          *progname;
> ++char          *mdrestore_progname;
> + int           show_progress = 0;
> + int           show_info = 0;
> + int           progress_since_warning = 0;
> +@@ -30,7 +30,7 @@ fatal(const char *msg, ...)
> +       va_list         args;
> +
> +       va_start(args, msg);
> +-      fprintf(stderr, "%s: ", progname);
> ++      fprintf(stderr, "%s: ", mdrestore_progname);
> +       vfprintf(stderr, msg, args);
> +       exit(1);
> + }
> +@@ -194,7 +194,7 @@ perform_restore(
> + static void
> + usage(void)
> + {
> +-      fprintf(stderr, "Usage: %s [-V] [-g] source target\n", progname);
> ++      fprintf(stderr, "Usage: %s [-V] [-g] source target\n",
> mdrestore_progname);
> +       exit(1);
> + }
> +
> +@@ -212,7 +212,7 @@ main(
> +       struct stat     statbuf;
> +       int             is_target_file;
> +
> +-      progname = basename(argv[0]);
> ++      mdrestore_progname = basename(argv[0]);
> +
> +       while ((c = getopt(argc, argv, "giV")) != EOF) {
> +               switch (c) {
> +@@ -223,7 +223,7 @@ main(
> +                               show_info = 1;
> +                               break;
> +                       case 'V':
> +-                              printf("%s version %s\n", progname,
> VERSION);
> ++                              printf("%s version %s\n",
> mdrestore_progname, VERSION);
> +                               exit(0);
> +                       default:
> +                               usage();
> +diff --git a/quota/init.c b/quota/init.c
> +index d45dc4c..46403de 100644
> +--- a/quota/init.c
> ++++ b/quota/init.c
> +@@ -21,7 +21,7 @@
> + #include "input.h"
> + #include "init.h"
> +
> +-char  *progname;
> ++char  *quota_progname;
> + int   exitcode;
> + int   expert;
> + bool  foreign_allowed = false;
> +@@ -47,7 +47,7 @@ usage(void)
> + {
> +       fprintf(stderr,
> +               _("Usage: %s [-V] [-x] [-f] [-p prog] [-c cmd]... [-d
> project]... [path]\n"),
> +-              progname);
> ++              quota_progname);
> +       exit(1);
> + }
> +
> +@@ -147,7 +147,7 @@ init(
> + {
> +       int             c;
> +
> +-      progname = basename(argv[0]);
> ++      quota_progname = basename(argv[0]);
> +       setlocale(LC_ALL, "");
> +       bindtextdomain(PACKAGE, LOCALEDIR);
> +       textdomain(PACKAGE);
> +@@ -173,13 +173,13 @@ init(
> +                       projid_file = optarg;
> +                       break;
> +               case 'p':
> +-                      progname = optarg;
> ++                      quota_progname = optarg;
> +                       break;
> +               case 'x':
> +                       expert++;
> +                       break;
> +               case 'V':
> +-                      printf(_("%s version %s\n"), progname, VERSION);
> ++                      printf(_("%s version %s\n"), quota_progname,
> VERSION);
> +                       exit(0);
> +               default:
> +                       usage();
> +diff --git a/spaceman/init.c b/spaceman/init.c
> +index b3eface..bedf112 100644
> +--- a/spaceman/init.c
> ++++ b/spaceman/init.c
> +@@ -23,7 +23,7 @@
> + #include "path.h"
> + #include "space.h"
> +
> +-char  *progname;
> ++char  *spaceman_progname;
> + int   exitcode;
> +
> + void
> +@@ -31,7 +31,7 @@ usage(void)
> + {
> +       fprintf(stderr,
> +               _("Usage: %s [-c cmd] file\n"),
> +-              progname);
> ++              spaceman_progname);
> +       exit(1);
> + }
> +
> +@@ -74,7 +74,7 @@ init(
> +       xfs_fsop_geom_t geometry = { 0 };
> +       struct fs_path  fsp;
> +
> +-      progname = basename(argv[0]);
> ++      spaceman_progname = basename(argv[0]);
> +       setlocale(LC_ALL, "");
> +       bindtextdomain(PACKAGE, LOCALEDIR);
> +       textdomain(PACKAGE);
> +@@ -86,7 +86,7 @@ init(
> +                       add_user_command(optarg);
> +                       break;
> +               case 'V':
> +-                      printf(_("%s version %s\n"), progname, VERSION);
> ++                      printf(_("%s version %s\n"), spaceman_progname,
> VERSION);
> +                       exit(0);
> +               default:
> +                       usage();
> +--
> +2.14.1
> +
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
> b/meta-filesystems/recipes-utils/xfsprogs/files/remove_
> flags_from_build_flags.patch
> new file mode 100644
> index 000000000..bba9a25c2
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove_
> flags_from_build_flags.patch
> @@ -0,0 +1,13 @@
> +Index: xfsprogs-4.12.0/include/builddefs.in
> +===================================================================
> +--- xfsprogs-4.12.0.orig/include/builddefs.in
> ++++ xfsprogs-4.12.0/include/builddefs.in
> +@@ -164,7 +164,7 @@ ifeq ($(ENABLE_GETTEXT),yes)
> + GCFLAGS += -DENABLE_GETTEXT
> + endif
> +
> +-BUILD_CFLAGS += $(GCFLAGS) $(PCFLAGS)
> ++BUILD_CFLAGS += $(GCFLAGS)
> + # First, Global, Platform, Local CFLAGS
> + CFLAGS += $(FCFLAGS) $(OPTIMIZER) $(GCFLAGS) $(PCFLAGS) $(LCFLAGS)
> +
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
> b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-
> 4.12.0-fix_musl.patch
> new file mode 100644
> index 000000000..efc57e4f6
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-
> 4.12.0-fix_musl.patch
> @@ -0,0 +1,117 @@
> +From 21253610f9ef87db8e2a75b863b7fcfbd0cdb421 Mon Sep 17 00:00:00 2001
> +From: "Darrick J. Wong" <darrick.wong@oracle.com>
> +Date: Tue, 25 Jul 2017 13:45:01 -0500
> +Subject: [PATCH] In patch 4944defad4 ("xfs_db: redirect printfs when
> + metadumping to stdout"), we solved the problem of xfs_db printfs ending
> up in
> + the metadump stream by reassigning stdout for the duration of a stdout
> + metadump.  Unfortunately, musl doesn't allow stdout to be reassigned (in
> + their view "extern FILE *stdout" means "extern FILE * const stdout"), so
> we
> + abandon the old approach in favor of playing games with dup() to switch
> the
> + raw file descriptors.
> +
> +While we're at it, fix a regression where an unconverted outf test
> +allows progress info to end up in the metadump stream.
> +
> +Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> +---
> + db/metadump.c | 47 ++++++++++++++++++++++++++++++++++++-----------
> + 1 file changed, 36 insertions(+), 11 deletions(-)
> +
> +diff --git a/db/metadump.c b/db/metadump.c
> +index 96641e0..4e2f648 100644
> +--- a/db/metadump.c
> ++++ b/db/metadump.c
> +@@ -78,6 +78,7 @@ static int           obfuscate = 1;
> + static int            zero_stale_data = 1;
> + static int            show_warnings = 0;
> + static int            progress_since_warning = 0;
> ++static bool           stdout_metadump;
> +
> + void
> + metadump_init(void)
> +@@ -137,7 +138,7 @@ print_progress(const char *fmt, ...)
> +       va_end(ap);
> +       buf[sizeof(buf)-1] = '\0';
> +
> +-      f = (outf == stdout) ? stderr : stdout;
> ++      f = stdout_metadump ? stderr : stdout;
> +       fprintf(f, "\r%-59s", buf);
> +       fflush(f);
> +       progress_since_warning = 1;
> +@@ -2750,7 +2751,8 @@ metadump_f(
> +       xfs_agnumber_t  agno;
> +       int             c;
> +       int             start_iocur_sp;
> +-      bool            stdout_metadump = false;
> ++      int             outfd = -1;
> ++      int             ret;
> +       char            *p;
> +
> +       exitcode = 1;
> +@@ -2870,16 +2872,35 @@ metadump_f(
> +                * metadump operation so that dbprintf and other messages
> +                * are sent to the console instead of polluting the
> +                * metadump stream.
> ++               *
> ++               * We get to do this the hard way because musl doesn't
> ++               * allow reassignment of stdout.
> +                */
> +-              outf = stdout;
> +-              stdout = stderr;
> ++              fflush(stdout);
> ++              outfd = dup(STDOUT_FILENO);
> ++              if (outfd < 0) {
> ++                      perror("opening dump stream");
> ++                      goto out;
> ++              }
> ++              ret = dup2(STDERR_FILENO, STDOUT_FILENO);
> ++              if (ret < 0) {
> ++                      perror("redirecting stdout");
> ++                      close(outfd);
> ++                      goto out;
> ++              }
> ++              outf = fdopen(outfd, "a");
> ++              if (outf == NULL) {
> ++                      fprintf(stderr, "cannot create dump stream\n");
> ++                      dup2(outfd, 1);
> ++                      close(outfd);
> ++                      goto out;
> ++              }
> +               stdout_metadump = true;
> +       } else {
> +               outf = fopen(argv[optind], "wb");
> +               if (outf == NULL) {
> +                       print_warning("cannot create dump file");
> +-                      free(metablock);
> +-                      return 0;
> ++                      goto out;
> +               }
> +       }
> +
> +@@ -2907,15 +2928,19 @@ metadump_f(
> +       if (progress_since_warning)
> +               fputc('\n', stdout_metadump ? stderr : stdout);
> +
> +-      if (stdout_metadump)
> +-              stdout = outf;
> +-      else
> +-              fclose(outf);
> ++      if (stdout_metadump) {
> ++              fflush(outf);
> ++              fflush(stdout);
> ++              ret = dup2(outfd, STDOUT_FILENO);
> ++              if (ret < 0)
> ++                      perror("un-redirecting stdout");
> ++      }
> ++      fclose(outf);
> +
> +       /* cleanup iocur stack */
> +       while (iocur_sp > start_iocur_sp)
> +               pop_cur();
> +-
> ++out:
> +       free(metablock);
> +
> +       return 0;
> +--
> +2.13.3
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
> similarity index 85%
> rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
> rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
> index 046dea425..444f712b5 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
> @@ -8,9 +8,12 @@ DEPENDS = "util-linux util-linux-native"
>  SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${
> BP}.tar.xz \
>             file://link_needed_libs.patch \
>             file://0001-define-__-prefixed-version-of-intXY_t-types.patch
> \
> +           file://remove_flags_from_build_flags.patch \
> +           file://0001-Rename-progname-as-it-is-provided-by-libc.patch \
> +           file://xfsprogs-4.12.0-fix_musl.patch \
>             "
> -SRC_URI[md5sum] = "f1f9b8c752347eefdb56483dafa0cefb"
> -SRC_URI[sha256sum] = "c3a6d87b564d7738243c507df82276
> bed982265e345363a95f2c764e8a5f5bb2"
> +SRC_URI[md5sum] = "e348b0e1d7bd1cd82d64b91ff37e727e"
> +SRC_URI[sha256sum] = "b330ad8d737f4152ae511580102e2f
> c49212bb51dfb4b614084344abae46d0df"
>
>  inherit autotools-brokensep
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

