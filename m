Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id F05A160107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:01:45 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id i68so55085874uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=VeHn6CstVV87MdacSytAYRQKiOkHWZJA7v30lC4J8Vo=;
	b=upb0V+GLuoT0fKXgBG20AjcUID7U1FI/kimqoJXHakbFVCzkwwZN858IyA0rJNJZKO
	FbcjkBQNF+bRGaUvktQdEr3mihItaVXKTEtdUPhrEygZtlSrv1hsmCC+5g0t4pgAvUPm
	upOdF5u4JLFcouJZzSIMUkGRoUnx+O22BZgLMvq/3V59JjnfkJvb/YCJHPI9r2lQ5Obu
	+0ZlwQzqnLkwKuilyihZYoo3htVBqq2H1J7KG8nD1DdG3sYuWY48XxUpqbJUCEYVLBbe
	At8t9vgF8/n0qIo8FpLn/1emk0KiGQ3CRfI1WIXVR8k05OlyBSh/Bb1n/KPGgFfZqgjg
	ylYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=VeHn6CstVV87MdacSytAYRQKiOkHWZJA7v30lC4J8Vo=;
	b=mmpctHC6Eo9qOjMRLJ4J1Q8uybkFBn0pz3XXJiPfac/zFQA0qrmd7vD510nrl3im2a
	juF4CVMcrV8ErbQGpEleEh0dnzwlsYWCOvPjyX3Vej8lz9i3sF8MOf1G0B9J57icTitQ
	szasm5KYzZCMlVQH2ajIyC4jn/k1jx4C5GhzzP1edeHyO6gsfnW1XH8l11oUefyQRCHX
	ZEn9UKGGrcdR0t7KPzriHEDx+BPblIjziOJX5HKUJiMoZEf4xtfAyUkrjJq9aLkGt/08
	cfl7TtvcyaOB/MIOGNfZOClBptnxvUyA+N++4OyJkEbKG59Okmdnn0jP0thbXwAVe2/w
	LElQ==
X-Gm-Message-State: AIkVDXJAt7SAKU2JbZUralt/4aLLYThPDpDco45jSojP1VfB93xhvsneqDWOVoefW+X4VBrySRZOGSqaUyjmBQ==
X-Received: by 10.159.53.1 with SMTP id o1mr1888211uao.76.1484136105944; Wed,
	11 Jan 2017 04:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Wed, 11 Jan 2017 04:01:45 -0800 (PST)
In-Reply-To: <CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 11 Jan 2017 13:01:45 +0100
Message-ID: <CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:01:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 12:57 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> This patch doesn't apply.
>
> On Tue, Jan 10, 2017 at 4:48 PM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
>
>> nspr-config adds path /usr/include
>>
>> which causes lots of
>>
>> | cc1plus: warning: include location "/usr/include" is unsafe for
>> cross-compilation [-Wpoison-system-directories]
>>
>> and finally fails with
>>
>> | In file included from /usr/include/sys/syscall.h:31:0,
>> |                  from <workdir>/cortexa7hf-neon-
>> vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-
>> 45.5.1esr/firefox-build-dir/dist/system_wrappers/sys/syscall.h:4,
>> |                  from <workdir>/cortexa7hf-neon-
>> vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-
>> 45.5.1esr/memory/mozjemalloc/jemalloc.c:397:
>> | <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/
>> firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c: In
>> function '_mmap':
>> | <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/
>> firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c:417=
:26:
>> error: '__NR_mmap2' undeclared (first use in this function)
>> |   return (void *) syscall(SYS_mmap2, addr, length, prot, flags,
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37
>> ++++++++++++++++++++++
>>  recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
>>  2 files changed, 38 insertions(+)
>>  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-
>> to-find-nspr.patch
>>
>> diff --git a/recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find=
-nspr.patch
>> b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch
>> new file mode 100644
>> index 0000000..d97570b
>> --- /dev/null
>> +++ b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-
>> to-find-nspr.patch
>> @@ -0,0 +1,37 @@
>> +From cdb21594b814af82c4128ccd1179267de2e0e780 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> +Date: Wed, 14 Dec 2016 22:57:55 +0100
>> +Subject: [PATCH] use pkg-config to find nspr
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +---
>> + configure | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure b/configure
>> +index 16133bf..806896a 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -15153,10 +15153,13 @@ fi
>> + echo "configure:15154: checking for NSPR - version >=3D $min_nspr_vers=
ion"
>> >&5
>> +
>> +       no_nspr=3D""
>> ++    NSPR_CONFIG=3D"pkg-config nspr"
>> ++    nspr_config_args=3D
>> +       if test "$NSPR_CONFIG" !=3D "no"; then
>> +               NSPR_CFLAGS=3D`$NSPR_CONFIG $nspr_config_args --cflags`
>> +               NSPR_LIBS=3D`$NSPR_CONFIG $nspr_config_args --libs`
>> +-              NSPR_VERSION_STRING=3D`$NSPR_CONFIG $nspr_config_args
>> --version`
>> ++              NSPR_VERSION_STRING=3D`$NSPR_CONFIG $nspr_config_args
>> --modversion`
>> ++              echo -n "$NSPR_VERSION_STRING... "
>> +       elif test -n "${NO_NSPR_CONFIG_SYSTEM_VERSION}"; then
>> +           NSPR_CFLAGS=3D"${NO_NSPR_CONFIG_SYSTEM_CFLAGS}"
>> +               NSPR_LIBS=3D"${NO_NSPR_CONFIG_SYSTEM_LDFLAGS}"
>> +--
>> +2.5.5
>> +
>> diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> index 6ca6633..a4ae32f 100644
>> --- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> +++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> @@ -40,6 +40,7 @@ SRC_URI =3D "https://archive.mozilla.org/
>> pub/firefox/releases/${PV}/source/firefox
>>             file://Fix-firefox-install-dir.patch \
>>             file://fixes/Correct-the-source-to-be-compatible-with-gcc6-b=
y-pre.patch
>> \
>>             file://0001-use-pkg-config-to-find-nss.patch \
>> +           file://0002-use-pkg-config-to-find-nspr.patch \
>>             "
>>
>>  SRC_URI[archive.md5sum] =3D "ee3cf2401a5716cebacaae5fb70d133f"
>> --
>> 2.5.5
>>
>> --
??? - will check and sen V3

Andreas

