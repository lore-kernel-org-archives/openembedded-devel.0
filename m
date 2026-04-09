Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B27E98FAC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 04:25:29 +0000 (UTC)
Subject: Re: [meta-oe][whinlatter][PATCH 3/3] libssh: Fix CVE-2026-0965
To: openembedded-devel@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 21:25:22 -0700
References: <20260406115535.1242965-1-deeratho@cisco.com> <CADySD0Hw0=QGHcd0Xfendesh8hiTfpxHb5T7boTSbXL5SSwUMw@mail.gmail.com>
In-Reply-To: <CADySD0Hw0=QGHcd0Xfendesh8hiTfpxHb5T7boTSbXL5SSwUMw@mail.gmail.com>
Message-ID: <829031.1775708722131603063@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JNqEUsod6vV0DnxfjZfZ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126110

--JNqEUsod6vV0DnxfjZfZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ankur,

Thank you for your review and response.

As previously indicated by the maintainer in this thread ( openembedded-cor=
e@lists.openembedded.org | Inquiry Regarding Package Upgrade Approach vs. M=
anual CVE Fixes in LTS Releases ( https://lists.openembedded.org/g/openembe=
dded-core/topic/118275693 ) ), package upgrades are not considered for stab=
le and LTS branches for stability. Only bug fixes and security fixes are ac=
cepted. Accordingly, I have submitted CVE fix patches instead of performing=
 a package upgrade.

Regards,
Deepak

On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:

>=20
> I think we can upgrade to v0.11.4
>=20
> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.11
>=20
> version 0.11.4 (released 2026-02-10)
> * Security:
> * CVE-2025-14821: libssh loads configuration files from the C:\etc
> directory
> on Windows
> * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
> * CVE-2026-0965: Possible Denial of Service when parsing unexpected
> configuration files
> * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
> * CVE-2026-0967: Specially crafted patterns could cause DoS
> * CVE-2026-0968: OOB Read in sftp_parse_longname()
> * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
> extensions
> * Stability and compatibility improvements of ProxyJum
>=20
>=20
>=20
> On Mon, Apr 6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via
> lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
> wrote:
>=20
>>=20
>> From: Deepak Rathore <deeratho@cisco.com>
>>=20
>> Pick the patch [1] as mentioned in [2]
>>=20
>> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623=
e02abc8f421c4c5fadc0429a8a76
>>=20
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>>=20
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>> .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>> .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>> 2 files changed, 287 insertions(+)
>> create mode 100644
>> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>=20
>> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> new file mode 100644
>> index 0000000000..57cb9d6170
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> @@ -0,0 +1,286 @@
>> +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
>> +From: Jakub Jelen <jjelen@redhat.com>
>> +Date: Thu, 11 Dec 2025 17:33:19 +0100
>> +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read
>> non-regular
>> + and too large configuration files
>> +
>> +Changes also the reading of known_hosts to use the new helper function
>> +
>> +CVE: CVE-2026-0965
>> +Upstream-Status: Backport [ https://git.libssh.org/projects/libssh.git/=
commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76
>> ]
>> +
>> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>> +(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>> +(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
>> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> +---
>> + include/libssh/misc.h | 3 ++
>> + include/libssh/priv.h | 3 ++
>> + src/bind_config.c | 4 +-
>> + src/config.c | 8 ++--
>> + src/dh-gex.c | 4 +-
>> + src/known_hosts.c | 2 +-
>> + src/knownhosts.c | 2 +-
>> + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>> + tests/unittests/torture_config.c | 20 +++++++++
>> + 9 files changed, 110 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>> +index ab726a0e..8eab94ee 100644
>> +--- a/include/libssh/misc.h
>> ++++ b/include/libssh/misc.h
>> +@@ -36,6 +36,7 @@
>> + #include <sys/types.h>
>> + #include <stdbool.h>
>> + #endif /* _WIN32 */
>> ++#include <stdio.h>
>> +
>> + #ifdef __cplusplus
>> + extern "C" {
>> +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username)=
;
>> + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>> + bool ssh_libssh_proxy_jumps(void);
>> +
>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
>> ++
>> + #ifdef __cplusplus
>> + }
>> + #endif
>> +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>> +index 35fd8506..62069970 100644
>> +--- a/include/libssh/priv.h
>> ++++ b/include/libssh/priv.h
>> +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t
>> buflen);
>> + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>> + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>> +
>> ++/** The default maximum file size for a configuration file */
>> ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>> ++
>> + #ifdef __cplusplus
>> + }
>> + #endif
>> +diff --git a/src/bind_config.c b/src/bind_config.c
>> +index 9e4a7fd4..c12f1003 100644
>> +--- a/src/bind_config.c
>> ++++ b/src/bind_config.c
>> +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>> + return;
>> + }
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>> + filename);
>> +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, const
>> char *filename)
>> + * option to be redefined later by another file. */
>> + uint8_t seen[BIND_CFG_MAX] =3D {0};
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> + return 0;
>> + }
>> +diff --git a/src/config.c b/src/config.c
>> +index b4171efd..1ffad537 100644
>> +--- a/src/config.c
>> ++++ b/src/config.c
>> +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>> + return;
>> + }
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>> +- filename);
>> ++ /* The underlying function logs the reasons */
>> + return;
>> + }
>> +
>> +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session,
>> const char *filename)
>> + int parsing, rv;
>> + bool global =3D 0;
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> ++ /* The underlying function logs the reasons */
>> + return 0;
>> + }
>> +
>> +diff --git a/src/dh-gex.c b/src/dh-gex.c
>> +index 46ba934e..428a5655 100644
>> +--- a/src/dh-gex.c
>> ++++ b/src/dh-gex.c
>> +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
>> + }
>> +
>> + if (moduli_file !=3D NULL)
>> +- moduli =3D fopen(moduli_file, "r");
>> ++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>> + else
>> +- moduli =3D fopen(MODULI_FILE, "r");
>> ++ moduli =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>> +
>> + if (moduli =3D=3D NULL) {
>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> +diff --git a/src/known_hosts.c b/src/known_hosts.c
>> +index 3ef83e21..701576ce 100644
>> +--- a/src/known_hosts.c
>> ++++ b/src/known_hosts.c
>> +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>> *ssh_get_knownhost_line(FILE **file,
>> + struct ssh_tokens_st *tokens =3D NULL;
>> +
>> + if (*file =3D=3D NULL) {
>> +- *file =3D fopen(filename,"r");
>> ++ *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (*file =3D=3D NULL) {
>> + return NULL;
>> + }
>> +diff --git a/src/knownhosts.c b/src/knownhosts.c
>> +index a2d08a75..3ab468de 100644
>> +--- a/src/knownhosts.c
>> ++++ b/src/knownhosts.c
>> +@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char
>> *match,
>> + FILE *fp =3D NULL;
>> + int rc;
>> +
>> +- fp =3D fopen(filename, "r");
>> ++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (fp =3D=3D NULL) {
>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s",
>> +diff --git a/src/misc.c b/src/misc.c
>> +index 774211fb..3968e6bc 100644
>> +--- a/src/misc.c
>> ++++ b/src/misc.c
>> +@@ -37,6 +37,7 @@
>> + #endif /* _WIN32 */
>> +
>> + #include <errno.h>
>> ++#include <fcntl.h>
>> + #include <limits.h>
>> + #include <stdio.h>
>> + #include <string.h>
>> +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>> + return !(t !=3D NULL && t[0] =3D=3D '1');
>> + }
>> +
>> ++/**
>> ++ * @internal
>> ++ *
>> ++ * @brief Safely open a file containing some configuration.
>> ++ *
>> ++ * Runs checks if the file can be used as some configuration file (is
>> regular
>> ++ * file and is not too large). If so, returns the opened file (for
>> reading).
>> ++ * Otherwise logs error and returns `NULL`.
>> ++ *
>> ++ * @param filename The path to the file to open.
>> ++ * @param max_file_size Maximum file size that is accepted.
>> ++ *
>> ++ * @returns the opened file or `NULL` on error.
>> ++ */
>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>> ++{
>> ++ FILE *f =3D NULL;
>> ++ struct stat sb;
>> ++ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> ++ int r, fd;
>> ++
>> ++ /* open first to avoid TOCTOU */
>> ++ fd =3D open(filename, O_RDONLY);
>> ++ if (fd =3D=3D -1) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to open a file %s for reading: %s",
>> ++ filename,
>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ return NULL;
>> ++ }
>> ++
>> ++ /* Check the file is sensible for a configuration file */
>> ++ r =3D fstat(fd, &sb);
>> ++ if (r !=3D 0) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to stat %s: %s",
>> ++ filename,
>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++ if ((sb.st_mode & S_IFMT) !=3D S_IFREG) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "The file %s is not a regular file: skipping",
>> ++ filename);
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ if ((size_t)sb.st_size > max_file_size) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>> ++ filename,
>> ++ (intmax_t)sb.st_size / 1024 / 1024,
>> ++ max_file_size / 1024 / 1024);
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ f =3D fdopen(fd, "r");
>> ++ if (f =3D=3D NULL) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to open a file %s for reading: %s",
>> ++ filename,
>> ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ /* the flcose() will close also the underlying fd */
>> ++ return f;
>> ++}
>> ++
>> + /** @} */
>> +diff --git a/tests/unittests/torture_config.c
>> b/tests/unittests/torture_config.c
>> +index fcfe8fbc..0cb31a76 100644
>> +--- a/tests/unittests/torture_config.c
>> ++++ b/tests/unittests/torture_config.c
>> +@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void
>> **state)
>> + ssh_string_free_char(v);
>> + }
>> +
>> ++/* Invalid configuration files
>> ++ */
>> ++static void torture_config_invalid(void **state)
>> ++{
>> ++ ssh_session session =3D *state;
>> ++
>> ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>> ++
>> ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>> ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>> ++
>> ++#ifndef _WIN32
>> ++ /* huge file -- ignored (or missing on non-unix) so OK */
>> ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>> ++#endif
>> ++}
>> ++
>> + int torture_run_tests(void)
>> + {
>> + int rc;
>> +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>> + setup, teardown),
>> + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>> + setup, teardown),
>> ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>> ++ setup,
>> ++ teardown),
>> + };
>> +
>> +
>> +--
>> +2.51.0
>> +
>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> index 193ff3512d..c552692bde 100644
>> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> @@ -14,6 +14,7 @@ SRC_URI =3D
>> "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstab=
le
>> file://CVE-2026-0968_p1.patch \
>> file://CVE-2026-0968_p2.patch \
>> file://CVE-2026-0967.patch \
>> + file://CVE-2026-0965.patch \
>> "
>>=20
>> SRC_URI:append:toolchain-clang =3D "
>> file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>> --
>> 2.35.6
>>=20
>>=20
>>=20
>>=20
>=20
>=20

