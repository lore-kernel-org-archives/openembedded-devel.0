Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C25D3517C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 12:57:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12474.1775048213863298913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 05:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sIGIwCnJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so62990645e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775048212; x=1775653012; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dElrVLyGd3r7TC1l5Ed3NzCNYFIANeFETsHF4sObWg0=;
        b=sIGIwCnJZlabzQjmyXatuJua/s5AMMZN4Au4G3yF6a7dmOewGlABGmllUI2+BBuMBc
         Q73u53pAgIVAcuTVaeMJPSX4NSVUTAsLkcMLES8YJtCT0eIYnyVe+vGPIXF5AE2WLJDW
         wAu0tMiR//eu6D/KVR+D2I6Q9Ti24nd+8j/oVJVM6ajlRdtiQyovz1+7EOcGky4gIQbn
         tKH7oNfvx4zwEI/cgQykKmChJp9Y9cwJ8TZXSzPZvcz21zAHR6RkBTlSludeCfmOGxN/
         WGEycZ7OnULdEJQnO/Ux3K5NVUQdXGVxDAlvKc7Fvdkk8jAmX1q/A9lcmqknfYh7m6aj
         zyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775048212; x=1775653012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dElrVLyGd3r7TC1l5Ed3NzCNYFIANeFETsHF4sObWg0=;
        b=GkOcDSq445buTnZ94qBaRoAlWz4KhkFzT3CCNMYU4J63/bJC99GaW+kaeFZmaIzfqu
         Y/aNjGr/xCBrToRXgqDFhhNnAsQaJ51qjyphvmpX+1gQfNvVRYnYE471EgUsTnpqN0dW
         46Mg7s4Dj34ubDxHRGZD5zEDSTyI87UPkW43bmil9CFibSk7tIk/OJzh0kIeKtM3isL6
         qyGMy3GDuZUYhrAwVix3Xg5WR/5//BoS3xe+jELajvecx5kV1DkzDAZaowpf7LTXFSmn
         4SvdWJeK4fAohcA1+iHp4/KV1llheIuWilfPqHCrTT71m7IGugSWR+zPaxZeyHvce20f
         GlHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIhFM2qk4M28gpIWBus3cdirks8SmxW3jK7e/lTIR2oe6po1QlQWjx/Pe8oImdTE0NbMWP9MI0NaLSOGK/UNjcDeA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzGmramZYiTSOGgACDVeFP9cyyN1DnLTqVbWIQis8G692rk5D/
	YCz+0Ut/FVYK96KRsk9/UJ+JyrMEVTgLVd+eFgqBG4FeeL8P5xtr/ccP
X-Gm-Gg: ATEYQzyB7Rt/VlIun8jDcJVAbxuOY450YOWmE67/PPmDlWjo7OV4mvyT3x8RJDaKUAm
	mFS5S/WkuceuA8vTOpKRlILhHVHwDqYFmTbGmaAKedfWAPfeep1z3b8obdOj9hZFtPXNqS9+qmg
	9jhVUtXZJMCeokc1dqq+KWG8rkLKxiu+6Y4MNm8i5sXXtyQ1H7Z8oKq7OeXAW3K4NELITZ7ZF9o
	UZ6shqRA6V/WYg+b+UXRJt2UoHtPdSzbr+5OohzNu+MMwYwWarMz0P4kX97OiGsnRiWS0Lqt7JS
	7iZ87C9YRWtnip7S6Dvkap3OuU3EQSzzgbBlc1pLgNKA/YsgtA2wZNnYIOOXo0ifqXt97ukIdgp
	FbVJt49H43vRVHTG0fWWT8pgAIDq+40vpNCcgnMT0qxVgb7H6cjicHPFiGhB71XMTByqGdtAQDu
	x0Sl14KFpLUZmoA7jufSVMnaKhaoXdu9Q=
X-Received: by 2002:a05:600c:4f95:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4888356754dmr58158045e9.13.1775048211922;
        Wed, 01 Apr 2026 05:56:51 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888955d711sm12549855e9.9.2026.04.01.05.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:56:51 -0700 (PDT)
Message-ID: <69cf966d-70b3-492a-afbd-9dcaf1d2ab5f@gmail.com>
Date: Wed, 1 Apr 2026 14:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] neon: Backport redirect test
 debug improvements
To: bindudaniel1996@gmail.com, openembedded-devel@lists.openembedded.org,
 bhabu.bindu@kpit.com
References: <20260331083134.378318-1-bhabu.bindu@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260331083134.378318-1-bhabu.bindu@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 12:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125908

Thanks for this patch, I plan to test and merge it, since it seems to
touch only test code.

Would like to ask 2 questions though.
1. The patches are numbered from 1/5 to 4/5. But there is no 5/5. Is
this intentional?
2. While running the ptests, I know about some flaky test cases, but I
can't recall this recipe ever failing for me (which doesn't mean that
the problem doesn't exist).
Do you happen to have some instructions, how to reproduce it? Is it more
involved than "run it lots of times"? I run the Kirkstone tests with
qemux86-64, if the arch matters.


