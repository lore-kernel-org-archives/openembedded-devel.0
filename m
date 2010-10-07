Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1P3wMW-0004r8-93
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 21:42:48 +0200
Received: by wwe15 with SMTP id 15so112833wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Ld19iXT18JD4eb3CEIBdn6M/b4/r8fQlseCnVeyduUE=;
	b=d9pm7wAa8sHKWadYK6xxHvnz4/Gsyn8NKh40Zjn8OIHgqKQXQvwxfWcl9ArM6mXSmS
	83YD0afu/51OZA3fJt7Rgb4i7gL8qZoCr1FWq14FJkmS4PzQuX4nuFDMvditClXGi0lk
	iSy52mddpQsDNeKW+w9V2QendC/wn4Cu3vQ7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=RqbGoUYoJFDd8Lg8KhaQ9AUpDVXz20N0rbD84KvkqogjURTM6f85WOTsutXsfoEW3E
	ulhW+WlVjBfObBqMEgLX7W4Z6rSKHCG+12hpCjutww436fFV2ZCrqfbbkuUsAIWYgUHm
	UdWKkRtRMIu13TV6acuwd+y+fRVp8QgcM3F0o=
MIME-Version: 1.0
Received: by 10.216.62.210 with SMTP id y60mr1214084wec.91.1286480102250; Thu,
	07 Oct 2010 12:35:02 -0700 (PDT)
Received: by 10.216.72.199 with HTTP; Thu, 7 Oct 2010 12:35:02 -0700 (PDT)
In-Reply-To: <1286408038.3829.22.camel@mattotaupa>
References: <1286408038.3829.22.camel@mattotaupa>
Date: Thu, 7 Oct 2010 12:35:02 -0700
Message-ID: <AANLkTi=nS_3emPJsndTjjAM=cPwwc=pW0Ktk7DJwEj++@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: libgee_0.6.0: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Thu, 07 Oct 2010 19:42:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 6, 2010 at 4:33 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> `configure` fails for me for `libgee_0.6.0.bb` [1].
>
> =A0 =A0 =A0 =A0| gee/Makefile.am:95: HAVE_INTROSPECTION does not appear i=
n AM_CONDITIONAL
>
> `libgee_0.5.2.bb` builds correctly because it does not yet use gobject-in=
trospection.
>
> This question was brought up before but was left unanswered [2].
>
> There was no file `introspection.m4`, where `HAVE_INTROSPECTION` is
> defined in, in
>
> =A0 =A0 =A0 =A0=85/work/armv7a-oe-linux-gnueabi/libgee-1_0.6.0-r1/libgee-=
0.6.0/m4
>
> as recommended in [3]. Should the m4 file be copied there as it is done
> for the other m4 files?
>
> =A0 =A0 =A0 =A0[=85]
> =A0 =A0 =A0 =A0| autoreconf: configure.ac: tracing
> =A0 =A0 =A0 =A0| autoreconf: running: libtoolize --copy --force
> =A0 =A0 =A0 =A0| libtoolize: putting auxiliary files in `.'.
> =A0 =A0 =A0 =A0| libtoolize: copying file `./ltmain.sh'
> =A0 =A0 =A0 =A0| libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
> =A0 =A0 =A0 =A0| libtoolize: copying file `m4/libtool.m4'
> =A0 =A0 =A0 =A0| libtoolize: copying file `m4/ltoptions.m4'
> =A0 =A0 =A0 =A0| libtoolize: copying file `m4/ltsugar.m4'
> =A0 =A0 =A0 =A0| libtoolize: copying file `m4/ltversion.m4'
> =A0 =A0 =A0 =A0| libtoolize: copying file `m4/lt~obsolete.m4'
> =A0 =A0 =A0 =A0[=85]
>
> I manually put the m4 file [4] into `libgee-0.6.0/m4/` and added
> `m4/introspection.m4` to `EXTRA_DIST` in `Makefile.am` to `` but
>
> =A0 =A0 =A0 =A0bitbake -c configure libgee
>
> still failed.
>
> Do you have any ideas?

I found that if I built gobject-introspection-native manually, then
libgee would complete without error.

The DEPENDS_virtclass-native =3D "gobject-introspection-native" in the
libgee recipe isn't triggering the build automatically.

Steve


