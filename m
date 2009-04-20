Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvwUZ-0006mh-Gh
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 18:37:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LvwQO-0004dP-4t
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 16:32:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:32:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:32:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 18:32:40 +0200
Message-ID: <gsi838$ec5$1@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][STABLE][PATCH 1/1] busybox 1.13.2: Add more upstream patches, bump PR
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
X-List-Received-Date: Mon, 20 Apr 2009 16:37:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 20-04-09 17:24, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@kernel.crashing.org>
>
> This adds the awk, killall, printf, syslogd, top24, unzip and wget patches
> from http://busybox.net/downloads/fixes-1.13.2/
> ---
>   .../busybox-1.13.2/busybox-1.13.2-awk.patch        |   46 ++++++++++++++++++++
>   .../busybox-1.13.2/busybox-1.13.2-killall.patch    |   17 +++++++
>   .../busybox-1.13.2/busybox-1.13.2-printf.patch     |   21 +++++++++
>   .../busybox-1.13.2/busybox-1.13.2-syslogd.patch    |   30 +++++++++++++
>   .../busybox-1.13.2/busybox-1.13.2-top24.patch      |   12 +++++
>   .../busybox-1.13.2/busybox-1.13.2-unzip.patch      |   12 +++++
>   .../busybox-1.13.2/busybox-1.13.2-wget.patch       |   41 +++++++++++++++++
>   recipes/busybox/busybox_1.13.2.bb                  |    9 +++-
>   8 files changed, 187 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-awk.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-killall.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-printf.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-syslogd.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-top24.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-unzip.patch
>   create mode 100644 recipes/busybox/busybox-1.13.2/busybox-1.13.2-wget.patch
>
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-awk.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-awk.patch
> new file mode 100644
> index 0000000..0a5e680
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-awk.patch
> @@ -0,0 +1,46 @@
> +diff -urpN busybox-1.13.2/editors/awk.c busybox-1.13.2-awk/editors/awk.c
> +--- busybox-1.13.2/editors/awk.c	2008-11-09 18:28:21.000000000 +0100
> ++++ busybox-1.13.2-awk/editors/awk.c	2009-02-26 12:17:05.000000000 +0100
> +@@ -392,8 +392,12 @@ static const uint16_t PRIMES[] ALIGN2 =
> +
> +
> + /* Globals. Split in two parts so that first one is addressed
> +- * with (mostly short) negative offsets */
> ++ * with (mostly short) negative offsets.
> ++ * NB: it's unsafe to put members of type "double"
> ++ * into globals2 (gcc may fail to align them).
> ++ */
> + struct globals {
> ++	double t_double;
> + 	chain beginseq, mainseq, endseq;
> + 	chain *seq;
> + 	node *break_ptr, *continue_ptr;
> +@@ -442,16 +446,16 @@ struct globals2 {
> + 	tsplitter exec_builtin__tspl;
> +
> + 	/* biggest and least used members go last */
> +-	double t_double;
> + 	tsplitter fsplitter, rsplitter;
> + };
> + #define G1 (ptr_to_globals[-1])
> + #define G (*(struct globals2 *)ptr_to_globals)
> + /* For debug. nm --size-sort awk.o | grep -vi ' [tr] ' */
> +-/* char G1size[sizeof(G1)]; - 0x6c */
> +-/* char Gsize[sizeof(G)]; - 0x1cc */
> ++/*char G1size[sizeof(G1)]; - 0x74 */
> ++/*char Gsize[sizeof(G)]; - 0x1c4 */
> + /* Trying to keep most of members accessible with short offsets: */
> +-/* char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
> ++/*char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
> ++#define t_double     (G1.t_double    )
> + #define beginseq     (G1.beginseq    )
> + #define mainseq      (G1.mainseq     )
> + #define endseq       (G1.endseq      )
> +@@ -479,7 +483,6 @@ struct globals2 {
> + #define t_info       (G.t_info      )
> + #define t_tclass     (G.t_tclass    )
> + #define t_string     (G.t_string    )
> +-#define t_double     (G.t_double    )
> + #define t_lineno     (G.t_lineno    )
> + #define t_rollback   (G.t_rollback  )
> + #define intvar       (G.intvar      )
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-killall.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-killall.patch
> new file mode 100644
> index 0000000..9524f52
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-killall.patch
> @@ -0,0 +1,17 @@
> +--- busybox-1.13.2/include/libbb.h	Wed Dec 31 04:06:45 2008
> ++++ busybox-1.13.2-killall/include/libbb.h	Sat Feb 14 02:41:18 2009
> +@@ -1275,7 +1275,13 @@
> + 	PSSCAN_UTIME    = 1<<  13,
> + 	PSSCAN_TTY      = 1<<  14,
> + 	PSSCAN_SMAPS	= (1<<  15) * ENABLE_FEATURE_TOPMEM,
> +-	PSSCAN_ARGVN    = (1<<  16) * (ENABLE_PGREP || ENABLE_PKILL || ENABLE_PIDOF),
> ++	/* NB: used by find_pid_by_name(). Any applet using it
> ++	 * needs to be mentioned here. */
> ++	PSSCAN_ARGVN    = (1<<  16) * (ENABLE_KILLALL
> ++				|| ENABLE_PGREP || ENABLE_PKILL
> ++				|| ENABLE_PIDOF
> ++				|| ENABLE_SESTATUS
> ++				),
> + 	USE_SELINUX(PSSCAN_CONTEXT = 1<<  17,)
> + 	PSSCAN_START_TIME = 1<<  18,
> + 	PSSCAN_CPU      = 1<<  19,
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-printf.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-printf.patch
> new file mode 100644
> index 0000000..281d457
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-printf.patch
> @@ -0,0 +1,21 @@
> +diff -urpN busybox-1.13.2/coreutils/printf.c busybox-1.13.2-printf/coreutils/printf.c
> +--- busybox-1.13.2/coreutils/printf.c	2008-12-31 04:06:45.000000000 +0100
> ++++ busybox-1.13.2-printf/coreutils/printf.c	2009-03-03 15:13:12.000000000 +0100
> +@@ -139,14 +139,14 @@ static void print_direc(char *format, un
> + 	char saved;
> + 	char *have_prec, *have_width;
> +
> ++	saved = format[fmt_length];
> ++	format[fmt_length] = '\0';
> ++
> + 	have_prec = strstr(format, ".*");
> + 	have_width = strchr(format, '*');
> + 	if (have_width - 1 == have_prec)
> + 		have_width = NULL;
> +
> +-	saved = format[fmt_length];
> +-	format[fmt_length] = '\0';
> +-
> + 	switch (format[fmt_length - 1]) {
> + 	case 'c':
> + 		printf(format, *argument);
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-syslogd.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-syslogd.patch
> new file mode 100644
> index 0000000..1c24cdc
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-syslogd.patch
> @@ -0,0 +1,30 @@
> +diff -urpN busybox-1.13.2/sysklogd/syslogd.c busybox-1.13.2-syslogd/sysklogd/syslogd.c
> +--- busybox-1.13.2/sysklogd/syslogd.c	2008-11-09 18:28:03.000000000 +0100
> ++++ busybox-1.13.2-syslogd/sysklogd/syslogd.c	2009-03-08 02:03:24.000000000 +0100
> +@@ -301,17 +301,23 @@ static void log_locally(time_t now, char
> + 	}
> + #endif
> + 	if (G.logFD>= 0) {
> ++		/* Reopen log file every second. This allows admin
> ++		 * to delete the file and not worry about restarting us.
> ++		 * This costs almost nothing since it happens
> ++		 * _at most_ once a second.
> ++		 */
> + 		if (!now)
> + 			now = time(NULL);
> + 		if (G.last_log_time != now) {
> +-			G.last_log_time = now; /* reopen log file every second */
> ++			G.last_log_time = now;
> + 			close(G.logFD);
> + 			goto reopen;
> + 		}
> + 	} else {
> +  reopen:
> +-		G.logFD = device_open(G.logFilePath, O_WRONLY | O_CREAT
> +-					| O_NOCTTY | O_APPEND | O_NONBLOCK);
> ++		G.logFD = open(G.logFilePath, O_WRONLY | O_CREAT
> ++					| O_NOCTTY | O_APPEND | O_NONBLOCK,
> ++					0666);
> + 		if (G.logFD<  0) {
> + 			/* cannot open logfile? - print to /dev/console then */
> + 			int fd = device_open(DEV_CONSOLE, O_WRONLY | O_NOCTTY | O_NONBLOCK);
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-top24.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-top24.patch
> new file mode 100644
> index 0000000..25ee861
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-top24.patch
> @@ -0,0 +1,12 @@
> +diff -urpN busybox-1.13.2/procps/top.c busybox-1.13.2-top24/procps/top.c
> +--- busybox-1.13.2/procps/top.c	2008-11-09 18:28:20.000000000 +0100
> ++++ busybox-1.13.2-top24/procps/top.c	2009-03-02 22:24:31.000000000 +0100
> +@@ -200,7 +200,7 @@ static NOINLINE int read_cpu_jiffy(FILE
> + 			&p_jif->usr,&p_jif->nic,&p_jif->sys,&p_jif->idle,
> + 			&p_jif->iowait,&p_jif->irq,&p_jif->softirq,
> + 			&p_jif->steal);
> +-	if (ret>  4) {
> ++	if (ret>= 4) {
> + 		p_jif->total = p_jif->usr + p_jif->nic + p_jif->sys + p_jif->idle
> + 			+ p_jif->iowait + p_jif->irq + p_jif->softirq + p_jif->steal;
> + 		/* procps 2.x does not count iowait as busy time */
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-unzip.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-unzip.patch
> new file mode 100644
> index 0000000..6b3f713
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-unzip.patch
> @@ -0,0 +1,12 @@
> +diff -urpN busybox-1.13.2/archival/unzip.c busybox-1.13.2-unzip/archival/unzip.c
> +--- busybox-1.13.2/archival/unzip.c	2008-11-09 18:28:02.000000000 +0100
> ++++ busybox-1.13.2-unzip/archival/unzip.c	2009-02-26 12:17:21.000000000 +0100
> +@@ -140,7 +140,7 @@ struct BUG_cde_header_must_be_16_bytes {
> + };
> +
> + #define FIX_ENDIANNESS_CDE(cde_header) do { \
> +-	(cde_header).formatted.cds_offset = SWAP_LE16((cde_header).formatted.cds_offset); \
> ++	(cde_header).formatted.cds_offset = SWAP_LE32((cde_header).formatted.cds_offset); \
> + } while (0)
> +
> + enum { zip_fd = 3 };
> diff --git a/recipes/busybox/busybox-1.13.2/busybox-1.13.2-wget.patch b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-wget.patch
> new file mode 100644
> index 0000000..862467f
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/busybox-1.13.2-wget.patch
> @@ -0,0 +1,41 @@
> +diff -urpN busybox-1.13.2/networking/wget.c busybox-1.13.2-wget/networking/wget.c
> +--- busybox-1.13.2/networking/wget.c	2008-11-09 18:27:59.000000000 +0100
> ++++ busybox-1.13.2-wget/networking/wget.c	2009-03-02 16:07:12.000000000 +0100
> +@@ -417,15 +417,17 @@ int wget_main(int argc UNUSED_PARAM, cha
> + 		KEY_content_length = 1, KEY_transfer_encoding, KEY_chunked, KEY_location
> + 	};
> + 	enum {
> +-		WGET_OPT_CONTINUE   = 0x1,
> +-		WGET_OPT_SPIDER	    = 0x2,
> +-		WGET_OPT_QUIET      = 0x4,
> +-		WGET_OPT_OUTNAME    = 0x8,
> +-		WGET_OPT_PREFIX     = 0x10,
> +-		WGET_OPT_PROXY      = 0x20,
> +-		WGET_OPT_USER_AGENT = 0x40,
> +-		WGET_OPT_PASSIVE    = 0x80,
> +-		WGET_OPT_HEADER     = 0x100,
> ++		WGET_OPT_CONTINUE   = (1<<  0),
> ++		WGET_OPT_SPIDER	    = (1<<  1),
> ++		WGET_OPT_QUIET      = (1<<  2),
> ++		WGET_OPT_OUTNAME    = (1<<  3),
> ++		WGET_OPT_PREFIX     = (1<<  4),
> ++		WGET_OPT_PROXY      = (1<<  5),
> ++		WGET_OPT_USER_AGENT = (1<<  6),
> ++		WGET_OPT_RETRIES    = (1<<  7),
> ++		WGET_OPT_NETWORK_READ_TIMEOUT = (1<<  8),
> ++		WGET_OPT_PASSIVE    = (1<<  9),
> ++		WGET_OPT_HEADER     = (1<<  10),
> + 	};
> + #if ENABLE_FEATURE_WGET_LONG_OPTIONS
> + 	static const char wget_longopts[] ALIGN1 =
> +@@ -437,6 +439,10 @@ int wget_main(int argc UNUSED_PARAM, cha
> + 		"directory-prefix\0" Required_argument "P"
> + 		"proxy\0"            Required_argument "Y"
> + 		"user-agent\0"       Required_argument "U"
> ++		/* Ignored: */
> ++		// "tries\0"            Required_argument "t"
> ++		// "timeout\0"          Required_argument "T"
> ++		/* Ignored (we always use PASV): */
> + 		"passive-ftp\0"      No_argument       "\xff"
> + 		"header\0"           Required_argument "\xfe"
> + 		;
> diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
> index 8ecbc1e..602e782 100644
> --- a/recipes/busybox/busybox_1.13.2.bb
> +++ b/recipes/busybox/busybox_1.13.2.bb
> @@ -1,13 +1,20 @@
>   require busybox.inc
> -PR = "r17"
> +PR = "r18"
>
>   SRC_URI = "\
>     http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
> +  file://busybox-1.13.2-awk.patch;patch=1 \
>     file://busybox-1.13.2-depmod.patch;patch=1 \
>     file://busybox-1.13.2-init.patch;patch=1 \
> +  file://busybox-1.13.2-killall.patch;patch=1 \
>     file://busybox-1.13.2-mdev.patch;patch=1 \
>     file://busybox-1.13.2-modprobe.patch;patch=1 \
> +  file://busybox-1.13.2-printf.patch;patch=1 \
> +  file://busybox-1.13.2-syslogd.patch;patch=1 \
>     file://busybox-1.13.2-tar.patch;patch=1 \
> +  file://busybox-1.13.2-top24.patch;patch=1 \
> +  file://busybox-1.13.2-unzip.patch;patch=1 \
> +  file://busybox-1.13.2-wget.patch;patch=1 \
>     \
>     file://udhcpscript.patch;patch=1 \
>     file://udhcpc-fix-nfsroot.patch;patch=1 \




