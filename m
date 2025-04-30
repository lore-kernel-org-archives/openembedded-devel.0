Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72BDC3ABA9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:44:50 +0000 (UTC)
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
 by mx.groups.io with SMTP id smtpd.web11.14908.1746013316727872897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 04:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=RjjRSiVK;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.8, mailfrom: jeroen@myspectrum.nl)
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4ZnZz626XQzY75qS;
	Wed, 30 Apr 2025 13:41:54 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission15.mail.transip.nl (Postfix) with ESMTPSA id 4ZnZz46dbnz2mZN1R;
	Wed, 30 Apr 2025 13:41:52 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 7532B202DD;
	Wed, 30 Apr 2025 11:41:50 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 30 Apr 2025 13:41:49 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [meta-oe][scarthgap][PATCH] can-utils: fix printing / reading timestamps
Date: Wed, 30 Apr 2025 13:41:32 +0200
Message-ID: <20250430114132.3275544-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1746013313; h=from:subject:to:cc:date:
 mime-version; bh=a8Ei+pKZPgBTujZjUE3SMzA3X137H/ivgYZ+wOmqy/4=;
 b=RjjRSiVK0DVqSyrP4PYpArXXt1cYCmHtD7K9M2crDB0/Fa80LB/IIXhT7vKYM/vxHdu39z
 Cizlm/uMLuqcZZ4AdjTY1OtvgxkZIrAHYgqnd8ICr4ANnP171mQYX4OKagJEh9KYUIiiXt
 xOsLozWdKjyRvoYIIZj2B2bkRpf7GxJpYGOVnLQQOTeUXQX5iCmvp0GaA/fFEkBoTsI906
 bU1hIWvmTZSEQ0+4I2+qtq/ss/r9xAGmrDOP1WCQXtgIx+oPjZyLyV9rS5X8f0IloWyPcs
 /YS8zFdNWY0TqmNqA8F3yDdilGDLgmLhP4sN/D9vAMM42oGFQ11ojsYxQ8+Rzw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 12:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117254

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Backport a patch to correctly handle 64bit timestamps.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 ...ting-always-use-64-bit-for-timestamp.patch | 422 ++++++++++++++++++
 .../socketcan/can-utils_2023.03.bb            |   4 +-
 2 files changed, 425 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-tim=
