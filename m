Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5A78D77980
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 19:10:08 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id t20so77029979wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=JhIPeKuxSxi0x/silhlUIicIoqFqDiiYi11O0na6emQ=;
	b=KMZCmyFD2dyhdknX11Mp138yUBVpEHhuZfIvZjeJnjfBXlxIm4vY3wsTqofKYBlc9I
	F81CNbq5/zJ41W5l8Yyb8IbWZmiKL0GraO1DZ3vWithErlRxdwQdk14sUjnJK1qxSIS3
	v9O1zEh3oAKfnSxu8jXyVJr6gcANgloZTyGqmew3g8lJanZVb9/VoaB9Cy47lrXmzbQl
	31WoPrCGFKvVT9Hkk8zwALPgZzp0TKV3TSbP1lpZxLI8eGBUO3hPzjPn6DC8d2bQdSib
	PlNKPURCA3hAe/B418jGx/LHW3ZKwi/OlaQold4Fkai3kgIWTHmCflpHdLdqZJLY6PZq
	yXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=JhIPeKuxSxi0x/silhlUIicIoqFqDiiYi11O0na6emQ=;
	b=daBo6hqxNSnbG5Ai8Ua006xrZAxWQfAOk3NcOKFC74Mu6e6QjYkQk9Y5cUOJo9Ymnr
	k8DrpaX7Oz7ogge+nCp9FxOtQ6YPuC36SZgz3F1JkVBNyoqnp6zFtsNjK/aeVj5kZK7o
	USYMIKZFohaE3a/VTfKoz5SLdMEOqYq1BXCiH2wNDUTzxEOBQNZJJ5/LIQffDPhWm1bn
	vLEJiLgqqAchwq84WK1TB3GtgR7euj+M46FBrUwWbOFLYAI6KMpYA24DSLsCdPR4bUer
	vHwoQh0d8fohziweeidsOCYI6cLPDkYZFJw7UAiO+46Kv80py68QSxhOlFgEMT58eVWQ
	T2mw==
X-Gm-Message-State: AFeK/H3fgobCkrpbte2eg0bOQqjQkZgxi9LOzb4AXVBYhDlZNVL3fW1XbOK5OZ8cehL8e9Xv+E0hXwxZ4TXGiw==
X-Received: by 10.28.69.68 with SMTP id s65mr26040410wma.13.1491505809678;
	Thu, 06 Apr 2017 12:10:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 6 Apr 2017 12:09:39 -0700 (PDT)
In-Reply-To: <20170406141730.GB17864@graute-opti>
References: <20170405134010.GA18688@graute-opti>
	<CAMKF1sq7vX1rwFL062BB_8UXeCxzQcdyr=PsZsUvEsfwqs-QjA@mail.gmail.com>
	<20170406141730.GB17864@graute-opti>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Apr 2017 12:09:39 -0700
Message-ID: <CAMKF1soKO0BSG96Lf41m4kXXptGBHj6dvOX77_MgxYg=_B=YGw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] unbound: this patch adds unbound to meta-networking
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
X-List-Received-Date: Thu, 06 Apr 2017 19:10:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 7:17 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
> On 05/04/17, Khem Raj wrote:
>> On Wed, Apr 5, 2017 at 6:40 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
>> > +HOMEPAGE = "https://www.unbound.net/"
>> > +SECTION = "net"
>> > +LICENSE = "BSD"
>>
>> Can you see which clause it is ? it will make it more clear
>
> is this BSD-4-Clause?
> https://unbound.nlnetlabs.nl/svn/trunk/LICENSE

looks like 2-Clause

