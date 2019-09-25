Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 783127E58B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 20:18:09 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l21so7047194lje.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NjfUBx1AM3Ri12rtbZ5HGS74fBpABfB76Sx/OBomgEY=;
	b=rKPP+CCJH9M7FerUxvE0VNCEg731cMcsHQDLAlYznxc0+sqArPwWIvYFQLrCX2pAQ1
	QoGFJlotr95ijPdRiuUN1ESJym8PhpZPgkX+iO+grAd16MxRP/8hW+rQQ87eJQVKx5oZ
	6g2HwHeuhRwN+j8B3KtQ047HN1pxqmDF8FuzStJFCHZfyDHcnEOaZSE7kbRMpo8NWPO7
	bQvU+nVWFDlnRV3BBYWoXvjyPMimY+8tId2S0t05GqmGQNU0GVkAhC6UU55cwoNqo3ZD
	s/z7RzANAV9wt1SrhZ90sUNLZ/E/cwqzPI5yFjW4gxouJIUbOSd2xKqhCBKF5fNDTSAD
	aOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NjfUBx1AM3Ri12rtbZ5HGS74fBpABfB76Sx/OBomgEY=;
	b=AdCgdN5NxIjfkLCDCiU4GPhpHpaoI3nlWPVwjTTISBIealPyVauUBeN9L0QPjQ+Aee
	DQuSVrQowMFmSbjaWo7k48ax22b0O2AWzXVDXfuT5+INyt0HpaWtvLjG9M5KYor+pHuO
	UsBEFSWw4/dN7EVHkVNQvOdeJsrtNM5rPuQrD1SSIbta1pnpLhKVQiZN+mwmKx/4XTr5
	TTIc+X1GuZqUkHIUqQ7NG7SIJRShkl4ZXqwepVARdTlsYs7DVIfXqy4IuDWuvw+Pwl0P
	FBJXbystQMaJ3a/YOuhAPr4rTpsqvnQ/qMC/C2JvGagLkWvLIiXFwOry2NzvzHbEVrRa
	hNyg==
X-Gm-Message-State: APjAAAXn1JksuUBU3Z/myjxEZseOGefo/PAZHHFnEgYZeyJhWkFUGGOD
	SmPqF/7TO3ChFS/ia84X6iTI1pCWTXQ=
X-Google-Smtp-Source: APXvYqzGpaG+B9W3IPCL9HGf6AlXA9QNOk6sfeKnFBm4fW6CX6IgKj3UKDLnHAPbnSpXAutU5PNESg==
X-Received: by 2002:a2e:8642:: with SMTP id i2mr107746ljj.110.1569442688623;
	Wed, 25 Sep 2019 13:18:08 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id r6sm1460293ljr.77.2019.09.25.13.18.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 13:18:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 22:18:04 +0200
Message-Id: <20190925201804.5577-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] can-utils: bump to latest revision
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
X-List-Received-Date: Wed, 25 Sep 2019 20:18:10 -0000