On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:

>=20
> I think we can upgrade to v0.11.4
>=20
> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.11
>=20
> version 0.11.4 (released 2026-02-10)
> * Security:
> * CVE-2025-14821: libssh loads configuration files from the C:\etc
> directory
> on Windows
> * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
> * CVE-2026-0965: Possible Denial of Service when parsing unexpected
> configuration files
> * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
> * CVE-2026-0967: Specially crafted patterns could cause DoS
> * CVE-2026-0968: OOB Read in sftp_parse_longname()
> * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
> extensions
> * Stability and compatibility improvements of ProxyJum
>=20
>=20
>=20
> On Mon, Apr 6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via
> lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
> wrote:
>=20
>>=20
>> From: Deepak Rathore <deeratho@cisco.com>
>>=20
>> Pick the patch [1] as mentioned in [2]
>>=20
>> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623=
e02abc8f421c4c5fadc0429a8a76
>>=20
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>>=20
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>> .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>> .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>> 2 files changed, 287 insertions(+)
>> create mode 100644
>> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>>=20
>> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> new file mode 100644
>> index 0000000000..57cb9d6170
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>> @@ -0,0 +1,286 @@
>> +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
>> +From: Jakub Jelen <jjelen@redhat.com>
>> +Date: Thu, 11 Dec 2025 17:33:19 +0100
>> +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read
>> non-regular
>> + and too large configuration files
>> +
>> +Changes also the reading of known_hosts to use the new helper function
>> +
>> +CVE: CVE-2026-0965
>> +Upstream-Status: Backport [ https://git.libssh.org/projects/libssh.git/=
commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76
>> ]
>> +
>> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>> +(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>> +(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
>> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> +---
>> + include/libssh/misc.h | 3 ++
>> + include/libssh/priv.h | 3 ++
>> + src/bind_config.c | 4 +-
>> + src/config.c | 8 ++--
>> + src/dh-gex.c | 4 +-
>> + src/known_hosts.c | 2 +-
>> + src/knownhosts.c | 2 +-
>> + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>> + tests/unittests/torture_config.c | 20 +++++++++
>> + 9 files changed, 110 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>> +index ab726a0e..8eab94ee 100644
>> +--- a/include/libssh/misc.h
>> ++++ b/include/libssh/misc.h
>> +@@ -36,6 +36,7 @@
>> + #include <sys/types.h>
>> + #include <stdbool.h>
>> + #endif /* _WIN32 */
>> ++#include <stdio.h>
>> +
>> + #ifdef __cplusplus
>> + extern "C" {
>> +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username)=
;
>> + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>> + bool ssh_libssh_proxy_jumps(void);
>> +
>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
>> ++
>> + #ifdef __cplusplus
>> + }
>> + #endif
>> +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>> +index 35fd8506..62069970 100644
>> +--- a/include/libssh/priv.h
>> ++++ b/include/libssh/priv.h
>> +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t
>> buflen);
>> + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>> + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>> +
>> ++/** The default maximum file size for a configuration file */
>> ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>> ++
>> + #ifdef __cplusplus
>> + }
>> + #endif
>> +diff --git a/src/bind_config.c b/src/bind_config.c
>> +index 9e4a7fd4..c12f1003 100644
>> +--- a/src/bind_config.c
>> ++++ b/src/bind_config.c
>> +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>> + return;
>> + }
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>> + filename);
>> +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, const
>> char *filename)
>> + * option to be redefined later by another file. */
>> + uint8_t seen[BIND_CFG_MAX] =3D {0};
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> + return 0;
>> + }
>> +diff --git a/src/config.c b/src/config.c
>> +index b4171efd..1ffad537 100644
>> +--- a/src/config.c
>> ++++ b/src/config.c
>> +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>> + return;
>> + }
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>> +- filename);
>> ++ /* The underlying function logs the reasons */
>> + return;
>> + }
>> +
>> +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session,
>> const char *filename)
>> + int parsing, rv;
>> + bool global =3D 0;
>> +
>> +- f =3D fopen(filename, "r");
>> ++ f =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (f =3D=3D NULL) {
>> ++ /* The underlying function logs the reasons */
>> + return 0;
>> + }
>> +
>> +diff --git a/src/dh-gex.c b/src/dh-gex.c
>> +index 46ba934e..428a5655 100644
>> +--- a/src/dh-gex.c
>> ++++ b/src/dh-gex.c
>> +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
>> + }
>> +
>> + if (moduli_file !=3D NULL)
>> +- moduli =3D fopen(moduli_file, "r");
>> ++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>> + else
>> +- moduli =3D fopen(MODULI_FILE, "r");
>> ++ moduli =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>> +
>> + if (moduli =3D=3D NULL) {
>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> +diff --git a/src/known_hosts.c b/src/known_hosts.c
>> +index 3ef83e21..701576ce 100644
>> +--- a/src/known_hosts.c
>> ++++ b/src/known_hosts.c
>> +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>> *ssh_get_knownhost_line(FILE **file,
>> + struct ssh_tokens_st *tokens =3D NULL;
>> +
>> + if (*file =3D=3D NULL) {
>> +- *file =3D fopen(filename,"r");
>> ++ *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (*file =3D=3D NULL) {
>> + return NULL;
>> + }
>> +diff --git a/src/knownhosts.c b/src/knownhosts.c
>> +index a2d08a75..3ab468de 100644
>> +--- a/src/knownhosts.c
>> ++++ b/src/knownhosts.c
>> +@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char
>> *match,
>> + FILE *fp =3D NULL;
>> + int rc;
>> +
>> +- fp =3D fopen(filename, "r");
>> ++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>> + if (fp =3D=3D NULL) {
>> + char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s",
>> +diff --git a/src/misc.c b/src/misc.c
>> +index 774211fb..3968e6bc 100644
>> +--- a/src/misc.c
>> ++++ b/src/misc.c
>> +@@ -37,6 +37,7 @@
>> + #endif /* _WIN32 */
>> +
>> + #include <errno.h>
>> ++#include <fcntl.h>
>> + #include <limits.h>
>> + #include <stdio.h>
>> + #include <string.h>
>> +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>> + return !(t !=3D NULL && t[0] =3D=3D '1');
>> + }
>> +
>> ++/**
>> ++ * @internal
>> ++ *
>> ++ * @brief Safely open a file containing some configuration.
>> ++ *
>> ++ * Runs checks if the file can be used as some configuration file (is
>> regular
>> ++ * file and is not too large). If so, returns the opened file (for
>> reading).
>> ++ * Otherwise logs error and returns `NULL`.
>> ++ *
>> ++ * @param filename The path to the file to open.
>> ++ * @param max_file_size Maximum file size that is accepted.
>> ++ *
>> ++ * @returns the opened file or `NULL` on error.
>> ++ */
>> ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>> ++{
>> ++ FILE *f =3D NULL;
>> ++ struct stat sb;
>> ++ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};
>> ++ int r, fd;
>> ++
>> ++ /* open first to avoid TOCTOU */
>> ++ fd =3D open(filename, O_RDONLY);
>> ++ if (fd =3D=3D -1) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to open a file %s for reading: %s",
>> ++ filename,
>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ return NULL;
>> ++ }
>> ++
>> ++ /* Check the file is sensible for a configuration file */
>> ++ r =3D fstat(fd, &sb);
>> ++ if (r !=3D 0) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to stat %s: %s",
>> ++ filename,
>> ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++ if ((sb.st_mode & S_IFMT) !=3D S_IFREG) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "The file %s is not a regular file: skipping",
>> ++ filename);
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ if ((size_t)sb.st_size > max_file_size) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>> ++ filename,
>> ++ (intmax_t)sb.st_size / 1024 / 1024,
>> ++ max_file_size / 1024 / 1024);
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ f =3D fdopen(fd, "r");
>> ++ if (f =3D=3D NULL) {
>> ++ SSH_LOG(SSH_LOG_RARE,
>> ++ "Failed to open a file %s for reading: %s",
>> ++ filename,
>> ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>> ++ close(fd);
>> ++ return NULL;
>> ++ }
>> ++
>> ++ /* the flcose() will close also the underlying fd */
>> ++ return f;
>> ++}
>> ++
>> + /** @} */
>> +diff --git a/tests/unittests/torture_config.c
>> b/tests/unittests/torture_config.c
>> +index fcfe8fbc..0cb31a76 100644
>> +--- a/tests/unittests/torture_config.c
>> ++++ b/tests/unittests/torture_config.c
>> +@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void
>> **state)
>> + ssh_string_free_char(v);
>> + }
>> +
>> ++/* Invalid configuration files
>> ++ */
>> ++static void torture_config_invalid(void **state)
>> ++{
>> ++ ssh_session session =3D *state;
>> ++
>> ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>> ++
>> ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>> ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>> ++
>> ++#ifndef _WIN32
>> ++ /* huge file -- ignored (or missing on non-unix) so OK */
>> ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>> ++#endif
>> ++}
>> ++
>> + int torture_run_tests(void)
>> + {
>> + int rc;
>> +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>> + setup, teardown),
>> + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>> + setup, teardown),
>> ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>> ++ setup,
>> ++ teardown),
>> + };
>> +
>> +
>> +--
>> +2.51.0
>> +
>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> index 193ff3512d..c552692bde 100644
>> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> @@ -14,6 +14,7 @@ SRC_URI =3D
>> "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstab=
le
>> file://CVE-2026-0968_p1.patch \
>> file://CVE-2026-0968_p2.patch \
>> file://CVE-2026-0967.patch \
>> + file://CVE-2026-0965.patch \
>> "
>>=20
>> SRC_URI:append:toolchain-clang =3D "
>> file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>> --
>> 2.35.6
>>=20
>>=20
>>=20
>>=20
>=20
>

