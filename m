Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9621D7F2AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 16:00:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t16so41709693pfe.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=3rugEAjFHTYPRYxD+WP3tAogmb6zyRuodnu/aCw1G9A=;
	b=uv/Ml0lYIHRDDQCazbqoIDb6WCuRQ2TTVCShfWGTK9/AATBGhfaqzx6lJsUDDk//l1
	idRS0714ax53p5fgFRxwDhsPjomuM/fx1aXhCeISQzsR3OyTyOY/nE18XNr7wSGywQQF
	dCDhMemn8/naO4esjRf7LyOWbA+TdMJbhK4U7HXfy0F1yoWD08p2+mQlqKRh+ddHb4qI
	TxeTqZNBpCbI33C+49tcHtgAM2vElj8yy2BNhq59fB0OIaKm+kI3xhpxh3Jum8EwfZM/
	XofttoQU8Js0eE+IPN4tNCBCNJRFag8DJVC2IO6eM5FvXah4WFk9Ny3PHNCa1SnNPB6V
	3rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=3rugEAjFHTYPRYxD+WP3tAogmb6zyRuodnu/aCw1G9A=;
	b=feZzpmTz4QO1Ju477ooEPxHl9Y5rH5KkLLTO5TnazoumF42aEVXjGIf1WLLx8alB0g
	9RNy8vMv2DVxqzZBGPU1zHSF6Bi8qwR5cxVHtJSHTZTkjgcOQ7GGeQZ2LVuONFsmLWt9
	SYuBl1/TjV4Yv/lZIoErgVlY3SU82lDhATMaryesS6VhS4eaNjus6y10PHiH101n2Agj
	U405T2SZSKWyAVPyYoywvX6vDWfOKVfBymVs2B7fM157PBmmyIgTrMEKfiC0ebWCMCTm
	Z+B4iVwGs8t3J/7qc/HsOpj5W3MDCsq8lFZ22iT8Sa4cQfzDLhK4ykUCHrxN24scf1Yn
	LzOQ==
X-Gm-Message-State: APjAAAXZRQO7RwRuvfTsPItyvhhG5RBNxF+KNnWrTeFA1mtEarMDWFp/
	wyOcwrRru3ItW7oWLDaanL4FzBoyYvI=
X-Google-Smtp-Source: APXvYqz2QNyGzFw61ijeS7N3JzQQQIc8c13FRmUv6BJx/M1yKg6SOk01HPK1/uW2RLKNx/5YaXSpaQ==
X-Received: by 2002:a63:4522:: with SMTP id s34mr3649747pga.362.1565107208782; 
	Tue, 06 Aug 2019 09:00:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	b24sm16360953pgw.66.2019.08.06.09.00.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 09:00:08 -0700 (PDT)
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <1565083537-4935-1-git-send-email-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <b841e42c-ee19-2df3-e798-5083e5e925d7@gmail.com>
Date: Tue, 6 Aug 2019 09:00:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565083537-4935-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH] umip: add recipe
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
X-List-Received-Date: Tue, 06 Aug 2019 16:00:08 -0000
X-Groupsio-MsgNum: 78948
Content-Type: multipart/mixed; boundary="------------38F640A33F7A88E1211F9EA5"
Content-Language: en-US

--------------38F640A33F7A88E1211F9EA5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/6/19 2:25 AM, Yi Zhao wrote:
> The umip has been removed in commit
> bb4aa80bfbd67ddfafeaf7700aff993592387a21 because it depends on
> ipsec-tools. But in fact the ipsec-tools is not the build dependency or=

