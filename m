Return-Path: <Aditya.Tayade@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-bo1ind01on0075.outbound.protection.outlook.com [104.47.101.75])
	by mail.openembedded.org (Postfix) with ESMTP id F234278D34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QSZVodGxCS3GjvydQo2tWyuwgR0PxCMX/WF4RU+7pVI=;
	b=c6KLkzjxELO7bC9lrhLHEePX/gqLv7iC58z5VWSoB4a2wOiuZ437xBPw6Y6LSEquOjoTuPRJuz4IlJjBUpH4JKAk3x3juG3go8lbih/x+pJPDOxDIFHvAX7/P8CVgvwSWVkm/dp7ioxOCnVEN7SNEZSC+pvlcIsCT4TrwILSGEw=
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM (10.164.150.144) by
	MAXPR01MB0058.INDPRD01.PROD.OUTLOOK.COM (10.164.148.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1038.23; Mon, 13 Aug 2018 12:37:21 +0000
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0]) by
	MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0%4]) with mapi id 15.20.1038.023;
	Mon, 13 Aug 2018 12:37:21 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] ltrace: added alternate source
Thread-Index: AQHUMwDSMnDyCBQUUkuCSq7KnoqMWg==
Date: Mon, 13 Aug 2018 12:37:21 +0000
Message-ID: <MAXPR01MB0348B0F7FCE0B995544DA5B291390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-originating-ip: [115.112.39.238]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MAXPR01MB0058;
	6:KF6iebb5I3UtKaqQ9FDRj+PEN3zycH6FuOvL3x59kWs7VVyXky5FAuDuRElpyPHUKlSYhqnJ8oCo/afPmcPwX+CIj6kn2fNIOSqBWGx9VCC5yOBUJ898LT6mSiJGfno9Q8vRLG9ankRIQkkyRKaUKDXp5d1csfEgj+/VhFA+E8e54TVnxWy5Idq5pV0F+36OejM5QnkuH1WFMjgylfwhLxfuJU/xIYRo15f/Rhnx2LkhDljSvG724bIEnZyeaZ6+uuYlXtblvEzpfUX6RNacvB3cOVomx7MvsdIChRVTPwJihinf1nI1f+lowIjkqfgCffa/jvb0xcSa3bMbw/9kJZxGMKqzIjXhFzr4smkQcDOwbMvl1lYOq5NWcHlPtC3jM61niu0BHip7zHGsLxyVk7s6f6JdJWCwPbLsqzfWIkA5tNMCMDYZwi/Ug92MDShWkBJe1o0KNPrG8hi7HorVQg==;
	5:zXyJiXbd7JMWGG5Geu9SKuTNLVlELEsjVztEzp6sOU/B8y1n3MJduL1S0XLhg16mpv7RcDGERW5+Ou6+Dmm3IY7TRfZGCEveR0TZ4G6j8q2SvloCt+1v+wFsKfl5APBrUNtA+yVo7i3WNemGfzBQfYltm/f/icWSMQAnGEZKxgM=;
	7:yoCfO2Vwxnu1pEndke6kO+JxHfd3ntjz95Xjio8C9jCWCp4pUufUROUX1gLP8d4arz92DNrhqfQBuXB/ftpqC1Slq+bC0i0L4J7NPBq5763vum63ED6Upej7pebrMCpkbLSnhcsunk4I/tlGo5wU8zDRgPIYKPx/uv/rhjs3Am4PMTkx6NXbmA7DJJJV8Mpv7GSVZcSpCOpM4na0DoPMMJps5Ze7D5YS15BRoQGv4VohxvGd1HowR5mqnXb3/CsC
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8a11aae3-356f-4846-bfb7-08d6011983c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MAXPR01MB0058; 
x-ms-traffictypediagnostic: MAXPR01MB0058:
x-microsoft-antispam-prvs: <MAXPR01MB0058FBFF19F426A3D08B3DB491390@MAXPR01MB0058.INDPRD01.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(146161314209440)(223705240517415)(21532816269658); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MAXPR01MB0058; BCL:0; PCL:0; RULEID:; SRVR:MAXPR01MB0058; 
x-forefront-prvs: 07630F72AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(50944005)(6116002)(39060400002)(26005)(3846002)(7736002)(966005)(14454004)(66066001)(186003)(316002)(72206003)(106356001)(53936002)(2351001)(81166006)(6606003)(256004)(478600001)(6916009)(8936002)(4326008)(14444005)(74316002)(19627405001)(81156014)(25786009)(6506007)(476003)(55236004)(486006)(1857600001)(5660300001)(102836004)(68736007)(55016002)(105586002)(5250100002)(86362001)(575784001)(2900100001)(2501003)(97736004)(2906002)(53946003)(8676002)(33656002)(5640700003)(9686003)(99286004)(6436002)(6306002)(54896002)(7696005)(559001)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB0058;
	H:MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: kqjpuOF/U9ZlJUhNX5ch888YRnQ0uNckSU0NYFPHz53i3es/70gtqx+I9xIowqkOTgFupvcf2nMblwnsHxYSY/7lwl1K3xQqsUVYiV2ZclvAYTOyqfJaqdcnnBkSPw3jro+Pjo/bSkjvHbldgpkV62a0EOXVPt2liCKtGrN48WoPED8iaCW4gas5tmI9ed3AW0suD74BdcbZ28eO7DjpP8SR+z57R4pI76VPDDayiwBwuMieSHdeZFNbHnbERHFqfegVCNZVp3u822s33lG9aZoPwJZHhzmmYQlplEFg1z0nigiFewiK1mod8W9WTM5ZgxHtIDBOoi0wzhGwN8//ereIiT6i2V3k/kAHmMkLdzU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a11aae3-356f-4846-bfb7-08d6011983c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2018 12:37:21.3639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB0058
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH] ltrace: added alternate source
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
X-List-Received-Date: Mon, 13 Aug 2018 12:37:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Description:
As alioth (the Debian service hosting anonscm) has been discontinued using =
https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new sou=
rce for ltrace.
The new source tree SRCREV SHA "ea8928dab8" and old source tree (from disco=
ntinued link)SRCREV SHA "c22d359433" points to same git history but have so=
me diffs.
Hence added a patch which applies the diff to SHA "ea8928dab8" to make it s=
ame as SHA "c22d359433" from the earlier git source.

