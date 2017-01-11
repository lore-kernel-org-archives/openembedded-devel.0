Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85D0071A21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:04:07 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id k62so14620083lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zBYPL3uhXGCC8rPdPVYFLXqYZhMJpZrgRUa0wF00jFc=;
	b=VdHSXWzOWhJe5VATe9tGH6KUxSS01AnEBGe23l4pyw/kpPIoW0y2QcmefsVr+wpRVu
	d+r/u00ulUfGaWqzCdFHHjQD0T5jHj5HqSQ0jbJ3G8zq0xvbL0tJkXocQP9TWJTCQvj4
	XxmduNgYgmV3d+kK8W3OFEZ94PgKu7WDWljzaNx22IAEkLh2rVglMip52cIWbxF+U/Gl
	vkvmh2IPYKfhEt+qZyY7XOjmDqEytHppNOSINkqSgDJoktpxu/jUCEQlp1rWpfMc8Cub
	4KxXL+zEr/qaOvx3dyJPmawONbOw0pzV2CJHzObriPkK4xfCmGmlgxoXkyqrDLBs7xl2
	ezFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zBYPL3uhXGCC8rPdPVYFLXqYZhMJpZrgRUa0wF00jFc=;
	b=omZKQg8W/fWNZd1w8IAlFpARtIWd44NshzELhB6OYbNz/XcC0L+OPl0kWZZpDbOprd
	Eqrd3IBZxz9GarBNVgX6843VMarBSwNkcu8P6COxGDRuysRsEiwxQjTPhzaa8N56Qu/1
	s0//3fLiqACbq2zZ8OadCAs7wxQHbV5gm+Y64U8SI3qxKo+XQTIjMfFUw6j/nnVBsJUz
	HaNqU5EF9c1BSWz3H8L6yXYHlIaekshkLdKL25MeWTRAj1ceZRLbVXeSBan5KjiUSLzl
	dVFgcuesF+CD+OeghoS86k1TIJk7kNEaf9lSBBtMnLPtKIN7WRb6msZagyRnFfsiKXC1
	5GnQ==
X-Gm-Message-State: AIkVDXLq8HcCwPICw6M4NaR1Ku6Kl8YsTcNJwKqxeOpDKhdSyj7Mp1Bf5tF/jvoYEwXXaarBuZbL5stgshNO3A==
X-Received: by 10.46.21.2 with SMTP id s2mr3002076ljd.19.1484136246925; Wed,
	11 Jan 2017 04:04:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Wed, 11 Jan 2017 04:03:36 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 11 Jan 2017 10:03:36 -0200
Message-ID: <CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 11 Jan 2017 12:04:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ERROR: firefox-45.6.0esr-r0 do_patch: Command Error: 'quilt --quiltrc
../build/tmp/sysroots/x86_64-linux/etc/quiltrc push' exited with 0  Output:
Applying patch 0002-use-pkg-config-to-find-nspr.patch
patching file configure
Hunk #1 FAILED at 15153.
1 out of 1 hunk FAILED -- rejects in file configure
Patch 0002-use-pkg-config-to-find-nspr.patch does not apply (enforce with
-f)
ERROR: firefox-45.6.0esr-r0 do_patch: Function failed: patch_do_patch