License header was moved due to SPDX-License-Identifier being added to
the file.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../can-utils/0001-Fix-musl-error.patch       | 677 ++++++++++++++++++
 ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ---
 .../socketcan/can-utils_git.bb                |  11 +-
 3 files changed, 682 insertions(+), 112 deletions(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Fix-musl-error.patch
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-Fix-musl-error.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-Fix-musl-error.patch
new file mode 100644
index 000000000..94f9539be
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-Fix-musl-error.patch
@@ -0,0 +1,677 @@
+From 9cf678b96644013a30ccb4124bf107af0952816c Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Wed, 25 Sep 2019 19:41:13 +0000
+Subject: [PATCH] Fix musl error
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ jacd.c      | 58 ++++++++++++++++++++++++++---------------------------
+ jcat.c      | 14 ++++++-------
+ jspy.c      | 26 ++++++++++++------------
+ jsr.c       | 30 +++++++++++++--------------
+ libj1939.c  |  4 ++--
+ testj1939.c | 26 ++++++++++++------------
+ 6 files changed, 79 insertions(+), 79 deletions(-)
+
+diff --git a/jacd.c b/jacd.c
+index 83275e2..839895b 100644
+--- a/jacd.c
++++ b/jacd.c
+@@ -20,7 +20,7 @@
+ 
+ #include <unistd.h>
+ #include <getopt.h>
+-#include <error.h>
++#include <err.h>
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <net/if.h>
+@@ -155,12 +155,12 @@ static int parse_range(char *str)
+ 	for (tok = strtok(str, ",;"); tok; tok = strtok(NULL, ",;")) {
+ 		a0 = ae = strtoul(tok, &endp, 0);
+ 		if (endp <= tok)
+-			error(1, 0, "parsing range '%s'", tok);
++			err(1, 0, "parsing range '%s'", tok);
+ 		if (*endp == '-') {
+ 			tok = endp+1;
+ 			ae = strtoul(tok, &endp, 0);
+ 			if (endp <= tok)
+-				error(1, 0, "parsing addr '%s'", tok);
++				err(1, 0, "parsing addr '%s'", tok);
+ 			if (ae < a0)
+ 				ae = a0;
+ 		}
+@@ -205,21 +205,21 @@ static int open_socket(const char *device, uint64_t name)
+ 		fprintf(stderr, "- socket(PF_CAN, SOCK_DGRAM, CAN_J1939);\n");
+ 	sock = ret = socket(PF_CAN, SOCK_DGRAM, CAN_J1939);
+ 	if (ret < 0)
+-		error(1, errno, "socket(j1939)");
++		err(1, errno, "socket(j1939)");
+ 
+ 	if (s.verbose)
+ 		fprintf(stderr, "- setsockopt(, SOL_SOCKET, SO_BINDTODEVICE, %s, %zd);\n", device, strlen(device));
+ 	ret = setsockopt(sock, SOL_SOCKET, SO_BINDTODEVICE,
+ 			device, strlen(device));
+ 	if (ret < 0)
+-		error(1, errno, "bindtodevice %s", device);
++		err(1, errno, "bindtodevice %s", device);
+ 
+ 	if (s.verbose)
+ 		fprintf(stderr, "- setsockopt(, SOL_CAN_J1939, SO_J1939_FILTER, <filter>, %zd);\n", sizeof(filt));
+ 	ret = setsockopt(sock, SOL_CAN_J1939, SO_J1939_FILTER,
+ 			&filt, sizeof(filt));
+ 	if (ret < 0)
+-		error(1, errno, "setsockopt filter");
++		err(1, errno, "setsockopt filter");
+ 
+ 	value = 1;
+ 	if (s.verbose)
+@@ -227,13 +227,13 @@ static int open_socket(const char *device, uint64_t name)
+ 	ret = setsockopt(sock, SOL_SOCKET, SO_BROADCAST,
+ 			&value, sizeof(value));
+ 	if (ret < 0)
+-		error(1, errno, "setsockopt set broadcast");
++		err(1, errno, "setsockopt set broadcast");
+ 
+ 	if (s.verbose)
+ 		fprintf(stderr, "- bind(, %s, %zi);\n", libj1939_addr2str(&saddr), sizeof(saddr));
+ 	ret = bind(sock, (void *)&saddr, sizeof(saddr));
+ 	if (ret < 0)
+-		error(1, errno, "bind()");
++		err(1, errno, "bind()");
+ 	return sock;
+ }
+ 
+@@ -258,7 +258,7 @@ static int repeat_address(int sock, uint64_t name)
+ 	ret = sendto(sock, dat, sizeof(dat), 0, (const struct sockaddr *)&saddr,
+ 		     sizeof(saddr));
+ 	if (must_warn(ret))
+-		error(1, errno, "send address claim for 0x%02x", s.last_sa);
++		err(1, errno, "send address claim for 0x%02x", s.last_sa);
+ 	return ret;
+ }
+ static int claim_address(int sock, uint64_t name, int sa)
+@@ -278,7 +278,7 @@ static int claim_address(int sock, uint64_t name, int sa)
+ 		fprintf(stderr, "- bind(, %s, %zi);\n", libj1939_addr2str(&saddr), sizeof(saddr));
+ 	ret = bind(sock, (void *)&saddr, sizeof(saddr));
+ 	if (ret < 0)
+-		error(1, errno, "rebind with sa 0x%02x", sa);
++		err(1, errno, "rebind with sa 0x%02x", sa);
+ 	s.last_sa = sa;
+ 	return repeat_address(sock, name);
+ }
+@@ -297,7 +297,7 @@ static int request_addresses(int sock)
+ 		fprintf(stderr, "- sendto(, { 0, 0xee, 0, }, %zi, 0, %s, %zi);\n", sizeof(dat), libj1939_addr2str(&saddr), sizeof(saddr));
+ 	ret = sendto(sock, dat, sizeof(dat), 0, (void *)&saddr, sizeof(saddr));
+ 	if (must_warn(ret))
+-		error(1, errno, "send request for address claims");
++		err(1, errno, "send request for address claims");
+ 	return ret;
+ }
+ 
+@@ -365,7 +365,7 @@ static void install_signal(int sig)
+ 	sigfillset(&sigact.sa_mask);
+ 	ret = sigaction(sig, &sigact, NULL);
+ 	if (ret < 0)
+-		error(1, errno, "sigaction for signal %i", sig);
++		err(1, errno, "sigaction for signal %i", sig);
+ }
+ 
+ static void schedule_itimer(int msec)
+@@ -381,7 +381,7 @@ static void schedule_itimer(int msec)
+ 		ret = setitimer(ITIMER_REAL, &val, NULL);
+ 	} while ((ret < 0) && (errno == EINTR));
+ 	if (ret < 0)
+-		error(1, errno, "setitimer %i msec", msec);
++		err(1, errno, "setitimer %i msec", msec);
+ }
+ 
+ /* dump status */
+@@ -422,7 +422,7 @@ static void save_cache(void)
+ 		return;
+ 	fp = fopen(s.cachefile, "w");
+ 	if (!fp)
+-		error(1, errno, "fopen %s, w", s.cachefile);
++		err(1, errno, "fopen %s, w", s.cachefile);
+ 
+ 	time(&t);
+ 	fprintf(fp, "# saved on %s\n", ctime(&t));
+@@ -445,7 +445,7 @@ static void restore_cache(void)
+ 	if (!fp) {
+ 		if (ENOENT == errno)
+ 			return;
+-		error(1, errno, "fopen %s, r", s.cachefile);
++		err(1, errno, "fopen %s, r", s.cachefile);
+ 	}
+ 	while (!feof(fp)) {
+ 		ret = getline(&line, &sz, fp);
+@@ -494,9 +494,9 @@ int main(int argc, char *argv[])
+ 	case 'p':
+ #ifdef _GNU_SOURCE
+ 		if (asprintf(&program_invocation_name, "%s.%s", program_invocation_short_name, optarg) < 0)
+-			error(1, errno, "asprintf(program invocation name)");
++			err(1, errno, "asprintf(program invocation name)");
+ #else
+-		error(0, 0, "compile with -D_GNU_SOURCE to use -p");
++		err(0, 0, "compile with -D_GNU_SOURCE to use -p");
+ #endif
+ 		break;
+ 	default:
+@@ -515,18 +515,18 @@ int main(int argc, char *argv[])
+ 
+ 	ret = parse_range(s.ranges);
+ 	if (!ret)
+-		error(1, 0, "no addresses in range");
++		err(1, 0, "no addresses in range");
+ 
+ 	if ((s.current_sa < J1939_IDLE_ADDR) && !(addr[s.current_sa].flags & F_USE)) {
+ 		if (s.verbose)
+-			error(0, 0, "forget saved address 0x%02x", s.current_sa);
++			err(0, 0, "forget saved address 0x%02x", s.current_sa);
+ 		s.current_sa = J1939_IDLE_ADDR;
+ 	}
+ 
+ 	if (s.verbose)
+-		error(0, 0, "ready for %s:%016llx", s.intf, (long long)s.name);
++		err(0, 0, "ready for %s:%016llx", s.intf, (long long)s.name);
+ 	if (!s.intf || !s.name)
+-		error(1, 0, "bad arguments");
++		err(1, 0, "bad arguments");
+ 	ret = sock = open_socket(s.intf, s.name);
+ 	sock_rx = open_socket(s.intf, s.name);
+ 
+@@ -545,7 +545,7 @@ int main(int argc, char *argv[])
+ 		case STATE_INITIAL:
+ 			ret = request_addresses(sock);
+ 			if (ret < 0)
+-				error(1, errno, "could not sent initial request");
++				err(1, errno, "could not sent initial request");
+ 			s.state = STATE_REQ_SENT;
+ 			break;
+ 		case STATE_REQ_PENDING:
+@@ -555,7 +555,7 @@ int main(int argc, char *argv[])
+ 			/* claim addr */
+ 			sa = choose_new_sa(s.name, s.current_sa);
+ 			if (sa == J1939_IDLE_ADDR)
+-				error(1, 0, "no free address to use");
++				err(1, 0, "no free address to use");
+ 			ret = claim_address(sock, s.name, sa);
+ 			if (ret < 0)
+ 				schedule_itimer(50);
+@@ -576,7 +576,7 @@ int main(int argc, char *argv[])
+ 		if (ret < 0) {
+ 			if (EINTR == errno)
+ 				continue;
+-			error(1, errno, "recvfrom()");
++			err(1, errno, "recvfrom()");
+ 		}
+ 		switch (saddr.can_addr.j1939.pgn) {
+ 		case J1939_PGN_REQUEST:
+@@ -588,7 +588,7 @@ int main(int argc, char *argv[])
+ 				break;
+ 			if (s.state == STATE_REQ_SENT) {
+ 				if (s.verbose)
+-					error(0, 0, "request sent, pending for 1250 ms");
++					err(0, 0, "request sent, pending for 1250 ms");
+ 				schedule_itimer(1250);
+ 				s.state = STATE_REQ_PENDING;
+ 			} else if (s.state == STATE_OPERATIONAL) {
+@@ -618,14 +618,14 @@ int main(int argc, char *argv[])
+ 				/* ourselve, disable itimer */
+ 				s.current_sa = sa;
+ 				if (s.verbose)
+-					error(0, 0, "claimed 0x%02x", sa);
++					err(0, 0, "claimed 0x%02x", sa);
+ 			} else if (sa == s.current_sa) {
+ 				if (s.verbose)
+-					error(0, 0, "address collision for 0x%02x", sa);
++					err(0, 0, "address collision for 0x%02x", sa);
+ 				if (s.name > saddr.can_addr.j1939.name) {
+ 					sa = choose_new_sa(s.name, sa);
+ 					if (sa == J1939_IDLE_ADDR) {
+-						error(0, 0, "no address left");
++						err(0, 0, "no address left");
+ 						/* put J1939_IDLE_ADDR in cache file */
+ 						s.current_sa = sa;
+ 						goto done;
+@@ -650,7 +650,7 @@ int main(int argc, char *argv[])
+ 	}
+ done:
+ 	if (s.verbose)
+-		error(0, 0, "shutdown");
++		err(0, 0, "shutdown");
+ 	claim_address(sock, s.name, J1939_IDLE_ADDR);
+ 	save_cache();
+ 	return 0;
+diff --git a/jcat.c b/jcat.c
+index 037b6a3..1ee5573 100644
+--- a/jcat.c
++++ b/jcat.c
+@@ -5,7 +5,7 @@
+ 
+ #include <err.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
+ #include <net/if.h>
+@@ -444,10 +444,10 @@ static size_t jcat_get_file_size(int fd)
+ 
+ 	offset = lseek(fd, 0, SEEK_END);
+ 	if (offset == -1)
+-		error(1, errno, "%s lseek()\n", __func__);
++		err(1, errno, "%s lseek()\n", __func__);
+ 
+ 	if (lseek(fd, 0, SEEK_SET) == -1)
+-		error(1, errno, "%s lseek() start\n", __func__);
++		err(1, errno, "%s lseek() start\n", __func__);
+ 
+ 	return offset;
+ }
+@@ -470,7 +470,7 @@ static int jcat_send(struct jcat_priv *priv)
+ 			break;
+ 
+ 		if (lseek(priv->infile, 0, SEEK_SET) == -1)
+-			error(1, errno, "%s lseek() start\n", __func__);
++			err(1, errno, "%s lseek() start\n", __func__);
+ 	}
+ 
+ 	return ret;
+@@ -557,7 +557,7 @@ static int jcat_sock_prepare(struct jcat_priv *priv)
+ 
+ 	if (setsockopt(priv->sock, SOL_SOCKET, SO_TIMESTAMPING,
+ 		       (char *) &sock_opt, sizeof(sock_opt)))
+-		error(1, 0, "setsockopt timestamping");
++		err(1, 0, "setsockopt timestamping");
+ 
+ 	ret = bind(priv->sock, (void *)&priv->sockname, sizeof(priv->sockname));
+ 	if (ret < 0) {
+@@ -592,7 +592,7 @@ static int jcat_parse_args(struct jcat_priv *priv, int argc, char *argv[])
+ 	case 'i':
+ 		priv->infile = open(optarg, O_RDONLY);
+ 		if (priv->infile == -1)
+-			error(EXIT_FAILURE, errno, "can't open input file");
++			err(EXIT_FAILURE, errno, "can't open input file");
+ 		priv->todo_filesize = 1;
+ 		break;
+ 	case 's':
+@@ -647,7 +647,7 @@ int main(int argc, char *argv[])
+ 
+ 	priv = malloc(sizeof(*priv));
+ 	if (!priv)
+-		error(EXIT_FAILURE, errno, "can't allocate priv");
++		err(EXIT_FAILURE, errno, "can't allocate priv");
+ 
+ 	bzero(priv, sizeof(*priv));
+ 
+diff --git a/jspy.c b/jspy.c
+index 6ae34d8..99d17cf 100644
+--- a/jspy.c
++++ b/jspy.c
+@@ -19,7 +19,7 @@
+ 
+ #include <unistd.h>
+ #include <getopt.h>
+-#include <error.h>
++#include <err.h>
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <sys/time.h>
+@@ -123,7 +123,7 @@ int main(int argc, char **argv)
+ 	case 't':
+ 		if (optarg) {
+ 			if (!strchr("adzA", optarg[0]))
+-				error(1, 0, "unknown time option '%c'", optarg[0]);
++				err(1, 0, "unknown time option '%c'", optarg[0]);
+ 			s.time = optarg[0];
+ 		} else {
+ 			s.time = 'z';
+@@ -138,19 +138,19 @@ int main(int argc, char **argv)
+ 		optarg = argv[optind];
+ 		ret = libj1939_str2addr(optarg, 0, &s.addr);
+ 		if (ret < 0) {
+-			error(0, 0, "bad URI %s", optarg);
++			err(0, 0, "bad URI %s", optarg);
+ 			return 1;
+ 		}
+ 	}
+ 
+ 	buf = malloc(s.pkt_len);
+ 	if (!buf)
+-		error(1, errno, "malloc %u", s.pkt_len);
++		err(1, errno, "malloc %u", s.pkt_len);
+ 
+ 	/* setup socket */
+ 	sock = socket(PF_CAN, SOCK_DGRAM, CAN_J1939);
+ 	if (sock < 0)
+-		error(1, errno, "socket(can, dgram, j1939)");
++		err(1, errno, "socket(can, dgram, j1939)");
+ 
+ 	memset(&filt, 0, sizeof(filt));
+ 	if (s.addr.can_addr.j1939.name) {
+@@ -171,23 +171,23 @@ int main(int argc, char **argv)
+ 	if (filter) {
+ 		ret = setsockopt(sock, SOL_CAN_J1939, SO_J1939_FILTER, &filt, sizeof(filt));
+ 		if (ret < 0)
+-			error(1, errno, "setsockopt filter");
++			err(1, errno, "setsockopt filter");
+ 	}
+ 
+ 	if (s.promisc) {
+ 		ret = setsockopt(sock, SOL_CAN_J1939, SO_J1939_PROMISC, &ival_1, sizeof(ival_1));
+ 		if (ret < 0)
+-			error(1, errno, "setsockopt promisc");
++			err(1, errno, "setsockopt promisc");
+ 	}
+ 
+ 	if (s.time) {
+ 		ret = setsockopt(sock, SOL_SOCKET, SO_TIMESTAMP, &ival_1, sizeof(ival_1));
+ 		if (ret < 0)
+-			error(1, errno, "setsockopt timestamp");
++			err(1, errno, "setsockopt timestamp");
+ 	}
+ 	ret = setsockopt(sock, SOL_SOCKET, SO_RCVBUF, &s.pkt_len, sizeof(s.pkt_len));
+ 		if (ret < 0)
+-			error(1, errno, "setsockopt rcvbuf %u", s.pkt_len);
++			err(1, errno, "setsockopt rcvbuf %u", s.pkt_len);
+ 
+ 	/* bind(): to default, only ifindex is used. */
+ 	memset(&src, 0, sizeof(src));
+@@ -198,7 +198,7 @@ int main(int argc, char **argv)
+ 	src.can_addr.j1939.pgn = J1939_NO_PGN;
+ 	ret = bind(sock, (void *)&src, sizeof(src));
+ 	if (ret < 0)
+-		error(1, errno, "bind(%s)", argv[1]);
++		err(1, errno, "bind(%s)", argv[1]);
+ 
+ 	/* these settings are static and can be held out of the hot path */
+ 	iov.iov_base = &buf[0];
+@@ -209,7 +209,7 @@ int main(int argc, char **argv)
+ 
+ 	memset(&tref, 0, sizeof(tref));
+ 	if (s.verbose)
+-		error(0, 0, "listening");
++		err(0, 0, "listening");
+ 	while (1) {
+ 		/* these settings may be modified by recvmsg() */
+ 		iov.iov_len = s.pkt_len;
+@@ -222,12 +222,12 @@ int main(int argc, char **argv)
+ 		if (ret < 0) {
+ 			switch (errno) {
+ 			case ENETDOWN:
+-				error(0, errno, "ifindex %i", s.addr.can_ifindex);
++				err(0, errno, "ifindex %i", s.addr.can_ifindex);
+ 				continue;
+ 			case EINTR:
+ 				continue;
+ 			default:
+-				error(1, errno, "recvmsg(ifindex %i)", s.addr.can_ifindex);
++				err(1, errno, "recvmsg(ifindex %i)", s.addr.can_ifindex);
+ 				break;
+ 			}
+ 		}
+diff --git a/jsr.c b/jsr.c
+index 20ea99c..14f11af 100644
+--- a/jsr.c
++++ b/jsr.c
+@@ -18,7 +18,7 @@
+ 
+ #include <unistd.h>
+ #include <getopt.h>
+-#include <error.h>
++#include <err.h>
+ #include <poll.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+@@ -106,7 +106,7 @@ int main(int argc, char **argv)
+ 	case 's':
+ 		s.pkt_len = strtoul(optarg, 0, 0);
+ 		if (!s.pkt_len)
+-			error(1, EINVAL, "packet size of %s", optarg);
++			err(1, EINVAL, "packet size of %s", optarg);
+ 		break;
+ 	case 'p':
+ 		s.priority = strtoul(optarg, 0, 0);
+@@ -125,14 +125,14 @@ int main(int argc, char **argv)
+ 		optarg = argv[optind++];
+ 		ret = libj1939_str2addr(optarg, 0, &s.src);
+ 		if (ret < 0)
+-			error(1, 0, "bad address spec [%s]", optarg);
++			err(1, 0, "bad address spec [%s]", optarg);
+ 		s.defined |= DEF_SRC;
+ 	}
+ 	if (argv[optind]) {
+ 		optarg = argv[optind++];
+ 		ret = libj1939_str2addr(optarg, 0, &s.dst);
+ 		if (ret < 0)
+-			error(1, 0, "bad address spec [%s]", optarg);
++			err(1, 0, "bad address spec [%s]", optarg);
+ 		s.defined |= DEF_DST;
+ 	}
+ 
+@@ -140,36 +140,36 @@ int main(int argc, char **argv)
+ 		struct stat st;
+ 
+ 		if (fstat(STDIN_FILENO, &st) < 0)
+-			error(1, errno, "stat stdin, could not determine buffer size");
++			err(1, errno, "stat stdin, could not determine buffer size");
+ 		s.pkt_len = st.st_size ?: 1024;
+ 	}
+ 
+ 	/* prepare */
+ 	buf = malloc(s.pkt_len);
+ 	if (!buf)
+-		error(1, errno, "malloc %u", s.pkt_len);
++		err(1, errno, "malloc %u", s.pkt_len);
+ 
+ 	sock = socket(PF_CAN, SOCK_DGRAM, CAN_J1939);
+ 	if (sock < 0)
+-		error(1, errno, "socket(can, dgram, j1939)");
++		err(1, errno, "socket(can, dgram, j1939)");
+ 
+ 	if (s.defined & DEF_PRIO) {
+ 		ret = setsockopt(sock, SOL_CAN_J1939, SO_J1939_SEND_PRIO, &s.priority, sizeof(s.priority));
+ 		if (ret < 0)
+-			error(1, errno, "setsockopt priority");
++			err(1, errno, "setsockopt priority");
+ 	}
+ 	if (s.defined & DEF_SRC) {
+ 		s.src.can_family = AF_CAN;
+ 		ret = bind(sock, (void *)&s.src, sizeof(s.src));
+ 		if (ret < 0)
+-			error(1, errno, "bind(%s), %i", libj1939_addr2str(&s.src), -errno);
++			err(1, errno, "bind(%s), %i", libj1939_addr2str(&s.src), -errno);
+ 	}
+ 
+ 	if (s.defined & DEF_DST) {
+ 		s.dst.can_family = AF_CAN;
+ 		ret = connect(sock, (void *)&s.dst, sizeof(s.dst));
+ 		if (ret < 0)
+-			error(1, errno, "connect(%s), %i", libj1939_addr2str(&s.dst), -errno);
++			err(1, errno, "connect(%s), %i", libj1939_addr2str(&s.dst), -errno);
+ 	}
+ 
+ 	pfd[0].fd = STDIN_FILENO;
+@@ -183,19 +183,19 @@ int main(int argc, char **argv)
+ 		if (ret < 0) {
+ 			if (errno == EINTR)
+ 				continue;
+-			error(1, errno, "poll()");
++			err(1, errno, "poll()");
+ 		}
+ 		if (pfd[0].revents) {
+ 			ret = read(pfd[0].fd, buf, s.pkt_len);
+ 			if (ret < 0)
+-				error(1, errno, "read(stdin)");
++				err(1, errno, "read(stdin)");
+ 			if (!ret)
+ 				break;
+ 			len = ret;
+ 			do {
+ 				ret = send(pfd[1].fd, buf, len, s.sendflags);
+ 				if (ret < 0)
+-					error(errno != ENOBUFS, errno, "write(%s)",
++					err(errno != ENOBUFS, errno, "write(%s)",
+ 							libj1939_addr2str(&s.src));
+ 			} while (ret < 0);
+ 		}
+@@ -203,7 +203,7 @@ int main(int argc, char **argv)
+ 			ret = read(pfd[1].fd, buf, s.pkt_len);
+ 			if (ret < 0) {
+ 				ret = errno;
+-				error(0, errno, "read(%s)", libj1939_addr2str(&s.dst));
++				err(0, errno, "read(%s)", libj1939_addr2str(&s.dst));
+ 				switch (ret) {
+ 				case EHOSTDOWN:
+ 					break;
+@@ -212,7 +212,7 @@ int main(int argc, char **argv)
+ 				}
+ 			} else {
+ 				if (write(STDOUT_FILENO, buf, ret) < 0)
+-					error(1, errno, "write(stdout)");
++					err(1, errno, "write(stdout)");
+ 			}
+ 		}
+ 	}
+diff --git a/libj1939.c b/libj1939.c
+index 5970d02..bfc9dda 100644
+--- a/libj1939.c
++++ b/libj1939.c
+@@ -16,7 +16,7 @@
+ #include <errno.h>
+ #include <inttypes.h>
+ 
+-#include <error.h>
++#include <err.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <net/if.h>
+@@ -42,7 +42,7 @@ static inline void fetch_names(void)
+ 	if (!saved) {
+ 		saved = if_nameindex();
+ 		if (!saved)
+-			error(1, errno, "if_nameindex()");
++			err(1, errno, "if_nameindex()");
+ 	}
+ }
+ 
+diff --git a/testj1939.c b/testj1939.c
+index 83df1d2..130f6ac 100644
+--- a/testj1939.c
++++ b/testj1939.c
+@@ -20,7 +20,7 @@
+ 
+ #include <unistd.h>
+ #include <getopt.h>
+-#include <error.h>
++#include <err.h>
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <net/if.h>
+@@ -53,7 +53,7 @@ static const char optstring[] = "?vbos::rep:cnw::";
+ 
+ static void onsigalrm(int sig)
+ {
+-	error(0, 0, "exit as requested");
++	err(0, 0, "exit as requested");
+ 	exit(0);
+ }
+ 
+@@ -64,7 +64,7 @@ static void schedule_oneshot_itimer(double delay)
+ 	it.it_value.tv_sec = delay;
+ 	it.it_value.tv_usec = (long)(delay * 1e6) % 1000000;
+ 	if (setitimer(ITIMER_REAL, &it, NULL) < 0)
+-		error(1, errno, "schedule itimer %.3lfs", delay);
++		err(1, errno, "schedule itimer %.3lfs", delay);
+ }
+ 
+ /* main */
+@@ -103,7 +103,7 @@ int main(int argc, char *argv[])
+ 	case 's':
+ 		todo_send = strtoul(optarg ?: "8", NULL, 0);
+ 		if (todo_send > sizeof(dat))
+-			error(1, 0, "Unsupported size. max: %zu", sizeof(dat));
++			err(1, 0, "Unsupported size. max: %zu", sizeof(dat));
+ 		break;
+ 	case 'r':
+ 		todo_recv = 1;
+@@ -159,7 +159,7 @@ int main(int argc, char *argv[])
+ 		fprintf(stderr, "- socket(PF_CAN, SOCK_DGRAM, CAN_J1939);\n");
+ 	sock = ret = socket(PF_CAN, SOCK_DGRAM, CAN_J1939);
+ 	if (ret < 0)
+-		error(1, errno, "socket(j1939)");
++		err(1, errno, "socket(j1939)");
+ 
+ 	if (todo_prio >= 0) {
+ 		if (verbose)
+@@ -167,7 +167,7 @@ int main(int argc, char *argv[])
+ 		ret = setsockopt(sock, SOL_CAN_J1939, SO_J1939_SEND_PRIO,
+ 				&todo_prio, sizeof(todo_prio));
+ 		if (ret < 0)
+-			error(1, errno, "set priority %i", todo_prio);
++			err(1, errno, "set priority %i", todo_prio);
+ 	}
+ 
+ 	if (!no_bind) {
+@@ -176,7 +176,7 @@ int main(int argc, char *argv[])
+ 			fprintf(stderr, "- bind(, %s, %zi);\n", libj1939_addr2str(&sockname), sizeof(sockname));
+ 		ret = bind(sock, (void *)&sockname, sizeof(sockname));
+ 		if (ret < 0)
+-			error(1, errno, "bind()");
++			err(1, errno, "bind()");
+ 
+ 		if (todo_rebind) {
+ 			/* rebind with actual SA */
+@@ -186,18 +186,18 @@ int main(int argc, char *argv[])
+ 				fprintf(stderr, "- bind(, %s, %zi);\n", libj1939_addr2str(&sockname), sizeof(sockname));
+ 			ret = bind(sock, (void *)&sockname, sizeof(sockname));
+ 			if (ret < 0)
+-				error(1, errno, "re-bind()");
++				err(1, errno, "re-bind()");
+ 		}
+ 	}
+ 
+ 	if (todo_connect) {
+ 		if (!valid_peername)
+-			error(1, 0, "no peername supplied");
++			err(1, 0, "no peername supplied");
+ 		if (verbose)
+ 			fprintf(stderr, "- connect(, %s, %zi);\n", libj1939_addr2str(&peername), sizeof(peername));
+ 		ret = connect(sock, (void *)&peername, sizeof(peername));
+ 		if (ret < 0)
+-			error(1, errno, "connect()");
++			err(1, errno, "connect()");
+ 	}
+ 
+ 	if (todo_send) {
+@@ -226,7 +226,7 @@ int main(int argc, char *argv[])
+ 		}
+ 
+ 		if (ret < 0)
+-			error(1, errno, "sendto");
++			err(1, errno, "sendto");
+ 	}
+ 
+ 	/* main loop */
+@@ -248,7 +248,7 @@ int main(int argc, char *argv[])
+ 					fprintf(stderr, "-\t<interrupted>\n");
+ 				continue;
+ 			}
+-			error(1, errno, "recvfrom()");
++			err(1, errno, "recvfrom()");
+ 		}
+ 
+ 		if (todo_echo) {
+@@ -257,7 +257,7 @@ int main(int argc, char *argv[])
+ 			ret = sendto(sock, dat, ret, 0,
+ 					(void *)&peername, peernamelen);
+ 			if (ret < 0)
+-				error(1, errno, "sendto");
++				err(1, errno, "sendto");
+ 		}
+ 		if (todo_recv) {
+ 			int i = 0;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index cbf3aee10..000000000
--- a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 20981c8a328747f823b7eef68d0c2812b3eaed30 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jul 2019 21:50:43 +0200
-Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-canlogserver.c: In function 'main':
-canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
-     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
-                     ^~~~~~~~~~
-                     SIOCGRARP
-canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
-
-Fixes:
- - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
-
-Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit/e9590b1ca75d360eaf3211bebd86058214d48064]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- canlogserver.c | 1 +
- cansniffer.c   | 1 +
- isotpdump.c    | 1 +
- isotpperf.c    | 1 +
- isotpsniffer.c | 1 +
- slcanpty.c     | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/canlogserver.c b/canlogserver.c
-index e3350b7..f53165c 100644
---- a/canlogserver.c
-+++ b/canlogserver.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <signal.h>
- #include <errno.h>
- 
-diff --git a/cansniffer.c b/cansniffer.c
-index 7b0a3fa..bf7d72e 100644
---- a/cansniffer.c
-+++ b/cansniffer.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/bcm.h>
-+#include <linux/sockios.h>
- 
- #include "terminal.h"
- 
-diff --git a/isotpdump.c b/isotpdump.c
-index b2b650a..36d8af3 100644
---- a/isotpdump.c
-+++ b/isotpdump.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/isotpperf.c b/isotpperf.c
-index db3a2b7..5852a57 100644
---- a/isotpperf.c
-+++ b/isotpperf.c
-@@ -56,6 +56,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- #define NO_CAN_ID 0xFFFFFFFFU
- #define PERCENTRES 2 /* resolution in percent for bargraph */
-diff --git a/isotpsniffer.c b/isotpsniffer.c
-index f42e18b..d7a4c66 100644
---- a/isotpsniffer.c
-+++ b/isotpsniffer.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/isotp.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/slcanpty.c b/slcanpty.c
-index 431ca68..7dfaf5c 100644
---- a/slcanpty.c
-+++ b/slcanpty.c
-@@ -40,6 +40,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- /* maximum rx buffer len: extended CAN frame with timestamp */
- #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index db5055fed..ec2fb8049 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,18 +1,17 @@
 SUMMARY = "Linux CAN network development utilities"
 DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;beginline=2;endline=44;md5=390a2c9a3c5e3595a069ac1436553ee7"
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
-           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
-           "
-SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+SRC_URI_append_libc-musl = " \
+    file://0001-Fix-musl-error.patch"
+SRCREV = "26ae1fffa8f290442882d3e59c7363cb371e2380"
 
 PV = "0.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-- 
2.17.1