ERROR:
WARNING: ltrace-1_7.91+gitAUTOINC+c22d359433 do_fetch: Failed to fetch URL =
git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dmaster, attemptin=
g MIRRORS if available

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
.../recipes-devtools/ltrace/ltrace/add-support-for-old-source-commit-SHA-c2=
2d359433.patch  | 435 ++++++++++++++++++++++++++++++++++++++++++++
meta-oe/recipes-devtools/ltrace/ltrace_git.bb                              =
                |  19 +-
2 files changed, 451 insertions(+), 3 deletions(-)
create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/add-support-for-o=
ld-source-commit-SHA-c22d359433.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/add-support-for-old-sou=
rce-commit-SHA-c22d359433.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ad=
d-support-for-old-source-commit-SHA-c22d359433.patch
new file mode 100644
index 0000000..ce420c4
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/add-support-for-old-source-com=
mit-SHA-c22d359433.patch
@@ -0,0 +1,435 @@
+ltrace: add support for old source commit SHA "c22d359433"
+
+Description:
+As alioth (the Debian service hosting anonscm) has been discontinued using=
 https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new so=
urce.
+The new source tree SRCREV SHA "ea8928dab8" and old source tree (from disc=
ontinued link)SRCREV SHA "c22d359433" points to same git history but have s=
ome diffs.
+This patch applies the diff to sha "ea8928dab8" to make it same as SHA "c2=
2d359433" from the earlier git source.
+
+Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
+Upstream-Status: Pending
+
+diff --git a/sysdeps/linux-gnu/mksyscallent_s390 b/sysdeps/linux-gnu/mksys=
callent_s390
+index 4186785..1964d14 100755
+--- a/sysdeps/linux-gnu/mksyscallent_s390
++++ b/sysdeps/linux-gnu/mksyscallent_s390
+@@ -20,10 +20,11 @@
+ #
+ # Generate syscall table for s390/s390x
+ #
+-# Use this on arch/s390/kernel/syscalls.S
++# Use this on arch/s390/kernel/syscall.s after removing the first few
++# nonsyscall lines.
+ #
+-# mksyscallent_s390 syscalls.S > syscalls31.h
+-# mksyscallent_s390 -x syscalls.S > syscalls64.h
++# cat syscall.s | mksyscallent_s390 > syscalls31.h
++# cat syscall.s | mksyscallent_s390 -x > syscalls64.h
+ #
+
+ use Getopt::Std;
+@@ -36,19 +37,16 @@ $opt_x and $s390x =3D 1;
+ while (<>) {
+ chomp;
+
+- next unless /^NI_SYSCALL/ || /^SYSCALL/;
+ if ($s390x=3D=3D1) {
+- s/^SYSCALL\(//;
++    s/^SYSCALL\([^,]*,//;
+ } else {
+- s/^SYSCALL\([^,]*\,//;
++            s/^SYSCALL\(//;
+ }
+
+ s/,.*//;
+- s/^compat_//;
+ s/^sys_//;
+- s/^s390_//;
+- s/\).*//;
+- s/id16$/id/;
++ s/^s390[x]*_//;
++ s/_glue$//;
+ s/^ni_syscall.*/$i/i;
+ $len =3D 32 - length();
+ $tab =3D $len / 8;
+diff --git a/sysdeps/linux-gnu/s390/syscalls31.h b/sysdeps/linux-gnu/s390/=
syscalls31.h
+index e185656..46f4cf3 100644
+--- a/sysdeps/linux-gnu/s390/syscalls31.h
++++ b/sysdeps/linux-gnu/s390/syscalls31.h
+@@ -35,15 +35,15 @@
+     "time",    /* 13 */
+     "mknod",    /* 14 */
+     "chmod",    /* 15 */
+-    "lchown", /* 16 */
++    "lchown16", /* 16 */
+     "17",      /* 17 */
+     "18",      /* 18 */
+     "lseek",    /* 19 */
+     "getpid",  /* 20 */
+     "mount",    /* 21 */
+-    "umount",        /* 22 */
+-    "setuid",  /* 23 */
+-    "getuid",  /* 24 */
++    "oldumount",        /* 22 */
++    "setuid16", /* 23 */
++    "getuid16", /* 24 */
+     "stime",    /* 25 */
+     "ptrace",  /* 26 */
+     "alarm",    /* 27 */
+@@ -65,11 +65,11 @@
+     "times",    /* 43 */
+     "44",      /* 44 */
+     "brk",      /* 45 */
+-    "setgid",  /* 46 */
+-    "getgid",  /* 47 */
++    "setgid16", /* 46 */
++    "getgid16", /* 47 */
+     "signal",  /* 48 */
+-    "geteuid", /* 49 */
+-    "getegid", /* 50 */
++    "geteuid16",        /* 49 */
++    "getegid16",        /* 50 */
+     "acct",    /* 51 */
+     "umount",  /* 52 */
+     "53",      /* 53 */
+@@ -89,18 +89,18 @@
+     "sigaction",        /* 67 */
+     "68",      /* 68 */
+     "69",      /* 69 */
+-    "setreuid", /* 70 */
+-    "setregid", /* 71 */
++    "setreuid16",      /* 70 */
++    "setregid16",      /* 71 */
+     "sigsuspend",      /* 72 */
+     "sigpending",      /* 73 */
+     "sethostname",      /* 74 */
+     "setrlimit",        /* 75 */
+-    "getrlimit",    /* 76 */
++    "old_getrlimit",    /* 76 */
+     "getrusage",        /* 77 */
+     "gettimeofday",    /* 78 */
+     "settimeofday",    /* 79 */
+-    "getgroups",      /* 80 */
+-    "setgroups",      /* 81 */
++    "getgroups16",      /* 80 */
++    "setgroups16",      /* 81 */
+     "82",      /* 82 */
+     "symlink", /* 83 */
+     "84",      /* 84 */
+@@ -108,13 +108,13 @@
+     "uselib",  /* 86 */
+     "swapon",  /* 87 */
+     "reboot",  /* 88 */
+-    "readdir",      /* 89 */
+-    "mmap", /* 90 */
++    "89",      /* 89 */
++    "old_mmap", /* 90 */
+     "munmap",  /* 91 */
+     "truncate", /* 92 */
+     "ftruncate",        /* 93 */
+     "fchmod",  /* 94 */
+-    "fchown", /* 95 */
++    "fchown16", /* 95 */
+     "getpriority",      /* 96 */
+     "setpriority",      /* 97 */
+     "98",      /* 98 */
+@@ -157,11 +157,11 @@
+     "sysfs",    /* 135 */
+     "personality",      /* 136 */
+     "137",      /* 137 */
+-    "setfsuid", /* 138 */
+-    "setfsgid", /* 139 */
+-    "_llseek", /* 140 */
++    "setfsuid16",      /* 138 */
++    "setfsgid16",      /* 139 */
++    "llseek",  /* 140 */
+     "getdents", /* 141 */
+-    "_newselect", /* 142 */
++    "select",  /* 142 */
+     "flock",    /* 143 */
+     "msync",    /* 144 */
+     "readv",    /* 145 */
+@@ -183,14 +183,14 @@
+     "sched_rr_get_interval",    /* 161 */
+     "nanosleep",        /* 162 */
+     "mremap",  /* 163 */
+-    "setresuid",        /* 164 */
+-    "getresuid",        /* 165 */
++    "setresuid16",      /* 164 */
++    "getresuid16",      /* 165 */
+     "166",      /* 166 */
+     "167",      /* 167 */
+     "poll",    /* 168 */
+-    "169",      /* 169 */
+-    "setresgid",        /* 170 */
+-    "getresgid",        /* 171 */
++    "nfsservctl",      /* 169 */
++    "setresgid16",      /* 170 */
++    "getresgid16",      /* 171 */
+     "prctl",    /* 172 */
+     "rt_sigreturn",    /* 173 */
+     "rt_sigaction",    /* 174 */
+@@ -201,7 +201,7 @@
+     "rt_sigsuspend",    /* 179 */
+     "pread64", /* 180 */
+     "pwrite64", /* 181 */
+-    "chown", /* 182 */
++    "chown16", /* 182 */
+     "getcwd",  /* 183 */
+     "capget",  /* 184 */
+     "capset",  /* 185 */
+@@ -217,25 +217,25 @@
+     "stat64",  /* 195 */
+     "lstat64", /* 196 */
+     "fstat64", /* 197 */
+-    "lchown32", /* 198 */
+-    "getuid32", /* 199 */
+-    "getgid32",  /* 200 */
+-    "geteuid32", /* 201 */
+-    "getegid32", /* 202 */
+-    "setreuid32", /* 203 */
+-    "setregid32", /* 204 */
+-    "getgroups32",        /* 205 */
+-    "setgroups32",        /* 206 */
+-    "fchown32",  /* 207 */
+-    "setresuid32",        /* 208 */
+-    "getresuid32",        /* 209 */
+-    "setresgid32",        /* 210 */
+-    "getresgid32",        /* 211 */
+-    "chown32",    /* 212 */
+-    "setuid32",  /* 213 */
+-    "setgid32",  /* 214 */
+-    "setfsuid32", /* 215 */
+-    "setfsgid32", /* 216 */
++    "lchown",  /* 198 */
++    "getuid",  /* 199 */
++    "getgid",  /* 200 */
++    "geteuid", /* 201 */
++    "getegid", /* 202 */
++    "setreuid", /* 203 */
++    "setregid", /* 204 */
++    "getgroups",        /* 205 */
++    "setgroups",        /* 206 */
++    "fchown",  /* 207 */
++    "setresuid",        /* 208 */
++    "getresuid",        /* 209 */
++    "setresgid",        /* 210 */
++    "getresgid",        /* 211 */
++    "chown",    /* 212 */
++    "setuid",  /* 213 */
++    "setgid",  /* 214 */
++    "setfsuid", /* 215 */
++    "setfsgid", /* 216 */
+     "pivot_root",      /* 217 */
+     "mincore", /* 218 */
+     "madvise", /* 219 */
+@@ -287,9 +287,9 @@
+     "statfs64", /* 265 */
+     "fstatfs64",        /* 266 */
+     "remap_file_pages", /* 267 */
+-    "mbind",    /* 268 */
+-    "get_mempolicy",    /* 269 */
+-    "set_mempolicy",    /* 270 */
++    "268",      /* 268 */
++    "269",      /* 269 */
++    "270",      /* 270 */
+     "mq_open", /* 271 */
+     "mq_unlink",        /* 272 */
+     "mq_timedsend",    /* 273 */
+@@ -306,7 +306,7 @@
+     "inotify_init",    /* 284 */
+     "inotify_add_watch",        /* 285 */
+     "inotify_rm_watch", /* 286 */
+-    "migrate_pages",    /* 287 */
++    "287",      /* 287 */
+     "openat",  /* 288 */
+     "mkdirat", /* 289 */
+     "mknodat", /* 290 */
+@@ -329,67 +329,3 @@
+     "sync_file_range", /* 307 */
+     "tee",      /* 308 */
+     "vmsplice", /* 309 */
+-    "move_pages",      /* 310 */
+-    "getcpu",  /* 311 */
+-    "epoll_pwait",      /* 312 */
+-    "utimes",  /* 313 */
+-    "fallocate",        /* 314 */
+-    "utimensat",        /* 315 */
+-    "signalfd", /* 316 */
+-    "317",      /* 317 */
+-    "eventfd", /* 318 */
+-    "timerfd_create",  /* 319 */
+-    "timerfd_settime", /* 320 */
+-    "timerfd_gettime", /* 321 */
+-    "signalfd4",        /* 322 */
+-    "eventfd2", /* 323 */
+-    "inotify_init1",    /* 324 */
+-    "pipe2",    /* 325 */
+-    "dup3",    /* 326 */
+-    "epoll_create1",    /* 327 */
+-    "preadv",  /* 328 */
+-    "pwritev", /* 329 */
+-    "rt_tgsigqueueinfo",        /* 330 */
+-    "perf_event_open", /* 331 */
+-    "fanotify_init",    /* 332 */
+-    "fanotify_mark",    /* 333 */
+-    "prlimit64",        /* 334 */
+-    "name_to_handle_at",        /* 335 */
+-    "open_by_handle_at",        /* 336 */
+-    "clock_adjtime",    /* 337 */
+-    "syncfs",  /* 338 */
+-    "setns",    /* 339 */
+-    "process_vm_readv", /* 340 */
+-    "process_vm_writev",        /* 341 */
+-    "s390_runtime_instr",    /* 342 */
+-    "kcmp",    /* 343 */
+-    "finit_module",    /* 344 */
+-    "sched_setattr",    /* 345 */
+-    "sched_getattr",    /* 346 */
+-    "renameat2",        /* 347 */
+-    "seccomp", /* 348 */
+-    "getrandom",        /* 349 */
+-    "memfd_create",    /* 350 */
+-    "bpf",      /* 351 */
+-    "s390_pci_mmio_write",  /* 352 */
+-    "s390_pci_mmio_read",    /* 353 */
+-    "execveat", /* 354 */
+-    "userfaultfd",      /* 355 */
+-    "membarrier",      /* 356 */
+-    "recvmmsg", /* 357 */
+-    "sendmmsg", /* 358 */
+-    "socket",  /* 359 */
+-    "socketpair",      /* 360 */
+-    "bind",    /* 361 */
+-    "connect", /* 362 */
+-    "listen",  /* 363 */
+-    "accept4", /* 364 */
+-    "getsockopt",      /* 365 */
+-    "setsockopt",      /* 366 */
+-    "getsockname",      /* 367 */
+-    "getpeername",      /* 368 */
+-    "sendto",  /* 369 */
+-    "sendmsg", /* 370 */
+-    "recvfrom", /* 371 */
+-    "recvmsg", /* 372 */
+-    "shutdown", /* 373 */
+diff --git a/sysdeps/linux-gnu/s390/syscalls64.h b/sysdeps/linux-gnu/s390/=
syscalls64.h
+index 939b996..f2ec7f4 100644
+--- a/sysdeps/linux-gnu/s390/syscalls64.h
++++ b/sysdeps/linux-gnu/s390/syscalls64.h
+@@ -41,7 +41,7 @@
+     "lseek",    /* 19 */
+     "getpid",  /* 20 */
+     "mount",    /* 21 */
+-    "umount",        /* 22 */
++    "oldumount",        /* 22 */
+     "23",      /* 23 */
+     "24",      /* 24 */
+     "25",      /* 25 */
+@@ -109,7 +109,7 @@
+     "swapon",  /* 87 */
+     "reboot",  /* 88 */
+     "89",      /* 89 */
+-    "mmap", /* 90 */
++    "old_mmap", /* 90 */
+     "munmap",  /* 91 */
+     "truncate", /* 92 */
+     "ftruncate",        /* 93 */
+@@ -188,7 +188,7 @@
+     "166",      /* 166 */
+     "167",      /* 167 */
+     "poll",    /* 168 */
+-    "169",      /* 169 */
++    "nfsservctl",      /* 169 */
+     "170",      /* 170 */
+     "171",      /* 171 */
+     "prctl",    /* 172 */
+@@ -287,9 +287,9 @@
+     "statfs64", /* 265 */
+     "fstatfs64",        /* 266 */
+     "remap_file_pages", /* 267 */
+-    "mbind",    /* 268 */
+-    "get_mempolicy",    /* 269 */
+-    "set_mempolicy",    /* 270 */
++    "268",      /* 268 */
++    "269",      /* 269 */
++    "270",      /* 270 */
+     "mq_open", /* 271 */
+     "mq_unlink",        /* 272 */
+     "mq_timedsend",    /* 273 */
+@@ -306,7 +306,7 @@
+     "inotify_init",    /* 284 */
+     "inotify_add_watch",        /* 285 */
+     "inotify_rm_watch", /* 286 */
+-    "migrate_pages",    /* 287 */
++    "287",      /* 287 */
+     "openat",  /* 288 */
+     "mkdirat", /* 289 */
+     "mknodat", /* 290 */
+@@ -329,67 +329,3 @@
+     "sync_file_range", /* 307 */
+     "tee",      /* 308 */
+     "vmsplice", /* 309 */
+-    "move_pages",      /* 310 */
+-    "getcpu",  /* 311 */
+-    "epoll_pwait",      /* 312 */
+-    "utimes",  /* 313 */
+-    "fallocate",        /* 314 */
+-    "utimensat",        /* 315 */
+-    "signalfd", /* 316 */
+-    "317",      /* 317 */
+-    "eventfd", /* 318 */
+-    "timerfd_create",  /* 319 */
+-    "timerfd_settime", /* 320 */
+-    "timerfd_gettime", /* 321 */
+-    "signalfd4",        /* 322 */
+-    "eventfd2", /* 323 */
+-    "inotify_init1",    /* 324 */
+-    "pipe2",    /* 325 */
+-    "dup3",    /* 326 */
+-    "epoll_create1",    /* 327 */
+-    "preadv",  /* 328 */
+-    "pwritev", /* 329 */
+-    "rt_tgsigqueueinfo",        /* 330 */
+-    "perf_event_open", /* 331 */
+-    "fanotify_init",    /* 332 */
+-    "fanotify_mark",    /* 333 */
+-    "prlimit64",        /* 334 */
+-    "name_to_handle_at",        /* 335 */
+-    "open_by_handle_at",        /* 336 */
+-    "clock_adjtime",    /* 337 */
+-    "syncfs",  /* 338 */
+-    "setns",    /* 339 */
+-    "process_vm_readv", /* 340 */
+-    "process_vm_writev",        /* 341 */
+-    "s390_runtime_instr", /* 342 */
+-    "kcmp",    /* 343 */
+-    "finit_module",    /* 344 */
+-    "sched_setattr",    /* 345 */
+-    "sched_getattr",    /* 346 */
+-    "renameat2",        /* 347 */
+-    "seccomp", /* 348 */
+-    "getrandom",        /* 349 */
+-    "memfd_create",    /* 350 */
+-    "bpf",      /* 351 */
+-    "s390_pci_mmio_write", /* 352 */
+-    "s390_pci_mmio_read",  /* 353 */
+-    "execveat", /* 354 */
+-    "userfaultfd",      /* 355 */
+-    "membarrier",      /* 356 */
+-    "recvmmsg", /* 357 */
+-    "sendmmsg", /* 358 */
+-    "socket",  /* 359 */
+-    "socketpair",      /* 360 */
+-    "bind",    /* 361 */
+-    "connect", /* 362 */
+-    "listen",  /* 363 */
+-    "accept4", /* 364 */
+-    "getsockopt",      /* 365 */
+-    "setsockopt",      /* 366 */
+-    "getsockname",      /* 367 */
+-    "getpeername",      /* 368 */
+-    "sendto",  /* 369 */
+-    "sendmsg", /* 370 */
+-    "recvfrom", /* 371 */
+-    "recvmsg", /* 372 */
+-    "shutdown", /* 373 */
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipe=
s-devtools/ltrace/ltrace_git.bb
index abe015d..02ea964 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -10,12 +10,16 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a"

 PE =3D "1"
-PV =3D "7.91+git${SRCPV}"
-SRCREV =3D "c22d359433b333937ee3d803450dc41998115685"
+PV =3D "7.92"
+SRCREV =3D "ea8928dab8a0a1f549d0ed8ebc6ec563e9fa1159"
+
+SRC_URI[md5sum] =3D "f6375033b1963cf6835e808051e93477"
+SRC_URI[sha256sum] =3D "1861e358fa86b9ec12557d3c3f3e583e1ee01a0984453a8278=
065d877ac337bc"

 DEPENDS =3D "elfutils"
 RDEPENDS_${PN} =3D "elfutils"
-SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dmas=
ter \
+SRC_URI =3D "https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.x=
z;protocol=3Dhttps \
+           file://add-support-for-old-source-commit-SHA-c22d359433.patch \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
@@ -34,6 +38,15 @@ PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES'=
, 'selinux', d)}"
 PACKAGECONFIG[unwind] =3D "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinux,=
libselinux"

+do_unpack_extra () {
+    if [ -d "${WORKDIR}/ltrace.git" ]; then
+    git clone ${WORKDIR}/ltrace.git ${S}
+    rm -rf ${WORKDIR}/ltrace.git
+    fi
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
 do_configure_prepend () {
     ( cd ${S}; ./autogen.sh )
 }


This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