--JNqEUsod6vV0DnxfjZfZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"font-family: 'Segoe UI'; font-size: 14px; font-style: normal;=
 font-weight: 400; line-height: 20px;">
<p>Hi Ankur,</p>
<p>Thank you for your review and response.</p>
<p>As previously indicated by the maintainer in this thread (<a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/topic/118275693">openembedd=
ed-core@lists.openembedded.org | Inquiry Regarding Package Upgrade Approach=
 vs. Manual CVE Fixes in LTS Releases</a>), package upgrades are not consid=
ered for stable and LTS branches for stability. Only bug fixes and security=
 fixes are accepted. Accordingly, I have submitted CVE fix patches instead =
of performing a package upgrade.</p>
<p>Regards,<br />Deepak</p>
</div>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:</div>
<div>
<blockquote>I think we can upgrade to v0.11.4<br /><br /><a href=3D"https:/=
/git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.11" target=
=3D"_blank" rel=3D"noopener">https://git.libssh.org/projects/libssh.git/tre=
e/CHANGELOG?h=3Dstable-0.11</a><br /><br />version 0.11.4 (released 2026-02=
-10)<br />* Security:<br />* CVE-2025-14821: libssh loads configuration fil=
es from the C:\etc directory<br />on Windows<br />* CVE-2026-0964: SCP Prot=
ocol Path Traversal in ssh_scp_pull_request()<br />* CVE-2026-0965: Possibl=
e Denial of Service when parsing unexpected<br />configuration files<br />*=
 CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input<br />* =
