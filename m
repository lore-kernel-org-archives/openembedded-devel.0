Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EDBE9DE6A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:30:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127467.1775723453087353216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CY//1Nzu;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so3890535e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775723451; x=1776328251; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRZ7eAuzHT1fqUcCYZZ9U8vedkHi6gEnJ1B6AK/J1ow=;
        b=CY//1Nzu1FvjeT+oqT3BLPu/MOJurw/kbEn9V4YRMmt3MXShggeTh29nDl7+JtwmFl
         8x+fnFZt6Ym7VhI4SMxHMk4xhAqseHH4rZYGnYQ0T454+4tndz7iCjwI1Ge1Bcp7lbKq
         TqJyMrvU949RRAc6uozibTBEhJ0QxVXzHgynthvCwcvsWBzsCcxmeTwxRxyTyQxir2Nl
         Gl7YqETHKDF0+IQH8sdAfGVkYaL+VP2bEAY3fVLmu3M6nD0VDtn+tXV9uMdaPT4iTseS
         fBsPlTcEFBnT/uV5R/JxKru8ZJmefWsrRljVLYPcIUxeLX+aVSLJoCVs3RnegJWFaE4Y
         HxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723451; x=1776328251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRZ7eAuzHT1fqUcCYZZ9U8vedkHi6gEnJ1B6AK/J1ow=;
        b=Zs/eoJPDZEs6cOb4yC/f0Ze2SmGBXIA8mkkmMG1e7FHtQ7ZuxJjSsyWnggN3xFGSSk
         zG7MvDMZR7ZfBxr4i3gWhLN7/XgugLo1VCk9hTC6jNSrFvpGZ+MLZS2wktsOj1dwJOd0
         132ZqeCE2SHrYnF4ZRYAGmiQBVaT1e/J2Bo8M40pm9JqJlNGxHK0n3qBiZha2PVWf8H3
         vj+rOGWHIpT0+NjVUS56T5JkqZg27tyE6ljKLuyVFSozX0ihn/t43MtM8tXkPOAZAHhV
         SlDw+9c+g98TM+8apgvG5JDrOx3e8fqif1WvY4ikhJOsKh+e9WRgh/n2A47ckhKOj3qn
         P7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVzeCFFTWeNJCZl8p8v1s25+5RiN5AFgBPt4Jq5zhFudLEGMQRoY4EsAgrod04DyakV5CwXZAOwvHeqz9husCCtnv0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YysduEDXTmyagqUiDZ7acaA0QwyRZB5G2JTFpXaK30I4JWikbUF
	6qAN0cnAX+3i7g2dIgDpmrneBzNLEvEu85++iDdAOrxQVWmyRkSsh6HN
X-Gm-Gg: AeBDieuYV78Zay5dvE9uqghW/AnB0K0Kq9f4CNNCDxp0vbdu+yVAgtaeXEl1gCJMUCT
	yyo+kYj839A2wOFV1b8S55fsiR1G6HY4XQlJb6gkYEJCD+WcvJdG7EwMYByf8f04A9Ecmx3qURj
	J1BEP4OIlOFf9IyTYNaupYoB07ePqtJGscdrwM2Vq8T6w0Q0lQkQZH1V6V7YmliZDhvoqdUPW5k
	BHRJz0v7dgDvZf9p888FJznHdR7QNUUacfwBCTLhaOoW0GdyjIkClz49Q1c9/odUKyKLCyW18TZ
	RfocqSeqPTMIqOfclgrcIIc5sUw6auAjjUgqlnMf9u1ZOFsNbbl6EijH1qjdgnrIwJ5fd5u8s7+
	kPkOKjLlMxW6q5safi933C5TeI9/TU0o9v5TR7k1fgXp7Py+mI3U84BC4JdIptW4xseXZ04O/GD
	hwNkO+rtQnM19qKdeWx5ekUs8VwNpVy+A=
X-Received: by 2002:a05:600c:354f:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488cd557418mr32647405e9.8.1775723450899;
        Thu, 09 Apr 2026 01:30:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cfa75ae2sm67237495e9.14.2026.04.09.01.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:30:50 -0700 (PDT)