On Wed, Jan 11, 2017 at 10:01 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Jan 11, 2017 at 12:57 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > This patch doesn't apply.
> >
> > On Tue, Jan 10, 2017 at 4:48 PM, Andreas M=C3=BCller <
> > schnitzeltony@googlemail.com> wrote:
> >
> >> nspr-config adds path /usr/include
> >>
> >> which causes lots of
> >>
> >> | cc1plus: warning: include location "/usr/include" is unsafe for
> >> cross-compilation [-Wpoison-system-directories]
> >>
> >> and finally fails with
> >>
> >> | In file included from /usr/include/sys/syscall.h:31:0,
> >> |                  from <workdir>/cortexa7hf-neon-
> >> vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-
> >> 45.5.1esr/firefox-build-dir/dist/system_wrappers/sys/syscall.h:4,
> >> |                  from <workdir>/cortexa7hf-neon-
> >> vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-
> >> 45.5.1esr/memory/mozjemalloc/jemalloc.c:397:
> >> | <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/
> >> firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c:
> In
> >> function '_mmap':
> >> | <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/
> >> firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/
> jemalloc.c:417:26:
> >> error: '__NR_mmap2' undeclared (first use in this function)
> >> |   return (void *) syscall(SYS_mmap2, addr, length, prot, flags,
> >>
> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> ---
> >>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37
> >> ++++++++++++++++++++++
> >>  recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
> >>  2 files changed, 38 insertions(+)
> >>  create mode 100644 recipes-mozilla/firefox/
> firefox/0002-use-pkg-config-
> >> to-find-nspr.patch
> >>
> >> diff --git a/recipes-mozilla/firefox/firefox/0002-use-pkg-config-
> to-find-nspr.patch
> >> b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-
> to-find-nspr.patch
> >> new file mode 100644
> >> index 0000000..d97570b
> >> --- /dev/null
> >> +++ b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-
> >> to-find-nspr.patch
> >> @@ -0,0 +1,37 @@
> >> +From cdb21594b814af82c4128ccd1179267de2e0e780 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@goog=
lemail.com>
> >> +Date: Wed, 14 Dec 2016 22:57:55 +0100
> >> +Subject: [PATCH] use pkg-config to find nspr
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Upstream-Status: Inappropriate [embedded specific]
> >> +
> >> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> +---
> >> + configure | 4 +++-
> >> + 1 file changed, 3 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/configure b/configure
> >> +index 16133bf..806896a 100755
> >> +--- a/configure
> >> ++++ b/configure
> >> +@@ -15153,10 +15153,13 @@ fi
> >> + echo "configure:15154: checking for NSPR - version >=3D
> $min_nspr_version"
> >> >&5
> >> +
> >> +       no_nspr=3D""
> >> ++    NSPR_CONFIG=3D"pkg-config nspr"
> >> ++    nspr_config_args=3D
> >> +       if test "$NSPR_CONFIG" !=3D "no"; then
> >> +               NSPR_CFLAGS=3D`$NSPR_CONFIG $nspr_config_args --cflags=
`
> >> +               NSPR_LIBS=3D`$NSPR_CONFIG $nspr_config_args --libs`
> >> +-              NSPR_VERSION_STRING=3D`$NSPR_CONFIG $nspr_config_args
> >> --version`
> >> ++              NSPR_VERSION_STRING=3D`$NSPR_CONFIG $nspr_config_args
> >> --modversion`
> >> ++              echo -n "$NSPR_VERSION_STRING... "
> >> +       elif test -n "${NO_NSPR_CONFIG_SYSTEM_VERSION}"; then
> >> +           NSPR_CFLAGS=3D"${NO_NSPR_CONFIG_SYSTEM_CFLAGS}"
> >> +               NSPR_LIBS=3D"${NO_NSPR_CONFIG_SYSTEM_LDFLAGS}"
> >> +--
> >> +2.5.5
> >> +
> >> diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> >> b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> >> index 6ca6633..a4ae32f 100644
> >> --- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> >> +++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
> >> @@ -40,6 +40,7 @@ SRC_URI =3D "https://archive.mozilla.org/
> >> pub/firefox/releases/${PV}/source/firefox
> >>             file://Fix-firefox-install-dir.patch \
> >>             file://fixes/Correct-the-source-to-be-compatible-with-
> gcc6-by-pre.patch
> >> \
> >>             file://0001-use-pkg-config-to-find-nss.patch \
> >> +           file://0002-use-pkg-config-to-find-nspr.patch \
> >>             "
> >>
> >>  SRC_URI[archive.md5sum] =3D "ee3cf2401a5716cebacaae5fb70d133f"
> >> --
> >> 2.5.5
> >>
> >> --
> ??? - will check and sen V3
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