CVE-2026-0967: Specially crafted patterns could cause DoS<br />* CVE-2026-0=
968: OOB Read in sftp_parse_longname()<br />* libssh-2026-sftp-extensions: =
Read buffer overrun when handling SFTP<br />extensions<br />* Stability and=
 compatibility improvements of ProxyJum<br /><br /><br /><br />On Mon, Apr =
6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via<br />lists.openembedded.org =
&lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br />wrote:<br />
<blockquote><br />From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br /><br =
/>Pick the patch [1] as mentioned in [2]<br /><br />[1] <a href=3D"https://=
git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5=
fadc0429a8a76" target=3D"_blank" rel=3D"noopener">https://git.libssh.org/pr=
ojects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76</a>=
<br />[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-0=
965" target=3D"_blank" rel=3D"noopener">https://security-tracker.debian.org=
/tracker/CVE-2026-0965</a><br /><br />Signed-off-by: Deepak Rathore &lt;dee=
ratho@cisco.com&gt;<br />---<br />.../libssh/libssh/CVE-2026-0965.patch | 2=
86 ++++++++++++++++++<br />.../recipes-support/libssh/libssh_0.11.3.bb | 1 =
+<br />2 files changed, 287 insertions(+)<br />create mode 100644 meta-oe/r=
ecipes-support/libssh/libssh/CVE-2026-0965.patch<br /><br />diff --git a/me=
ta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch b/meta-oe/recipes-s=
upport/libssh/libssh/CVE-2026-0965.patch<br />new file mode 100644<br />ind=
ex 0000000000..57cb9d6170<br />--- /dev/null<br />+++ b/meta-oe/recipes-sup=
port/libssh/libssh/CVE-2026-0965.patch<br />@@ -0,0 +1,286 @@<br />+From 58=
58a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001<br />+From:=
 Jakub Jelen &lt;jjelen@redhat.com&gt;<br />+Date: Thu, 11 Dec 2025 17:33:1=
9 +0100<br />+Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to =
read non-regular<br />+ and too large configuration files<br />+<br />+Chan=
ges also the reading of known_hosts to use the new helper function<br />+<b=
r />+CVE: CVE-2026-0965<br />+Upstream-Status: Backport [<a href=3D"https:/=
/git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c=
5fadc0429a8a76" target=3D"_blank" rel=3D"noopener">https://git.libssh.org/p=
rojects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76</a=
>]<br />+<br />+Signed-off-by: Jakub Jelen &lt;jjelen@redhat.com&gt;<br />+=
Reviewed-by: Andreas Schneider &lt;asn@cryptomilk.org&gt;<br />+(cherry pic=
ked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)<br />+(cherry pic=
ked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)<br />+Signed-off-=
by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br />+---<br />+ include/libs=
sh/misc.h | 3 ++<br />+ include/libssh/priv.h | 3 ++<br />+ src/bind_config=
.c | 4 +-<br />+ src/config.c | 8 ++--<br />+ src/dh-gex.c | 4 +-<br />+ sr=
c/known_hosts.c | 2 +-<br />+ src/knownhosts.c | 2 +-<br />+ src/misc.c | 7=
4 ++++++++++++++++++++++++++++++++<br />+ tests/unittests/torture_config.c =
| 20 +++++++++<br />+ 9 files changed, 110 insertions(+), 10 deletions(-)<b=
r />+<br />+diff --git a/include/libssh/misc.h b/include/libssh/misc.h<br /=
>+index ab726a0e..8eab94ee 100644<br />+--- a/include/libssh/misc.h<br />++=
++ b/include/libssh/misc.h<br />+@@ -36,6 +36,7 @@<br />+ #include &lt;sys/=
types.h&gt;<br />+ #include &lt;stdbool.h&gt;<br />+ #endif /* _WIN32 */<br=
 />++#include &lt;stdio.h&gt;<br />+<br />+ #ifdef __cplusplus<br />+ exter=
n "C" {<br />+@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char =
*username);<br />+ void ssh_proxyjumps_free(struct ssh_list *proxy_jump_lis=
t);<br />+ bool ssh_libssh_proxy_jumps(void);<br />+<br />++FILE *ssh_stric=
t_fopen(const char *filename, size_t max_file_size);<br />++<br />+ #ifdef =
__cplusplus<br />+ }<br />+ #endif<br />+diff --git a/include/libssh/priv.h=
 b/include/libssh/priv.h<br />+index 35fd8506..62069970 100644<br />+--- a/=