estamp-formatting-always-use-64-bit-for-timestamp.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-timestamp-=
formatting-always-use-64-bit-for-timestamp.patch b/meta-oe/recipes-extend=
ed/socketcan/can-utils/0001-timestamp-formatting-always-use-64-bit-for-ti=
mestamp.patch
new file mode 100644
index 0000000000..47f3792c39
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-timestamp-formatt=
ing-always-use-64-bit-for-timestamp.patch
@@ -0,0 +1,422 @@
+From 05eb82fc959328f851d4b939d394529ac377de19 Mon Sep 17 00:00:00 2001
+From: TyK <tisyang@gmail.com>
+Date: Mon, 27 Nov 2023 10:59:21 +0800
+Subject: [PATCH] timestamp formatting: always use 64-bit for timestamp
+ formatting.
+
+Using C99 `unsigned long long` to format `struct timeval`'s `tv_sec`
+and `tv_usec`, fix incorrect print on some 32bit platform which
+are using time64.
+
+Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit=
/ceda93bd5c56927c72d48dcaa30e17d6ecea86b8]
+---
+ asc2log.c      | 38 +++++++++++++++++++++++---------------
+ candump.c      |  6 +++---
+ canlogserver.c |  4 ++--
+ canplayer.c    | 11 +++++++----
+ isotpdump.c    |  8 ++++----
+ isotpperf.c    |  4 ++--
+ isotpsniffer.c |  6 +++---
+ j1939cat.c     |  4 ++--
+ j1939spy.c     |  6 +++---
+ log2asc.c      | 11 +++++++----
+ slcanpty.c     |  4 ++--
+ 11 files changed, 58 insertions(+), 44 deletions(-)
+
+diff --git a/asc2log.c b/asc2log.c
+index ea6b486..4eb3609 100644
+--- a/asc2log.c
++++ b/asc2log.c
+@@ -73,7 +73,7 @@ void print_usage(char *prg)
+=20
+ void prframe(FILE *file, struct timeval *tv, int dev, struct canfd_fram=
e *cf, unsigned int max_dlen, char *extra_info) {
+=20
+-	fprintf(file, "(%lu.%06lu) ", tv->tv_sec, tv->tv_usec);
++	fprintf(file, "(%llu.%06llu) ", (unsigned long long)tv->tv_sec, (unsig=
ned long long)tv->tv_usec);
+=20
+ 	if (dev > 0)
+ 		fprintf(file, "can%d ", dev-1);
+@@ -141,11 +141,14 @@ void eval_can(char* buf, struct timeval *date_tvp,=
 char timestamps, char base, i
+ 	char dir[3]; /* 'Rx' or 'Tx' plus terminating zero */
+ 	char *extra_info;
+ 	int i, items;
++	unsigned long long sec, usec;
+=20
+ 	/* check for ErrorFrames */
+-	if (sscanf(buf, "%lu.%lu %d %s",
+-		   &read_tv.tv_sec, &read_tv.tv_usec,
++	if (sscanf(buf, "%llu.%llu %d %s",
++		   &sec, &usec,
+ 		   &interface, tmp1) =3D=3D 4) {
++		read_tv.tv_sec =3D sec;
++		read_tv.tv_usec =3D usec;
+=20
+ 		if (!strncmp(tmp1, "ErrorFrame", strlen("ErrorFrame"))) {
+=20
+@@ -165,18 +168,20 @@ void eval_can(char* buf, struct timeval *date_tvp,=
 char timestamps, char base, i
+=20
+ 	/* check for CAN frames with (hexa)decimal values */
+ 	if (base =3D=3D 'h')
+-		items =3D sscanf(buf, "%lu.%lu %d %s %2s %c %x %x %x %x %x %x %x %x %=
x",
+-			       &read_tv.tv_sec, &read_tv.tv_usec, &interface,
++		items =3D sscanf(buf, "%llu.%llu %d %s %2s %c %x %x %x %x %x %x %x %x=
 %x",
++			       &sec, &usec, &interface,
+ 			       tmp1, dir, &rtr, &dlc,
+ 			       &data[0], &data[1], &data[2], &data[3],
+ 			       &data[4], &data[5], &data[6], &data[7]);
+ 	else
+-		items =3D sscanf(buf, "%lu.%lu %d %s %2s %c %x %d %d %d %d %d %d %d %=
d",
+-			       &read_tv.tv_sec, &read_tv.tv_usec, &interface,
++		items =3D sscanf(buf, "%llu.%llu %d %s %2s %c %x %d %d %d %d %d %d %d=
 %d",
++			       &sec, &usec, &interface,
+ 			       tmp1, dir, &rtr, &dlc,
+ 			       &data[0], &data[1], &data[2], &data[3],
+ 			       &data[4], &data[5], &data[6], &data[7]);
+=20
++	read_tv.tv_sec =3D sec;
++	read_tv.tv_usec =3D usec;
+ 	if (items < 7 ) /* make sure we've read the dlc */
+ 		return;
+=20
+@@ -246,6 +251,7 @@ void eval_canfd(char* buf, struct timeval *date_tvp,=
 char timestamps, int dplace
+ 	char *extra_info;
+ 	char *ptr;
+ 	int i;
++	unsigned long long sec, usec;
+=20
+ 	/* The CANFD format is mainly in hex representation but <DataLength>
+ 	   and probably some content we skip anyway. Don't trust the docs! */
+@@ -255,19 +261,21 @@ void eval_canfd(char* buf, struct timeval *date_tv=
p, char timestamps, int dplace
+ 	   100000  214   223040 80000000 46500250 460a0250 20011736 20010205 *=
/
+=20
+ 	/* check for valid line without symbolic name */
+-	if (sscanf(buf, "%lu.%lu %*s %d %2s %s %hhx %hhx %x %d ",
+-		   &read_tv.tv_sec, &read_tv.tv_usec, &interface,
++	if (sscanf(buf, "%llu.%llu %*s %d %2s %s %hhx %hhx %x %d ",
++		   &sec, &usec, &interface,
+ 		   dir, tmp1, &brs, &esi, &dlc, &dlen) !=3D 9) {
+=20
+ 		/* check for valid line with a symbolic name */
+-		if (sscanf(buf, "%lu.%lu %*s %d %2s %s %*s %hhx %hhx %x %d ",
+-			   &read_tv.tv_sec, &read_tv.tv_usec, &interface,
++		if (sscanf(buf, "%llu.%llu %*s %d %2s %s %*s %hhx %hhx %x %d ",
++			   &sec, &usec, &interface,
+ 			   dir, tmp1, &brs, &esi, &dlc, &dlen) !=3D 9) {
+=20
+ 			/* no valid CANFD format pattern */
+ 			return;
+ 		}
+ 	}
++	read_tv.tv_sec =3D sec;
++	read_tv.tv_usec =3D usec;
+=20
+ 	/* check for allowed (unsigned) value ranges */
+ 	if ((dlen > CANFD_MAX_DLEN) || (dlc > CANFD_MAX_DLC) ||
+@@ -427,12 +435,12 @@ int main(int argc, char **argv)
+ 	FILE *infile =3D stdin;
+ 	FILE *outfile =3D stdout;
+ 	static int verbose;
+-	static struct timeval tmp_tv; /* tmp frame timestamp from ASC file */
+ 	static struct timeval date_tv; /* date of the ASC file */
+ 	static int dplace; /* decimal place 4, 5 or 6 or uninitialized */
+ 	static char base; /* 'd'ec or 'h'ex */
+ 	static char timestamps; /* 'a'bsolute or 'r'elative */
+ 	int opt;
++	unsigned long long sec, usec;
+=20
+ 	while ((opt =3D getopt(argc, argv, "I:O:v?")) !=3D -1) {
+ 		switch (opt) {
+@@ -505,12 +513,12 @@ int main(int argc, char **argv)
+ 					gettimeofday(&date_tv, NULL);
+ 				}
+ 				if (verbose)
+-					printf("date %lu =3D> %s", date_tv.tv_sec, ctime(&date_tv.tv_sec))=
;
++					printf("date %llu =3D> %s", (unsigned long long)date_tv.tv_sec, ct=
ime(&date_tv.tv_sec));
+ 				continue;
+ 			}
+=20
+ 			/* check for decimal places length in valid CAN frames */
+-			if (sscanf(buf, "%lu.%s %s ", &tmp_tv.tv_sec, tmp2,
++			if (sscanf(buf, "%llu.%s %s ", &sec, tmp2,
+ 				   tmp1) !=3D 3)
+ 				continue; /* dplace remains zero until first found CAN frame */
+=20
+@@ -529,7 +537,7 @@ int main(int argc, char **argv)
+ 		/* so try to get CAN frames and ErrorFrames and convert them */
+=20
+ 		/* check classic CAN format or the CANFD tag which can take both type=
s */
+-		if (sscanf(buf, "%lu.%lu %s ", &tmp_tv.tv_sec,  &tmp_tv.tv_usec, tmp1=
) =3D=3D 3){
++		if (sscanf(buf, "%llu.%llu %s ", &sec,  &usec, tmp1) =3D=3D 3){
+ 			if (!strncmp(tmp1, "CANFD", 5))
+ 				eval_canfd(buf, &date_tv, timestamps, dplace, outfile);
+ 			else
+diff --git a/candump.c b/candump.c
+index 82f75b1..4ae8864 100644
+--- a/candump.c
++++ b/candump.c
+@@ -224,7 +224,7 @@ static inline void sprint_timestamp(const char times=
tamp, const struct timeval *
+ {
+ 	switch (timestamp) {
+ 	case 'a': /* absolute with timestamp */
+-		sprintf(ts_buffer, "(%010lu.%06lu) ", tv->tv_sec, tv->tv_usec);
++		sprintf(ts_buffer, "(%010llu.%06llu) ", (unsigned long long)tv->tv_se=
c, (unsigned long long)tv->tv_usec);
+ 		break;
+=20
+ 	case 'A': /* absolute with date */
+@@ -234,7 +234,7 @@ static inline void sprint_timestamp(const char times=
tamp, const struct timeval *
+=20
+ 		tm =3D *localtime(&tv->tv_sec);
+ 		strftime(timestring, 24, "%Y-%m-%d %H:%M:%S", &tm);
+-		sprintf(ts_buffer, "(%s.%06lu) ", timestring, tv->tv_usec);
++		sprintf(ts_buffer, "(%s.%06llu) ", timestring, (unsigned long long)tv=
->tv_usec);
+ 	}
+ 	break;
+=20
+@@ -251,7 +251,7 @@ static inline void sprint_timestamp(const char times=
tamp, const struct timeval *
+ 			diff.tv_sec--, diff.tv_usec +=3D 1000000;
+ 		if (diff.tv_sec < 0)
+ 			diff.tv_sec =3D diff.tv_usec =3D 0;
+-		sprintf(ts_buffer, "(%03lu.%06lu) ", diff.tv_sec, diff.tv_usec);
++		sprintf(ts_buffer, "(%03llu.%06llu) ", (unsigned long long)diff.tv_se=
c, (unsigned long long)diff.tv_usec);
+=20
+ 		if (timestamp =3D=3D 'd')
+ 			*last_tv =3D *tv; /* update for delta calculation */
+diff --git a/canlogserver.c b/canlogserver.c
+index 51d548f..349d64e 100644
+--- a/canlogserver.c
++++ b/canlogserver.c
+@@ -408,8 +408,8 @@ int main(int argc, char **argv)
+=20
+ 				idx =3D idx2dindex(addr.can_ifindex, s[i]);
+=20
+-				sprintf(temp, "(%lu.%06lu) %*s ",
+-					tv.tv_sec, tv.tv_usec, max_devname_len, devname[idx]);
++				sprintf(temp, "(%llu.%06llu) %*s ",
++					(unsigned long long)tv.tv_sec, (unsigned long long)tv.tv_usec, max=
_devname_len, devname[idx]);
+ 				sprint_canframe(temp+strlen(temp), &frame, 0, maxdlen);=20
+ 				strcat(temp, "\n");
+=20
+diff --git a/canplayer.c b/canplayer.c
+index 51adc77..96346ce 100644
+--- a/canplayer.c
++++ b/canplayer.c
+@@ -259,6 +259,7 @@ int main(int argc, char **argv)
+ 	int txidx;       /* sendto() interface index */
+ 	int eof, txmtu, i, j;
+ 	char *fret;
++	unsigned long long sec, usec;
+=20
+ 	while ((opt =3D getopt(argc, argv, "I:l:tin:g:s:xv?")) !=3D -1) {
+ 		switch (opt) {
+@@ -419,11 +420,12 @@ int main(int argc, char **argv)
+=20
+ 		eof =3D 0;
+=20
+-		if (sscanf(buf, "(%lu.%lu) %s %s", &log_tv.tv_sec, &log_tv.tv_usec,
+-			   device, ascframe) !=3D 4) {
++		if (sscanf(buf, "(%llu.%llu) %s %s", &sec, &usec, device, ascframe) !=
=3D 4) {
+ 			fprintf(stderr, "incorrect line format in logfile\n");
+ 			return 1;
+ 		}
++		log_tv.tv_sec =3D sec;
++		log_tv.tv_usec =3D usec;
+=20
+ 		if (use_timestamps) { /* throttle sending due to logfile timestamps *=
/
+=20
+@@ -505,11 +507,12 @@ int main(int argc, char **argv)
+ 					break;
+ 				}
+=20
+-				if (sscanf(buf, "(%lu.%lu) %s %s", &log_tv.tv_sec, &log_tv.tv_usec,
+-					   device, ascframe) !=3D 4) {
++				if (sscanf(buf, "(%llu.%llu) %s %s", &sec, &usec, device, ascframe)=
 !=3D 4) {
+ 					fprintf(stderr, "incorrect line format in logfile\n");
+ 					return 1;
+ 				}
++				log_tv.tv_sec =3D sec;
++				log_tv.tv_usec =3D usec;
+=20
+ 				/*
+ 				 * ensure the fractions of seconds are 6 decimal places long to cat=
ch
+diff --git a/isotpdump.c b/isotpdump.c
+index d22725e..e9e96ce 100644
+--- a/isotpdump.c
++++ b/isotpdump.c
+@@ -361,7 +361,7 @@ int main(int argc, char **argv)
+=20
+ 			switch (timestamp) {
+ 			case 'a': /* absolute with timestamp */
+-				printf("(%lu.%06lu) ", tv.tv_sec, tv.tv_usec);
++				printf("(%llu.%06llu) ", (unsigned long long)tv.tv_sec, (unsigned l=
ong long)tv.tv_usec);
+ 				break;
+=20
+ 			case 'A': /* absolute with date */
+@@ -372,7 +372,7 @@ int main(int argc, char **argv)
+ 				tm =3D *localtime(&tv.tv_sec);
+ 				strftime(timestring, 24, "%Y-%m-%d %H:%M:%S",
+ 					 &tm);
+-				printf("(%s.%06lu) ", timestring, tv.tv_usec);
++				printf("(%s.%06llu) ", timestring, (unsigned long long)tv.tv_usec);
+ 			} break;
+=20
+ 			case 'd': /* delta */
+@@ -388,8 +388,8 @@ int main(int argc, char **argv)
+ 					diff.tv_sec--, diff.tv_usec +=3D 1000000;
+ 				if (diff.tv_sec < 0)
+ 					diff.tv_sec =3D diff.tv_usec =3D 0;
+-				printf("(%lu.%06lu) ", diff.tv_sec,
+-				       diff.tv_usec);
++				printf("(%llu.%06llu) ", (unsigned long long)diff.tv_sec,
++				       (unsigned long long)diff.tv_usec);
+=20
+ 				if (timestamp =3D=3D 'd')
+ 					last_tv =3D
+diff --git a/isotpperf.c b/isotpperf.c
+index 154d5cd..ad0dc2a 100644
+--- a/isotpperf.c
++++ b/isotpperf.c
+@@ -403,9 +403,9 @@ int main(int argc, char **argv)
+=20
+ 				/* check devisor to be not zero */
+ 				if (diff_tv.tv_sec * 1000 + diff_tv.tv_usec / 1000){
+-					printf("%lu.%06lus ", diff_tv.tv_sec, diff_tv.tv_usec);
++					printf("%llu.%06llus ", (unsigned long long)diff_tv.tv_sec, (unsig=
ned long long)diff_tv.tv_usec);
+ 					printf("=3D> %lu byte/s", (fflen * 1000) /
+-					       (diff_tv.tv_sec * 1000 + diff_tv.tv_usec / 1000));
++					       (unsigned long)(diff_tv.tv_sec * 1000 + diff_tv.tv_usec / 1=
000));
+ 				} else
+ 					printf("(no time available)     ");
+=20
+diff --git a/isotpsniffer.c b/isotpsniffer.c
+index 2b6de40..f976149 100644
+--- a/isotpsniffer.c
++++ b/isotpsniffer.c
+@@ -101,7 +101,7 @@ void printbuf(unsigned char *buffer, int nbytes, int=
 color, int timestamp,
+ 		switch (timestamp) {
+=20
+ 		case 'a': /* absolute with timestamp */
+-			printf("(%lu.%06lu) ", tv->tv_sec, tv->tv_usec);
++			printf("(%llu.%06llu) ", (unsigned long long)tv->tv_sec, (unsigned l=
ong long)tv->tv_usec);
+ 			break;
+=20
+ 		case 'A': /* absolute with date */
+@@ -111,7 +111,7 @@ void printbuf(unsigned char *buffer, int nbytes, int=
 color, int timestamp,
+=20
+ 			tm =3D *localtime(&tv->tv_sec);
+ 			strftime(timestring, 24, "%Y-%m-%d %H:%M:%S", &tm);
+-			printf("(%s.%06lu) ", timestring, tv->tv_usec);
++			printf("(%s.%06llu) ", timestring, (unsigned long long)tv->tv_usec);
+ 		}
+ 		break;
+=20
+@@ -128,7 +128,7 @@ void printbuf(unsigned char *buffer, int nbytes, int=
 color, int timestamp,
+ 				diff.tv_sec--, diff.tv_usec +=3D 1000000;
+ 			if (diff.tv_sec < 0)
+ 				diff.tv_sec =3D diff.tv_usec =3D 0;
+-			printf("(%lu.%06lu) ", diff.tv_sec, diff.tv_usec);
++			printf("(%llu.%06llu) ", (unsigned long long)diff.tv_sec, (unsigned =
long long)diff.tv_usec);
+=20
+ 			if (timestamp =3D=3D 'd')
+ 				*last_tv =3D *tv; /* update for delta calculation */
+diff --git a/j1939cat.c b/j1939cat.c
+index 4234aad..238c4ff 100644
+--- a/j1939cat.c
++++ b/j1939cat.c
+@@ -148,8 +148,8 @@ static void j1939cat_print_timestamp(struct j1939cat=
_priv *priv, const char *nam
+ 	if (!(cur->tv_sec | cur->tv_nsec))
+ 		return;
+=20
+-	fprintf(stderr, "  %s: %lu s %lu us (seq=3D%03u, send=3D%07u)",
+-			name, cur->tv_sec, cur->tv_nsec / 1000,
++	fprintf(stderr, "  %s: %llu s %llu us (seq=3D%03u, send=3D%07u)",
++			name, (unsigned long long)cur->tv_sec, (unsigned long long)cur->tv_n=
sec / 1000,
+ 			stats->tskey, stats->send);
+=20
+ 	fprintf(stderr, "\n");
+diff --git a/j1939spy.c b/j1939spy.c
+index e49ed14..56950ea 100644
+--- a/j1939spy.c
++++ b/j1939spy.c
+@@ -268,14 +268,14 @@ int main(int argc, char **argv)
+ 				goto abs_time;
+ 			} else if ('a' =3D=3D s.time) {
+ 				abs_time:
+-				printf("(%lu.%04lu)", tdut.tv_sec, tdut.tv_usec / 100);
++				printf("(%llu.%04llu)", (unsigned long long)tdut.tv_sec, (unsigned =
long long)tdut.tv_usec / 100);
+ 			} else if ('A' =3D=3D s.time) {
+ 				struct tm tm;
+ 				tm =3D *localtime(&tdut.tv_sec);
+-				printf("(%04u%02u%02uT%02u%02u%02u.%04lu)",
++				printf("(%04u%02u%02uT%02u%02u%02u.%04llu)",
+ 					tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+ 					tm.tm_hour, tm.tm_min, tm.tm_sec,
+-					tdut.tv_usec/100);
++					(unsigned long long)tdut.tv_usec/100);
+ 			}
+ 		}
+ 		printf(" %s ", libj1939_addr2str(&src));
+diff --git a/log2asc.c b/log2asc.c
+index a1cf364..85634f8 100644
+--- a/log2asc.c
++++ b/log2asc.c
+@@ -190,6 +190,7 @@ int main(int argc, char **argv)
+ 	FILE *infile =3D stdin;
+ 	FILE *outfile =3D stdout;
+ 	static int maxdev, devno, i, crlf, fdfmt, nortrdlc, d4, opt, mtu;
++	unsigned long long sec, usec;
+=20
+ 	while ((opt =3D getopt(argc, argv, "I:O:4nfr?")) !=3D -1) {
+ 		switch (opt) {
+@@ -259,18 +260,20 @@ int main(int argc, char **argv)
+ 		if (buf[0] !=3D '(')
+ 			continue;
+=20
+-		if (sscanf(buf, "(%lu.%lu) %s %s %s", &tv.tv_sec, &tv.tv_usec,
++		if (sscanf(buf, "(%llu.%llu) %s %s %s", &sec, &usec,
+ 			   device, ascframe, extra_info) !=3D 5) {
+=20
+ 			/* do not evaluate the extra info */
+ 			extra_info[0] =3D 0;
+=20
+-			if (sscanf(buf, "(%lu.%lu) %s %s", &tv.tv_sec, &tv.tv_usec,
++			if (sscanf(buf, "(%llu.%llu) %s %s", &sec, &usec,
+ 				   device, ascframe) !=3D 4) {
+ 				fprintf(stderr, "incorrect line format in logfile\n");
+ 				return 1;
+ 			}
+ 		}
++		tv.tv_sec =3D sec;
++		tv.tv_usec =3D usec;
+=20
+ 		if (!start_tv.tv_sec) { /* print banner */
+ 			start_tv =3D tv;
+@@ -305,9 +308,9 @@ int main(int argc, char **argv)
+ 				tv.tv_sec =3D tv.tv_usec =3D 0;
+=20
+ 			if (d4)
+-				fprintf(outfile, "%4lu.%04lu ", tv.tv_sec, tv.tv_usec/100);
++				fprintf(outfile, "%4llu.%04llu ", (unsigned long long)tv.tv_sec, (u=
nsigned long long)tv.tv_usec/100);
+ 			else
+-				fprintf(outfile, "%4lu.%06lu ", tv.tv_sec, tv.tv_usec);
++				fprintf(outfile, "%4llu.%06llu ", (unsigned long long)tv.tv_sec, (u=
nsigned long long)tv.tv_usec);
+=20
+ 			if ((mtu =3D=3D CAN_MTU) && (fdfmt =3D=3D 0))
+ 				can_asc(&cf, devno, nortrdlc, extra_info, outfile);
+diff --git a/slcanpty.c b/slcanpty.c
+index fa97cd6..fc86d4f 100644
+--- a/slcanpty.c
++++ b/slcanpty.c
+@@ -363,8 +363,8 @@ int can2pty(int pty, int socket, int *tstamp)
+ 		if (ioctl(socket, SIOCGSTAMP, &tv) < 0)
+ 			perror("SIOCGSTAMP");
+=20
+-		sprintf(&buf[ptr + 2*frame.can_dlc], "%04lX",
+-			(tv.tv_sec%60)*1000 + tv.tv_usec/1000);
++		sprintf(&buf[ptr + 2*frame.can_dlc], "%04llX",
++			(unsigned long long)(tv.tv_sec%60)*1000 + tv.tv_usec/1000);
+ 	}
+=20
+ 	strcat(buf, "\r"); /* add terminating character */
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb b/me=
ta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
index ca6cb7db58..5a7beb978a 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM =3D "file://include/linux/can.h;endline=3D=
44;md5=3Da9e1169c6c9a114a61
=20
 DEPENDS =3D "libsocketcan"
=20
-SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protocol=3Dhttps;bran=
ch=3Dmaster \
+           file://0001-timestamp-formatting-always-use-64-bit-for-timest=
amp.patch \
+"
=20
 SRCREV =3D "cfe41963f3425e9adb01a70cfaddedf5e5982720"
=20
--=20
2.43.0


