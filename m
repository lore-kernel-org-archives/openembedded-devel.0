Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD09F60720
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 19:49:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9IJnr6a022102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Oct 2019 12:49:54 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 18 Oct 2019 12:49:53 -0700
To: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost> <20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
Date: Fri, 18 Oct 2019 15:49:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018134224.62ca6095@gmail.com>
X-Originating-IP: [172.25.44.5]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Fri, 18 Oct 2019 19:49:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/18/19 7:42 AM, marek.bykowski@gmail.com wrote:
> Fix/clean up a couple of things:
> - if lmbench doesn't use a return from a function attributed to warn_unused_result
>    suppress the warning/s
> - fix buffer overflow
> - define feature_test_macro_GNU_SOURCE compiling in sched_{get,set}affinity()
> - go strict for a pre-build check if sched_{get,set}affinity() from glibc builds
>    cleanly. If it is not compile it out.
> 
> Signed-off-by: Marek Bykowski<marek.bykowski@gmail.com>
> Reviewed-off-by: Marcin Lapaj<marcin.lapaj@tieto.com>
> ---
> Changelog V2->V3:
> - primary I have made it strict in a pre-build check if sched_{get,set}affinity()
>    do not throw any warnings. If they do there is a possibility of a mismatch
>    between the routines signatures in the app and their definitions in the glibc
>    and, as a result, decided on skipping the affinity all together. Anyway I don't
>    think affinity is used that often (if at all) in lmbench. It is better-off
>    to script it around and use "taskset" to control the CPU's affinity
> - additionally I have tested building it against x86 and aarch64 toolchains
> ---
>   ...h-Fix-clean-up-the-build-for-lmbench.patch | 475 ++++++++++++++++++
>   .../lmbench/lmbench_3.0-a9.bb                 |   1 +
>   2 files changed, 476 insertions(+)
>   create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch
> 
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch
> new file mode 100644
> index 000000000..ba650040e
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch
> @@ -0,0 +1,475 @@
> +lmbench: Fix/clean-up the build for lmbench
> +
> +Fix/clean up a coule of things:
> +- if lmbench doesn't use a return from a function attributed to warn_unused_result
> +  supress the warning/s
> +- fix buffer overflow
> +- define feature_test_macro_GNU_SOURCE compiling in sched_{get,set}affinity()
> +- go strict for a pre-build check if sched_{get,set}affinity() from glibc builds
> +  cleanly. If it is not compile it out.
> +
> +Signed-off-by: Marek Bykowski<marek.bykowski@gmail.com>
> +Reviewed-off-by: Marcin Lapaj<marcin.lapaj@tieto.com>
> +
> +---
> + scripts/build          | 24 +++++++++++++++---------
> + src/bw_tcp.c           |  2 +-
> + src/bw_unix.c          |  4 ++--
> + src/hello.c            |  2 +-
> + src/lat_connect.c      |  2 +-
> + src/lat_fcntl.c        |  4 ++--
> + src/lat_fs.c           |  2 +-
> + src/lat_http.c         |  6 +++---
> + src/lat_proc.c         |  2 +-
> + src/lat_select.c       |  2 +-
> + src/lat_tcp.c          |  8 ++++----
> + src/lat_unix.c         |  2 +-
> + src/lat_unix_connect.c |  4 ++--
> + src/lib_sched.c        |  7 +++++--
> + src/lib_timing.c       | 18 +++++++++---------
> + src/lmhttp.c           | 26 +++++++++++++++++---------
> + src/memsize.c          |  4 ++--
> + 17 files changed, 68 insertions(+), 51 deletions(-)
> +
> +diff --git a/scripts/build b/scripts/build
> +index 3786741..c0930d6 100755
> +--- a/scripts/build
> ++++ b/scripts/build
> +@@ -33,7 +33,7 @@ else
> + 	fi
> + fi
> + rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
> +-	
> ++
> + # check for IA64 HP-UX w/ HP's ANSI compiler; may need pointer swizzling
> + arch=`echo $OS | awk -F- '{print $1;}'`
> + if [ "X$CC" = "Xcc" -a "X$arch" = "Xia64" ]
> +@@ -272,14 +272,20 @@ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
> + 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
> + rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
> +
> +-# check that we have sched_setaffinity
> +-echo "#include <stdlib.h>" > ${BASE}$$.c
> +-echo "#include <unistd.h>" >> ${BASE}$$.c
> +-echo "#include <sched.h>" >> ${BASE}$$.c
> +-echo "main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
> +-${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
> +-	&& CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1";
> +-rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
> ++# check that we have sched_setaffinity and it builds cleanly
> ++cat << '_ACEOF' > ${BASE}$$.c
> ++#define _GNU_SOURCE
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <sched.h>
> ++int main() {
> ++cpu_set_t set; CPU_ZERO(&set); CPU_SET(0, &set);
> ++if (sched_setaffinity(0, sizeof(set), &set) == -1) exit(EXIT_FAILURE); exit(EXIT_SUCCESS);
> ++}
> ++_ACEOF
> ++${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${BASE}$$_err
> ++test -s ${BASE}$$_err || CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1"
> ++rm -f ${BASE}$$_err ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
> +
> +
> + if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR}; fi
> +diff --git a/src/bw_tcp.c b/src/bw_tcp.c
> +index cc27098..bf76fac 100644
> +--- a/src/bw_tcp.c
> ++++ b/src/bw_tcp.c
> +@@ -60,7 +60,7 @@ main(int ac, char **av)
> + 		{
> + 			int	conn;
> + 			conn = tcp_connect(optarg, TCP_DATA, SOCKOPT_NONE);
> +-			write(conn, "0", 1);
> ++			(void) !write(conn, "0", 1);
> + 			exit(0);
> + 		}
> + 		case 'm':
> +diff --git a/src/bw_unix.c b/src/bw_unix.c
> +index ad71157..493db7c 100644
> +--- a/src/bw_unix.c
> ++++ b/src/bw_unix.c
> +@@ -97,7 +97,7 @@ reader(iter_t iterations, void* cookie)
> + 	size_t	todo = state->bytes;
> +
> + 	while (iterations-- > 0) {
> +-		write(state->control[1], &todo, sizeof(todo));
> ++		(void) !write(state->control[1], &todo, sizeof(todo));
> + 		for (done = 0; done < todo; done += n) {
> + 			if ((n = read(state->pipes[0], state->buf, state->xfer)) <= 0) {
> + 				/* error! */
> +@@ -115,7 +115,7 @@ writer(int controlfd, int writefd, char* buf, void* cookie)
> + 	struct _state* state = (struct _state*)cookie;
> +
> + 	for ( ;; ) {
> +-		read(controlfd, &todo, sizeof(todo));
> ++		(void) !read(controlfd, &todo, sizeof(todo));
> + 		for (done = 0; done < todo; done += n) {
> + #ifdef TOUCH
> + 			touch(buf, XFERSIZE);
> +diff --git a/src/hello.c b/src/hello.c
> +index 15a2493..0f7f237 100644
> +--- a/src/hello.c
> ++++ b/src/hello.c
> +@@ -3,6 +3,6 @@
> + int
> + main()
> + {
> +-	write(1, "Hello world\n", 12);
> ++	(void) !write(1, "Hello world\n", 12);


Hi Merek,

What's the "!" for ? It doesn't seem to be essential.

In unistd.h:
extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur;

and in cdefs.h:
---------------
/* If fortification mode, we warn about unused results of certain
    function calls which can lead to problems.  */
#if __GNUC_PREREQ (3,4)
# define __attribute_warn_unused_result__ \
    __attribute__ ((__warn_unused_result__))
# if __USE_FORTIFY_LEVEL > 0
#  define __wur __attribute_warn_unused_result__
# endif
#else
# define __attribute_warn_unused_result__ /* empty */
#endif
#ifndef __wur
# define __wur /* Ignore */
#endif
---------------

so did you consider just making a compiler specific fix/hack
for gcc/clang such as:
    #define __wur /* Ignore */
You could do that in each file that needs it.
While that's still ugly, it is at least more localized.


Also, did you confirm that this change doesn't affect the
resulting binary code? I expect that it won't but it's a
benchmark so it's worth confirming.


Finally, lmbench hasn't released a new tarball on sf.net in 5 years:
    https://sourceforge.net/projects/lmbench/
There's a new somewhat active version of lmbench:
    https://github.com/intel/lmbench
Should we use that version?

Sorry to leave this until v3 but the:
    (void) !foo()
syntax triggered me! ;-)

-- 
# Randy MacLeod
# Wind River Linux

