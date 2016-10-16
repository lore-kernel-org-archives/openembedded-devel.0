Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id BCC8A71A4B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 17:22:17 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so6803093vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HJUZaStPMEEzDy7Phy/aV1K1/REXFHkGZl0FcpRDboM=;
	b=yWswg5t0ReXA3vHc2aKtIpUYHMM53wDGkNsPClVW63ucnltWGx4YqMHfMjxhAUR74P
	4LiXsAxmZGK7+bG0HYt0TVmZkBaXvqdTDKMMnxBSVFkaXhbtyvN71/Qfd9A7R/8s67Yh
	BGaQLIysjb7jU7Naae+uaPIX2jPXsYvSSXtwzYApx3JLHPJ5AgIG78E2xt0CkRLEe55M
	p13pILITiU9xZtUPpwRzizWtHbwFc7RilnpBE/CbVTYqZumMuhc4Lbl8DhZ1TvvKiEVJ
	8b/6a+0nGmhhHO0mgNLQIakzLDPhCvGbex1kklrLhMxdWJda4tuei/9Cs52gLJk0EP2x
	phfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HJUZaStPMEEzDy7Phy/aV1K1/REXFHkGZl0FcpRDboM=;
	b=WH4AHZA/MHpWjRRtum1SEV/8DINuF9UZa5u/WDik/awYob2LCXX8wYkiV9xRdlSrKe
	SI6H+CM3us0SuhT+47XjvpHsHmkypLjGZzDA+wuwMYpYPsoXkBNZOpm/5g/i/YJKfNkJ
	crD8Ol3cZTHjwawS+W+unQ5fw0m2HplYM1UpXCtjzynrTDauCnHGVPwg1NPnDXDyckoC
	U79ISFVF7cNJTG96MkNuaRTuctPsiVL34ywSJCundUekCJDEmswZphl7PgxYVks3eJNX
	Yta08LjCM/aG/A9sEOzL/MDrV0AaBIo07ybcmugDywLhrljDVU/d/B5B5JAFFuw/T4hU
	50qA==
X-Gm-Message-State: AA6/9RlDo9na/QfW8KHE73YmwfQvKL0UYP2Z+Zgh4CQz5gWuagRHyByj54ybRBwFZCfXicLWd01McHr2q0rINQ==
X-Received: by 10.31.244.14 with SMTP id s14mr14683928vkh.31.1476638538293;
	Sun, 16 Oct 2016 10:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 16 Oct 2016 10:21:47 -0700 (PDT)
In-Reply-To: <877f98xqy9.fsf@parenteses.org>
References: <1476620149-25938-1-git-send-email-mario.goulart@gmail.com>
	<278c88df-7054-8cb9-5af6-3f3637dfc1fe@mlbassoc.com>
	<877f98xqy9.fsf@parenteses.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2016 10:21:47 -0700
Message-ID: <CAMKF1somK-1MMJgRZNJW=mgn-PdtsVrX5GbP5d-2MJkTY_05Mw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH] postgresql.inc: Fix do_configure error (could not find Python.h)
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
X-List-Received-Date: Sun, 16 Oct 2016 17:22:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 16, 2016 at 8:18 AM, Mario Domenech Goulart
<mario.goulart@gmail.com> wrote:
> Hi Gary,
>
> On Sun, 16 Oct 2016 15:43:02 +0200 Gary Thomas <gary@mlbassoc.com> wrote:
>
>> On 2016-10-16 14:15, Mario Domenech Goulart wrote:
>>> Fixes:
>>>
>>> | checking for Python.h... no
>>> | configure: error: header file <Python.h> is required for Python
>>> | NOTE: The following config.log files may provide further information.
>>> | WARNING: exit code 1 from a shell command.
>>> | NOTE: .../tmp/work/armv5e-poky-linux-gnueabi/postgresql/9.4.8-r0.0/build/config.log
>>> | ERROR: configure failed
>>>
>>> Signed-off-by: Mario Domenech Goulart <mario.goulart@gmail.com>
>>> ---
>>>  meta-oe/recipes-support/postgresql/postgresql.inc | 8 ++------
>>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
>>> index 9592c79..454624c 100644
>>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>>> @@ -40,6 +40,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
>>>
>>>  inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
>>>
>>> +CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>> +
>>>  SYSTEMD_SERVICE_${PN} = "postgresql.service"
>>>  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>>>
>>> @@ -109,12 +111,6 @@ python populate_packages_prepend() {
>>>  }
>>>
>>>  do_configure() {
>>> -    # do_configure_prepend
>>> -    # make sure configure finds python includdirs with these envs
>>> -    export \
>>> -           STAGING_INCDIR=${STAGING_INCDIR} \
>>> -           STAGING_LIBDIR=${STAGING_LIBDIR}
>>> -
>>>      # do_configure
>>>      autotools_do_configure
>>>
>>>
>>
>> Why is this needed?  I just built the existing recipe in a bare build
>> without any problems.  Perhaps I'm missing something?
>
> Maybe I'm running into a race condition.  Now I tried again and could
> not reproduce the Python issue (tried both master and krogoth).
> However, in both master and krogoth I get the following error after
> cleaning sstate for postgresql, removing $TMPDIR and building postgresql
> again:
>
> | checking for tclsh... no
> | checking for tcl... no
> | checking for tclsh8.6... no
> | checking for tclsh86... no
> | checking for tclsh8.5... no
> | checking for tclsh85... no
> | checking for tclsh8.4... no
> | checking for tclsh84... no
> | checking for tclsh8.3... no
> | checking for tclsh83... no
> | configure: error: Tcl shell not found
> | WARNING: exit code 1 from a shell command.
>

This is a different error probably missing a dependency on tcl, if its missing
then add it via a pkgconfig or disable it explicitly with --disable-tcl

> When I could reproduce the issue, I checked the sysroot directory and
> Python.h was in ${STAGING_INCDIR}/${PYTHON_DIR}, not in
> ${STAGING_INCDIR}.  ${STAGING_INCDIR}/${PYTHON_DIR} was not in the
> compiler's include path and the code included Python.h with
> "#include <Python.h>".
>
> Naturally, it is possible that _I_ am missing something.
>
>> Also, would it not be better to just add python to DEPENDS?
>
> Python gets added to DEPENDS via PACKAGECONFIG.

That should do the needed bits of adding it to depends. However unless we have
some packageconfig or somesuch exposing the subdir for python inside includedir
compiler will not find it. It will be interesting to know the
commandline from config.log
where its complaining about missing python.h secondly, there could be
some mechanism
in postgresql build system to detect it and its not triggering for
some reason in failing
case.

>
> All the best.
> Mario
> --
> http://parenteses.org/mario
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

