Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4W6v-0008GX-Q3
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 11:53:04 +0200
Received: by iwn7 with SMTP id 7so612973iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rda4m8HuHTaVnzHDQCIhcV4901UxVCNezzsBIQ1ftdA=;
	b=ANh2PPqO1jehaouMuZDzgE31GBfcXJ9PDP+bD0IV9i8NryJHFXLeih+9Kh+ofDF8YZ
	VwqDQB7kBygFGeSk84w4nAniNhYKaRFQfgRl0yz4vqF4zIDRP1M/pJQw5rugpx9Uv3og
	/VjnuZPFnGaIWrfua4RHWEGGba34rIMZsdlYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nEri05QqdUTFCHcqir/ld/5bNOy+F6/cNHgsAE35JT5mPcrgZyOaDjtVWSbcgxNyUP
	LPdicjrS2sL6YcqkjIo/xng3uqJM5gbSgj8xJ4jp6hRtz16VG5wH6ehLa82boDnDwHUD
	ESvP3rd4kBRiocq+6N9UpGQcMkkO6qIG87M08=
MIME-Version: 1.0
Received: by 10.42.152.66 with SMTP id h2mr581415icw.237.1286617959435; Sat,
	09 Oct 2010 02:52:39 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 02:52:39 -0700 (PDT)
In-Reply-To: <1286612941.3831.24.camel@mattotaupa>
References: <1286612941.3831.24.camel@mattotaupa>
Date: Sat, 9 Oct 2010 11:52:39 +0200
Message-ID: <AANLkTi=x_-moOb3Xv02rVZkw3Uq5BhLjBFstbiqtZR1E@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPENDS not honored: `do_configure` runs before `do_populate_sysroot` of dependencies
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
X-List-Received-Date: Sat, 09 Oct 2010 09:53:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/9 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE folks,
>
>
> if recipe B depends on A, I noticed that B=92s `do_configure` is run
> before all operations of A are complete, that means all tasks after
> `do_install` like `do_populate_sysroot`.
>
> Here is my concrete example.
>
> Running
>
> =A0 =A0 =A0 =A0$ bitbake console-image
>
> with `minimal-uclibc` for `MACHINE =3D "beagleboard"`
> `virtual:native:libgee_0.6.0.bb` failed to build for me (same error as
> in [1]). `do_configure` did not find a file which is provided by
> `gobject-introspection-native` which was recently added to `DEPENDS` [2]
> to fix [1].
>
> Before the failure the last completed task of
> `gobject-introspection-native` was
>
> =A0 =A0 =A0 =A0NOTE: Running task 1929 of 3724 (ID: 3078, virtual:native:=
/oe/openembedded/recipes/gobject-introspection/gobject-introspection_0.9.10=
.bb, do_install)
> =A0 =A0 =A0 =A0NOTE: package gobject-introspection-native-0.9.10-r0: task=
 do_install: Started
> =A0 =A0 =A0 =A0NOTE: package gobject-introspection-native-0.9.10-r0: task=
 do_install: Succeeded
>
> and then `do_configure` of `libgee-native` was already run. Building
> `gobject-introspection-native` manually I saw that there was a task
> `do_populate_sysroot`. With this task completed `libgee-native` was
> build successful.
>
> Is that a BitBake error?
>
>
> Thanks,
>
> Paul
>
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/=
025125.html
> =A0 =A0"libgee_0.6.0: gee/Makefile.am:95: HAVE_INTROSPECTION does not app=
ear in AM_CONDITIONAL"
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D72c2a=
c940065948cb688fde821e51efac6b71b4b
>
> _______________________________________________

Paul, I think you spotted a serious issue.
I don't think it is a bitbake error as such though (bitbake is just
the machine) but more likely something in our bbclass files

Something similar came up on irc on oct 5 (maybe the discussion
started on oct 4).
This was wrt sqlite3 native and the dependency on tcl-native.
I had a failing log for this too: see
http://tinderbox.openembedded.net/builds/92319/
Note that that was from a clean build.
I know something has been done to tackle this specific issue, but it
seems we have a more generic problem here.

To dig into the latter:
This seems the commit that fixes things:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9f503dbde0f=
2f6e9d4a94f6ab4be1b04dfc99950
but I have no idea why it should fix things.

For a native recipe this:
-DEPENDS =3D "tcl-native readline ncurses"
+DEPENDS =3D "readline ncurses"
+DEPENDS_virtclass-native_append =3D " tcl-native"
should not really make a difference I'd say.

Frans.