On 3/31/26 10:31, BINDU via lists.openembedded.org wrote:
> The redirect test in neon 0.30.2 intermittently fails with
> "did not get NE_REDIRECT", making it hard to debug.
> 
> Backport relevant upstream changes from updated neon version to:
> - log actual return value when NE_REDIRECT is not received
> - use double_serve_sstring for improved test reliability
> 
> Upstream-Status: Backport
> [https://github.com/notroj/neon/commit/f7a3d8f1366c7df6578d79af3b5d28a316011be0]
> [https://github.com/notroj/neon/commit/0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619]
> [https://github.com/notroj/neon/commit/1e562888d85efc492c434474c8d90cef3aaa8b18]
> [https://github.com/notroj/neon/commit/9e836bb63bf41fd78e12175cd7b35bfb07a031e3]
> 
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> ---
>  ...0001-Temporarily-disable-no_redirect.patch | 45 +++++++++++++++++
>  ...ling-no_redirect-with-more-debugging.patch | 50 +++++++++++++++++++
>  ...Switch-to-using-double_serve_sstring.patch | 48 ++++++++++++++++++
>  .../neon/0004-test-redirect.c-Cleanup.patch   | 49 ++++++++++++++++++
>  meta-oe/recipes-support/neon/neon_0.30.2.bb   |  4 ++
>  5 files changed, 196 insertions(+)
>  create mode 100644 meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
>  create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
>  create mode 100644 meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
>  create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
> 
> diff --git a/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch b/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
> new file mode 100644
> index 0000000000..891457fab2
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
> @@ -0,0 +1,45 @@
> +From f7a3d8f1366c7df6578d79af3b5d28a316011be0 Mon Sep 17 00:00:00 2001
> +From: Joe Orton <jorton@redhat.com>
> +Date: Thu, 7 Mar 2019 09:56:57 +0000
> +Subject: [PATCH 1/5] Temporarily disable redirect.c:no_redirect
> +
> +Upstream-Status: Backport
> +[https://github.com/notroj/neon/commit/f7a3d8f1366c7df6578d79af3b5d28a316011be0]
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + test/redirect.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/test/redirect.c b/test/redirect.c
> +index c93b388..920c481 100644
> +--- a/test/redirect.c
> ++++ b/test/redirect.c
> +@@ -162,6 +162,7 @@ static int fail_loop(void)
> + }
> + #endif
> + 
> ++#if 0
> + /* ensure that ne_redirect_location returns NULL when no redirect has
> +  * been encountered, or redirect hooks aren't registered. */
> + static int no_redirect(void)
> +@@ -187,6 +188,7 @@ static int no_redirect(void)
> +     ne_session_destroy(sess);
> +     return OK;
> + }
> ++#endif
> + 
> + ne_test tests[] = {
> +     T(lookup_localhost),
> +@@ -194,7 +196,9 @@ ne_test tests[] = {
> +     T(non_absolute),
> +     T(relative_1),
> +     T(relative_2),
> ++#if 0
> +     T(no_redirect),
> ++#endif
> +     T(NULL) 
> + };
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch b/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
> new file mode 100644
> index 0000000000..a6b524b52c
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
> @@ -0,0 +1,50 @@
> +From 0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619 Mon Sep 17 00:00:00 2001
> +From: Joe Orton <jorton@redhat.com>
> +Date: Mon, 8 Apr 2019 10:22:52 +0100
> +Subject: [PATCH 2/5] * test/redirect: Try re-enabling no_redirect with more
> + debugging.
> +
> +Upstream-Status: Backport
> +[https://github.com/notroj/neon/commit/0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619]
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + test/redirect.c | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/redirect.c b/test/redirect.c
> +index 920c481..e7ecc19 100644
> +--- a/test/redirect.c
> ++++ b/test/redirect.c
> +@@ -64,7 +64,10 @@ static int serve_redir(ne_socket *sock, void *ud)
> + static int process_redir(ne_session *sess, const char *path,
> +                          const ne_uri **redir)
> + {
> +-    ONN("did not get NE_REDIRECT", any_request(sess, path) != NE_REDIRECT);
> ++    int ret = any_request(sess, path);
> ++    ONV(ret != NE_REDIRECT,
> ++        ("request got %d (%s) rather than NE_REDIRECT",
> ++         ret, ne_get_error(sess)));
> +     *redir = ne_redirect_location(sess);
> +     return OK;
> + }
> +@@ -162,7 +165,7 @@ static int fail_loop(void)
> + }
> + #endif
> + 
> +-#if 0
> ++#if 01
> + /* ensure that ne_redirect_location returns NULL when no redirect has
> +  * been encountered, or redirect hooks aren't registered. */
> + static int no_redirect(void)
> +@@ -196,7 +199,7 @@ ne_test tests[] = {
> +     T(non_absolute),
> +     T(relative_1),
> +     T(relative_2),
> +-#if 0
> ++#if 1
> +     T(no_redirect),
> + #endif
> +     T(NULL) 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch b/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
> new file mode 100644
> index 0000000000..c8278cc701
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
> @@ -0,0 +1,48 @@
> +From 1e562888d85efc492c434474c8d90cef3aaa8b18 Mon Sep 17 00:00:00 2001
> +From: Joe Orton <jorton@redhat.com>
> +Date: Mon, 8 Apr 2019 10:32:27 +0100
> +Subject: [PATCH 3/5] * test/redirect.c (no_redirect): Switch to using
> + double_serve_sstring.
> +
> +Upstream-Status: Backport
> +[https://github.com/notroj/neon/commit/1e562888d85efc492c434474c8d90cef3aaa8b18]
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + test/redirect.c | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/test/redirect.c b/test/redirect.c
> +index e7ecc19..42deadb 100644
> +--- a/test/redirect.c
> ++++ b/test/redirect.c
> +@@ -166,17 +166,23 @@ static int fail_loop(void)
> + #endif
> + 
> + #if 01
> ++
> ++#define RESP1 "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
> ++#define RESP2 "HTTP/1.0 302 Get Ye Away\r\n" "Location: /blah\r\n" "\r\n"
> + /* ensure that ne_redirect_location returns NULL when no redirect has
> +  * been encountered, or redirect hooks aren't registered. */
> + static int no_redirect(void)
> + {
> +     ne_session *sess;
> +     const ne_uri *loc;
> ++    struct double_serve_args resp;
> ++
> ++    resp.first.data = RESP1;
> ++    resp.first.len = strlen(RESP1);
> ++    resp.second.data = RESP2;
> ++    resp.second.len = strlen(RESP2);
> + 
> +-    CALL(session_server(&sess, single_serve_string, 
> +-                        "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
> +-                        "HTTP/1.0 302 Get Ye Away\r\n"
> +-                        "Location: /blah\r\n" "\r\n"));
> ++    CALL(session_server(&sess, double_serve_sstring, &resp));
> +     ONN("redirect non-NULL before register", ne_redirect_location(sess));
> +     ne_redirect_register(sess);
> +     ONN("initial redirect non-NULL", ne_redirect_location(sess));
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch b/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
> new file mode 100644
> index 0000000000..e92864bc19
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
> @@ -0,0 +1,49 @@
> +From 9e836bb63bf41fd78e12175cd7b35bfb07a031e3 Mon Sep 17 00:00:00 2001
> +From: Joe Orton <jorton@redhat.com>
> +Date: Mon, 8 Apr 2019 10:35:42 +0100
> +Subject: [PATCH 4/5] * test/redirect.c: Cleanup.
> +
> +Upstream-Status: Backport
> +[https://github.com/notroj/neon/commit/9e836bb63bf41fd78e12175cd7b35bfb07a031e3]
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + test/redirect.c | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/test/redirect.c b/test/redirect.c
> +index 42deadb..682097d 100644
> +--- a/test/redirect.c
> ++++ b/test/redirect.c
> +@@ -165,10 +165,9 @@ static int fail_loop(void)
> + }
> + #endif
> + 
> +-#if 01
> +-
> + #define RESP1 "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
> + #define RESP2 "HTTP/1.0 302 Get Ye Away\r\n" "Location: /blah\r\n" "\r\n"
> ++
> + /* ensure that ne_redirect_location returns NULL when no redirect has
> +  * been encountered, or redirect hooks aren't registered. */
> + static int no_redirect(void)
> +@@ -197,7 +196,6 @@ static int no_redirect(void)
> +     ne_session_destroy(sess);
> +     return OK;
> + }
> +-#endif
> + 
> + ne_test tests[] = {
> +     T(lookup_localhost),
> +@@ -205,9 +203,7 @@ ne_test tests[] = {
> +     T(non_absolute),
> +     T(relative_1),
> +     T(relative_2),
> +-#if 1
> +     T(no_redirect),
> +-#endif
> +     T(NULL) 
> + };
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-support/neon/neon_0.30.2.bb
> index 646a9eca13..f620d547a9 100644
> --- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
> +++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
> @@ -9,6 +9,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
>             file://pkgconfig.patch \
>             file://fix-package-check-for-libxml2.patch \
>             file://run-ptest \
> +           file://0001-Temporarily-disable-no_redirect.patch \
> +           file://0002-Re-enabling-no_redirect-with-more-debugging.patch \
> +           file://0003-no_redirect-Switch-to-using-double_serve_sstring.patch \
> +           file://0004-test-redirect.c-Cleanup.patch \
>            "
>  
>  SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125878): https://lists.openembedded.org/g/openembedded-devel/message/125878
> Mute This Topic: https://lists.openembedded.org/mt/118593282/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