> essential runtime dependency for it.
> It is also supported by other ipsec tools. e.g strongswan
> (https://wiki.strongswan.org/projects/strongswan/wiki/MobileIPv6).
>
> Consider umip is the only implementation of Mobile IPv6 and NEMO Basic
> Support for Linux. So add the recipe back.


last commit to this package was in 2013, seems to tell me that this
package is long dead. Such packages are a huge maintainance cost when we
do major changes like toolchain bumps etc. I am not willing to
re-introduce it, since this all falls on me to keep fixing them

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...ependency-to-support-parallel-compilation.patch |  33 +++++
>  .../0002-Add-format-string-to-fprintf-call.patch   |  28 ++++
>  ...GCLD-with-SIGCHLD-and-include-sys-types.h.patch |  41 ++++++
>  ...READ_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 143 +++++++++++++=
++++++++
>  .../umip/umip/0005-support-openssl-1.1.x.patch     |  88 +++++++++++++=

>  .../recipes-connectivity/umip/umip/mip6d           | 112 +++++++++++++=
+++
>  .../recipes-connectivity/umip/umip/mip6d.service   |  10 ++
>  .../recipes-connectivity/umip/umip_1.0.bb          |  44 +++++++
>  8 files changed, 499 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/0001=
-add-dependency-to-support-parallel-compilation.patch
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/0002=
-Add-format-string-to-fprintf-call.patch
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/0003=
-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/0004=
-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/0005=
-support-openssl-1.1.x.patch
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/mip6=
d
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip/mip6=
d.service
>  create mode 100644 meta-networking/recipes-connectivity/umip/umip_1.0.=
bb
>
> diff --git a/meta-networking/recipes-connectivity/umip/umip/0001-add-de=
pendency-to-support-parallel-compilation.patch b/meta-networking/recipes-=
connectivity/umip/umip/0001-add-dependency-to-support-parallel-compilatio=
n.patch
> new file mode 100644
> index 0000000..05bc801
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/0001-add-dependenc=
y-to-support-parallel-compilation.patch
> @@ -0,0 +1,33 @@
> +From b7c799fda644876d3da3df54a158ecc30e1996ab Mon Sep 17 00:00:00 2001=

> +From: "Roy.Li" <RongQing.Li@windriver.com>
> +Date: Mon, 5 Aug 2019 15:25:38 +0800
> +Subject: [PATCH] add dependency to support parallel compilation
> +
> +When "make -j10", the compilation will fail,
> +because scan.c has included gram.h, but gram.h was produced
> +after scan.c was compiled
> +
> +So add this dependency to ensure that gram.h is produced
> +before scan.c is produced.
> +
> +Upstream-Status: Inappropriate [upstream is not active]
> +
> +Signed-off-by: Roy.Li <RongQing.Li@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + src/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index e49cb4f..746baf2 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -81,3 +81,5 @@ CLEANFILES =3D gram.c gram.h \
> +=20
> + DISTCLEANFILES =3D $(BUILT_SOURCES)
> + MAINTAINERCLEANFILES =3D Makefile.in
> ++
> ++scan.c: gram.h
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/umip/umip/0002-Add-fo=
rmat-string-to-fprintf-call.patch b/meta-networking/recipes-connectivity/=
umip/umip/0002-Add-format-string-to-fprintf-call.patch
> new file mode 100644
> index 0000000..2468471
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/0002-Add-format-st=
ring-to-fprintf-call.patch
> @@ -0,0 +1,28 @@
> +From 7dfd213707ab2208addb5c34f5cee3c227f79de2 Mon Sep 17 00:00:00 2001=

> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 27 Jun 2017 07:48:31 -0700
> +Subject: [PATCH] Add format string to fprintf() call
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/vt.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/vt.c b/src/vt.c
> +index 795d393..a533d3d 100644
> +--- a/src/vt.c
> ++++ b/src/vt.c
> +@@ -499,7 +499,7 @@ static int vt_cmd_dump_candidates(const struct vt_=
handle *vh,
> + 		}
> + 		llen +=3D cmdlen;
> +=20
> +-		ret =3D fprintf(vh->vh_stream, e->cmd);
> ++		ret =3D fprintf(vh->vh_stream, "%s", e->cmd);
> + 		if (ret < 0)
> + 			return ret;
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/umip/umip/0003-replac=
e-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-networking/rec=
ipes-connectivity/umip/umip/0003-replace-SIGCLD-with-SIGCHLD-and-include-=
sys-types.h.patch
> new file mode 100644
> index 0000000..9605e8c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/0003-replace-SIGCL=
D-with-SIGCHLD-and-include-sys-types.h.patch
> @@ -0,0 +1,41 @@
> +From ed33fc650456812454e331f98bf9fdc77245db1d Mon Sep 17 00:00:00 2001=

> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 4 Mar 2018 22:30:30 -0800
> +Subject: [PATCH] replace SIGCLD with SIGCHLD and include sys/types.h
> +
> +Fixes
> +main.c:129:10: error: 'SIGCLD' undeclared (first use in this function)=
; did you mean 'SIGCHLD'?
> +   signal(SIGCLD, sig_child);
> +          ^~~~~~
> +          SIGCHLD
> +
> +main.c:125:2: warning: implicit declaration of function 'umask' [-Wimp=
licit-function-declaration]
> +  umask(0);
> +  ^~~~~
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/main.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/main.c b/src/main.c
> +index 79db0ec..8b09603 100644
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -133,9 +133,9 @@ static void daemon_start(int ignsigcld)
> +=20
> + 	if (ignsigcld) {
> + #ifdef SIGTSTP
> +-		signal(SIGCLD, sig_child);
> ++		signal(SIGCHLD, sig_child);
> + #else
> +-		signal(SIGCLD, SIG_IGN);
> ++		signal(SIGCHLD, SIG_IGN);
> + #endif
> + 	}
> + }
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/umip/umip/0004-replac=
e-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-networking/re=
cipes-connectivity/umip/umip/0004-replace-PTHREAD_MUTEX_FAST_NP-with-PTHR=
EAD_MUTEX_NOR.patch
> new file mode 100644
> index 0000000..b0901c4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/0004-replace-PTHRE=
AD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> @@ -0,0 +1,143 @@
> +From 55d20b7ed07c05c8a8bc83eca70533f8c83c80fc Mon Sep 17 00:00:00 2001=

> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 4 Mar 2018 23:01:25 -0800
> +Subject: [PATCH] replace PTHREAD_MUTEX_FAST_NP with PTHREAD_MUTEX_NORM=
AL
> +
> +PTHREAD_MUTEX_FAST_NP is not available on non-posix systems
> +e.g. musl
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/ha.c        | 2 +-
> + src/icmp6.c     | 2 +-
> + src/mh.c        | 2 +-
> + src/mn.c        | 2 +-
> + src/movement.c  | 2 +-
> + src/mpdisc_ha.c | 2 +-
> + src/mpdisc_mn.c | 2 +-
> + src/tqueue.c    | 2 +-
> + src/tunnelctl.c | 2 +-
> + 9 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/ha.c b/src/ha.c
> +index 135ca8b..e6803e9 100644
> +--- a/src/ha.c
> ++++ b/src/ha.c
> +@@ -1262,7 +1262,7 @@ int ha_init(void)
> + {
> + 	pthread_mutexattr_t mattrs;
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&bu_worker_mutex, &mattrs) ||
> + 	    pthread_cond_init(&cond, NULL))
> + 		return -1;
> +diff --git a/src/icmp6.c b/src/icmp6.c
> +index 6da7234..02fc476 100644
> +--- a/src/icmp6.c
> ++++ b/src/icmp6.c
> +@@ -243,7 +243,7 @@ int icmp6_init(void)
> + 		return -1;
> + 	/* create ICMP listener thread */
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&icmp6_sock.send_mutex, &mattrs) ||
> + 	    pthread_rwlock_init(&handler_lock, NULL) ||
> + 	    pthread_create(&icmp6_listener, NULL, icmp6_listen, NULL))
> +diff --git a/src/mh.c b/src/mh.c
> +index 58185b3..cba9a33 100644
> +--- a/src/mh.c
> ++++ b/src/mh.c
> +@@ -204,7 +204,7 @@ int mh_init(void)
> + 		return -1;
> +=20
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&mh_sock.send_mutex, &mattrs) ||
> + 	    pthread_rwlock_init(&handler_lock, NULL) ||
> + 	    pthread_create(&mh_listener, NULL, mh_listen, NULL))
> +diff --git a/src/mn.c b/src/mn.c
> +index 27de7aa..747ac13 100644
> +--- a/src/mn.c
> ++++ b/src/mn.c
> +@@ -1568,7 +1568,7 @@ static struct home_addr_info *hai_copy(struct ho=
me_addr_info *conf_hai)
> + 	if (hai !=3D NULL) {
> + 		pthread_mutexattr_t mattrs;
> + 		pthread_mutexattr_init(&mattrs);
> +-		pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++		pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> +=20
> + 		memcpy(hai, conf_hai, sizeof(struct home_addr_info));
> +=20
> +diff --git a/src/movement.c b/src/movement.c
> +index 5ff1183..e215124 100644
> +--- a/src/movement.c
> ++++ b/src/movement.c
> +@@ -2019,7 +2019,7 @@ int md_init(void)
> + 	int val;
> +=20
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&iface_lock, &mattrs))
> + 		return -1;
> +=20
> +diff --git a/src/mpdisc_ha.c b/src/mpdisc_ha.c
> +index 5bb350e..cdc0f4b 100644
> +--- a/src/mpdisc_ha.c
> ++++ b/src/mpdisc_ha.c
> +@@ -572,7 +572,7 @@ int mpd_ha_init(void)
> + {
> + 	pthread_mutexattr_t mattrs;
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&mpa_lock, &mattrs) ||
> + 	    pthread_rwlock_init(&prefix_lock, NULL) ||
> + 	    hash_init(&mpa_hash, DOUBLE_ADDR, MPA_BUCKETS) < 0)
> +diff --git a/src/mpdisc_mn.c b/src/mpdisc_mn.c
> +index b6af8d2..ad34679 100644
> +--- a/src/mpdisc_mn.c
> ++++ b/src/mpdisc_mn.c
> +@@ -267,7 +267,7 @@ int mpd_mn_init(void)
> + {
> + 	pthread_mutexattr_t mattrs;
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&mps_lock, &mattrs))
> + 		return -1;
> + 	if (hash_init(&mps_hash, DOUBLE_ADDR, MPS_BUCKETS) < 0)
> +diff --git a/src/tqueue.c b/src/tqueue.c
> +index 2f7aa0b..9c185b8 100644
> +--- a/src/tqueue.c
> ++++ b/src/tqueue.c
> +@@ -65,7 +65,7 @@ int taskqueue_init(void)
> + {
> + 	pthread_mutexattr_t mattrs;
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&mutex, &mattrs) ||
> + 	    pthread_cond_init(&cond, NULL) ||
> + 	    pthread_create(&tq_runner, NULL, runner, NULL))
> +diff --git a/src/tunnelctl.c b/src/tunnelctl.c
> +index 23fc20b..813b8ec 100644
> +--- a/src/tunnelctl.c
> ++++ b/src/tunnelctl.c
> +@@ -433,7 +433,7 @@ int tunnelctl_init(void)
> + 		return -1;
> +=20
> + 	pthread_mutexattr_init(&mattrs);
> +-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
> ++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
> + 	if (pthread_mutex_init(&tnl_lock, &mattrs))
> + 		return -1;
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/umip/umip/0005-suppor=
t-openssl-1.1.x.patch b/meta-networking/recipes-connectivity/umip/umip/00=
05-support-openssl-1.1.x.patch
> new file mode 100644
> index 0000000..4d74d82
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/0005-support-opens=
sl-1.1.x.patch
> @@ -0,0 +1,88 @@
> +From 58adc9c226e3c8e9468201055d4d41f91fdd617a Mon Sep 17 00:00:00 2001=

> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 25 Sep 2018 14:38:14 +0800
> +Subject: [PATCH] support openssl 1.1.x
> +
> +Long time no maintain from upstream since 2013
> +(git://git.umip.org/umip/umip.git), backport a
> +fix from openSUSE
> +
> +Upstream-Status: Backport [openSUSE]
> +http://ftp.gwdg.de/pub/opensuse/source/distribution/leap/15.0/repo/oss=
/src/mipv6d-2.0.2.umip.0.4-lp150.1.2.src.rpm
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/keygen.c | 12 ++++++++++++
> + src/mh.c     | 17 ++++++++++++++++-
> + 2 files changed, 28 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/keygen.c b/src/keygen.c
> +index e434a38..b902644 100644
> +--- a/src/keygen.c
> ++++ b/src/keygen.c
> +@@ -172,6 +172,7 @@ static void build_kgen_token(struct in6_addr *addr=
, uint8_t *nonce,
> + 	uint8_t tmp[20];
> + #ifdef HAVE_LIBCRYPTO
> + 	unsigned int len =3D 20;
> ++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x101=
0006fL
> + 	HMAC_CTX ctx;
> +=20
> + 	HMAC_CTX_init(&ctx);
> +@@ -182,6 +183,17 @@ static void build_kgen_token(struct in6_addr *add=
r, uint8_t *nonce,
> + 	HMAC_Final(&ctx, tmp, &len);
> + 	HMAC_CTX_cleanup(&ctx);
> + #else
> ++	HMAC_CTX *ctx;
> ++	ctx =3D HMAC_CTX_new();
> ++	HMAC_Init_ex(ctx, key_cn, sizeof(key_cn), EVP_sha1(), NULL);
> ++	HMAC_Update(ctx, (unsigned char *)addr, sizeof(*addr));
> ++	HMAC_Update(ctx, nonce, NONCE_LENGTH);
> ++	HMAC_Update(ctx, &id, sizeof(id));
> ++	HMAC_Final(ctx, tmp, &len);
> ++	HMAC_CTX_free(ctx);
> ++#endif // End of defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_N=
UMBER < 0x1010006fL
> ++
> ++#else
> + 	HMAC_SHA1_CTX ctx;
> +=20
> + 	HMAC_SHA1_init(&ctx, key_cn, sizeof(key_cn));
> +diff --git a/src/mh.c b/src/mh.c
> +index cba9a33..212eb5a 100644
> +--- a/src/mh.c
> ++++ b/src/mh.c
> +@@ -518,9 +518,10 @@ static int calculate_auth_data(const struct iovec=
 *iov, int iovlen,
> +=20
> + #ifdef HAVE_LIBCRYPTO
> + 	unsigned int len =3D HMAC_SHA1_HASH_LEN;
> +-	HMAC_CTX ctx;
> + 	const EVP_MD *evp_md =3D EVP_sha1();
> +=20
> ++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x101=
0006fL
> ++	HMAC_CTX ctx;
> + 	HMAC_CTX_init(&ctx);
> + 	HMAC_Init_ex(&ctx, key, HMAC_SHA1_KEY_SIZE, evp_md, NULL);
> +=20
> +@@ -532,6 +533,20 @@ static int calculate_auth_data(const struct iovec=
 *iov, int iovlen,
> + 	HMAC_Final(&ctx, buf, &len);
> + 	HMAC_CTX_cleanup(&ctx);
> + #else
> ++	HMAC_CTX *ctx;
> ++	ctx =3D HMAC_CTX_new();
> ++	HMAC_Init_ex(ctx, key, HMAC_SHA1_KEY_SIZE, evp_md, NULL);
> ++
> ++	HMAC_Update(ctx, (uint8_t *)coa, sizeof(*coa));
> ++	HMAC_Update(ctx, (uint8_t *)cn, sizeof(*coa));
> ++	for (i =3D 0; i < iovlen; i++) {
> ++		HMAC_Update(ctx, (uint8_t *)iov[i].iov_base, iov[i].iov_len);
> ++	}
> ++	HMAC_Final(ctx, buf, &len);
> ++	HMAC_CTX_free(ctx);
> ++#endif
> ++
> ++#else
> + 	HMAC_SHA1_CTX ctx;
> +=20
> + 	HMAC_SHA1_init(&ctx, key, HMAC_SHA1_KEY_SIZE);
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/umip/umip/mip6d b/met=
a-networking/recipes-connectivity/umip/umip/mip6d
> new file mode 100644
> index 0000000..ebd70a6
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/mip6d
> @@ -0,0 +1,112 @@
> +#!/bin/sh
> +#
> +# mip6d		Start script for the Mobile IPv6 daemon
> +#
> +# chkconfig:	- 55 25
> +# description:	The mobile IPv6 daemon allows nodes to remain \
> +#		reachable while moving around in the IPv6 Internet.
> +# processname:	mip6d
> +# config:	/etc/mip6d.conf
> +# config:	/etc/sysconfig/mip6d
> +#
> +### BEGIN INIT INFO
> +# Provides: mipv6-daemon
> +# Required-Start: $local_fs $remote_fs $network $named
> +# Required-Stop: $local_fs $remote_fs $network
> +# Should-Start: $syslog
> +# Should-Stop: $network $syslog
> +# Default-Start:
> +# Default-Stop: 0 1 6
> +# Short-Description: Start and stop Mobile IPV6 daemon
> +# Description:	The mobile IPv6 daemon allows nodes to remain
> +#		reachable while moving around in the IPv6 Internet.
> +### END INIT INFO
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +if [ -f /etc/sysconfig/mip6d ]; then
> +	. /etc/sysconfig/mip6d
> +fi
> +
> +mip6d=3D/usr/sbin/mip6d
> +prog=3D"mip6d"
> +lockfile=3D/var/lock/subsys/$prog
> +
> +start() {
> +	[ -x $mip6d ] || exit 5
> +	echo -n $"Starting $prog: "
> +	start-stop-daemon -S -x ${mip6d} && success || failure
> +	retval=3D$?
> +	echo
> +	[ $retval -eq 0 ] && touch ${lockfile}
> +	return $retval
> +}
> +
> +stop() {
> +	echo -n $"Stopping $prog: "
> +	start-stop-daemon -K -x $mip6d
> +	retval=3D$?
> +	echo
> +	[ $retval -eq 0 ] && rm -f ${lockfile}
> +	return $retval
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +reload()
> +{
> +	echo -n $"Reloading $prog configuration: "
> +	killproc $mip6d -HUP
> +	retval=3D$?
> +	echo
> +	return $retval
> +}
> +
> +force_reload() {
> +	restart
> +}
> +
> +rh_status() {
> +	status $prog
> +}
> +
> +rh_status_q() {
> +	rh_status > /dev/null 2>&1
> +}
> +
> +case "$1" in
> +  start)
> +	rh_status_q && exit 0
> +	$1
> +	;;
> +  stop)
> +	rh_status_q || exit 0
> +	$1
> +	;;
> +  restart)
> +	$1
> +	;;
> +  reload)
> +	rh_status_q || exit 7
> +	$1
> +	;;
> +  force-reload)
> +	force_reload
> +	;;
> +  status)
> +	rh_status
> +	;;
> +  condrestart|try-restart)
> +	rh_status_q || exit 0
> +	restart
> +	;;
> +  *)
> +	echo $"Usage: $prog {start|stop|status|restart|condrestart|try-restar=
t|reload|force-reload}"
> +	exit 2
> +esac
> +
> +exit $?
> diff --git a/meta-networking/recipes-connectivity/umip/umip/mip6d.servi=
ce b/meta-networking/recipes-connectivity/umip/umip/mip6d.service
> new file mode 100644
> index 0000000..2b5a5b9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip/mip6d.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DMIPL Mobile IPv6
> +After=3Dnetwork.target
> +
> +[Service]
> +EnvironmentFile=3D-@SYSCONFDIR@/sysconfig/mip6d
> +ExecStart=3D@SBINDIR@/mip6d $ARGS
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-connectivity/umip/umip_1.0.bb b/me=
ta-networking/recipes-connectivity/umip/umip_1.0.bb
> new file mode 100644
> index 0000000..dfb6582
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "Mobile IPv6 and NEMO for Linux"
> +DESCRIPTION =3D "UMIP is an open source implementation of Mobile IPv6 =
and NEMO \
> +Basic Support for Linux. It is released under the GPLv2 license. It su=
pports \
> +the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776=
 and \
