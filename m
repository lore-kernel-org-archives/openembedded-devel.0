Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 86B227723B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:58:56 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id o16so160763136wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tl8Axw6I2wNmJpmClVhwJWFdVjhLfu/pCx9Bm/jLSS8=;
	b=IvW5+0OnD/WXWgxWpwYoT4Wnff3j4OsgjD6Q0yPBhs1vW7vDggCtonP9oXkxfB9pqM
	uaID/nJaRTsAd50deKXE8nlGUi0JY8DeEq6u2jiDrvZXJhYb/uhvj2LxihxUU7qeqxk+
	Nf1TpPycnMNFyac1ksOzvAeIC18co3R/r+EeJoFNwGCx6Pi7ET0II46jNlymLAJbjq4I
	+TKXfiZ0ZZ487EOteKVduKMS2R1dujD4Dml5DBXUw2eddsxdzEBrrGveC0JiK7PeekAu
	yUKsNJPJj6gwSAJl8WW8WBHWjSek4TGBfHmxP2+ytrvk8euHovcyYvG0q1vxsf32sB4I
	3rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tl8Axw6I2wNmJpmClVhwJWFdVjhLfu/pCx9Bm/jLSS8=;
	b=P8Z2lrTyAhRlV1+H6RLaZAib4Gz1lrnAXv08ZHOegViO0pq4pxJsDWVicJJfuo0/JV
	lwXVSquQ7uT1J4a8gyGRfY1fj61Rtw2oD0Vl+QgbxTrpB29UmnL2m6pHM+fno43BaBDM
	nsHp7+VLj7k/MajLvBJ1V5O4bXsXuJd5VhTn8g/b9PiiUj0ji4W0zXGD7RPrH2X9ibhK
	Dh3WaJtN9oV1UeU+EWv1SoQdNvBLs5ZtWo7iUHHD6RdBLVTWNl/QKwRNaCys6O16H2qU
	91/YECWVgC6VLiKtdD+KY+EJakCskjdyzmh3qHuL1uM7sBWKAu5uSAWp2PMopL50vMlb
	6Iww==
X-Gm-Message-State: AMke39mklpDpC4pkzxTgwUXdi8V2HAGymP6t+SBcLnOr1azLcZ/X/uKuTJX+O1LxwTadk9qGW8EePh00JCcJrA==
X-Received: by 10.223.150.34 with SMTP id b31mr22556075wra.196.1487026736856; 
	Mon, 13 Feb 2017 14:58:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 14:58:56 -0800 (PST)
In-Reply-To: <1487023500.2100.15.camel@gmail.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
	<CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
	<CA+chaQdeBHucjgvjgff=kudTnTX1+cxxGv6yMnGb39UjuOxSaA@mail.gmail.com>
	<1487023500.2100.15.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 23:58:56 +0100
Message-ID: <CA+chaQfPjR2wNPeAqsU1rLkoaPms81hgZd28+4hALm5M9nJKnQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Mon, 13 Feb 2017 22:58:59 -0000
Content-Type: text/plain; charset=UTF-8

Yes, I guessed that Richard answer was the motivation for what you did, but
the original issue reported by Andreas was about "many recipes depending on
kdoctool".

Here I see only 2 cases of such dependency, so I think we can live without
the bbclass - unless someone says that he has many recipes in internal
layers which depend on python-m2crypto-native.

Just my 2c (I'm not familiar with python-m2crypto so I cannot say how
common this use-case is).

On Mon, Feb 13, 2017 at 11:05 PM, Max Krummenacher <max.oss.09@gmail.com>
wrote:

> Hi
>
> Am Montag, den 13.02.2017, 22:40 +0100 schrieb Martin Jansa:
> > Oh, I see what you did in master-next 1/4, but is it worth creating
> > .bbclass for just 2 dependencies which probably won't be used by so many
> > recipes?
>
> That's how I understand Richard here:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-February/132693.html
>
> Actually it is not 2 dependencies, it is 1 dependency on
> python-m2crypto-native and the run time dependency that
> python-m2crypto-native
> needs since it upgrade to 0.25.1.
>
> So the issue here is that if some time in the future there is another
> RDEPENDS that python-m2crypto-native needs we will have to track down
> all the users of it and add the new dependency there too.
>
> If you think this does not merit a new class I can substitute the new
> class by adding python-typing-native to crda and pywbem to fix the build
> in the current setup and resend the patch series.
>
> Max
>
>
>
> On Mon, Feb 13, 2017 at 10:39 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > Did you test this change? You added it to inherit not DEPENDS..
> > >
> > > On Mon, Feb 13, 2017 at 10:02 PM, Max Krummenacher <
> max.oss.09@gmail.com>
> > > wrote:
> > >
> > > > This fixed the build, remove blacklist also.
> > > >
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > ---
> > > >  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 6 +-----
> > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > >
> > > > diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > > b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > > index 8b5394e..14d4e69 100644
> > > > --- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > > +++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > > @@ -16,14 +16,13 @@ HOMEPAGE = "http://pywbem.sf.net/"
> > > >  LICENSE = "LGPLv2"
> > > >  LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5
> > > > =fbc093901857fcd118f065f900982c24"
> > > >  SECTION = "Development/Libraries"
> > > > -DEPENDS = "python-m2crypto-native"
> > > >  SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${
> BP}
> > > > /${BP}-dev.r704.zip"
> > > >  SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
> > > >  SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e
> > > > 633ad07b7c11d89db2472b9f923f3fd3ed8"
> > > >
> > > >  S = "${WORKDIR}/${BP}-dev"
> > > >
> > > > -inherit setuptools python-dir
> > > > +inherit setuptools python-m2crypto-native
> > > >
> > > >  do_install_append() {
> > > >      mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> > > > @@ -34,6 +33,3 @@ do_install_append() {
> > > >  }
> > > >
> > > >  BBCLASSEXTEND = "native"
> > > > -
> > > > -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> > > > http://errors.yoctoproject.org/Errors/Details/130596/"
> > > > -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> > > > http://errors.yoctoproject.org/Errors/Details/130681/"
> > > > --
> > > > 2.6.6
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > >
> > >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

