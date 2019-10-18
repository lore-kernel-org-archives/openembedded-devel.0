Return-Path: <marek.bykowski@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39E577F660
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 11:42:29 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id m7so5905203lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tlV56qSozcg0BbzNwRalKcmyTttROsvJLi0Aln7MmR4=;
	b=RGXh3qZLef5f/IME5kf3r/4zX7ITdPqB+qPkpTv4qk72Wuj9zZ+Zt/ZI7J5AAfV0s/
	JLWIP/IUNQLrgHch9xSk/JSr6XuKCfK4+mQORTm9fExEmTk/E6MdsKH8YeYqXOMcPXI0
	UqMB6VzWD+Y5OcvhyeQA8eUnNTM4LiW574t0vN0KfpXfUKKtmL9ZOsGXVtc7Fv9UJMD+
	P10vQEm+9hAgGuATeeBnDds2/QqDNQvURJIs2tViChCOJr2sJSCSwRiHWmbMwpTsF90I
	GTq8e5hgjF7VcqT7NBgJuMaAiCKkEYlApQ+SZL6I/Z7n5yclQVIPRXEcWETYUz+dkKZT
	Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tlV56qSozcg0BbzNwRalKcmyTttROsvJLi0Aln7MmR4=;
	b=j+/zJa0EsPp19bOhO4tOrouhU261bG3BSXJTvz4c2OsCldWrfJrdvqzftMPfcLC+DR
	0umSlib7K88HlWwkeef2TIdgPdY4aUVbetRzWW5PeYCY6PI+39mNyhGc2iSkp1xsUAjZ
	20J6OuuuU53u/o1mQ0UUJUB72g8myr09MWDt69/RH54KuLJs+kjubUAwvSHEf1oD+jyC
	Np69FPhII9FHxYzztiqoJA50y76xbPSr8oxLzGkRGyT6oHZSy+0qfN073Nopr+qomVUp
	DIFi6+lNKKrMQ71gSn3Icasxdxry3nwhS5jrRPTfMZc0bVFwgS9L8qSJD9dF/i5PDqFu
	FhDw==
X-Gm-Message-State: APjAAAUucVxHJCo915D1F8xdiY3xko3KcI37ldMhe0oK5q6+CvDYSVPV
	iOemFr17uy/EoCY0wgN3vm4=
X-Google-Smtp-Source: APXvYqwGZ+IZ1Wq5MLX+TjlVIMOtGxodkcMhlr0uXaHVtOfFWkBmmIRPD1coezx81Zpo3wOmu7iXCQ==
X-Received: by 2002:a05:651c:113b:: with SMTP id
	e27mr5733919ljo.125.1571398949159; 
	Fri, 18 Oct 2019 04:42:29 -0700 (PDT)
Received: from localhost ([78.133.233.210]) by smtp.gmail.com with ESMTPSA id
	i17sm3383793lfj.35.2019.10.18.04.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2019 04:42:28 -0700 (PDT)
Date: Fri, 18 Oct 2019 13:42:24 +0200
From: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191018134224.62ca6095@gmail.com>
In-Reply-To: <CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost>
	<20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 18 Oct 2019 11:42:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Fix/clean up a couple of things:
- if lmbench doesn't use a return from a function attributed to warn_unused_result
  suppress the warning/s
- fix buffer overflow
- define feature_test_macro _GNU_SOURCE compiling in sched_{get,set}affinity()
- go strict for a pre-build check if sched_{get,set}affinity() from glibc builds
  cleanly. If it is not compile it out.

Signed-off-by: Marek Bykowski <marek.bykowski@gmail.com>
Reviewed-off-by: Marcin Lapaj <marcin.lapaj@tieto.com>
---
Changelog V2->V3:
- primary I have made it strict in a pre-build check if sched_{get,set}affinity()
  do not throw any warnings. If they do there is a possibility of a mismatch
  between the routines signatures in the app and their definitions in the glibc
  and, as a result, decided on skipping the affinity all together. Anyway I don't
  think affinity is used that often (if at all) in lmbench. It is better-off
  to script it around and use "taskset" to control the CPU's affinity
- additionally I have tested building it against x86 and aarch64 toolchains
---
 ...h-Fix-clean-up-the-build-for-lmbench.patch | 475 ++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |   1 +
 2 files changed, 476 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch
