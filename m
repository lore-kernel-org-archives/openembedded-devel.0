Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E7BFD5F79
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 05:19:21 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99676.1775625556965989053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 22:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MfnjXUAE;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbd08144deso2961167a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 22:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775625556; cv=none;
        d=google.com; s=arc-20240605;
        b=QyDXT6nYijBw9cfkb2lIBeGMFaazbIyE+ctuMZNtimJ5udlDtra4iyONBYIzV4zaQA
         Bw/yViY5VOlX9VqLxvpmtryv+3il97QRGYDAikvxtUzXbwdX/QBX10tUWTcuBWS6+Xat
         ItlL8fj5+GKPmXHr+ynL4zJezqIOb2CEGDRrkPjtOSyDVoauWHcPE7//HShDMIvYmhNX
         nk8U6la7F5lyOE2pBhIoJV+z70G0JXa+di3zPXc9rw4jjF4zP/HnM/HIqjkcbO42Dq6z
         /1XKJK2jIrkp+Y3im7BlkF8lQqPQ9LTOdDvF+sDlD2JAqyqInS5xnVVhKTLailhlyUbd
         Ndvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RKfNaRcg8T3+NBZKQN1360O30FUT9pXM0aN08gitAy8=;
        fh=pdeOg0eUEeSbuFfdgh6mXmfyvsNCruy81TzftImGxD4=;
        b=CCCsc31r7k951BJDuuTYKMtnvcADtJh4K0ER0oqVgrl2ae5Ki6fuYi8f/DxKgs2mj2
         9L8BLaH8/+dGk0uk/64vtCij6AW56pkXdcEWrku0eQNRkJLz6c8FD4BhiirHGuGNEmO8
         Hl7pBo7jLg8kcVjmUs3PfZp7550d3b7NrLO2w0vm1V59dWFdjDssxBf59AiSESBmJI1l
         q2CY4nI19gumILAvhtf2f2YAMYjry87/2ZsKe+FVB9zhotlSLdrnU6EBkI4BFLR8+xdt
         0n2qqYNcAyj0sEQQOugs+G2vd5AKj3S5YOlAq6LkoivCiLy5uZ3M1QvZRI/FUDqP6r+K
         ci4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775625556; x=1776230356; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKfNaRcg8T3+NBZKQN1360O30FUT9pXM0aN08gitAy8=;
        b=MfnjXUAEy5dr5NaXRpjgs0/03T9RaxnyQ5QyrDMj7FVElJZ+mqb8fFAM2twrRmgfPI
         zDmb8WDfS44T1sfQcWlWalTN9bH/jhmIT36onKI7oj8PmT6L4m+fJkki8uZJ3yLhY1Ge
         cagZK5AjvDhTVsEqArlzvNo7mCI4Sv98RE2cFM7hQc/zIf3QBPcflsL18OVjoxm4EmX5
         f1pIngzy52TiD+sf6WEzln5h7Y2Lm0e3COvdzxorPSib5KFkEiPlxYckv0USN3z8Dr4c
         0cgwqZapZG08ZLPW5B+AlN5tgI28wpCvZFWuJGvAcslfkwDfwEuWiQA4nLIj61dkEqHF
         aSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775625556; x=1776230356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RKfNaRcg8T3+NBZKQN1360O30FUT9pXM0aN08gitAy8=;
        b=hTumY4HBDInc4FcCvbi5gcbEjjyeOSsItCmndu1EX4LCIWP4NrnDbjP/z2YaNCHO3h
         yFIHMSoCXC1IafWdFupUozeuWsLEQAYflmqjdqCG17QJPwIMbaysN7ZlxbmVPBGMaLxf
         wsuSbQWD0FcdnWBgdciTwfijyLZYFx5DrI2K7qUi6FG1FYYhY2DwX1uKEEu7U+dBgB82
         MJDbEl5eyPfSrF3tJ6dppfZpR2C+L9HvOeMumASKX+jSpASfpsrTZAhuC/XCp/on1zaJ
         nX03AmKkqXQjqoNjuKQjTeIz4ompbRU6c0mOnzZZ/yH2osqv2UREAxpxRZElYh+1fexg
         E3Rw==