include/libssh/priv.h<br />++++ b/include/libssh/priv.h<br />+@@ -473,6 +47=
3,9 @@ char *ssh_strerror(int err_num, char *buf, size_t buflen);<br />+ #d=
efine SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)<br />+ int encode_current_tty_=
opts(unsigned char *buf, size_t buflen);<br />+<br />++/** The default maxi=
mum file size for a configuration file */<br />++#define SSH_MAX_CONFIG_FIL=
E_SIZE 16 * 1024 * 1024<br />++<br />+ #ifdef __cplusplus<br />+ }<br />+ #=
endif<br />+diff --git a/src/bind_config.c b/src/bind_config.c<br />+index =
9e4a7fd4..c12f1003 100644<br />+--- a/src/bind_config.c<br />++++ b/src/bin=
d_config.c<br />+@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,<br />+=
 return;<br />+ }<br />+<br />+- f =3D fopen(filename, "r");<br />++ f =3D =
ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D N=
ULL) {<br />+ SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",<br />+ f=
ilename);<br />+@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind=
 bind, const char *filename)<br />+ * option to be redefined later by anoth=
er file. */<br />+ uint8_t seen[BIND_CFG_MAX] =3D {0};<br />+<br />+- f =3D=
 fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filename, SSH_MAX_CON=
FIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />+ return 0;<br />+ }<br />=
+diff --git a/src/config.c b/src/config.c<br />+index b4171efd..1ffad537 10=
0644<br />+--- a/src/config.c<br />++++ b/src/config.c<br />+@@ -223,10 +22=
3,9 @@ local_parse_file(ssh_session session,<br />+ return;<br />+ }<br />+=
<br />+- f =3D fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filenam=
e, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />+- SSH_LOG(S=
SH_LOG_RARE, "Cannot find file %s to load",<br />+- filename);<br />++ /* T=
he underlying function logs the reasons */<br />+ return;<br />+ }<br />+<b=
r />+@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session, c=
onst char *filename)<br />+ int parsing, rv;<br />+ bool global =3D 0;<br /=
>+<br />+- f =3D fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filen=
ame, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />++ /* The =
underlying function logs the reasons */<br />+ return 0;<br />+ }<br />+<br=
 />+diff --git a/src/dh-gex.c b/src/dh-gex.c<br />+index 46ba934e..428a5655=
 100644<br />+--- a/src/dh-gex.c<br />++++ b/src/dh-gex.c<br />+@@ -519,9 +=
519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,<br />+ }<br />+=
<br />+ if (moduli_file !=3D NULL)<br />+- moduli =3D fopen(moduli_file, "r=
");<br />++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SI=
ZE);<br />+ else<br />+- moduli =3D fopen(MODULI_FILE, "r");<br />++ moduli=
 =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);<br />+<br />+=
 if (moduli =3D=3D NULL) {<br />+ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};<=
br />+diff --git a/src/known_hosts.c b/src/known_hosts.c<br />+index 3ef83e=
21..701576ce 100644<br />+--- a/src/known_hosts.c<br />++++ b/src/known_hos=
ts.c<br />+@@ -83,7 +83,7 @@ static struct ssh_tokens_st *ssh_get_knownhost=
_line(FILE **file,<br />+ struct ssh_tokens_st *tokens =3D NULL;<br />+<br =
/>+ if (*file =3D=3D NULL) {<br />+- *file =3D fopen(filename,"r");<br />++=
 *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if =
(*file =3D=3D NULL) {<br />+ return NULL;<br />+ }<br />+diff --git a/src/k=
nownhosts.c b/src/knownhosts.c<br />+index a2d08a75..3ab468de 100644<br />+=
--- a/src/knownhosts.c<br />++++ b/src/knownhosts.c<br />+@@ -232,7 +232,7 =
@@ static int ssh_known_hosts_read_entries(const char *match,<br />+ FILE *=
fp =3D NULL;<br />+ int rc;<br />+<br />+- fp =3D fopen(filename, "r");<br =
/>++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if=
 (fp =3D=3D NULL) {<br />+ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};<br />+ =
SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s",<br /=
>+diff --git a/src/misc.c b/src/misc.c<br />+index 774211fb..3968e6bc 10064=
4<br />+--- a/src/misc.c<br />++++ b/src/misc.c<br />+@@ -37,6 +37,7 @@<br =
/>+ #endif /* _WIN32 */<br />+<br />+ #include &lt;errno.h&gt;<br />++#incl=
ude &lt;fcntl.h&gt;<br />+ #include &lt;limits.h&gt;<br />+ #include &lt;st=
dio.h&gt;<br />+ #include &lt;string.h&gt;<br />+@@ -2244,4 +2245,77 @@ ssh=
_libssh_proxy_jumps(void)<br />+ return !(t !=3D NULL &amp;&amp; t[0] =3D=
=3D '1');<br />+ }<br />+<br />++/**<br />++ * @internal<br />++ *<br />++ =
* @brief Safely open a file containing some configuration.<br />++ *<br />+=
+ * Runs checks if the file can be used as some configuration file (is regu=
lar<br />++ * file and is not too large). If so, returns the opened file (f=
or reading).<br />++ * Otherwise logs error and returns `NULL`.<br />++ *<b=
r />++ * @param filename The path to the file to open.<br />++ * @param max=
_file_size Maximum file size that is accepted.<br />++ *<br />++ * @returns=
 the opened file or `NULL` on error.<br />++ */<br />++FILE *ssh_strict_fop=
en(const char *filename, size_t max_file_size)<br />++{<br />++ FILE *f =3D=
 NULL;<br />++ struct stat sb;<br />++ char err_msg[SSH_ERRNO_MSG_MAX] =3D =
{0};<br />++ int r, fd;<br />++<br />++ /* open first to avoid TOCTOU */<br=
 />++ fd =3D open(filename, O_RDONLY);<br />++ if (fd =3D=3D -1) {<br />++ =
SSH_LOG(SSH_LOG_RARE,<br />++ "Failed to open a file %s for reading: %s",<b=
r />++ filename,<br />++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));<=
br />++ return NULL;<br />++ }<br />++<br />++ /* Check the file is sensibl=
e for a configuration file */<br />++ r =3D fstat(fd, &amp;sb);<br />++ if =
(r !=3D 0) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "Failed to stat %s: %s",=
<br />++ filename,<br />++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX))=
;<br />++ close(fd);<br />++ return NULL;<br />++ }<br />++ if ((sb.st_mode=
 &amp; S_IFMT) !=3D S_IFREG) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "The f=