new file mode 100644
index 000000000..ba650040e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch
@@ -0,0 +1,475 @@
+lmbench: Fix/clean-up the build for lmbench
+
+Fix/clean up a coule of things:
+- if lmbench doesn't use a return from a function attributed to warn_unused_result
+  supress the warning/s
+- fix buffer overflow
+- define feature_test_macro _GNU_SOURCE compiling in sched_{get,set}affinity()
+- go strict for a pre-build check if sched_{get,set}affinity() from glibc builds
+  cleanly. If it is not compile it out.
+
+Signed-off-by: Marek Bykowski <marek.bykowski@gmail.com>
+Reviewed-off-by: Marcin Lapaj <marcin.lapaj@tieto.com>
+
+---
+ scripts/build          | 24 +++++++++++++++---------
+ src/bw_tcp.c           |  2 +-
+ src/bw_unix.c          |  4 ++--
+ src/hello.c            |  2 +-
+ src/lat_connect.c      |  2 +-
+ src/lat_fcntl.c        |  4 ++--
+ src/lat_fs.c           |  2 +-
+ src/lat_http.c         |  6 +++---
+ src/lat_proc.c         |  2 +-
+ src/lat_select.c       |  2 +-
+ src/lat_tcp.c          |  8 ++++----
+ src/lat_unix.c         |  2 +-
+ src/lat_unix_connect.c |  4 ++--
+ src/lib_sched.c        |  7 +++++--
+ src/lib_timing.c       | 18 +++++++++---------
+ src/lmhttp.c           | 26 +++++++++++++++++---------
+ src/memsize.c          |  4 ++--
+ 17 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/scripts/build b/scripts/build
+index 3786741..c0930d6 100755
+--- a/scripts/build
++++ b/scripts/build
+@@ -33,7 +33,7 @@ else
+ 	fi
+ fi
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+-	
++
+ # check for IA64 HP-UX w/ HP's ANSI compiler; may need pointer swizzling
+ arch=`echo $OS | awk -F- '{print $1;}'`
+ if [ "X$CC" = "Xcc" -a "X$arch" = "Xia64" ]
+@@ -272,14 +272,20 @@ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+-# check that we have sched_setaffinity
+-echo "#include <stdlib.h>" > ${BASE}$$.c
+-echo "#include <unistd.h>" >> ${BASE}$$.c
+-echo "#include <sched.h>" >> ${BASE}$$.c
+-echo "main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
+-${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+-	&& CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1";
+-rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
++# check that we have sched_setaffinity and it builds cleanly
++cat << '_ACEOF' > ${BASE}$$.c
++#define _GNU_SOURCE
++#include <stdlib.h>
++#include <unistd.h>
++#include <sched.h>
++int main() {
++cpu_set_t set; CPU_ZERO(&set); CPU_SET(0, &set);
++if (sched_setaffinity(0, sizeof(set), &set) == -1) exit(EXIT_FAILURE); exit(EXIT_SUCCESS);
++}
++_ACEOF
++${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${BASE}$$_err
++test -s ${BASE}$$_err || CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1"
++rm -f ${BASE}$$_err ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ 
+ if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR}; fi
+diff --git a/src/bw_tcp.c b/src/bw_tcp.c
+index cc27098..bf76fac 100644
+--- a/src/bw_tcp.c
++++ b/src/bw_tcp.c
+@@ -60,7 +60,7 @@ main(int ac, char **av)
+ 		{
+ 			int	conn;
+ 			conn = tcp_connect(optarg, TCP_DATA, SOCKOPT_NONE);
+-			write(conn, "0", 1);
++			(void) !write(conn, "0", 1);
+ 			exit(0);
+ 		}
+ 		case 'm':
+diff --git a/src/bw_unix.c b/src/bw_unix.c
+index ad71157..493db7c 100644
+--- a/src/bw_unix.c
++++ b/src/bw_unix.c
+@@ -97,7 +97,7 @@ reader(iter_t iterations, void* cookie)
+ 	size_t	todo = state->bytes;
+ 
+ 	while (iterations-- > 0) {
+-		write(state->control[1], &todo, sizeof(todo));
++		(void) !write(state->control[1], &todo, sizeof(todo));
+ 		for (done = 0; done < todo; done += n) {
+ 			if ((n = read(state->pipes[0], state->buf, state->xfer)) <= 0) {
+ 				/* error! */
+@@ -115,7 +115,7 @@ writer(int controlfd, int writefd, char* buf, void* cookie)
+ 	struct _state* state = (struct _state*)cookie;
+ 
+ 	for ( ;; ) {
+-		read(controlfd, &todo, sizeof(todo));
++		(void) !read(controlfd, &todo, sizeof(todo));
+ 		for (done = 0; done < todo; done += n) {
+ #ifdef TOUCH
+ 			touch(buf, XFERSIZE);
+diff --git a/src/hello.c b/src/hello.c
+index 15a2493..0f7f237 100644
+--- a/src/hello.c
++++ b/src/hello.c
+@@ -3,6 +3,6 @@
+ int
+ main()
+ {
+-	write(1, "Hello world\n", 12);
++	(void) !write(1, "Hello world\n", 12);
+ 	return (0);
+ }
+diff --git a/src/lat_connect.c b/src/lat_connect.c
+index 4e5538e..2e08731 100644
+--- a/src/lat_connect.c
++++ b/src/lat_connect.c
+@@ -52,7 +52,7 @@ main(int ac, char **av)
+ 			int sock = tcp_connect(av[optind],
+ 					       TCP_CONNECT,
+ 					       SOCKOPT_NONE);
+-			write(sock, "0", 1);
++			(void) !write(sock, "0", 1);
+ 			close(sock);
+ 			exit(0);
+ 		}
+diff --git a/src/lat_fcntl.c b/src/lat_fcntl.c
+index 01847a8..3b9fd65 100644
+--- a/src/lat_fcntl.c
++++ b/src/lat_fcntl.c
+@@ -120,8 +120,8 @@ initialize(iter_t iterations, void* cookie)
+ 	}
+ 	unlink(state->filename1);
+ 	unlink(state->filename2);
+-	write(state->fd1, buf, sizeof(buf));
+-	write(state->fd2, buf, sizeof(buf));
++	(void) !write(state->fd1, buf, sizeof(buf));
++	(void) !write(state->fd2, buf, sizeof(buf));
+ 	lock.l_type = F_WRLCK;
+ 	lock.l_whence = 0;
+ 	lock.l_start = 0;
+diff --git a/src/lat_fs.c b/src/lat_fs.c
+index 003a4ea..14efa25 100644
+--- a/src/lat_fs.c
++++ b/src/lat_fs.c
+@@ -117,7 +117,7 @@ mkfile(char *name, size_t size)
+ 
+ 	while (size > 0) {
+ 		chunk = ((size > (128*1024)) ? (128*1024) : size);
+-		write(fd, buf, chunk);
++		(void) !write(fd, buf, chunk);
+ 		size -= chunk;
+ 	}
+ 	close(fd);
+diff --git a/src/lat_http.c b/src/lat_http.c
+index 28d04f7..6ccc88e 100644
+--- a/src/lat_http.c
++++ b/src/lat_http.c
+@@ -29,11 +29,11 @@ http(char *server, char *file, int prog)
+ 	if (debug) {
+ 		printf("%s", buf);
+ 	}
+-	write(sock, buf, strlen(buf));
++	(void) !write(sock, buf, strlen(buf));
+ 	while ((n = read(sock, buf, XFERSIZE)) > 0) {
+ 		b += n;
+ 		if (echo) {
+-			write(1, buf, n);
++			(void) !write(1, buf, n);
+ 		}
+ 	}
+ 	close(sock);
+@@ -49,7 +49,7 @@ killhttp(char *server, int prog)
+ 	int     sock;
+ 
+ 	sock = tcp_connect(server, prog, SOCKOPT_REUSE);
+-	write(sock, "EXIT", 4);
++	(void) !write(sock, "EXIT", 4);
+ 	close(sock);
+ }
+ 
+diff --git a/src/lat_proc.c b/src/lat_proc.c
+index 6142661..e368956 100644
+--- a/src/lat_proc.c
++++ b/src/lat_proc.c
+@@ -111,7 +111,7 @@ do_shell(iter_t iterations, void* cookie)
+ 		case 0:	/* child */
+ 			handle_scheduler(benchmp_childid(), 1, 1);
+ 			close(1);
+-			execlp("/bin/sh", "sh", "-c", PROG, 0);
++			execlp("/bin/sh", "sh", "-c", PROG, (char *)0);
+ 			exit(1);
+ 
+ 		default:
+diff --git a/src/lat_select.c b/src/lat_select.c
+index 5217878..662e0ac 100644
+--- a/src/lat_select.c
++++ b/src/lat_select.c
+@@ -131,7 +131,7 @@ server(void* cookie)
+ 		/* child server process */
+ 		while (pid == getppid()) {
+ 			int newsock = tcp_accept(state->sock, SOCKOPT_NONE);
+-			read(newsock, &state->fid, 1);
++			(void) !read(newsock, &state->fid, 1);
+ 			close(newsock);
+ 		}
+ 		exit(0);
+diff --git a/src/lat_tcp.c b/src/lat_tcp.c
+index 6a11996..aad56b3 100644
+--- a/src/lat_tcp.c
++++ b/src/lat_tcp.c
+@@ -104,7 +104,7 @@ init(iter_t iterations, void* cookie)
+ 		exit(1);
+ 	}
+ 
+-	write(state->sock, &msize, sizeof(int));
++	(void) !write(state->sock, &msize, sizeof(int));
+ }
+ 
+ void
+@@ -125,8 +125,8 @@ doclient(iter_t iterations, void* cookie)
+ 	int 	sock   = state->sock;
+ 
+ 	while (iterations-- > 0) {
+-		write(sock, state->buf, state->msize);
+-		read(sock, state->buf, state->msize);
++		(void) !write(sock, state->buf, state->msize);
++		(void) !read(sock, state->buf, state->msize);
+ 	}
+ }
+ 
+@@ -169,7 +169,7 @@ doserver(int sock)
+ 			exit(4);
+ 		}
+ 		for (n = 0; read(sock, buf, msize) > 0; n++) {
+-			write(sock, buf, msize);
++			(void) !write(sock, buf, msize);
+ 		}
+ 		free(buf);
+ 	} else {
+diff --git a/src/lat_unix.c b/src/lat_unix.c
+index 43ad6a3..d7ed2f3 100644
+--- a/src/lat_unix.c
++++ b/src/lat_unix.c
+@@ -93,7 +93,7 @@ initialize(iter_t iterations, void* cookie)
+ 	/* Child sits and ping-pongs packets back to parent */
+ 	signal(SIGTERM, exit);
+ 	while (read(pState->sv[0], pState->buf, pState->msize) == pState->msize) {
+-		write(pState->sv[0], pState->buf, pState->msize);
++		(void) !write(pState->sv[0], pState->buf, pState->msize);
+ 	}
+ 	exit(0);
+ }
+diff --git a/src/lat_unix_connect.c b/src/lat_unix_connect.c
+index a66b256..d21747c 100644
+--- a/src/lat_unix_connect.c
++++ b/src/lat_unix_connect.c
+@@ -47,7 +47,7 @@ int main(int ac, char **av)
+ 		}
+ 		if (!strcmp(av[1], "-S")) {
+ 			int sock = unix_connect(CONNAME);
+-			write(sock, "0", 1);
++			(void) !write(sock, "0", 1);
+ 			close(sock);
+ 			exit(0);
+ 		}
+@@ -92,7 +92,7 @@ void server_main(void)
+ 	for (;;) {
+ 		newsock = unix_accept(sock);
+ 		c = 0;
+-		read(newsock, &c, 1);
++		(void) !read(newsock, &c, 1);
+ 		if (c && c == '0') {
+ 			unix_done(sock, CONNAME);
+ 			exit(0);
+diff --git a/src/lib_sched.c b/src/lib_sched.c
+index fc5f82d..32616fa 100644
+--- a/src/lib_sched.c
++++ b/src/lib_sched.c
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ #include "bench.h"
+ 
+ /* #define _DEBUG */
+@@ -205,7 +206,8 @@ sched_pin(int cpu)
+ 		sz = 1 + (2 * sched_ncpus()) / (8 * sizeof(unsigned long));
+ 		mask = (unsigned long*)malloc(sz * sizeof(unsigned long));
+ 		cpumask = (unsigned long*)malloc(sz * sizeof(unsigned long));
+-		retval = sched_getaffinity(0, sz * sizeof(unsigned long), cpumask);
++		retval = sched_getaffinity(0, sz * sizeof(unsigned long),
++					(cpu_set_t *) cpumask);
+ 		if (retval < 0) perror("sched_getaffinity:");
+ 		if (retval < 0) return retval;
+ 
+@@ -229,7 +231,8 @@ sched_pin(int cpu)
+ 			j++;
+ 		}
+ 	}
+-	retval = sched_setaffinity(0, sz * sizeof(unsigned long), mask);
++	retval = sched_setaffinity(0, sz * sizeof(unsigned long),
++			(const cpu_set_t *) mask);
+ 	if (retval < 0) perror("sched_setaffinity:");
+ #ifdef _DEBUG
+ 	fprintf(stderr, "sched_pin(%d): pid=%d, returning %d\n", cpu, (int)getpid(), retval);
+diff --git a/src/lib_timing.c b/src/lib_timing.c
+index 714f0da..db84e8f 100644
+--- a/src/lib_timing.c
++++ b/src/lib_timing.c
+@@ -398,7 +398,7 @@ benchmp_parent(	int response,
+ 	}
+ 
+ 	/* send 'start' signal */
+-	write(start_signal, signals, parallel * sizeof(char));
++	(void) !write(start_signal, signals, parallel * sizeof(char));
+ 
+ 	/* Collect 'done' signals */
+ 	for (i = 0; i < parallel * sizeof(char); i += bytes_read) {
+@@ -443,7 +443,7 @@ benchmp_parent(	int response,
+ 		FD_ZERO(&fds_error);
+ 
+ 		/* tell one child to report its results */
+-		write(result_signal, buf, sizeof(char));
++		(void) !write(result_signal, buf, sizeof(char));
+ 
+ 		for (; n > 0; n -= bytes_read, buf += bytes_read) {
+ 			bytes_read = 0;
+@@ -484,7 +484,7 @@ benchmp_parent(	int response,
+ 	signal(SIGCHLD, SIG_DFL);
+ 	
+ 	/* send 'exit' signals */
+-	write(exit_signal, results, parallel * sizeof(char));
++	(void) !write(exit_signal, results, parallel * sizeof(char));
+ 
+ 	/* Compute median time; iterations is constant! */
+ 	set_results(merged_results);
+@@ -690,13 +690,13 @@ benchmp_interval(void* _state)
+ 		       NULL, &timeout);
+ 		if (FD_ISSET(state->start_signal, &fds)) {
+ 			state->state = timing_interval;
+-			read(state->start_signal, &c, sizeof(char));
++			(void) !read(state->start_signal, &c, sizeof(char));
+ 			iterations = state->iterations;
+ 		}
+ 		if (state->need_warmup) {
+ 			state->need_warmup = 0;
+ 			/* send 'ready' */
+-			write(state->response, &c, sizeof(char));
++			(void) !write(state->response, &c, sizeof(char));
+ 		}
+ 		break;
+ 	case timing_interval:
+@@ -726,7 +726,7 @@ benchmp_interval(void* _state)
+ 		state->iterations = iterations;
+ 		if (state->state == cooldown) {
+ 			/* send 'done' */
+-			write(state->response, (void*)&c, sizeof(char));
++			(void) !write(state->response, (void*)&c, sizeof(char));
+ 			iterations = state->iterations_batch;
+ 		}
+ 		break;
+@@ -741,8 +741,8 @@ benchmp_interval(void* _state)
+ 			 * the parent to tell us to send our results back.
+ 			 * From this point on, we will do no more "work".
+ 			 */
+-			read(state->result_signal, (void*)&c, sizeof(char));
+-			write(state->response, (void*)get_results(), state->r_size);
++			(void) !read(state->result_signal, (void*)&c, sizeof(char));
++			(void) !write(state->response, (void*)get_results(), state->r_size);
+ 			if (state->cleanup) {
+ 				if (benchmp_sigchld_handler == SIG_DFL)
+ 					signal(SIGCHLD, SIG_DFL);
+@@ -750,7 +750,7 @@ benchmp_interval(void* _state)
+ 			}
+ 
+ 			/* Now wait for signal to exit */
+-			read(state->exit_signal, (void*)&c, sizeof(char));
++			(void) !read(state->exit_signal, (void*)&c, sizeof(char));
+ 			exit(0);
+ 		}
+ 	};
+diff --git a/src/lmhttp.c b/src/lmhttp.c
+index 41d9949..080b462 100644
+--- a/src/lmhttp.c
++++ b/src/lmhttp.c
+@@ -277,26 +277,34 @@ void
+ dodir(char *name, int sock)
+ {
+ 	FILE	*p;
+-	char	buf[1024];
++	char	*buf;
+ 	char	path[1024];
++	size_t 	bytes;
+ 
+ 	if (dflg) printf("dodir(%s)\n", name);
++	/* figure out a buf size and allocate with malloc */
++	bytes = snprintf(buf, 0, "cd %s && ls -1a", name);
++	buf = (char*) malloc(bytes + 1);
+ 	sprintf(buf, "cd %s && ls -1a", name);
+ 	p = popen(buf, "r");
+ 	if (!p && dflg) printf("Couldn't popen %s\n", buf);
++	bytes = snprintf(buf, 0, "\
++<HTML><HEAD>\n<TITLE>Index of /%s</TITLE></HEAD><BODY><H1>Index of /%s</H1>\n",
++	    name, name);
++	buf = (char*) realloc(buf, bytes + 1);
+ 	sprintf(buf, "\
+ <HTML><HEAD>\n<TITLE>Index of /%s</TITLE></HEAD><BODY><H1>Index of /%s</H1>\n",
+ 	    name, name);
+-	write(sock, buf, strlen(buf));
++	(void) !write(sock, buf, strlen(buf));
+ 	while (fgets(buf, sizeof(buf), p)) {
+ 		buf[strlen(buf) - 1] = 0;
+ 		sprintf(path, "/%s/%s", name, buf);
+ 		if (dflg) printf("\t%s\n", path);
+-		write(sock, "<A HREF=\"", 9);
+-		write(sock, path, strlen(path));
+-		write(sock, "\">", 2);
+-		write(sock, buf, strlen(buf));
+-		write(sock, "</A><BR>\n", 9);
++		(void) !write(sock, "<A HREF=\"", 9);
++		(void) !write(sock, path, strlen(path));
++		(void) !write(sock, "\">", 2);
++		(void) !write(sock, buf, strlen(buf));
++		(void) !write(sock, "</A><BR>\n", 9);
+ 	}
+ 	pclose(p);
+ }
+@@ -380,7 +388,7 @@ logit(int sock, char *name, int size)
+ 	len = sprintf(buf, "%u %u %s %u\n",
+ 	    *((unsigned int*)&sin.sin_addr), (unsigned int)time(0), name, size);
+ 	if (nbytes + len >= sizeof(logbuf)) {
+-		write(logfile, logbuf, nbytes);
++		(void) !write(logfile, logbuf, nbytes);
+ 		nbytes = 0;
+ 	}
+ 	bcopy(buf, &logbuf[nbytes], len);
+@@ -390,7 +398,7 @@ logit(int sock, char *name, int size)
+ void die()
+ {
+ 	if (nbytes) {
+-		write(logfile, logbuf, nbytes);
++		(void) !write(logfile, logbuf, nbytes);
+ 		nbytes = 0;
+ 	}
+ 	exit(1);
+diff --git a/src/memsize.c b/src/memsize.c
+index 82d7faf..35fff9d 100644
+--- a/src/memsize.c
++++ b/src/memsize.c
+@@ -111,7 +111,7 @@ timeit(char *where, size_t size)
+ 		clear_alarm();
+ 		if ((sum / n) > too_long || alarm_triggered) {
+ 			size = range - incr;
+-			fprintf(stderr, "Error! Memory testing timeout! Touch one page of memory needs more than %d (usecs)\n ", too_long);
++			fprintf(stderr, "Error! Memory testing timeout! Touch one page of memory needs more than %zu (usecs)\n ", too_long);
+ 			break;
+ 		}
+ 		for (s = s_prev; s <= range; s_prev = s, s *= 2)
+@@ -157,7 +157,7 @@ test_malloc(size_t size)
+ 		close(fid[0]);
+ 		p = malloc(size);
+ 		result = (p ? 1 : 0);
+-		write(fid[1], &result, sizeof(int));
++		(void) !write(fid[1], &result, sizeof(int));
+ 		close(fid[1]);
+ 		if (p) free(p);
+ 		exit(0);
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 8e6e803a8..cc43c6bd5 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-Check-for-musl-define-guard-before-redefining-sockle.patch \
            file://0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch \
            file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
+           file://0001-lmbench-Fix-clean-up-the-build-for-lmbench.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
2.21.0.896.g6a6c0f1