X-Gm-Message-State: AOJu0Yz6zoatkzT9IQxgfYI3YpY41OpNSbQvx38dUfGYC7vSTPYc8LGc
	yGhopAMP2AIsRJrMB3LaGQIBU5Pjnl5DeDD2QXNvpkjDGXK0P7I3cxxxxpsqiPeHWia7h4mLrhk
	G6a0tgTEWF+Hnj1dGb9OH5I+9NZ2PQAo=
X-Gm-Gg: AeBDieuMIUrRnKjJXasH0XO4kHUBLpHlZ9yplhV1hu+Fjl1D+Scva9QL3M+mV5LC4Rs
	8qYN9DtKDAZeGMPcruex4Nx3TzOAu0l/MOKWI9i16jpImuCFdLB5noswGIOgOKppbKW10q8fXPV
	scnyzccDRCBp8dqU5ndoCNUHH5PegesmUHs8GM6u7TbT2eFfZnXSCKb+bs8SRNlasscf47GNIqR
	GgHNmmLJ1bE7RLwErF1CMjXk6eBHkQzAi3wQcYCKkI58h2597t+FpWWAyjfVS2jlDu/xCGoTJ+b
	8nZEOqzt
X-Received: by 2002:a05:6820:f00f:b0:67e:3758:440f with SMTP id
 006d021491bc7-6821da707a9mr10771679eaf.20.1775625555923; Tue, 07 Apr 2026
 22:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260406115535.1242965-1-deeratho@cisco.com>
In-Reply-To: <20260406115535.1242965-1-deeratho@cisco.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 8 Apr 2026 17:19:03 +1200
X-Gm-Features: AQROBzCMtVyO-V6k4RQx9wjx-fNCYalwXSn3SUeq4IkHZUEsE9fyCwraJmy9tb0
Message-ID: <CADySD0Hw0=QGHcd0Xfendesh8hiTfpxHb5T7boTSbXL5SSwUMw@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 3/3] libssh: Fix CVE-2026-0965
To: deeratho@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 05:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126097

I think we can upgrade to v0.11.4

https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.11

version 0.11.4 (released 2026-02-10)
 * Security:
   * CVE-2025-14821: libssh loads configuration files from the C:\etc direc=
tory
     on Windows
   * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
   * CVE-2026-0965: Possible Denial of Service when parsing unexpected
     configuration files
   * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
   * CVE-2026-0967: Specially crafted patterns could cause DoS
   * CVE-2026-0968: OOB Read in sftp_parse_longname()
   * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
     extensions
 * Stability and compatibility improvements of ProxyJum



