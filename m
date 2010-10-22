Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DUX-0000cg-N0
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 11:00:51 +0200
Received: by iwn6 with SMTP id 6so11112iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NlFy9aZmOPD4TeIxIkOaf3v/lzx7D6fbT5EBuN70rB8=;
	b=gJSGzTe+jo03RDSbxY0yq1hCrwTbfjsVjqx/7C0JmyZta2l52R2VEFuzgiAhF2Uyr2
	o4bEUg1jDmKlG2xvejpw7RczsDsI6JBaxkb27ApmTIATh7eDbPoX/5SY4YAWWcAFIQeo
	6h/duaVlA8G1kJRtj0JoD4VQzrPm6IcaMaozs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Gh5PlCM5SNlyGSROQFQ2YIhBjcccxHsmm0EpbU7RIW0xYEKLZBAGw8rqE+JCx3F2vi
	kKBunoDTBjV6HWCM30nbr7Rx29zMb8KvapQ73iOZdSxbxNzSmaNWBMInqmDxT7a7i/yQ
	ZYNmWM0zKH5hc1K3BB1D7VMSnkkhIJC0UQDnQ=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr2089310ibc.161.1287738005779; Fri,
	22 Oct 2010 02:00:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 02:00:05 -0700 (PDT)
In-Reply-To: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
Date: Fri, 22 Oct 2010 11:00:05 +0200
Message-ID: <AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: empty strings
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
X-List-Received-Date: Fri, 22 Oct 2010 09:00:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping.

people don't care?
I feel there are some issues in the examples below (and some easy
cleanup actions).

Frans

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> triggered by a remark on irc, I decided to do a grep on "" in all our rec=
ipes.
> That gave some interesting observations. I've fixed a few things from
> the type X +=3D "" or X_append =3D ""
> See the patch set I just send.
>
> However there are also a few things that are not so obvious and for
> which I want to ask your opinion, Some seem useless, others are
> probably needed, but wanted to raise all issues that could be
> unneeded.
> Note that the recipes are just examples, ofthen there are more recipes
> that have the same pattern.
>
> libvorbis/libvorbis_1.2.3.bb:EXTRA_OECONF =3D ""
> aircrack/aircrack_2.1.bb:DEPENDS =3D ""
> apt/apt-native.inc:PACKAGES =3D "" =A0(this is a native recipe, isn't thi=
s
> always the case for native recipes ? )
> bind/bind_9.3.1.bb:RPEDENDS =3D "" (this one has a DEPENDS on openssl, I
> would expect it also to rdepend on openssl in this case)
> c3110x/cx3110x_1.1.bb:export LDFLAGS =3D ""
> classpath/classpath.inc:RPROVIDES_${PN} =3D ""
> fuse/fuse-module_2.7.4.bb: =A0 =A0 =A0LDFLAGS=3D""
> glibc/glibc_2.10.1.bb: =A0CPPFLAGS=3D"" oe_runconf (I was wondering of th=
e
> resetting CPPFLAGS is useful, didn't really dig into this one)
> gs/gs-fonts-std_8.11.bb:HOMEPAGE =3D ""
> gsoap/gsoap-native_2.7.13.bb:EXTRA_OEMAKE =3D ""
> ipkg/ipkg-native.inc:PROVIDES =3D "" =A0(hm, no provides)
> meta/staging-linkage_1.0.bb:SRC_URI =3D ""
> psmisc/psmisc.inc:FILES_${PN} =3D "" (guess all files are added to other
> packages, if that is so, should there be a line like this?)
> tmake/tmake_1.11.bb:FILES =3D ""
> ttf-fonts/ttf-hunkyfonts_0.3.0.bb:RRECOMMENDS_${PN}-dbg =3D "" (seems
> somewhat strange to me)
>
>
> this one also looked weird; guess it is ok but found it odd that these ar=
e reset
> hplip/hplip_2.8.10.bb:EXTRA_OEMAKE =3D 'BUILD_SYS=3D"" HOST_SYS=3D""'
>
> I would like opinions on which of these constructs is useful and which
> not. (and yes, I know an assingment may be used to nullify an earlier
> assingment in an .inc file and I am also aware of cases where there is
> something like X_virtclass_native =3D "" which is used to nullify
> non-native assignments to X.
>
> Enjoy, Frans
>


