Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1USVgk-00019Y-L4
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 18:58:32 +0200
Received: by mail-la0-f48.google.com with SMTP id fq13so593462lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ukKBpXKksF7hfbO18LcWZawqAw80nvbAJSqIlXBmQ5U=;
	b=zKkl4+yp5CwMzOxc5K4dp+cxhIO2nfAYX7LYBaDm2xxRuflvIX3/jQqpaVXZUSDCrK
	BV36O+sw2PWntgDdiPwYOZhyzFUoO33/I5wgjzzx0SZTBeGlvFEpDongBQQE0/0fxPPG
	M0B0PtgTZmayrtzEuE14uRc6qNBYqQ5dy0zaELc6Yf3n/5601GXPBicQvLpmpbdaUUQ0
	qTp+P2uu4nsW4OLaRU9eh8smmrOL6r4t2IvwIXgvlQwLh7Az0jHQIpqOXthDBeAWY0Se
	t6gL4RYbFiBDzQyuu96OvJhrXkxzBE4jY53+D95ydtcza7J2a+UA3JX7eKr6fnBgm+0r
	gcPg==
MIME-Version: 1.0
X-Received: by 10.112.168.135 with SMTP id zw7mr3898957lbb.115.1366216858454; 
	Wed, 17 Apr 2013 09:40:58 -0700 (PDT)
Received: by 10.112.199.69 with HTTP; Wed, 17 Apr 2013 09:40:58 -0700 (PDT)
In-Reply-To: <20130417103635.2e081896@e6520eb>
References: <1366149409-3168-1-git-send-email-steven.w.warren@gmail.com>
	<20130417103635.2e081896@e6520eb>
Date: Wed, 17 Apr 2013 11:40:58 -0500
Message-ID: <CAFzuKnwN0Fzv_VuKCXUpuoGHmB_RZwCYTWnry+ROtoU8SVZ_Pg@mail.gmail.com>
From: "wayne, steve" <steven.w.warren@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qwt: Adjusted SRC_URI to point to a URL + PATH that works.
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
X-List-Received-Date: Wed, 17 Apr 2013 16:58:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Eric,

Indeed it is working one my end today using both wget and the unmodified
recipe in a different clone of the meta-openembedded recipe.

Yesterday I was receiving a '502: Internal Server Error'....I guess if I
had looked into that (
http://en.wikipedia.org/wiki/List_of_HTTP_status_codes#5xx_Server_Error) I
could have figured out there was some temporary service problem at
sourceforge.

Thanks for double-checking!

Wayne



wayne


On Wed, Apr 17, 2013 at 3:36 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi Wayne,
>
> Le Tue, 16 Apr 2013 16:56:49 -0500,
> Wayne Warren <steven.w.warren@gmail.com> a =E9crit :
>
> > Signed-off-by: Wayne Warren <steven.w.warren@gmail.com>
> > ---
> >  meta-oe/recipes-qt/qwt/qwt.inc |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-qt/qwt/qwt.inc
> b/meta-oe/recipes-qt/qwt/qwt.inc
> > index d9d47f0..e771b01 100644
> > --- a/meta-oe/recipes-qt/qwt/qwt.inc
> > +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> > @@ -5,7 +5,7 @@ SECTION =3D "libs"
> >  LICENSE =3D "QWTv1.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af420=
51c88"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt \
> > +SRC_URI =3D "
> http://sourceforge.net/projects/qwt/files/qwt/${PV}/qwt-${PV}.tar.bz2;nam=
e=3Dqwt\
>
> What problem do you meet exactly ?
> original SRC_URI works fine from here :
> bitbake.conf defines :
> SOURCEFORGE_MIRROR =3D "http://downloads.sourceforge.net"
>
> [ebenard@e6520eb ~]$ wget
> http://downloads.sourceforge.net/qwt/qwt-6.0.1.tar.bz2
> [ebenard@e6520eb ~]$ $ echo $?
> 0
> [ebenard@e6520eb ~]$ md5sum qwt-6.0.1.tar.bz2
> ace68558eab873e2da7e641179c4ef0c  qwt-6.0.1.tar.bz2
>
> and the recipe has :
> SRC_URI[qwt.md5sum] =3D "ace68558eab873e2da7e641179c4ef0c"
>
> Eric
>