ile %s is not a regular file: skipping",<br />++ filename);<br />++ close(f=
d);<br />++ return NULL;<br />++ }<br />++<br />++ if ((size_t)sb.st_size &=
gt; max_file_size) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "The file %s is =
too large (%jd MB &gt; %zu MB): skipping",<br />++ filename,<br />++ (intma=
x_t)sb.st_size / 1024 / 1024,<br />++ max_file_size / 1024 / 1024);<br />++=
 close(fd);<br />++ return NULL;<br />++ }<br />++<br />++ f =3D fdopen(fd,=
 "r");<br />++ if (f =3D=3D NULL) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "=
Failed to open a file %s for reading: %s",<br />++ filename,<br />++ ssh_st=
rerror(r, err_msg, SSH_ERRNO_MSG_MAX));<br />++ close(fd);<br />++ return N=
ULL;<br />++ }<br />++<br />++ /* the flcose() will close also the underlyi=
ng fd */<br />++ return f;<br />++}<br />++<br />+ /** @} */<br />+diff --g=
it a/tests/unittests/torture_config.c b/tests/unittests/torture_config.c<br=
 />+index fcfe8fbc..0cb31a76 100644<br />+--- a/tests/unittests/torture_con=
fig.c<br />++++ b/tests/unittests/torture_config.c<br />+@@ -2675,6 +2675,2=
3 @@ static void torture_config_match_complex(void **state)<br />+ ssh_stri=
ng_free_char(v);<br />+ }<br />+<br />++/* Invalid configuration files<br /=
>++ */<br />++static void torture_config_invalid(void **state)<br />++{<br =
/>++ ssh_session session =3D *state;<br />++<br />++ ssh_options_set(sessio=
n, SSH_OPTIONS_HOST, "Bar");<br />++<br />++ /* non-regular file -- ignored=
 (or missing on non-unix) so OK */<br />++ _parse_config(session, "/dev/ran=
dom", NULL, SSH_OK);<br />++<br />++#ifndef _WIN32<br />++ /* huge file -- =
ignored (or missing on non-unix) so OK */<br />++ _parse_config(session, "/=
proc/kcore", NULL, SSH_OK);<br />++#endif<br />++}<br />++<br />+ int tortu=
re_run_tests(void)<br />+ {<br />+ int rc;<br />+@@ -2771,6 +2788,9 @@ int =
torture_run_tests(void)<br />+ setup, teardown),<br />+ cmocka_unit_test_se=
tup_teardown(torture_config_match_complex,<br />+ setup, teardown),<br />++=
 cmocka_unit_test_setup_teardown(torture_config_invalid,<br />++ setup,<br =
/>++ teardown),<br />+ };<br />+<br />+<br />+--<br />+2.51.0<br />+<br />d=
iff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recip=
es-support/libssh/libssh_0.11.3.bb<br />index 193ff3512d..c552692bde 100644=
<br />--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb<br />+++ b/meta=
-oe/recipes-support/libssh/libssh_0.11.3.bb<br />@@ -14,6 +14,7 @@ SRC_URI =
=3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
ble<br />file://CVE-2026-0968_p1.patch \<br />file://CVE-2026-0968_p2.patch=
 \<br />file://CVE-2026-0967.patch \<br />+ file://CVE-2026-0965.patch \<br=
 />"<br /><br />SRC_URI:append:toolchain-clang =3D " file://0001-CompilerCh=
ecks.cmake-drop-Wunused-variable-flag.patch"<br />--<br />2.35.6<br /><br /=
><br /><br /></blockquote>
</blockquote>
</div>
<div>On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:</div>
<div>
<blockquote>I think we can upgrade to v0.11.4<br /><br /><a href=3D"https:/=
/git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dstable-0.11" target=
=3D"_blank" rel=3D"noopener">https://git.libssh.org/projects/libssh.git/tre=
e/CHANGELOG?h=3Dstable-0.11</a><br /><br />version 0.11.4 (released 2026-02=
-10)<br />* Security:<br />* CVE-2025-14821: libssh loads configuration fil=
es from the C:\etc directory<br />on Windows<br />* CVE-2026-0964: SCP Prot=
ocol Path Traversal in ssh_scp_pull_request()<br />* CVE-2026-0965: Possibl=
e Denial of Service when parsing unexpected<br />configuration files<br />*=
 CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input<br />* =
CVE-2026-0967: Specially crafted patterns could cause DoS<br />* CVE-2026-0=
968: OOB Read in sftp_parse_longname()<br />* libssh-2026-sftp-extensions: =
Read buffer overrun when handling SFTP<br />extensions<br />* Stability and=
 compatibility improvements of ProxyJum<br /><br /><br /><br />On Mon, Apr =
6, 2026 at 11:56=E2=80=AFPM Deepak Rathore via<br />lists.openembedded.org =
&lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br />wrote:<br />
<blockquote><br />From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br /><br =
/>Pick the patch [1] as mentioned in [2]<br /><br />[1] <a href=3D"https://=
git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5=
fadc0429a8a76" target=3D"_blank" rel=3D"noopener">https://git.libssh.org/pr=
ojects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76</a>=
<br />[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-0=
965" target=3D"_blank" rel=3D"noopener">https://security-tracker.debian.org=
/tracker/CVE-2026-0965</a><br /><br />Signed-off-by: Deepak Rathore &lt;dee=
ratho@cisco.com&gt;<br />---<br />.../libssh/libssh/CVE-2026-0965.patch | 2=
86 ++++++++++++++++++<br />.../recipes-support/libssh/libssh_0.11.3.bb | 1 =
+<br />2 files changed, 287 insertions(+)<br />create mode 100644 meta-oe/r=
ecipes-support/libssh/libssh/CVE-2026-0965.patch<br /><br />diff --git a/me=
ta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch b/meta-oe/recipes-s=
upport/libssh/libssh/CVE-2026-0965.patch<br />new file mode 100644<br />ind=
ex 0000000000..57cb9d6170<br />--- /dev/null<br />+++ b/meta-oe/recipes-sup=
port/libssh/libssh/CVE-2026-0965.patch<br />@@ -0,0 +1,286 @@<br />+From 58=
58a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001<br />+From:=
 Jakub Jelen &lt;jjelen@redhat.com&gt;<br />+Date: Thu, 11 Dec 2025 17:33:1=
9 +0100<br />+Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to =
read non-regular<br />+ and too large configuration files<br />+<br />+Chan=
ges also the reading of known_hosts to use the new helper function<br />+<b=
r />+CVE: CVE-2026-0965<br />+Upstream-Status: Backport [<a href=3D"https:/=
/git.libssh.org/projects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c=
5fadc0429a8a76" target=3D"_blank" rel=3D"noopener">https://git.libssh.org/p=
rojects/libssh.git/commit/?id=3Dbf390a042623e02abc8f421c4c5fadc0429a8a76</a=
>]<br />+<br />+Signed-off-by: Jakub Jelen &lt;jjelen@redhat.com&gt;<br />+=
Reviewed-by: Andreas Schneider &lt;asn@cryptomilk.org&gt;<br />+(cherry pic=
ked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)<br />+(cherry pic=
ked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)<br />+Signed-off-=
by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br />+---<br />+ include/libs=
sh/misc.h | 3 ++<br />+ include/libssh/priv.h | 3 ++<br />+ src/bind_config=
.c | 4 +-<br />+ src/config.c | 8 ++--<br />+ src/dh-gex.c | 4 +-<br />+ sr=
c/known_hosts.c | 2 +-<br />+ src/knownhosts.c | 2 +-<br />+ src/misc.c | 7=
4 ++++++++++++++++++++++++++++++++<br />+ tests/unittests/torture_config.c =
| 20 +++++++++<br />+ 9 files changed, 110 insertions(+), 10 deletions(-)<b=
r />+<br />+diff --git a/include/libssh/misc.h b/include/libssh/misc.h<br /=
>+index ab726a0e..8eab94ee 100644<br />+--- a/include/libssh/misc.h<br />++=
++ b/include/libssh/misc.h<br />+@@ -36,6 +36,7 @@<br />+ #include &lt;sys/=
types.h&gt;<br />+ #include &lt;stdbool.h&gt;<br />+ #endif /* _WIN32 */<br=
 />++#include &lt;stdio.h&gt;<br />+<br />+ #ifdef __cplusplus<br />+ exter=
n "C" {<br />+@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char =
*username);<br />+ void ssh_proxyjumps_free(struct ssh_list *proxy_jump_lis=
t);<br />+ bool ssh_libssh_proxy_jumps(void);<br />+<br />++FILE *ssh_stric=
t_fopen(const char *filename, size_t max_file_size);<br />++<br />+ #ifdef =
__cplusplus<br />+ }<br />+ #endif<br />+diff --git a/include/libssh/priv.h=
 b/include/libssh/priv.h<br />+index 35fd8506..62069970 100644<br />+--- a/=
include/libssh/priv.h<br />++++ b/include/libssh/priv.h<br />+@@ -473,6 +47=
3,9 @@ char *ssh_strerror(int err_num, char *buf, size_t buflen);<br />+ #d=
efine SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)<br />+ int encode_current_tty_=
opts(unsigned char *buf, size_t buflen);<br />+<br />++/** The default maxi=
mum file size for a configuration file */<br />++#define SSH_MAX_CONFIG_FIL=
E_SIZE 16 * 1024 * 1024<br />++<br />+ #ifdef __cplusplus<br />+ }<br />+ #=
endif<br />+diff --git a/src/bind_config.c b/src/bind_config.c<br />+index =
9e4a7fd4..c12f1003 100644<br />+--- a/src/bind_config.c<br />++++ b/src/bin=
d_config.c<br />+@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,<br />+=
 return;<br />+ }<br />+<br />+- f =3D fopen(filename, "r");<br />++ f =3D =
ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D N=
ULL) {<br />+ SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",<br />+ f=
ilename);<br />+@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind=
 bind, const char *filename)<br />+ * option to be redefined later by anoth=