Message-ID: <4f088571-cd1b-4614-b62d-36454c8ab04f@gmail.com>
Date: Thu, 9 Apr 2026 10:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 3/3] libssh: Fix CVE-2026-0965
To: deeratho@cisco.com, openembedded-devel@lists.openembedded.org
References: <20260406115535.1242965-1-deeratho@cisco.com>
 <CADySD0Hw0=QGHcd0Xfendesh8hiTfpxHb5T7boTSbXL5SSwUMw@mail.gmail.com>
 <829031.1775708722131603063@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <829031.1775708722131603063@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 08:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126146



On 4/9/26 06:25, Deepak Rathore via lists.openembedded.org wrote:
> Hi Ankur,
> 
> Thank you for your review and response.
> 
> As previously indicated by the maintainer in this thread (openembedded-
> core@lists.openembedded.org | Inquiry Regarding Package Upgrade Approach
> vs. Manual CVE Fixes in LTS Releases <https://lists.openembedded.org/g/
> openembedded-core/topic/118275693>), package upgrades are not considered
> for stable and LTS branches for stability. Only bug fixes and security
> fixes are accepted. Accordingly, I have submitted CVE fix patches
> instead of performing a package upgrade.
> 

That mailchain also mentions: 'As stated, "General version upgrades" are
unacceptable but there is an
exception for "Changes to follow an upstream stable series or LTS that
aligns with the original release (based on compatibility)'

meta-oe stable branches accept updates also in line with this statement.

Which change in this version do you deem to be inappropriate for a
stable branch?

One thing that's worth pointing out is that there are 6 participants in
the linked email exchange, but 0 meta-openembedded maintainers. While
meta-oe and oe-core are closely related, they are separate projects and
if you have a question about meta-oe, I'd recommend to ask it here
instead of using other random mailing lists.