> +RFC4877 (IPsec and IKEv2)."
> +HOMEPAGE =3D "http://umip.org/"
> +SECTION =3D "System Environment/Base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D073dc31ccb2ebed70db54f1e8ae=
b4c33"
> +
> +DEPENDS =3D "openssl indent-native bison-native"
> +
> +SRC_URI =3D "git://git.umip.org/umip/umip.git \
> +           file://0001-add-dependency-to-support-parallel-compilation.=
patch \
> +           file://0002-Add-format-string-to-fprintf-call.patch \
> +           file://0003-replace-SIGCLD-with-SIGCHLD-and-include-sys-typ=
es.h.patch \
> +           file://0004-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTE=
X_NOR.patch \
> +           file://0005-support-openssl-1.1.x.patch \
> +           file://mip6d \
> +           file://mip6d.service \
> +           "
> +SRCREV =3D "cbd441c5db719db554ff2b4fcb02fef88ae2f791"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF =3D "--enable-vt"
> +
> +inherit autotools-brokensep systemd update-rc.d
> +
> +INITSCRIPT_NAME =3D "mip6d"
> +INITSCRIPT_PARAMS =3D "start 64 . stop 36 0 1 2 3 4 5 6 ."
> +
> +SYSTEMD_SERVICE_${PN} =3D "mip6d.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install_append() {
> +    install -D -m 0755 ${WORKDIR}/mip6d ${D}${sysconfdir}/init.d/mip6d=

> +    install -D -m 0644 ${WORKDIR}/mip6d.service ${D}${systemd_system_u=
nitdir}/mip6d.service
> +    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +        -e 's,@SBINDIR@,${sbindir},g' \
> +        ${D}${systemd_system_unitdir}/mip6d.service
> +}
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-mip6 kernel-module-ipv6"

--------------38F640A33F7A88E1211F9EA5
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------38F640A33F7A88E1211F9EA5--