>
>> > +do_install () {
>> > +        install -d ${D}${bindir}
>> > +        install -d ${D}${libdir}
>> > +        install -d ${D}${sysconfdir}
>> > +        install -m 644 -D ${S}/libunbound/unbound.h ${D}${includedir}/unbound.h
>> > +        install -m 644 -D ${S}/doc/example.conf.in ${D}${sysconfdir}/unbound/unbound.conf
>> > +        install -m 644 -D ${S}/contrib/unbound.service.in ${D}${libdir}/systemd/unbound.service
>> > +        install -m 755 unbound ${D}${bindir}
>> > +        install -m 755 unbound-anchor ${D}${bindir}
>> > +        install -m 755 unbound-checkconf ${D}${bindir}
>> > +        install -m 755 unbound ${D}${bindir}
>> > +        install -m 755 unbound-control-setup ${D}${bindir}
>> > +        install -m 755 unbound-host ${D}${bindir}
>> > +        install -m 755 ${WORKDIR}/build/.libs/libunbound.so* ${D}${libdir}
>> > +}
>>
>> do this in a do_install_append()
>
> this breaks my packaging. /usr/local/share and /usr/local/lib are not my
> desired dirs. I prefer /usr/share and /usr/lib. I also don't need the
> man pages. How do I put them into extra packacke?
> Some clue to fix this the righty way?
>
> ERROR: QA Issue: unbound: Files/directories were installed but not shipped in any package:
>   /usr/local
>   /usr/local/share
>   /usr/local/lib
>   /usr/local/include
>   /usr/local/share/man
>   /usr/local/share/man/man8
>   /usr/local/share/man/man3
>   /usr/local/share/man/man5
>   /usr/local/share/man/man1
>   /usr/local/share/man/man8/unbound-control-setup.8
>   /usr/local/share/man/man8/unbound-checkconf.8
>   /usr/local/share/man/man8/unbound-control.8
>   /usr/local/share/man/man8/unbound-anchor.8
>   /usr/local/share/man/man8/unbound.8
>   /usr/local/share/man/man3/ub_strerror.3
>   /usr/local/share/man/man3/ub_ctx_set_fwd.3
>   /usr/local/share/man/man3/ub_wait.3
>   /usr/local/share/man/man3/ub_result.3
>   /usr/local/share/man/man3/ub_resolve.3
>   /usr/local/share/man/man3/ub_ctx_create.3
>   /usr/local/share/man/man3/ub_ctx_hosts.3
>   /usr/local/share/man/man3/ub_ctx_data_add.3
>   /usr/local/share/man/man3/ub_ctx_add_ta.3
>   /usr/local/share/man/man3/ub_poll.3
>   /usr/local/share/man/man3/ub_ctx_async.3
>   /usr/local/share/man/man3/ub_ctx_debugout.3
>   /usr/local/share/man/man3/ub_ctx.3
>   /usr/local/share/man/man3/ub_resolve_free.3
>   /usr/local/share/man/man3/ub_ctx_set_option.3
>   /usr/local/share/man/man3/libunbound.3
>   /usr/local/share/man/man3/ub_ctx_add_ta_file.3
>   /usr/local/share/man/man3/ub_ctx_get_option.3
>   /usr/local/share/man/man3/ub_resolve_async.3
>   /usr/local/share/man/man3/ub_ctx_zone_remove.3
>   /usr/local/share/man/man3/ub_ctx_print_local_zones.3
>   /usr/local/share/man/man3/ub_ctx_zone_add.3
>   /usr/local/share/man/man3/ub_ctx_resolvconf.3
>   /usr/local/share/man/man3/ub_ctx_config.3
>   /usr/local/share/man/man3/ub_cancel.3
>   /usr/local/share/man/man3/ub_ctx_delete.3
>   /usr/local/share/man/man3/ub_ctx_debuglevel.3
>   /usr/local/share/man/man3/ub_ctx_data_remove.3
>   /usr/local/share/man/man3/ub_fd.3
>   /usr/local/share/man/man3/ub_ctx_trustedkeys.3
>   /usr/local/share/man/man3/ub_process.3
>   /usr/local/share/man/man5/unbound.conf.5
>   /usr/local/share/man/man1/unbound-host.1
>   /usr/local/lib/libunbound.la
>   /usr/local/lib/libunbound.a
>   /usr/local/lib/libunbound.so
>   /usr/local/lib/libunbound.so.2
>   /usr/local/lib/libunbound.so.2.4.4
>   /usr/local/lib/.debug
>   /usr/local/lib/.debug/libunbound.so.2.4.4
>   /usr/local/include/unbound.h
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> unbound: 55 installed and not shipped files. [installed-vs-shipped]
>
>
> Best regards,
>
> Oliver
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

