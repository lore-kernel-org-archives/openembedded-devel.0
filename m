Return-Path: <ian@boundarydevices.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C5D62607AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 18:36:00 +0000 (UTC)
Received: by wmec201 with SMTP id c201so219358747wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=uZ0y+YmIlSIdi6aUrGtsZs2Vawfj5dcfCj+wxG8vJIA=;
	b=BLvtNGQOM0nSwjo0HEAWiW53YjSazYaVzyXRpBxEWuxvqPr/E+vgghy32tgokqNDWC
	ewz05q+X9Q0E4gPZfSJYQEl+3veQte/uLfb8Je2r/3XMQ47hMdmLKuwTKoo8tUhnwbU5
	nRjE8YQVZ4evFA4ZG/ZQ+x8nOeZCrTh83ltiAY2wX7A3fqPGAs2hTep5M2KygSzHlSTo
	TBrBJlZouNGGXtt5qk+RcYzczXvGUAIdKlNtIN1Uq5I3tD/tjHIYxdNzG6XPS9gZNdFA
	kxbBhFRvYuVotlZMgdwT1cwdrzmhtggPkfFWVQhQNia2f+ZakxXQmKipj1ONpsl3AEG4
	3s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=uZ0y+YmIlSIdi6aUrGtsZs2Vawfj5dcfCj+wxG8vJIA=;
	b=UpxnC348fPVD/Rf/Q83HO4rSU8Ist8tgh5JxW8vWuI6prVcyUJComifzdNxVPr/aAw
	/YbbpVDVg1V1pWHr1q9E+GTBrvzzrzaea7UhPM36e7VXpXkV7U3S5cwNdstAwUV3uDeW
	svovyqYuGiDhM//9wnbHkxwRbE3j5tahxL2bT2Z7syVqqToO9ESqXeSaA+7yUlWnrNfR
	TMi4Z3Iz4Qtyd4hSN7sNItUDVTR4N0f9rc4n4CmuXq0vhWvOLrAIB1V5xGZ/irkgqgKL
	aFw4oWZFYw8FPoJ7vdchkpJjWvirxagnKKw/e2jj/LT555Sx1hRHahS87XbS5sIOKbzB
	bCtg==
X-Gm-Message-State: ALoCoQlkmbUo/kOToHTmozwvmul++CgE0ovaAPrmeArKUk/XzygFTTAoFXAqVkcen147XdwY6Fzd
MIME-Version: 1.0
X-Received: by 10.194.185.234 with SMTP id ff10mr81386489wjc.170.1448994960488;
	Tue, 01 Dec 2015 10:36:00 -0800 (PST)
Received: by 10.27.110.18 with HTTP; Tue, 1 Dec 2015 10:36:00 -0800 (PST)
In-Reply-To: <CAMKF1soK_A0ymhcBKzoi8eP4rGpct5i4pAh5jhiLbBuA1TQyrA@mail.gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
	<20151106171738.GF2550@jama>
	<1446839474.2527.7.camel@Saturn.local.all>
	<CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
	<CADseiPmXNcnsCaYsEi_oW-ujY3Q6EWVE1iz5tm=WYt0wULt5NA@mail.gmail.com>
	<CAMKF1soK_A0ymhcBKzoi8eP4rGpct5i4pAh5jhiLbBuA1TQyrA@mail.gmail.com>
Date: Tue, 1 Dec 2015 10:36:00 -0800
Message-ID: <CADseiPm=mpgdXnGwjvG=EULxypjcSAubr1B7+0=r3OzY0FuBZg@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Tue, 01 Dec 2015 18:36:01 -0000
Content-Type: text/plain; charset=UTF-8

Yes. Building through Yocto Jethro, uses GCC 5.2

On Tue, Dec 1, 2015 at 12:05 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 30, 2015 at 11:17 PM, Ian Coolidge <ian@boundarydevices.com>
> wrote:
> > I'm getting segfaults when I run google-chrome on my nitrogen6x after the
> > new updates. Compiles great, just segfaults. Anyone else noticing similar
> > problems? I'll be digging into it more, thought I'd reach out first
> though.
>
> are you using gcc5 ?
>
> >
> > Thanks,
> > -Ian
> >
> > On Fri, Nov 6, 2015 at 11:58 AM, Otavio Salvador <
> > otavio.salvador@ossystems.com.br> wrote:
> >
> >> On Fri, Nov 6, 2015 at 5:51 PM, Max Krummenacher <max.oss.09@gmail.com>
> >> wrote:
> >> > Hi
> >> > Am Freitag, den 06.11.2015, 18:17 +0100 schrieb Martin Jansa:
> >> >
> >> >> After long time first successful chromium build in bitbake world..
> >> >> Thanks!
> >> >>
> >> >> Can you apply the same fix for cef3 recipes?
> >> >> http://errors.yoctoproject.org/Errors/Details/21442/
> >> >>
> >> >> cef3 for qemux86-64 doesn't even configure:
> >> >> http://errors.yoctoproject.org/Errors/Details/21501/
> >> >>
> >> > I'll try to fix this.
> >> >
> >> > It looks like this never worked for x86-64 because of a missing config
> >> > file.
> >> > One probably can reuse the i568 one.
> >> >
> >> > There seem to be additional errors to the one fixed with the packages.
> >> > So
> >> > maybe I won't be able to fix it.
> >>
> >> Send a complete patchset and we apply them all ;-)
> >>
> >> --
> >> Otavio Salvador                             O.S. Systems
> >> http://www.ossystems.com.br        http://code.ossystems.com.br
> >> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

