Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC67E9DE68
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:26:33 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127413.1775723187248170209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2EBPCSYz;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so246714f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775723185; x=1776327985; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRXg/crj2eDQmJH+hQ0oW7uGJZv2ZgQBsgLftQB4QjY=;
        b=2EBPCSYzIhGYU3rvUlMC/DlJNVjDVCBazAUSx66PnYWqSwNq1cpg4bFVu1/gy/ScHb
         KyD6qj0ZLYAa1pA4XS9D8wF6sk0rztL5wJOLxi15Hu60h9fWtzGTJL2QHI4NNf5qerFU
         GLXdhRHV1xFzd1LJ1aDbKwo5t7EYaF8mGwIZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723185; x=1776327985;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRXg/crj2eDQmJH+hQ0oW7uGJZv2ZgQBsgLftQB4QjY=;
        b=CXBm3tjKYanIqVSxYwwejyavBowVB0CbjrdvYw/OuRTIRxjfm64nGo6J8iDydKgbqo
         ewoKhKSmJ4C2MbIuwTW2YQ/49WKzZ3pCnJW7py6+YAOZKWW9gm8XVf3+4sPYQZuXkg2t
         BmVu2A0ycYeT4OAZeD0rNcbHPm8a7J6myc+DAzQQTSiguyCdwIIZx6woiHYRo0CWlkGR
         Ktn7CHb6Gy2WyVvgP7gM5gTmCquChAab/8kS7orQ9aABsfW8w3bw0RXOgO2YsnX2CyYX
         MGgGn95ZuEzrFY0U+OJLvHebQRAEtA46tSFaBr9Wp/vpYoKZq8krtPDRaZo0LdbH4i20
         ZSkg==
X-Forwarded-Encrypted: i=1; AJvYcCXrjYSaVp86PV+cz96i8E8g4IqYGBevpq7VqZou5/+3SNWksvm46nCEjSB8/Xiqcu5Z8Ozi4xtHBPZLuNUeFEkBGGc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTnxYg27OS4FgiyrFnIQu+UwTFHoR12HqswGyK5eo2QqX7LyCG
	x0rCOiBc9LfPp0xsBUVEtcjouQluSvSPuGkk29udB2GEOZfGS5A8fkeseR5PTOZsK8o=
X-Gm-Gg: AeBDievUhQYzQggtP3ayuIyMareTLEJb7993Rb7m/GcpY+zs2fmv9ajPWj4Wd+8KhQ+
	oP+cf0aIDmGwlMyGw3Ju+qrbQGyqc49rhA4bx9GPFoFkiz+D31A+Achlf1teGY06QPP3jN5qFTf
	JGXYq4n88z8Uof3TAaURbcTAJf8hySORFC6KezfsJDHT2P2R2JW1N1I9E8Bx1XqbcqGNLd2WFGu
	0dqRPrCIbCJxOF84GJDe7SFq2Czeh6GMiaErRNReNTPPykktz6qrS42GtsniWTpswuLFowx6yyK
	aGxtZqVTdFfTetfdioupa6PGaUkH0TLgB+s9GkDkuISt5BxSLJXyNz3hw/93Nj+smoCIaEBQIFl
	vlcqXaKQljqGwYnaw7r71ONdxVdNs0TlVx9dmpRc4um0p24XwMKGrvQ/SYnjQ1A3hMvXlBir30a
	TofJkwLBxI2hDRewXi33uEdiKfLtq1mVFpU/Xl9La/qnnOYB4va9LfH9/fayVJm3KQUswlzvfMF
	k0ZtW/d1Z+8a2s=
X-Received: by 2002:a5d:457b:0:b0:43b:45c6:7ad with SMTP id ffacd0b85a97d-43d595e2424mr2504546f8f.29.1775723184967;
        Thu, 09 Apr 2026 01:26:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm62190657f8f.14.2026.04.09.01.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:26:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:26:24 +0200
Message-Id: <DHOHC169AXMN.LV8K4JK1C38N@smile.fr>
To: <deeratho@cisco.com>, <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 3/3] libssh: Fix CVE-2026-0965
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260406115535.1242965-1-deeratho@cisco.com>
 <CADySD0Hw0=QGHcd0Xfendesh8hiTfpxHb5T7boTSbXL5SSwUMw@mail.gmail.com>
 <829031.1775708722131603063@lists.openembedded.org>
In-Reply-To: <829031.1775708722131603063@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 08:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126145

