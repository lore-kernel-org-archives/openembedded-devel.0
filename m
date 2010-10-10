Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P51V2-0005bX-MO
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 21:24:01 +0200
Received: by gyd8 with SMTP id 8so839694gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 12:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=zjV68ej9mrSiztZvEBU6iVfV9FeV/JOU7n/MkIUZr9Q=;
	b=evLXf7AKLdiWquqBei4RuWw4g9cdvuq4m8qYCtORjm1bPjZ+8Ag45thREnRdtBKKmt
	SCpupNwDh46lXs0VP+STN5hn4G/bLJMxL+9wigpYeWlCrBNY79Jl/A5ornoAm6ruwbIE
	WwBewgjaszp0lFSLso75VDK4VP+H//JxYnvhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=STnifFVTbIIRCgILFeGEFfOpQr2LQntzpVkbGlIzUBdM6PLa7DQaLDN/fywYzFdQZE
	WJRqf/epOb5MQgFKLW/W1h4sMdcMFIXmhwbA0skytfGfCW6YuObZhgCo/OEOuDI+eP6l
	2XBa0si5vmfkWYuqp2QIs6enPr6g6HI6wkYdQ=
Received: by 10.90.31.14 with SMTP id e14mr2627586age.21.1286738600800; Sun,
	10 Oct 2010 12:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 12:23:00 -0700 (PDT)
In-Reply-To: <1286711637.3808.42.camel@mattotaupa>
References: <1286711637.3808.42.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 12:23:00 -0700
Message-ID: <AANLkTi=Jgtbz+E+b9sV-owYFh6Vo38oR2TwG2Q47DOfC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Inclusion of `gobject-introspection` breaks several packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Oct 2010 19:24:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 4:53 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> `gobject-introspection` got added in 143188 [1] to get `libgee_0.6.0` to
> build [2].

with my last commit to libgee its no more needed to be in the depends in li=
bgee
so we can remove that from DEPENDS safely.

>
> As a consequence the configure script of a lot of packages like `gtk+`,
> `atk`, `gstreamer` detects the presence of GObject Introspection and
> enables it.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ ./configure --help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-introspection=3D[no/auto/yes]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable introspection for this =
build
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>
> Auto detection seems to be the default.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure:12206: checking for gobject-introspe=
ction
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure:12237: $PKG_CONFIG --exists --print-=
errors "gobject-introspection-1.0 >=3D 0.6.7"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure:12240: $? =3D 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure:12251: result: yes
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>
> Now for example Pango 1.10.0 does not generate a `gir` file, which was
> enabled again in a later release [3]. This breaks building for example
> `gtk+` [4].
>
> The question is how to proceed.
>
> 1. Somehow excluding `gobject-introspection` from images.
> 2. Would packaging gir-repository [5] help?
> 3. Pass `--enable-introspection=3Dno` by default to the configure script.
> 4. Add `--enable-introspection=3Dno` to all relevant packages.
> 5. Update to new versions supporting GObject Introspection correctly.
>
> What do you think?
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D14318=
872c0063d26c246a35b373dbfaf4f4c6587
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D64a53=
b0ab6695b9ec4e327524fb41a916067bbfd
> [3] http://git.gnome.org/browse/pango/commit/?id=3D078300ef69ab0855a7cc39=
503880cbc8b2e23494
> [4] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/=
025174.html (patch is wrong though)
> [5] http://git.gnome.org/browse/gir-repository/tree/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


