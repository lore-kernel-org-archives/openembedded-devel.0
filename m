Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1FAF874FE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:40:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a13-v6so11567032pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=LDpMC1Hkjwxib3ZiW0N53gO3a3SyBNCmbjG/G1ypZW0=;
	b=KxNZUSaOOiL8N+wt2khvcXosMOOipfRL4lfCRhtYm03vbUWSkoNtIO/XtSEYfr+8cM
	ZrgPsdXtVPFvLb2dsF6HWM8iijtDBDrY5RGT71eE3mbMOnpQ0g3xfRJSY/2iutZKE10A
	AqHA7V279IFg2tgzmHyL2PQ8sQ9+E96H9E0tInYu4stzry7Dz1VSwROHmuEuPjTj39/T
	4JWfXPBvf2dOptN3YV17nK4+QQ5hLG0d0STiNqejQA2h6KJXBqZ4zgUxXovTVNjeMeYo
	Pwl8EHDMZsWyO+gawz2oI+GZXlwgZJjlKUWUdPoydir98aF4Vn6JSSLdCeM7eNryFgf/
	PW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=LDpMC1Hkjwxib3ZiW0N53gO3a3SyBNCmbjG/G1ypZW0=;
	b=LVyoAlJk8FCWC8ZzSoi9CyOEtjbpa6/343RlDaBMABO4btgrojkMvUrqoqkucvTrtJ
	x02uQ3o3yDH8TJteR4/smi3EvTSoElvJax2d+/WBswPSxELHpIhYUkHu3esdlrsYYIIJ
	pAggbugLh20oR29AOvqb3Aa3E6BFZZBJTGpjbHTZKaHTZX0s1Iau2TfBKAaubR4UtYF5
	72oEEPyTz9pvWJNbS9e+q31KnHOaX9v+d+BmOgdOi59o+wi8k1Hgaj8+zlOeGixEQUqt
	zg3nL0R6CHmeVHDLgHgxbZV+zdo40c+ifuttPtJUwNs7ejSHVqZMIfcxXUnpEB86NWji
	/hTA==
X-Gm-Message-State: ALKqPweMEQBL9g2L4T5dKlUo8O0MWcvvjxxRXQkWbfdsg5uEHwpuYi6K
	zvCCEgeE3/Xz8HxLevkSRTM93hd8
X-Google-Smtp-Source: ADUXVKLo/kyDgGXGp/oGQr9HyDGowMeshqb2c7QVhgIm+sPLyTcbMz6OBUoZgIQULnb2TuxDW/4giQ==
X-Received: by 2002:a65:41c6:: with SMTP id
	b6-v6mr9683238pgq.372.1527874819649; 
	Fri, 01 Jun 2018 10:40:19 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	b74-v6sm40938513pfl.138.2018.06.01.10.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 10:40:18 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>,
	openembedded-devel@lists.openembedded.org
References: <20180601114158.24298-1-richard.leitner@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
	Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
	4evWolFf5cMmp87DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Message-ID: <ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
Date: Fri, 1 Jun 2018 10:40:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180601114158.24298-1-richard.leitner@skidata.com>
Cc: dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] pam-plugin-ccreds: add recipe
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
X-List-Received-Date: Fri, 01 Jun 2018 17:40:19 -0000
X-Groupsio-MsgNum: 72568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="4m5BmLeh5iefhURpOCZcjC5EZfKe8g45Z"

--4m5BmLeh5iefhURpOCZcjC5EZfKe8g45Z
Content-Type: multipart/mixed; boundary="N0oXVTn2C3bK5b2ycTYI26NJKCrwQcHQ3";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>,
 openembedded-devel@lists.openembedded.org
Cc: dev@g0hl1n.net
Message-ID: <ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pam-plugin-ccreds: add recipe
References: <20180601114158.24298-1-richard.leitner@skidata.com>
In-Reply-To: <20180601114158.24298-1-richard.leitner@skidata.com>

--N0oXVTn2C3bK5b2ycTYI26NJKCrwQcHQ3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/1/18 4:41 AM, Richard Leitner wrote:
> Add version 11 of the pam-plugin-ccreds with the debian patches applied=
=2E
>=20

I see QA errors like below

ERROR: pam-plugin-ccreds-11-r0 do_package_qa: QA Issue: non
-dev/-dbg/nativesdk- package contains symlink .so: pam-plugin-ccreds
path
'/work/core2-64-bec-linux-musl/pam-plugin-ccreds/11-r0/packages-split/pam=
-plugin-ccreds/lib/security/pam_ccreds.so'
[dev-so]


> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  ...ke-sure-we-don-t-overflow-the-data-buffer.patch | 29 +++++++
>  .../0002-add-minimum_uid-option.patch              | 97 ++++++++++++++=
++++++++
>  ...TENSION_SO-also-for-linux-gnueabi-targets.patch | 29 +++++++
>  .../recipes-extended/pam/pam-plugin-ccreds_11.bb   | 27 ++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001=
-make-sure-we-don-t-overflow-the-data-buffer.patch
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002=
-add-minimum_uid-option.patch
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003=
-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.b=
b
>=20
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-s=
ure-we-don-t-overflow-the-data-buffer.patch b/meta-oe/recipes-extended/pa=
m/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patc=
h
> new file mode 100644
> index 000000000..d7f8f5a96
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-=
don-t-overflow-the-data-buffer.patch
> @@ -0,0 +1,29 @@
> +From 59a95494002ce57ace17d676544101e88a55265d Mon Sep 17 00:00:00 2001=

> +From: Nicolas Boullis <nicolas.boullis@ecp.fr>
> +Date: Mon, 23 Mar 2009 10:46:44 +0100
> +Subject: [PATCH 1/3] make sure we don't overflow the data buffer
> +
> +This patch was taken from Debian's libpam-ccreds v10-6 source:
> +	0001-make-sure-we-don-t-overflow-the-data-buffer.patch
> +
> +Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + cc_db.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cc_db.c b/cc_db.c
> +index c0e0488..9371c4d 100644
> +--- a/cc_db.c
> ++++ b/cc_db.c
> +@@ -199,7 +199,7 @@ int pam_cc_db_get(void *_db, const char *keyname, =
size_t keylength,
> + 		return (rc =3D=3D DB_NOTFOUND) ? PAM_AUTHINFO_UNAVAIL : PAM_SERVICE=
_ERR;
> + 	}
> +=20
> +-	if (val.size < *size) {
> ++	if (val.size > *size) {
> + 		return PAM_BUF_ERR;
> + 	}
> +=20
> +--=20
> +2.11.0
> +
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-mi=
nimum_uid-option.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0=
002-add-minimum_uid-option.patch
> new file mode 100644
> index 000000000..adc464924
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_u=
id-option.patch
> @@ -0,0 +1,97 @@
> +From 21e3ab24836c5087f3531d2d3270242cea857a79 Mon Sep 17 00:00:00 2001=

> +From: =3D?UTF-8?q?Guido=3D20G=3DC3=3DBCnther?=3D <agx@sigxcpu.org>
> +Date: Thu, 13 May 2010 12:36:26 +0200
> +Subject: [PATCH 2/3] add minimum_uid option
> +
> +Closes: #580037
> +
> +This patch was taken from Debian's libpam-ccreds v10-6 source:
> +	0002-add-minimum_uid-option.patch
> +
> +Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + cc_pam.c | 39 +++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 39 insertions(+)
> +
> +diff --git a/cc_pam.c b/cc_pam.c
> +index d096117..56776aa 100644
> +--- a/cc_pam.c
> ++++ b/cc_pam.c
> +@@ -20,6 +20,7 @@
> + #include <errno.h>
> + #include <limits.h>
> + #include <syslog.h>
> ++#include <pwd.h>
> +=20
> + #include "cc_private.h"
> +=20
> +@@ -45,6 +46,30 @@ PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh,=

> + 				int flags, int argc, const char **argv);
> + #endif
> +=20
> ++
> ++/*
> ++ * Given the PAM arguments and the user we're authenticating, see if =
we should
> ++ * ignore that user because they're root or have a low-numbered UID a=
nd we
> ++ * were configured to ignore such users.  Returns true if we should i=
gnore
> ++ * them, false otherwise.
> ++ */
> ++static int
> ++_pamcc_should_ignore(const char *username, int minimum_uid)
> ++{
> ++	struct passwd *pwd;
> ++
> ++	if (minimum_uid > 0) {
> ++		pwd =3D getpwnam(username);
> ++		if (pwd !=3D NULL && pwd->pw_uid < (unsigned long) minimum_uid) {
> ++			syslog(LOG_DEBUG, "ignoring low-UID user (%lu < %d)",
> ++				(unsigned long) pwd->pw_uid, minimum_uid);
> ++			return 1;
> ++		}
> ++	}
> ++	return 0;
> ++}
> ++
> ++
> + static int _pam_sm_interact(pam_handle_t *pamh,
> + 			    int flags,
> + 			    const char **authtok)
> +@@ -291,7 +316,9 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *p=
amh,
> + 	unsigned int sm_flags =3D 0, sm_action =3D 0;
> + 	const char *ccredsfile =3D NULL;
> + 	const char *action =3D NULL;
> ++	const char *name =3D NULL;
> + 	int (*selector)(pam_handle_t *, int, unsigned int, const char *);
> ++	int minimum_uid =3D 0;
> +=20
> + 	for (i =3D 0; i < argc; i++) {
> + 		if (strcmp(argv[i], "use_first_pass") =3D=3D 0)
> +@@ -300,6 +327,8 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *p=
amh,
> + 			sm_flags |=3D SM_FLAGS_TRY_FIRST_PASS;
> + 		else if (strcmp(argv[i], "service_specific") =3D=3D 0)
> + 			sm_flags |=3D SM_FLAGS_SERVICE_SPECIFIC;
> ++		else if (strncmp(argv[i], "minimum_uid=3D", sizeof("minimum_uid=3D"=
) - 1) =3D=3D 0)
> ++			minimum_uid =3D atoi(argv[i] + sizeof("minimum_uid=3D") - 1);
> + 		else if (strncmp(argv[i], "ccredsfile=3D", sizeof("ccredsfile=3D") =
- 1) =3D=3D 0)
> + 			ccredsfile =3D argv[i] + sizeof("ccredsfile=3D") - 1;
> + 		else if (strncmp(argv[i], "action=3D", sizeof("action=3D") - 1) =3D=
=3D 0)
> +@@ -321,6 +350,16 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *=
pamh,
> + 		syslog(LOG_ERR, "pam_ccreds: invalid action \"%s\"", action);
> + 	}
> +=20
> ++	rc =3D pam_get_user(pamh, &name, NULL);
> ++	if (rc !=3D PAM_SUCCESS || name =3D=3D NULL) {
> ++		if (rc =3D=3D PAM_CONV_AGAIN)
> ++			return PAM_INCOMPLETE;
> ++		else
> ++			return PAM_SERVICE_ERR;
> ++	}
> ++	if (_pamcc_should_ignore(name, minimum_uid))
> ++		return PAM_USER_UNKNOWN;
> ++
> + 	switch (sm_action) {
> + 	case SM_ACTION_VALIDATE_CCREDS:
> + 		selector =3D _pam_sm_validate_cached_credentials;
> +--=20
> +2.11.0
> +
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EX=
TENSION_SO-also-for-linux-gnueabi-targets.patch b/meta-oe/recipes-extende=
d/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targ=
ets.patch
> new file mode 100644
> index 000000000..4f203f1a3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION=
_SO-also-for-linux-gnueabi-targets.patch
> @@ -0,0 +1,29 @@
> +From 12d9bb59284bd01a9fcc3b9280698ffc23ef2ddc Mon Sep 17 00:00:00 2001=

> +From: Richard Leitner <richard.leitner@skidata.com>
> +Date: Fri, 1 Jun 2018 13:24:15 +0200
> +Subject: [PATCH 3/3] Set EXTENSION_SO also for linux-gnueabi targets
> +
> +As EXTENSION_SO gets already set for linux and linux-gnu targets we
> +should set it also for linux-gnueabi targets.
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + configure.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 0dbdf79..a434208 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -43,7 +43,7 @@ AC_SUBST(pam_ccreds_so_LD)
> + AC_SUBST(pam_ccreds_so_LDFLAGS)
> +=20
> + AM_CONDITIONAL(USE_NATIVE_LINKER, test -n "$pam_ccreds_so_LD")
> +-AM_CONDITIONAL(EXTENSION_SO, test "$target_os" =3D "linux" -o "$targe=
t_os" =3D "linux-gnu")
> ++AM_CONDITIONAL(EXTENSION_SO, test "$target_os" =3D "linux" -o "$targe=
t_os" =3D "linux-gnu" -o "$target_os" =3D "linux-gnueabi")
> + AM_CONDITIONAL(EXTENSION_1, test "$TARGET_OS" =3D "HPUX")
> +=20
> + if test -z "$use_gcrypt"; then
> +--=20
> +2.11.0
> +
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/met=
a-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> new file mode 100644
> index 000000000..ded51e3a0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "PAM cached credentials module"
> +HOMEPAGE =3D "https://www.padl.com/OSS/pam_ccreds.html"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> +
> +DEPENDS =3D "libpam openssl db"
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES =3D "pam"
> +
> +SRCREV =3D "376bb189ceb3a113954f1012c45be7ff09e148ba"
> +
> +SRC_URI =3D " \
> +    git://github.com/PADL/pam_ccreds \
> +    file://0001-make-sure-we-don-t-overflow-the-data-buffer.patch \
> +    file://0002-add-minimum_uid-option.patch \
> +    file://0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch =
\
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--libdir=3D${base_libdir} "
> +
> +FILES_${PN} +=3D "${base_libdir}/security/pam*"
>=20



--N0oXVTn2C3bK5b2ycTYI26NJKCrwQcHQ3--

--4m5BmLeh5iefhURpOCZcjC5EZfKe8g45Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxGE/QAKCRC7BTNVkZ0z
FI/ZAJwLGNfRPwVV4zIwAIkRHussbZAk1wCfXF3KIeKk1p5UmCacyeq/xE/YEqw=
=+hhO
-----END PGP SIGNATURE-----

--4m5BmLeh5iefhURpOCZcjC5EZfKe8g45Z--