er file. */<br />+ uint8_t seen[BIND_CFG_MAX] =3D {0};<br />+<br />+- f =3D=
 fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filename, SSH_MAX_CON=
FIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />+ return 0;<br />+ }<br />=
+diff --git a/src/config.c b/src/config.c<br />+index b4171efd..1ffad537 10=
0644<br />+--- a/src/config.c<br />++++ b/src/config.c<br />+@@ -223,10 +22=
3,9 @@ local_parse_file(ssh_session session,<br />+ return;<br />+ }<br />+=
<br />+- f =3D fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filenam=
e, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />+- SSH_LOG(S=
SH_LOG_RARE, "Cannot find file %s to load",<br />+- filename);<br />++ /* T=
he underlying function logs the reasons */<br />+ return;<br />+ }<br />+<b=
r />+@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session, c=
onst char *filename)<br />+ int parsing, rv;<br />+ bool global =3D 0;<br /=
>+<br />+- f =3D fopen(filename, "r");<br />++ f =3D ssh_strict_fopen(filen=
ame, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if (f =3D=3D NULL) {<br />++ /* The =
underlying function logs the reasons */<br />+ return 0;<br />+ }<br />+<br=
 />+diff --git a/src/dh-gex.c b/src/dh-gex.c<br />+index 46ba934e..428a5655=
 100644<br />+--- a/src/dh-gex.c<br />++++ b/src/dh-gex.c<br />+@@ -519,9 +=
519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,<br />+ }<br />+=
<br />+ if (moduli_file !=3D NULL)<br />+- moduli =3D fopen(moduli_file, "r=
");<br />++ moduli =3D ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SI=
ZE);<br />+ else<br />+- moduli =3D fopen(MODULI_FILE, "r");<br />++ moduli=
 =3D ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);<br />+<br />+=
 if (moduli =3D=3D NULL) {<br />+ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};<=
