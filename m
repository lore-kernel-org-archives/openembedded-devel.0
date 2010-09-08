Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOmd-0003mY-Pt
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:50:08 +0200
Received: by iwn2 with SMTP id 2so199806iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bl7vc2cz1ZbMkVV1RhqaKti77iswbn5Ef2pBc+HN1rk=;
	b=ijPeYLdhqrZyoNrgh7TYfhRlNabbIScNkh02iuTsh0FvogXAK0+9/0fxH0N3EkbikE
	DoEhQT7E/t1Icqy+XsBIhgwKcEPpBcW5+T9+ET8kp3X6/a5xDMOg5ceCPV4gHDcya9n3
	PetkDt9FLgAKkm+BfMog4U5vl2WVS0uwFDYhc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fyX7Nyn34B/ayfdN4L8KJqxwHF/A9DbR0Ms6mMJDbZeguPENcLcyyinicqDfLlokgg
	BSL8oDd81o1dRWKQzjoruXWd6NTl8bhOfMyp8fI35IG5PGMoSCBa1/ItHKP1OOEJpgcQ
	xO5Hd3kUwkUePDLgxpFJ7wm7mKluKumMnhwmc=
Received: by 10.231.32.73 with SMTP id b9mr4720733ibd.133.1283968167194; Wed,
	08 Sep 2010 10:49:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:49:07 -0700 (PDT)
In-Reply-To: <AANLkTi=3gKS1xKPCLJOg0vxpVSgxOwx9N-GmiQS1zO9g@mail.gmail.com>
References: <AANLkTi=3gKS1xKPCLJOg0vxpVSgxOwx9N-GmiQS1zO9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:49:07 -0700
Message-ID: <AANLkTi=YqpnwM52LoTsVSb6wZJaGEXfyxrQiV_tMjwSH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipe simplification questions
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
X-List-Received-Date: Wed, 08 Sep 2010 17:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 10:41 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi
>
> While browsing through a recipe I stumbled upon the following two functio=
ns:
>
> inherit autotools
>
> do_configure() {
> =A0 =A0 =A0 =A0oe_runconf
> }

if you look into autotools bbclass then you will see that do_configure
does much more it regenerates the configure scripts before it runs
sometimes thats not a viable option we just want to use whatever
configure is provided in tar and that is what this does.

>
> do_install() {
> =A0 =A0 =A0 =A0make install DESTDIR=3D${D}
> }
>

this if used in a recipe which inherits autotools could be for getting
parallelism out of context during install but not during compile.
again this kind of stuff should be avoided.

> Two questions:
>
> 1) does a =A0do_configure like above have any use?
> I would expect it to be the default case in case of autotools
>
> 2) the make install line I have seen on several places.
> Isn't it more elegant/simpler to just say
> EXTRA_OEMAKE =3D "DESTDIR=3D${D}" and remove the whole do_install functio=
n?
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