On Mon, Apr 6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via
lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
wrote:
>
> From: Deepak Rathore <deeratho@cisco.com>
>
> Pick the patch [1] as mentioned in [2]
>
> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623e=
02abc8f421c4c5fadc0429a8a76
> [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../libssh/libssh/CVE-2026-0965.patch         | 286 ++++++++++++++++++
>  .../recipes-support/libssh/libssh_0.11.3.bb   |   1 +
>  2 files changed, 287 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.p=
atch
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch b/=
meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
> new file mode 100644
> index 0000000000..57cb9d6170
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
> @@ -0,0 +1,286 @@
> +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 11 Dec 2025 17:33:19 +0100
> +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read non-re=
gular
> + and too large configuration files
> +
> +Changes also the reading of known_hosts to use the new helper function
> +
> +CVE: CVE-2026-0965
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/co=
mmit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76]
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> +(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
> +(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + include/libssh/misc.h            |  3 ++
> + include/libssh/priv.h            |  3 ++
> + src/bind_config.c                |  4 +-
> + src/config.c                     |  8 ++--
> + src/dh-gex.c                     |  4 +-
> + src/known_hosts.c                |  2 +-
> + src/knownhosts.c                 |  2 +-
> + src/misc.c                       | 74 ++++++++++++++++++++++++++++++++
> + tests/unittests/torture_config.c | 20 +++++++++
> + 9 files changed, 110 insertions(+), 10 deletions(-)
> +
> +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
> +index ab726a0e..8eab94ee 100644
> +--- a/include/libssh/misc.h
> ++++ b/include/libssh/misc.h
> +@@ -36,6 +36,7 @@
> + #include <sys/types.h>
> + #include <stdbool.h>
> + #endif /* _WIN32 */
> ++#include <stdio.h>
> +
> + #ifdef __cplusplus
> + extern "C" {
> +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username);
> + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
> + bool ssh_libssh_proxy_jumps(void);
> +
> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
> ++
> + #ifdef __cplusplus
> + }
> + #endif
> +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
> +index 35fd8506..62069970 100644
> +--- a/include/libssh/priv.h
> ++++ b/include/libssh/priv.h
> +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t bu=
flen);
> + #define SSH_TTY_MODES_MAX_BUFSIZE   (55 * 5 + 1)
> + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
> +
> ++/** The default maximum file size for a configuration file */
> ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
> ++
> + #ifdef __cplusplus
> + }
> + #endif
> +diff --git a/src/bind_config.c b/src/bind_config.c
> +index 9e4a7fd4..c12f1003 100644
> +--- a/src/bind_config.c
> ++++ b/src/bind_config.c
> +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
> +         return;
> +     }
> +
> +-    f =3D fopen(filename, "r");
> ++    f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +     if (f =3D=3D NULL) {
> +         SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
> +                 filename);
> +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, const =
char *filename)
> +      * option to be redefined later by another file. */
> +     uint8_t seen[BIND_CFG_MAX] =3D {0};
> +
> +-    f =3D fopen(filename, "r");
> ++    f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +     if (f =3D=3D NULL) {
> +         return 0;
> +     }
> +diff --git a/src/config.c b/src/config.c
> +index b4171efd..1ffad537 100644
> +--- a/src/config.c
> ++++ b/src/config.c
> +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
> +         return;
> +     }
> +
> +-    f =3D fopen(filename, "r");
> ++    f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +     if (f =3D=3D NULL) {
> +-        SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
> +-                filename);
> ++        /* The underlying function logs the reasons */
> +         return;
> +     }
> +
> +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session, con=
st char *filename)
> +     int parsing, rv;
> +     bool global =3D 0;
> +
> +-    f =3D fopen(filename, "r");
> ++    f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +     if (f =3D=3D NULL) {
> ++        /* The underlying function logs the reasons */
> +         return 0;
> +     }
> +
> +diff --git a/src/dh-gex.c b/src/dh-gex.c
> +index 46ba934e..428a5655 100644
> +--- a/src/dh-gex.c
> ++++ b/src/dh-gex.c
> +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
> +     }
> +
> +     if (moduli_file !=3D NULL)
> +-        moduli =3D fopen(moduli_file, "r");
> ++        moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SI=
ZE);
> +     else
> +-        moduli =3D fopen(MODULI_FILE, "r");
> ++        moduli =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SI=
ZE);
> +
> +     if (moduli =3D=3D NULL) {
> +         char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
> +diff --git a/src/known_hosts.c b/src/known_hosts.c
> +index 3ef83e21..701576ce 100644
> +--- a/src/known_hosts.c
> ++++ b/src/known_hosts.c
> +@@ -83,7 +83,7 @@ static struct ssh_tokens_st *ssh_get_knownhost_line(FI=
LE **file,
> +     struct ssh_tokens_st *tokens =3D NULL;
> +
> +     if (*file =3D=3D NULL) {
> +-        *file =3D fopen(filename,"r");
> ++        *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +         if (*file =3D=3D NULL) {
> +             return NULL;
> +         }
> +diff --git a/src/knownhosts.c b/src/knownhosts.c
> +index a2d08a75..3ab468de 100644
> +--- a/src/knownhosts.c
> ++++ b/src/knownhosts.c
> +@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char *=
match,
> +     FILE *fp =3D NULL;
> +     int rc;
> +
> +-    fp =3D fopen(filename, "r");
> ++    fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
> +     if (fp =3D=3D NULL) {
> +         char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
> +         SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s=
': %s",
> +diff --git a/src/misc.c b/src/misc.c
> +index 774211fb..3968e6bc 100644
> +--- a/src/misc.c
> ++++ b/src/misc.c
> +@@ -37,6 +37,7 @@
> + #endif /* _WIN32 */
> +
> + #include <errno.h>
> ++#include <fcntl.h>
> + #include <limits.h>
> + #include <stdio.h>
> + #include <string.h>
> +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
> +     return !(t !=3D NULL && t[0] =3D=3D '1');
> + }
> +
> ++/**
> ++ * @internal
> ++ *
> ++ * @brief Safely open a file containing some configuration.
> ++ *
> ++ * Runs checks if the file can be used as some configuration file (is r=
egular
> ++ * file and is not too large). If so, returns the opened file (for read=
ing).
> ++ * Otherwise logs error and returns `NULL`.
> ++ *
> ++ * @param filename      The path to the file to open.
> ++ * @param max_file_size Maximum file size that is accepted.
> ++ *
> ++ * @returns the opened file or `NULL` on error.
> ++ */
> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
> ++{
> ++    FILE *f =3D NULL;
> ++    struct stat sb;
> ++    char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
> ++    int r, fd;
> ++
> ++    /* open first to avoid TOCTOU */
> ++    fd =3D open(filename, O_RDONLY);
> ++    if (fd =3D=3D -1) {
> ++        SSH_LOG(SSH_LOG_RARE,
> ++                "Failed to open a file %s for reading: %s",
> ++                filename,
> ++                ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
> ++        return NULL;
> ++    }
> ++
> ++    /* Check the file is sensible for a configuration file */
> ++    r =3D fstat(fd, &sb);
> ++    if (r !=3D 0) {
> ++        SSH_LOG(SSH_LOG_RARE,
> ++                "Failed to stat %s: %s",
> ++                filename,
> ++                ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
> ++        close(fd);
> ++        return NULL;
> ++    }
> ++    if ((sb.st_mode & S_IFMT) !=3D S_IFREG) {
> ++        SSH_LOG(SSH_LOG_RARE,
> ++                "The file %s is not a regular file: skipping",
> ++                filename);
> ++        close(fd);
> ++        return NULL;
> ++    }
> ++
> ++    if ((size_t)sb.st_size > max_file_size) {
> ++        SSH_LOG(SSH_LOG_RARE,
> ++                "The file %s is too large (%jd MB > %zu MB): skipping",
> ++                filename,
> ++                (intmax_t)sb.st_size / 1024 / 1024,
> ++                max_file_size / 1024 / 1024);
> ++        close(fd);
> ++        return NULL;
> ++    }
> ++
> ++    f =3D fdopen(fd, "r");
> ++    if (f =3D=3D NULL) {
> ++        SSH_LOG(SSH_LOG_RARE,
> ++                "Failed to open a file %s for reading: %s",
> ++                filename,
> ++                ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
> ++        close(fd);
> ++        return NULL;
> ++    }
> ++
> ++    /* the flcose() will close also the underlying fd */
> ++    return f;
> ++}
> ++
> + /** @} */
> +diff --git a/tests/unittests/torture_config.c b/tests/unittests/torture_=
config.c
> +index fcfe8fbc..0cb31a76 100644
> +--- a/tests/unittests/torture_config.c
> ++++ b/tests/unittests/torture_config.c
> +@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void **s=
tate)
> +     ssh_string_free_char(v);
> + }
> +
> ++/* Invalid configuration files
> ++ */
> ++static void torture_config_invalid(void **state)
> ++{
> ++    ssh_session session =3D *state;
> ++
> ++    ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
> ++
> ++    /* non-regular file -- ignored (or missing on non-unix) so OK */
> ++    _parse_config(session, "/dev/random", NULL, SSH_OK);
> ++
> ++#ifndef _WIN32
> ++    /* huge file -- ignored (or missing on non-unix) so OK */
> ++    _parse_config(session, "/proc/kcore", NULL, SSH_OK);
> ++#endif
> ++}
> ++
> + int torture_run_tests(void)
> + {
> +     int rc;
> +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
> +                                         setup, teardown),
> +         cmocka_unit_test_setup_teardown(torture_config_match_complex,
> +                                         setup, teardown),
> ++        cmocka_unit_test_setup_teardown(torture_config_invalid,
> ++                                        setup,
> ++                                        teardown),
> +     };
> +
> +
> +--
> +2.51.0
> +
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.3.bb
> index 193ff3512d..c552692bde 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.libssh.org/projects/libssh.git;p=
rotocol=3Dhttps;branch=3Dstable
>             file://CVE-2026-0968_p1.patch \
>             file://CVE-2026-0968_p2.patch \
>             file://CVE-2026-0967.patch \
> +           file://CVE-2026-0965.patch \
>            "
>
>  SRC_URI:append:toolchain-clang =3D " file://0001-CompilerChecks.cmake-dr=
op-Wunused-variable-flag.patch"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126037): https://lists.openembedded.org/g/openembedde=
d-devel/message/126037
> Mute This Topic: https://lists.openembedded.org/mt/118688803/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