br />+diff --git a/src/known_hosts.c b/src/known_hosts.c<br />+index 3ef83e=
21..701576ce 100644<br />+--- a/src/known_hosts.c<br />++++ b/src/known_hos=
ts.c<br />+@@ -83,7 +83,7 @@ static struct ssh_tokens_st *ssh_get_knownhost=
_line(FILE **file,<br />+ struct ssh_tokens_st *tokens =3D NULL;<br />+<br =
/>+ if (*file =3D=3D NULL) {<br />+- *file =3D fopen(filename,"r");<br />++=
 *file =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if =
(*file =3D=3D NULL) {<br />+ return NULL;<br />+ }<br />+diff --git a/src/k=
nownhosts.c b/src/knownhosts.c<br />+index a2d08a75..3ab468de 100644<br />+=
--- a/src/knownhosts.c<br />++++ b/src/knownhosts.c<br />+@@ -232,7 +232,7 =
@@ static int ssh_known_hosts_read_entries(const char *match,<br />+ FILE *=
fp =3D NULL;<br />+ int rc;<br />+<br />+- fp =3D fopen(filename, "r");<br =
/>++ fp =3D ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);<br />+ if=
 (fp =3D=3D NULL) {<br />+ char err_msg[SSH_ERRNO_MSG_MAX] =3D {0};<br />+ =
SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s",<br /=
>+diff --git a/src/misc.c b/src/misc.c<br />+index 774211fb..3968e6bc 10064=
4<br />+--- a/src/misc.c<br />++++ b/src/misc.c<br />+@@ -37,6 +37,7 @@<br =
/>+ #endif /* _WIN32 */<br />+<br />+ #include &lt;errno.h&gt;<br />++#incl=
ude &lt;fcntl.h&gt;<br />+ #include &lt;limits.h&gt;<br />+ #include &lt;st=
dio.h&gt;<br />+ #include &lt;string.h&gt;<br />+@@ -2244,4 +2245,77 @@ ssh=
_libssh_proxy_jumps(void)<br />+ return !(t !=3D NULL &amp;&amp; t[0] =3D=
=3D '1');<br />+ }<br />+<br />++/**<br />++ * @internal<br />++ *<br />++ =
* @brief Safely open a file containing some configuration.<br />++ *<br />+=
+ * Runs checks if the file can be used as some configuration file (is regu=
lar<br />++ * file and is not too large). If so, returns the opened file (f=
or reading).<br />++ * Otherwise logs error and returns `NULL`.<br />++ *<b=
r />++ * @param filename The path to the file to open.<br />++ * @param max=
_file_size Maximum file size that is accepted.<br />++ *<br />++ * @returns=
 the opened file or `NULL` on error.<br />++ */<br />++FILE *ssh_strict_fop=
en(const char *filename, size_t max_file_size)<br />++{<br />++ FILE *f =3D=
 NULL;<br />++ struct stat sb;<br />++ char err_msg[SSH_ERRNO_MSG_MAX] =3D =
{0};<br />++ int r, fd;<br />++<br />++ /* open first to avoid TOCTOU */<br=
 />++ fd =3D open(filename, O_RDONLY);<br />++ if (fd =3D=3D -1) {<br />++ =
SSH_LOG(SSH_LOG_RARE,<br />++ "Failed to open a file %s for reading: %s",<b=
r />++ filename,<br />++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));<=
br />++ return NULL;<br />++ }<br />++<br />++ /* Check the file is sensibl=
e for a configuration file */<br />++ r =3D fstat(fd, &amp;sb);<br />++ if =
(r !=3D 0) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "Failed to stat %s: %s",=
<br />++ filename,<br />++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX))=
;<br />++ close(fd);<br />++ return NULL;<br />++ }<br />++ if ((sb.st_mode=
 &amp; S_IFMT) !=3D S_IFREG) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "The f=
ile %s is not a regular file: skipping",<br />++ filename);<br />++ close(f=
d);<br />++ return NULL;<br />++ }<br />++<br />++ if ((size_t)sb.st_size &=
gt; max_file_size) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "The file %s is =
too large (%jd MB &gt; %zu MB): skipping",<br />++ filename,<br />++ (intma=
x_t)sb.st_size / 1024 / 1024,<br />++ max_file_size / 1024 / 1024);<br />++=
 close(fd);<br />++ return NULL;<br />++ }<br />++<br />++ f =3D fdopen(fd,=
 "r");<br />++ if (f =3D=3D NULL) {<br />++ SSH_LOG(SSH_LOG_RARE,<br />++ "=
Failed to open a file %s for reading: %s",<br />++ filename,<br />++ ssh_st=
rerror(r, err_msg, SSH_ERRNO_MSG_MAX));<br />++ close(fd);<br />++ return N=
ULL;<br />++ }<br />++<br />++ /* the flcose() will close also the underlyi=
ng fd */<br />++ return f;<br />++}<br />++<br />+ /** @} */<br />+diff --g=
it a/tests/unittests/torture_config.c b/tests/unittests/torture_config.c<br=
 />+index fcfe8fbc..0cb31a76 100644<br />+--- a/tests/unittests/torture_con=
fig.c<br />++++ b/tests/unittests/torture_config.c<br />+@@ -2675,6 +2675,2=
3 @@ static void torture_config_match_complex(void **state)<br />+ ssh_stri=
ng_free_char(v);<br />+ }<br />+<br />++/* Invalid configuration files<br /=
>++ */<br />++static void torture_config_invalid(void **state)<br />++{<br =
/>++ ssh_session session =3D *state;<br />++<br />++ ssh_options_set(sessio=
n, SSH_OPTIONS_HOST, "Bar");<br />++<br />++ /* non-regular file -- ignored=
 (or missing on non-unix) so OK */<br />++ _parse_config(session, "/dev/ran=
dom", NULL, SSH_OK);<br />++<br />++#ifndef _WIN32<br />++ /* huge file -- =
ignored (or missing on non-unix) so OK */<br />++ _parse_config(session, "/=
proc/kcore", NULL, SSH_OK);<br />++#endif<br />++}<br />++<br />+ int tortu=
re_run_tests(void)<br />+ {<br />+ int rc;<br />+@@ -2771,6 +2788,9 @@ int =
torture_run_tests(void)<br />+ setup, teardown),<br />+ cmocka_unit_test_se=
tup_teardown(torture_config_match_complex,<br />+ setup, teardown),<br />++=
 cmocka_unit_test_setup_teardown(torture_config_invalid,<br />++ setup,<br =
/>++ teardown),<br />+ };<br />+<br />+<br />+--<br />+2.51.0<br />+<br />d=
iff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recip=
es-support/libssh/libssh_0.11.3.bb<br />index 193ff3512d..c552692bde 100644=
<br />--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb<br />+++ b/meta=
-oe/recipes-support/libssh/libssh_0.11.3.bb<br />@@ -14,6 +14,7 @@ SRC_URI =
=3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
ble<br />file://CVE-2026-0968_p1.patch \<br />file://CVE-2026-0968_p2.patch=
 \<br />file://CVE-2026-0967.patch \<br />+ file://CVE-2026-0965.patch \<br=
 />"<br /><br />SRC_URI:append:toolchain-clang =3D " file://0001-CompilerCh=
ecks.cmake-drop-Wunused-variable-flag.patch"<br />--<br />2.35.6<br /><br /=
><br /><br /></blockquote>
</blockquote>
</div>

--JNqEUsod6vV0DnxfjZfZ--