> Regards,
> Deepak
> 
>  
>  
> On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:
> 
>     I think we can upgrade to v0.11.4
> 
>     https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?
>     h=stable-0.11 <https://git.libssh.org/projects/libssh.git/tree/
>     CHANGELOG?h=stable-0.11>
> 
>     version 0.11.4 (released 2026-02-10)
>     * Security:
>     * CVE-2025-14821: libssh loads configuration files from the C:\etc
>     directory
>     on Windows
>     * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
>     * CVE-2026-0965: Possible Denial of Service when parsing unexpected
>     configuration files
>     * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
>     * CVE-2026-0967: Specially crafted patterns could cause DoS
>     * CVE-2026-0968: OOB Read in sftp_parse_longname()
>     * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
>     extensions
>     * Stability and compatibility improvements of ProxyJum
> 
> 
> 
>     On Mon, Apr 6, 2026 at 11:56 PM Deepak Rathore via
>     lists.openembedded.org <deeratho=cisco.com@lists.openembedded.org>
>     wrote:
> 
> 
>         From: Deepak Rathore <deeratho@cisco.com>
> 
>         Pick the patch [1] as mentioned in [2]
> 
>         [1] https://git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76 <https://
>         git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76>
>         [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>         <https://security-tracker.debian.org/tracker/CVE-2026-0965>
> 
>         Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>         ---
>         .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>         .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>         2 files changed, 287 insertions(+)
>         create mode 100644 meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch
> 
>         diff --git a/meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch b/meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch
>         new file mode 100644
>         index 0000000000..57cb9d6170
>         --- /dev/null
>         +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>         @@ -0,0 +1,286 @@
>         +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17
>         00:00:00 2001
>         +From: Jakub Jelen <jjelen@redhat.com>
>         +Date: Thu, 11 Dec 2025 17:33:19 +0100
>         +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to
>         read non-regular
>         + and too large configuration files
>         +
>         +Changes also the reading of known_hosts to use the new helper
>         function
>         +
>         +CVE: CVE-2026-0965
>         +Upstream-Status: Backport [https://git.libssh.org/projects/
>         libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76
>         <https://git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76>]
>         +
>         +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>         +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>         +(cherry picked from commit
>         a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>         +(cherry picked from commit
>         bf390a042623e02abc8f421c4c5fadc0429a8a76)
>         +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>         +---
>         + include/libssh/misc.h | 3 ++
>         + include/libssh/priv.h | 3 ++
>         + src/bind_config.c | 4 +-
>         + src/config.c | 8 ++--
>         + src/dh-gex.c | 4 +-
>         + src/known_hosts.c | 2 +-
>         + src/knownhosts.c | 2 +-
>         + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>         + tests/unittests/torture_config.c | 20 +++++++++
>         + 9 files changed, 110 insertions(+), 10 deletions(-)
>         +
>         +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>         +index ab726a0e..8eab94ee 100644
>         +--- a/include/libssh/misc.h
>         ++++ b/include/libssh/misc.h
>         +@@ -36,6 +36,7 @@
>         + #include <sys/types.h>
>         + #include <stdbool.h>
>         + #endif /* _WIN32 */
>         ++#include <stdio.h>
>         +
>         + #ifdef __cplusplus
>         + extern "C" {
>         +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char
>         *username);
>         + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>         + bool ssh_libssh_proxy_jumps(void);
>         +
>         ++FILE *ssh_strict_fopen(const char *filename, size_t
>         max_file_size);
>         ++
>         + #ifdef __cplusplus
>         + }
>         + #endif
>         +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>         +index 35fd8506..62069970 100644
>         +--- a/include/libssh/priv.h
>         ++++ b/include/libssh/priv.h
>         +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf,
>         size_t buflen);
>         + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>         + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>         +
>         ++/** The default maximum file size for a configuration file */
>         ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>         ++
>         + #ifdef __cplusplus
>         + }
>         + #endif
>         +diff --git a/src/bind_config.c b/src/bind_config.c
>         +index 9e4a7fd4..c12f1003 100644
>         +--- a/src/bind_config.c
>         ++++ b/src/bind_config.c
>         +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>         + return;
>         + }
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>         + filename);
>         +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind
>         bind, const char *filename)
>         + * option to be redefined later by another file. */
>         + uint8_t seen[BIND_CFG_MAX] = {0};
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         + return 0;
>         + }
>         +diff --git a/src/config.c b/src/config.c
>         +index b4171efd..1ffad537 100644
>         +--- a/src/config.c
>         ++++ b/src/config.c
>         +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>         + return;
>         + }
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>         +- filename);
>         ++ /* The underlying function logs the reasons */
>         + return;
>         + }
>         +
>         +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session
>         session, const char *filename)
>         + int parsing, rv;
>         + bool global = 0;
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         ++ /* The underlying function logs the reasons */
>         + return 0;
>         + }
>         +
>         +diff --git a/src/dh-gex.c b/src/dh-gex.c
>         +index 46ba934e..428a5655 100644
>         +--- a/src/dh-gex.c
>         ++++ b/src/dh-gex.c
>         +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char
>         *moduli_file,
>         + }
>         +
>         + if (moduli_file != NULL)
>         +- moduli = fopen(moduli_file, "r");
>         ++ moduli = ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>         + else
>         +- moduli = fopen(MODULI_FILE, "r");
>         ++ moduli = ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>         +
>         + if (moduli == NULL) {
>         + char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         +diff --git a/src/known_hosts.c b/src/known_hosts.c
>         +index 3ef83e21..701576ce 100644
>         +--- a/src/known_hosts.c
>         ++++ b/src/known_hosts.c
>         +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>         *ssh_get_knownhost_line(FILE **file,
>         + struct ssh_tokens_st *tokens = NULL;
>         +
>         + if (*file == NULL) {
>         +- *file = fopen(filename,"r");
>         ++ *file = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (*file == NULL) {
>         + return NULL;
>         + }
>         +diff --git a/src/knownhosts.c b/src/knownhosts.c
>         +index a2d08a75..3ab468de 100644
>         +--- a/src/knownhosts.c
>         ++++ b/src/knownhosts.c
>         +@@ -232,7 +232,7 @@ static int
>         ssh_known_hosts_read_entries(const char *match,
>         + FILE *fp = NULL;
>         + int rc;
>         +
>         +- fp = fopen(filename, "r");
>         ++ fp = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (fp == NULL) {
>         + char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file
>         '%s': %s",
>         +diff --git a/src/misc.c b/src/misc.c
>         +index 774211fb..3968e6bc 100644
>         +--- a/src/misc.c
>         ++++ b/src/misc.c
>         +@@ -37,6 +37,7 @@
>         + #endif /* _WIN32 */
>         +
>         + #include <errno.h>
>         ++#include <fcntl.h>
>         + #include <limits.h>
>         + #include <stdio.h>
>         + #include <string.h>
>         +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>         + return !(t != NULL && t[0] == '1');
>         + }
>         +
>         ++/**
>         ++ * @internal
>         ++ *
>         ++ * @brief Safely open a file containing some configuration.
>         ++ *
>         ++ * Runs checks if the file can be used as some configuration
>         file (is regular
>         ++ * file and is not too large). If so, returns the opened file
>         (for reading).
>         ++ * Otherwise logs error and returns `NULL`.
>         ++ *
>         ++ * @param filename The path to the file to open.
>         ++ * @param max_file_size Maximum file size that is accepted.
>         ++ *
>         ++ * @returns the opened file or `NULL` on error.
>         ++ */
>         ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>         ++{
>         ++ FILE *f = NULL;
>         ++ struct stat sb;
>         ++ char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         ++ int r, fd;
>         ++
>         ++ /* open first to avoid TOCTOU */
>         ++ fd = open(filename, O_RDONLY);
>         ++ if (fd == -1) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to open a file %s for reading: %s",
>         ++ filename,
>         ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ return NULL;
>         ++ }
>         ++
>         ++ /* Check the file is sensible for a configuration file */
>         ++ r = fstat(fd, &sb);
>         ++ if (r != 0) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to stat %s: %s",
>         ++ filename,
>         ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++ if ((sb.st_mode & S_IFMT) != S_IFREG) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "The file %s is not a regular file: skipping",
>         ++ filename);
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ if ((size_t)sb.st_size > max_file_size) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>         ++ filename,
>         ++ (intmax_t)sb.st_size / 1024 / 1024,
>         ++ max_file_size / 1024 / 1024);
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ f = fdopen(fd, "r");
>         ++ if (f == NULL) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to open a file %s for reading: %s",
>         ++ filename,
>         ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ /* the flcose() will close also the underlying fd */
>         ++ return f;
>         ++}
>         ++
>         + /** @} */
>         +diff --git a/tests/unittests/torture_config.c b/tests/
>         unittests/torture_config.c
>         +index fcfe8fbc..0cb31a76 100644
>         +--- a/tests/unittests/torture_config.c
>         ++++ b/tests/unittests/torture_config.c
>         +@@ -2675,6 +2675,23 @@ static void
>         torture_config_match_complex(void **state)
>         + ssh_string_free_char(v);
>         + }
>         +
>         ++/* Invalid configuration files
>         ++ */
>         ++static void torture_config_invalid(void **state)
>         ++{
>         ++ ssh_session session = *state;
>         ++
>         ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>         ++
>         ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>         ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>         ++
>         ++#ifndef _WIN32
>         ++ /* huge file -- ignored (or missing on non-unix) so OK */
>         ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>         ++#endif
>         ++}
>         ++
>         + int torture_run_tests(void)
>         + {
>         + int rc;
>         +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>         + setup, teardown),
>         + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>         + setup, teardown),
>         ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>         ++ setup,
>         ++ teardown),
>         + };
>         +
>         +
>         +--
>         +2.51.0
>         +
>         diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/
>         meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         index 193ff3512d..c552692bde 100644
>         --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         @@ -14,6 +14,7 @@ SRC_URI = "git://git.libssh.org/projects/
>         libssh.git;protocol=https;branch=stable
>         file://CVE-2026-0968_p1.patch \
>         file://CVE-2026-0968_p2.patch \
>         file://CVE-2026-0967.patch \
>         + file://CVE-2026-0965.patch \
>         "
> 
>         SRC_URI:append:toolchain-clang = " file://0001-
>         CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>         --
>         2.35.6
> 
> 
> 
> On Wed, Apr 8, 2026 at 10:49 AM, Ankur Tyagi wrote:
> 
>     I think we can upgrade to v0.11.4
> 
>     https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?
>     h=stable-0.11 <https://git.libssh.org/projects/libssh.git/tree/
>     CHANGELOG?h=stable-0.11>
> 
>     version 0.11.4 (released 2026-02-10)
>     * Security:
>     * CVE-2025-14821: libssh loads configuration files from the C:\etc
>     directory
>     on Windows
>     * CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
>     * CVE-2026-0965: Possible Denial of Service when parsing unexpected
>     configuration files
>     * CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
>     * CVE-2026-0967: Specially crafted patterns could cause DoS
>     * CVE-2026-0968: OOB Read in sftp_parse_longname()
>     * libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
>     extensions
>     * Stability and compatibility improvements of ProxyJum
> 
> 
> 
>     On Mon, Apr 6, 2026 at 11:56 PM Deepak Rathore via
>     lists.openembedded.org <deeratho=cisco.com@lists.openembedded.org>
>     wrote:
> 
> 
>         From: Deepak Rathore <deeratho@cisco.com>
> 
>         Pick the patch [1] as mentioned in [2]
> 
>         [1] https://git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76 <https://
>         git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76>
>         [2] https://security-tracker.debian.org/tracker/CVE-2026-0965
>         <https://security-tracker.debian.org/tracker/CVE-2026-0965>
> 
>         Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>         ---
>         .../libssh/libssh/CVE-2026-0965.patch | 286 ++++++++++++++++++
>         .../recipes-support/libssh/libssh_0.11.3.bb | 1 +
>         2 files changed, 287 insertions(+)
>         create mode 100644 meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch
> 
>         diff --git a/meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch b/meta-oe/recipes-support/libssh/libssh/
>         CVE-2026-0965.patch
>         new file mode 100644
>         index 0000000000..57cb9d6170
>         --- /dev/null
>         +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>         @@ -0,0 +1,286 @@
>         +From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17
>         00:00:00 2001
>         +From: Jakub Jelen <jjelen@redhat.com>
>         +Date: Thu, 11 Dec 2025 17:33:19 +0100
>         +Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to
>         read non-regular
>         + and too large configuration files
>         +
>         +Changes also the reading of known_hosts to use the new helper
>         function
>         +
>         +CVE: CVE-2026-0965
>         +Upstream-Status: Backport [https://git.libssh.org/projects/
>         libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76
>         <https://git.libssh.org/projects/libssh.git/commit/?
>         id=bf390a042623e02abc8f421c4c5fadc0429a8a76>]
>         +
>         +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
>         +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
>         +(cherry picked from commit
>         a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
>         +(cherry picked from commit
>         bf390a042623e02abc8f421c4c5fadc0429a8a76)
>         +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>         +---
>         + include/libssh/misc.h | 3 ++
>         + include/libssh/priv.h | 3 ++
>         + src/bind_config.c | 4 +-
>         + src/config.c | 8 ++--
>         + src/dh-gex.c | 4 +-
>         + src/known_hosts.c | 2 +-
>         + src/knownhosts.c | 2 +-
>         + src/misc.c | 74 ++++++++++++++++++++++++++++++++
>         + tests/unittests/torture_config.c | 20 +++++++++
>         + 9 files changed, 110 insertions(+), 10 deletions(-)
>         +
>         +diff --git a/include/libssh/misc.h b/include/libssh/misc.h
>         +index ab726a0e..8eab94ee 100644
>         +--- a/include/libssh/misc.h
>         ++++ b/include/libssh/misc.h
>         +@@ -36,6 +36,7 @@
>         + #include <sys/types.h>
>         + #include <stdbool.h>
>         + #endif /* _WIN32 */
>         ++#include <stdio.h>
>         +
>         + #ifdef __cplusplus
>         + extern "C" {
>         +@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char
>         *username);
>         + void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
>         + bool ssh_libssh_proxy_jumps(void);
>         +
>         ++FILE *ssh_strict_fopen(const char *filename, size_t
>         max_file_size);
>         ++
>         + #ifdef __cplusplus
>         + }
>         + #endif
>         +diff --git a/include/libssh/priv.h b/include/libssh/priv.h
>         +index 35fd8506..62069970 100644
>         +--- a/include/libssh/priv.h
>         ++++ b/include/libssh/priv.h
>         +@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf,
>         size_t buflen);
>         + #define SSH_TTY_MODES_MAX_BUFSIZE (55 * 5 + 1)
>         + int encode_current_tty_opts(unsigned char *buf, size_t buflen);
>         +
>         ++/** The default maximum file size for a configuration file */
>         ++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
>         ++
>         + #ifdef __cplusplus
>         + }
>         + #endif
>         +diff --git a/src/bind_config.c b/src/bind_config.c
>         +index 9e4a7fd4..c12f1003 100644
>         +--- a/src/bind_config.c
>         ++++ b/src/bind_config.c
>         +@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
>         + return;
>         + }
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         + SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>         + filename);
>         +@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind
>         bind, const char *filename)
>         + * option to be redefined later by another file. */
>         + uint8_t seen[BIND_CFG_MAX] = {0};
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         + return 0;
>         + }
>         +diff --git a/src/config.c b/src/config.c
>         +index b4171efd..1ffad537 100644
>         +--- a/src/config.c
>         ++++ b/src/config.c
>         +@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
>         + return;
>         + }
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         +- SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
>         +- filename);
>         ++ /* The underlying function logs the reasons */
>         + return;
>         + }
>         +
>         +@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session
>         session, const char *filename)
>         + int parsing, rv;
>         + bool global = 0;
>         +
>         +- f = fopen(filename, "r");
>         ++ f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (f == NULL) {
>         ++ /* The underlying function logs the reasons */
>         + return 0;
>         + }
>         +
>         +diff --git a/src/dh-gex.c b/src/dh-gex.c
>         +index 46ba934e..428a5655 100644
>         +--- a/src/dh-gex.c
>         ++++ b/src/dh-gex.c
>         +@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char
>         *moduli_file,
>         + }
>         +
>         + if (moduli_file != NULL)
>         +- moduli = fopen(moduli_file, "r");
>         ++ moduli = ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
>         + else
>         +- moduli = fopen(MODULI_FILE, "r");
>         ++ moduli = ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
>         +
>         + if (moduli == NULL) {
>         + char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         +diff --git a/src/known_hosts.c b/src/known_hosts.c
>         +index 3ef83e21..701576ce 100644
>         +--- a/src/known_hosts.c
>         ++++ b/src/known_hosts.c
>         +@@ -83,7 +83,7 @@ static struct ssh_tokens_st
>         *ssh_get_knownhost_line(FILE **file,
>         + struct ssh_tokens_st *tokens = NULL;
>         +
>         + if (*file == NULL) {
>         +- *file = fopen(filename,"r");
>         ++ *file = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (*file == NULL) {
>         + return NULL;
>         + }
>         +diff --git a/src/knownhosts.c b/src/knownhosts.c
>         +index a2d08a75..3ab468de 100644
>         +--- a/src/knownhosts.c
>         ++++ b/src/knownhosts.c
>         +@@ -232,7 +232,7 @@ static int
>         ssh_known_hosts_read_entries(const char *match,
>         + FILE *fp = NULL;
>         + int rc;
>         +
>         +- fp = fopen(filename, "r");
>         ++ fp = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
>         + if (fp == NULL) {
>         + char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         + SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file
>         '%s': %s",
>         +diff --git a/src/misc.c b/src/misc.c
>         +index 774211fb..3968e6bc 100644
>         +--- a/src/misc.c
>         ++++ b/src/misc.c
>         +@@ -37,6 +37,7 @@
>         + #endif /* _WIN32 */
>         +
>         + #include <errno.h>
>         ++#include <fcntl.h>
>         + #include <limits.h>
>         + #include <stdio.h>
>         + #include <string.h>
>         +@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
>         + return !(t != NULL && t[0] == '1');
>         + }
>         +
>         ++/**
>         ++ * @internal
>         ++ *
>         ++ * @brief Safely open a file containing some configuration.
>         ++ *
>         ++ * Runs checks if the file can be used as some configuration
>         file (is regular
>         ++ * file and is not too large). If so, returns the opened file
>         (for reading).
>         ++ * Otherwise logs error and returns `NULL`.
>         ++ *
>         ++ * @param filename The path to the file to open.
>         ++ * @param max_file_size Maximum file size that is accepted.
>         ++ *
>         ++ * @returns the opened file or `NULL` on error.
>         ++ */
>         ++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
>         ++{
>         ++ FILE *f = NULL;
>         ++ struct stat sb;
>         ++ char err_msg[SSH_ERRNO_MSG_MAX] = {0};
>         ++ int r, fd;
>         ++
>         ++ /* open first to avoid TOCTOU */
>         ++ fd = open(filename, O_RDONLY);
>         ++ if (fd == -1) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to open a file %s for reading: %s",
>         ++ filename,
>         ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ return NULL;
>         ++ }
>         ++
>         ++ /* Check the file is sensible for a configuration file */
>         ++ r = fstat(fd, &sb);
>         ++ if (r != 0) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to stat %s: %s",
>         ++ filename,
>         ++ ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++ if ((sb.st_mode & S_IFMT) != S_IFREG) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "The file %s is not a regular file: skipping",
>         ++ filename);
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ if ((size_t)sb.st_size > max_file_size) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "The file %s is too large (%jd MB > %zu MB): skipping",
>         ++ filename,
>         ++ (intmax_t)sb.st_size / 1024 / 1024,
>         ++ max_file_size / 1024 / 1024);
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ f = fdopen(fd, "r");
>         ++ if (f == NULL) {
>         ++ SSH_LOG(SSH_LOG_RARE,
>         ++ "Failed to open a file %s for reading: %s",
>         ++ filename,
>         ++ ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
>         ++ close(fd);
>         ++ return NULL;
>         ++ }
>         ++
>         ++ /* the flcose() will close also the underlying fd */
>         ++ return f;
>         ++}
>         ++
>         + /** @} */
>         +diff --git a/tests/unittests/torture_config.c b/tests/
>         unittests/torture_config.c
>         +index fcfe8fbc..0cb31a76 100644
>         +--- a/tests/unittests/torture_config.c
>         ++++ b/tests/unittests/torture_config.c
>         +@@ -2675,6 +2675,23 @@ static void
>         torture_config_match_complex(void **state)
>         + ssh_string_free_char(v);
>         + }
>         +
>         ++/* Invalid configuration files
>         ++ */
>         ++static void torture_config_invalid(void **state)
>         ++{
>         ++ ssh_session session = *state;
>         ++
>         ++ ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
>         ++
>         ++ /* non-regular file -- ignored (or missing on non-unix) so OK */
>         ++ _parse_config(session, "/dev/random", NULL, SSH_OK);
>         ++
>         ++#ifndef _WIN32
>         ++ /* huge file -- ignored (or missing on non-unix) so OK */
>         ++ _parse_config(session, "/proc/kcore", NULL, SSH_OK);
>         ++#endif
>         ++}
>         ++
>         + int torture_run_tests(void)
>         + {
>         + int rc;
>         +@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
>         + setup, teardown),
>         + cmocka_unit_test_setup_teardown(torture_config_match_complex,
>         + setup, teardown),
>         ++ cmocka_unit_test_setup_teardown(torture_config_invalid,
>         ++ setup,
>         ++ teardown),
>         + };
>         +
>         +
>         +--
>         +2.51.0
>         +
>         diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/
>         meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         index 193ff3512d..c552692bde 100644
>         --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>         @@ -14,6 +14,7 @@ SRC_URI = "git://git.libssh.org/projects/
>         libssh.git;protocol=https;branch=stable
>         file://CVE-2026-0968_p1.patch \
>         file://CVE-2026-0968_p2.patch \
>         file://CVE-2026-0967.patch \
>         + file://CVE-2026-0965.patch \
>         "
> 
>         SRC_URI:append:toolchain-clang = " file://0001-
>         CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>         --
>         2.35.6
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126110): https://lists.openembedded.org/g/openembedded-devel/message/126110
> Mute This Topic: https://lists.openembedded.org/mt/118688803/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


