Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.25670.1606515895671871554
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 14:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sOSw4/aR;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b144so5594102qkc.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MY2mgt9e3Z3uavZ51ZX0k1FmdOocUqUhdPnC+fCHTSQ=;
        b=sOSw4/aRe9hsA75jPDbDf/1QYQXJdYdcDKmj7DkDWnsHXC4l7Bh+1BKOwfQbGJoTZv
         sOYNviCzAJJX3zukvOFciuvML0OlDC25EX7kyyryZpcjPLFZ5fopC0BcOBT+uG8wggci
         6PCevaongmhBGpwNFXW7hIHt/rSkVLeHVeBr7vT1f1rTON4pEqIrpMV5oZLquthcS75Z
         JIgJUPnPUrpcwO++1YdxGOyCQSXflTdhOviSykWbI8lqODr2DQj96kPq9U4WOKoYIgEC
         X2u9jzstMxbBNo05irNuf1OEOU9lPRwI2sXA+0uTlE125d5Sx5W49A5yR6PhhN2aW+r8
         aIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MY2mgt9e3Z3uavZ51ZX0k1FmdOocUqUhdPnC+fCHTSQ=;
        b=ttAsbJhWRpKAirroMSx22vZBg8cHP230r7R06kvnNJzwjU8EWsfDGshUEnpAabcVPm
         fM8AHS7l6luTw2CZYqqDcnCtUNexwWRMSrg+8hBmYeGaChAyQOiufrxfFnT6ZQ9hIMd8
         yVtGsjjUhWIK08XP7zgYZWhpgHRs27LNX5EAvub2QLRigUmWnyZlAE7jwSVMgWN+Ti6G
         Sdblo+dHgeqGp4GWhnYPb/31RFve/i+b+qkj57qSnx1l6R0k0HZKyNQUgjAkQgOZV5Vd
         j/gLglRvgO59u6W3Q5wnY04qvfgMv6N0LiYTFyOjvbHflm3RUDNw7V40j/nJVJyltSyd
         ktYg==
X-Gm-Message-State: AOAM53176NTOrJMrZyQBquaGtZHusJqgJKzJgvwy5KwvRLg6u1/MxM7E
	ocJXmDNUkiIqy6CZ/1yJlp5HWPIiJBFpjsE4SBc=
X-Google-Smtp-Source: ABdhPJwjdy1kP5M01uxD+BiUtDEeGBogmjeh7rpPWGyo3TNFaa8A9B5W2mtw3t9AdWdt5oxhcJsp1UgEeBDtn89Vrm8=
X-Received: by 2002:ae9:f402:: with SMTP id y2mr9648643qkl.9.1606515894680;
 Fri, 27 Nov 2020 14:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20201127153734.147135-1-beniaminsandu@gmail.com>
 <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com> <CABQJdOEPr-5mOcP01PiGX+mzMpfd+4CxFiEeHBkDo1yu7Yr9QQ@mail.gmail.com>
In-Reply-To: <CABQJdOEPr-5mOcP01PiGX+mzMpfd+4CxFiEeHBkDo1yu7Yr9QQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Nov 2020 14:24:28 -0800
Message-ID: <CAMKF1spC2zcn7PABeux8V2dXJwJ=OuJm5Tuq+cckfTsv=y_w+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 1:01 PM Beniamin Sandu <beniaminsandu@gmail.com> wr=
ote:
>
>
>
> =C3=8En vin., 27 nov. 2020 la 21:51, Khem Raj <raj.khem@gmail.com> a scr=
is:
>>
>> On Fri, Nov 27, 2020 at 7:37 AM beni <beniaminsandu@gmail.com> wrote:
>> >
>> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> > ---
>> >  .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16 ++++++++++++++=
++
>>
>>
>> Please add it to packagegroup-meta-oe as well.
>
>
> Okay.
>>
>>
>> >  1 file changed, 16 insertions(+)
>> >  create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.=
bb
>> >
>> > diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/me=
ta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
>> > new file mode 100644
>> > index 000000000..d9599c046
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
>> > @@ -0,0 +1,16 @@
>> > +SUMMARY =3D "User-space front-end command-line tool for ftrace"
>> > +
>> > +LICENSE =3D "GPLv2 & LGPLv2.1"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D873f48a813bded3de6ebc54e6=
880c4ac"
>> > +
>> > +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/t=
race-cmd.git;branch=3Dmaster"
>> > +SRCREV =3D "530b1a0caef39466e16bbd49de5afef89656f03f"
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +do_install() {
>> > +       oe_runmake DESTDIR=3D${D} install
>> > +}
>> > +
>> > +FILES_${PN} +=3D "${prefix}/etc \
>>
>> user ${sysconfdir}
>
> IIRC ${sysconfdir} points to /etc and I need /usr/etc, I could not find =
anything to point there at a quick glance so I used this.

yes that was the question. If the content should be moved to /etc
instead of /usr/etc since /usr/etc does not seem to be
that common.

>>
>>
>> > +       ${libdir}/traceevent/plugins/"
>> > --
>> > 2.25.1
>> >
>> >
>> >=20
>> >