On Thu Apr 9, 2026 at 6:25 AM CEST, Deepak Rathore via lists.openembedded.o=
rg wrote:
> Hi Ankur,
>
> Thank you for your review and response.
>
> As previously indicated by the maintainer in this thread ( openembedded-c=
ore@lists.openembedded.org | Inquiry Regarding Package Upgrade Approach vs.=
 Manual CVE Fixes in LTS Releases ( https://lists.openembedded.org/g/openem=
bedded-core/topic/118275693 ) ), package upgrades are not considered for st=
able and LTS branches for stability. Only bug fixes and security fixes are =
accepted. Accordingly, I have submitted CVE fix patches instead of performi=
ng a package upgrade.

Hello Deepak,

Just to clarify the above mail: upgrades are generally not acceptable as
they often mix feature additions and security fixes but there is an
exception for upstream projects that have a stable upgrade policy
compatible with ours (ie only security/bug fixes on stable).

It looks like libssh does have a stable policy compatible with ours: If
it were a oe-core recipe I would seriously consider the upgrade.

Regards,

>
> Regards,
> Deepak
>
> On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:
>
>>=20
>> I think we can upgrade to v0.11.4
>>=20
>> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.1=
1
>>=20
>> version 0.11.4 (released 2026-02-10)
>> * Security:
>> * CVE-2025-14821: libssh loads configuration files from the C:\etc
>> directory
>> on Windows
>> * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
>> * CVE-2026-0965: Possible Denial of Service when parsing unexpected
>> configuration files
>> * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
>> * CVE-2026-0967: Specially crafted patterns could cause DoS
>> * CVE-2026-0968: OOB Read in sftp_parse_longname()
>> * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
>> extensions
>> * Stability and compatibility improvements of ProxyJum
>>=20
>>=20
>>=20
>> On Mon, Apr 6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via
>> lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
>> wrote:
>>=20
>>>=20
>>> From: Deepak Rathore <deeratho@cisco.com>
>>>=20
>>> Pick the patch [1] as mentioned in [2]
>>>=20
>>> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a04262=
3e02abc8f421c4c5fadc0429a8a76
>>>=20
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>>>=20
>>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>>> ---
>>> .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>>> .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>>> 2 files changed, 287 insertions(+)
>>> create mode 100644
>>> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>>=20
>>> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> new file mode 100644
>>> index 0000000000..57cb9d6170
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> @@ -0,0 +1,286 @@
>>> +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
>>> +From: Jakub Jelen <jjelen@redhat.com>
>>> +Date: Thu, 11 Dec 2025 17:33:19 +0100
>>> +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read
>>> non-regular
>>> + and too large configuration files
>>> +
>>> +Changes also the reading of known_hosts to use the new helper function
>>> +
>>> +CVE: CVE-2026-0965
>>> +Upstream-Status: Backport [ https://git.libssh.org/projects/libssh.git=
/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76
>>> ]
>>> +
>>> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>>> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>>> +(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>>> +(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
>>> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>>> +---
>>> + include/libssh/misc.h | 3 ++
>>> + include/libssh/priv.h | 3 ++
>>> + src/bind_config.c | 4 +-
>>> + src/config.c | 8 ++--
>>> + src/dh-gex.c | 4 +-
>>> + src/known_hosts.c | 2 +-
>>> + src/knownhosts.c | 2 +-
>>> + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>>> + tests/unittests/torture_config.c | 20 +++++++++
>>> + 9 files changed, 110 insertions(+), 10 deletions(-)
>>> +
>>> +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>>> +index ab726a0e..8eab94ee 100644
>>> +--- a/include/libssh/misc.h
>>> ++++ b/include/libssh/misc.h
>>> +@@ -36,6 +36,7 @@
>>> + #include <sys/types.h>
>>> + #include <stdbool.h>
>>> + #endif /* _WIN32 */
>>> ++#include <stdio.h>
>>> +
>>> + #ifdef __cplusplus
>>> + extern "C" {
>>> +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username=
);
>>> + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>>> + bool ssh_libssh_proxy_jumps(void);
>>> +
>>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
>>> ++
>>> + #ifdef __cplusplus
>>> + }
>>> + #endif
>>> +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>>> +index 35fd8506..62069970 100644
>>> +--- a/include/libssh/priv.h
>>> ++++ b/include/libssh/priv.h
>>> +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t
>>> buflen);
>>> + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>>> + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>>> +
>>> ++/** The default maximum file size for a configuration file */
>>> ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>>> ++
>>> + #ifdef __cplusplus
>>> + }
>>> + #endif
>>> +diff --git a/src/bind_config.c b/src/bind_config.c
>>> +index 9e4a7fd4..c12f1003 100644
>>> +--- a/src/bind_config.c
>>> ++++ b/src/bind_config.c
>>> +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>>> + return;
>>> + }
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>>> + filename);
>>> +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, cons=
t
>>> char *filename)
>>> + * option to be redefined later by another file. */
>>> + uint8_t seen[BIND_CFG_MAX] =3D {0};
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> + return 0;
>>> + }
>>> +diff --git a/src/config.c b/src/config.c
>>> +index b4171efd..1ffad537 100644
>>> +--- a/src/config.c
>>> ++++ b/src/config.c
>>> +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>>> + return;
>>> + }
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>>> +- filename);
>>> ++ /* The underlying function logs the reasons */
>>> + return;
>>> + }
>>> +
>>> +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session,
>>> const char *filename)
>>> + int parsing, rv;
>>> + bool global =3D 0;
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> ++ /* The underlying function logs the reasons */
>>> + return 0;
>>> + }
>>> +
>>> +diff --git a/src/dh-gex.c b/src/dh-gex.c
>>> +index 46ba934e..428a5655 100644
>>> +--- a/src/dh-gex.c
>>> ++++ b/src/dh-gex.c
>>> +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
>>> + }
>>> +
>>> + if (moduli_file !=3D NULL)
>>> +- moduli =3D fopen(moduli_file, "r");
>>> ++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>>> + else
>>> +- moduli =3D fopen(MODULI_FILE, "r");
>>> ++ moduli =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>>> +
>>> + if (moduli =3D=3D NULL) {
>>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> +diff --git a/src/known_hosts.c b/src/known_hosts.c
>>> +index 3ef83e21..701576ce 100644
>>> +--- a/src/known_hosts.c
>>> ++++ b/src/known_hosts.c
>>> +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>>> *ssh_get_knownhost_line(FILE **file,
>>> + struct ssh_tokens_st *tokens =3D NULL;
>>> +
>>> + if (*file =3D=3D NULL) {
>>> +- *file =3D fopen(filename,"r");
>>> ++ *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (*file =3D=3D NULL) {
>>> + return NULL;
>>> + }
>>> +diff --git a/src/knownhosts.c b/src/knownhosts.c
>>> +index a2d08a75..3ab468de 100644
>>> +--- a/src/knownhosts.c
>>> ++++ b/src/knownhosts.c
>>> +@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char
>>> *match,
>>> + FILE *fp =3D NULL;
>>> + int rc;
>>> +
>>> +- fp =3D fopen(filename, "r");
>>> ++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (fp =3D=3D NULL) {
>>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s"=
,
>>> +diff --git a/src/misc.c b/src/misc.c
>>> +index 774211fb..3968e6bc 100644
>>> +--- a/src/misc.c
>>> ++++ b/src/misc.c
>>> +@@ -37,6 +37,7 @@
>>> + #endif /* _WIN32 */
>>> +
>>> + #include <errno.h>
>>> ++#include <fcntl.h>
>>> + #include <limits.h>
>>> + #include <stdio.h>
>>> + #include <string.h>
>>> +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>>> + return !(t !=3D NULL && t[0] =3D=3D '1');
>>> + }
>>> +
>>> ++/**
>>> ++ * @internal
>>> ++ *
>>> ++ * @brief Safely open a file containing some configuration.
>>> ++ *
>>> ++ * Runs checks if the file can be used as some configuration file (is
>>> regular
>>> ++ * file and is not too large). If so, returns the opened file (for
>>> reading).
>>> ++ * Otherwise logs error and returns `NULL`.
>>> ++ *
>>> ++ * @param filename The path to the file to open.
>>> ++ * @param max_file_size Maximum file size that is accepted.
>>> ++ *
>>> ++ * @returns the opened file or `NULL` on error.
>>> ++ */
>>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>>> ++{
>>> ++ FILE *f =3D NULL;
>>> ++ struct stat sb;
>>> ++ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> ++ int r, fd;
>>> ++
>>> ++ /* open first to avoid TOCTOU */
>>> ++ fd =3D open(filename, O_RDONLY);
>>> ++ if (fd =3D=3D -1) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to open a file %s for reading: %s",
>>> ++ filename,
>>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ /* Check the file is sensible for a configuration file */
>>> ++ r =3D fstat(fd, &sb);
>>> ++ if (r !=3D 0) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to stat %s: %s",
>>> ++ filename,
>>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++ if ((sb.st_mode & S_IFMT) !=3D S_IFREG) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "The file %s is not a regular file: skipping",
>>> ++ filename);
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ if ((size_t)sb.st_size > max_file_size) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>>> ++ filename,
>>> ++ (intmax_t)sb.st_size / 1024 / 1024,
>>> ++ max_file_size / 1024 / 1024);
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ f =3D fdopen(fd, "r");
>>> ++ if (f =3D=3D NULL) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to open a file %s for reading: %s",
>>> ++ filename,
>>> ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ /* the flcose() will close also the underlying fd */
>>> ++ return f;
>>> ++}
>>> ++
>>> + /** @} */
>>> +diff --git a/tests/unittests/torture_config.c
>>> b/tests/unittests/torture_config.c
>>> +index fcfe8fbc..0cb31a76 100644
>>> +--- a/tests/unittests/torture_config.c
>>> ++++ b/tests/unittests/torture_config.c
>>> +@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void
>>> **state)
>>> + ssh_string_free_char(v);
>>> + }
>>> +
>>> ++/* Invalid configuration files
>>> ++ */
>>> ++static void torture_config_invalid(void **state)
>>> ++{
>>> ++ ssh_session session =3D *state;
>>> ++
>>> ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>>> ++
>>> ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>>> ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>>> ++
>>> ++#ifndef _WIN32
>>> ++ /* huge file -- ignored (or missing on non-unix) so OK */
>>> ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>>> ++#endif
>>> ++}
>>> ++
>>> + int torture_run_tests(void)
>>> + {
>>> + int rc;
>>> +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>>> + setup, teardown),
>>> + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>>> + setup, teardown),
>>> ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>>> ++ setup,
>>> ++ teardown),
>>> + };
>>> +
>>> +
>>> +--
>>> +2.51.0
>>> +
>>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> index 193ff3512d..c552692bde 100644
>>> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> @@ -14,6 +14,7 @@ SRC_URI =3D
>>> "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
ble
>>> file://CVE-2026-0968_p1.patch \
>>> file://CVE-2026-0968_p2.patch \
>>> file://CVE-2026-0967.patch \
>>> + file://CVE-2026-0965.patch \
>>> "
>>>=20
>>> SRC_URI:append:toolchain-clang =3D "
>>> file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>>> --
>>> 2.35.6
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>=20
>
> On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:
>
>>=20
>> I think we can upgrade to v0.11.4
>>=20
>> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.1=
1
>>=20
>> version 0.11.4 (released 2026-02-10)
>> * Security:
>> * CVE-2025-14821: libssh loads configuration files from the C:\etc
>> directory
>> on Windows
>> * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
>> * CVE-2026-0965: Possible Denial of Service when parsing unexpected
>> configuration files
>> * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
>> * CVE-2026-0967: Specially crafted patterns could cause DoS
>> * CVE-2026-0968: OOB Read in sftp_parse_longname()
>> * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
>> extensions
>> * Stability and compatibility improvements of ProxyJum
>>=20
>>=20
>>=20
>> On Mon, Apr 6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via
>> lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
>> wrote:
>>=20
>>>=20
>>> From: Deepak Rathore <deeratho@cisco.com>
>>>=20
>>> Pick the patch [1] as mentioned in [2]
>>>=20
>>> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a04262=
3e02abc8f421c4c5fadc0429a8a76
>>>=20
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>>>=20
>>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>>> ---
>>> .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>>> .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>>> 2 files changed, 287 insertions(+)
>>> create mode 100644
>>> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>>=20
>>> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> new file mode 100644
>>> index 0000000000..57cb9d6170
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>> @@ -0,0 +1,286 @@
>>> +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
>>> +From: Jakub Jelen <jjelen@redhat.com>
>>> +Date: Thu, 11 Dec 2025 17:33:19 +0100
>>> +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read
>>> non-regular
>>> + and too large configuration files
>>> +
>>> +Changes also the reading of known_hosts to use the new helper function
>>> +
>>> +CVE: CVE-2026-0965
>>> +Upstream-Status: Backport [ https://git.libssh.org/projects/libssh.git=
/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76
>>> ]
>>> +
>>> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>>> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>>> +(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>>> +(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
>>> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>>> +---
>>> + include/libssh/misc.h | 3 ++
>>> + include/libssh/priv.h | 3 ++
>>> + src/bind_config.c | 4 +-
>>> + src/config.c | 8 ++--
>>> + src/dh-gex.c | 4 +-
>>> + src/known_hosts.c | 2 +-
>>> + src/knownhosts.c | 2 +-
>>> + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>>> + tests/unittests/torture_config.c | 20 +++++++++
>>> + 9 files changed, 110 insertions(+), 10 deletions(-)
>>> +
>>> +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>>> +index ab726a0e..8eab94ee 100644
>>> +--- a/include/libssh/misc.h
>>> ++++ b/include/libssh/misc.h
>>> +@@ -36,6 +36,7 @@
>>> + #include <sys/types.h>
>>> + #include <stdbool.h>
>>> + #endif /* _WIN32 */
>>> ++#include <stdio.h>
>>> +
>>> + #ifdef __cplusplus
>>> + extern "C" {
>>> +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username=
);
>>> + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>>> + bool ssh_libssh_proxy_jumps(void);
>>> +
>>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
>>> ++
>>> + #ifdef __cplusplus
>>> + }
>>> + #endif
>>> +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>>> +index 35fd8506..62069970 100644
>>> +--- a/include/libssh/priv.h
>>> ++++ b/include/libssh/priv.h
>>> +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t
>>> buflen);
>>> + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>>> + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>>> +
>>> ++/** The default maximum file size for a configuration file */
>>> ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>>> ++
>>> + #ifdef __cplusplus
>>> + }
>>> + #endif
>>> +diff --git a/src/bind_config.c b/src/bind_config.c
>>> +index 9e4a7fd4..c12f1003 100644
>>> +--- a/src/bind_config.c
>>> ++++ b/src/bind_config.c
>>> +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>>> + return;
>>> + }
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>>> + filename);
>>> +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, cons=
t
>>> char *filename)
>>> + * option to be redefined later by another file. */
>>> + uint8_t seen[BIND_CFG_MAX] =3D {0};
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> + return 0;
>>> + }
>>> +diff --git a/src/config.c b/src/config.c
>>> +index b4171efd..1ffad537 100644
>>> +--- a/src/config.c
>>> ++++ b/src/config.c
>>> +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>>> + return;
>>> + }
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>>> +- filename);
>>> ++ /* The underlying function logs the reasons */
>>> + return;
>>> + }
>>> +
>>> +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session,
>>> const char *filename)
>>> + int parsing, rv;
>>> + bool global =3D 0;
>>> +
>>> +- f =3D fopen(filename, "r");
>>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (f =3D=3D NULL) {
>>> ++ /* The underlying function logs the reasons */
>>> + return 0;
>>> + }
>>> +
>>> +diff --git a/src/dh-gex.c b/src/dh-gex.c
>>> +index 46ba934e..428a5655 100644
>>> +--- a/src/dh-gex.c
>>> ++++ b/src/dh-gex.c
>>> +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
>>> + }
>>> +
>>> + if (moduli_file !=3D NULL)
>>> +- moduli =3D fopen(moduli_file, "r");
>>> ++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>>> + else
>>> +- moduli =3D fopen(MODULI_FILE, "r");
>>> ++ moduli =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>>> +
>>> + if (moduli =3D=3D NULL) {
>>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> +diff --git a/src/known_hosts.c b/src/known_hosts.c
>>> +index 3ef83e21..701576ce 100644
>>> +--- a/src/known_hosts.c
>>> ++++ b/src/known_hosts.c
>>> +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>>> *ssh_get_knownhost_line(FILE **file,
>>> + struct ssh_tokens_st *tokens =3D NULL;
>>> +
>>> + if (*file =3D=3D NULL) {
>>> +- *file =3D fopen(filename,"r");
>>> ++ *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (*file =3D=3D NULL) {
>>> + return NULL;
>>> + }
>>> +diff --git a/src/knownhosts.c b/src/knownhosts.c
>>> +index a2d08a75..3ab468de 100644
>>> +--- a/src/knownhosts.c
>>> ++++ b/src/knownhosts.c
>>> +@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char
>>> *match,
>>> + FILE *fp =3D NULL;
>>> + int rc;
>>> +
>>> +- fp =3D fopen(filename, "r");
>>> ++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>>> + if (fp =3D=3D NULL) {
>>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s"=
,
>>> +diff --git a/src/misc.c b/src/misc.c
>>> +index 774211fb..3968e6bc 100644
>>> +--- a/src/misc.c
>>> ++++ b/src/misc.c
>>> +@@ -37,6 +37,7 @@
>>> + #endif /* _WIN32 */
>>> +
>>> + #include <errno.h>
>>> ++#include <fcntl.h>
>>> + #include <limits.h>
>>> + #include <stdio.h>
>>> + #include <string.h>
>>> +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>>> + return !(t !=3D NULL && t[0] =3D=3D '1');
>>> + }
>>> +
>>> ++/**
>>> ++ * @internal
>>> ++ *
>>> ++ * @brief Safely open a file containing some configuration.
>>> ++ *
>>> ++ * Runs checks if the file can be used as some configuration file (is
>>> regular
>>> ++ * file and is not too large). If so, returns the opened file (for
>>> reading).
>>> ++ * Otherwise logs error and returns `NULL`.
>>> ++ *
>>> ++ * @param filename The path to the file to open.
>>> ++ * @param max_file_size Maximum file size that is accepted.
>>> ++ *
>>> ++ * @returns the opened file or `NULL` on error.
>>> ++ */
>>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>>> ++{
>>> ++ FILE *f =3D NULL;
>>> ++ struct stat sb;
>>> ++ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>>> ++ int r, fd;
>>> ++
>>> ++ /* open first to avoid TOCTOU */
>>> ++ fd =3D open(filename, O_RDONLY);
>>> ++ if (fd =3D=3D -1) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to open a file %s for reading: %s",
>>> ++ filename,
>>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ /* Check the file is sensible for a configuration file */
>>> ++ r =3D fstat(fd, &sb);
>>> ++ if (r !=3D 0) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to stat %s: %s",
>>> ++ filename,
>>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++ if ((sb.st_mode & S_IFMT) !=3D S_IFREG) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "The file %s is not a regular file: skipping",
>>> ++ filename);
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ if ((size_t)sb.st_size > max_file_size) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>>> ++ filename,
>>> ++ (intmax_t)sb.st_size / 1024 / 1024,
>>> ++ max_file_size / 1024 / 1024);
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ f =3D fdopen(fd, "r");
>>> ++ if (f =3D=3D NULL) {
>>> ++ SSH_LOG(SSH_LOG_RARE,
>>> ++ "Failed to open a file %s for reading: %s",
>>> ++ filename,
>>> ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>>> ++ close(fd);
>>> ++ return NULL;
>>> ++ }
>>> ++
>>> ++ /* the flcose() will close also the underlying fd */
>>> ++ return f;
>>> ++}
>>> ++
>>> + /** @} */
>>> +diff --git a/tests/unittests/torture_config.c
>>> b/tests/unittests/torture_config.c
>>> +index fcfe8fbc..0cb31a76 100644
>>> +--- a/tests/unittests/torture_config.c
>>> ++++ b/tests/unittests/torture_config.c
>>> +@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void
>>> **state)
>>> + ssh_string_free_char(v);
>>> + }
>>> +
>>> ++/* Invalid configuration files
>>> ++ */
>>> ++static void torture_config_invalid(void **state)
>>> ++{
>>> ++ ssh_session session =3D *state;
>>> ++
>>> ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>>> ++
>>> ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>>> ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>>> ++
>>> ++#ifndef _WIN32
>>> ++ /* huge file -- ignored (or missing on non-unix) so OK */
>>> ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>>> ++#endif
>>> ++}
>>> ++
>>> + int torture_run_tests(void)
>>> + {
>>> + int rc;
>>> +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>>> + setup, teardown),
>>> + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>>> + setup, teardown),
>>> ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>>> ++ setup,
>>> ++ teardown),
>>> + };
>>> +
>>> +
>>> +--
>>> +2.51.0
>>> +
>>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> index 193ff3512d..c552692bde 100644
>>> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>>> @@ -14,6 +14,7 @@ SRC_URI =3D
>>> "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
ble
>>> file://CVE-2026-0968_p1.patch \
>>> file://CVE-2026-0968_p2.patch \
>>> file://CVE-2026-0967.patch \
>>> + file://CVE-2026-0965.patch \
>>> "
>>>=20
>>> SRC_URI:append:toolchain-clang =3D "
>>> file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>>> --
>>> 2.35.6
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>


--=20
Yoann Congal
Smile ECS


