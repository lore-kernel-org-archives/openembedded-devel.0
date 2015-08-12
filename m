Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B30676720
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 06:21:04 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so3911151lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XNmq4py+eT+xsJc0ZZgFvFvB1ckdPGPgBi/BzD7HlzI=;
	b=rZ8UHofPQS+541DhS0Mdl9uGa8PoDbY2G8FH+DbhZUiAIQZh6uuvBQZQ7PbzYnnTAm
	63SrIoq28AQJGpQurZKORHzQC0mJdFNnFT10/QNFNTpks/kVzrWaXneDhCuIvYI+XKvE
	8wKtS0bZ2jxWyAI4d1IJDhKXSfxhfzcQgx26ZgitefgdQNG+82ezC74cT1MIPzpifmJd
	lx41YByzsx6Faa9o4uUql91vDTALboWw8ueRc62plQ4JfhG5lZcmqkhR8xK1rTCIY9Pq
	i9nx0ihSeMmUL8hl681BpwyJUE77TByCapZwf5rxqOpn//BpPJwEpCyJmVQfAtnp7HLq
	AYgQ==
MIME-Version: 1.0
X-Received: by 10.112.52.2 with SMTP id p2mr30563247lbo.8.1439360463873; Tue,
	11 Aug 2015 23:21:03 -0700 (PDT)
Received: by 10.25.15.38 with HTTP; Tue, 11 Aug 2015 23:21:03 -0700 (PDT)
In-Reply-To: <C1999217-99AE-4AB2-83D7-8EED48D721D8@gmail.com>
References: <1439307808-7581-1-git-send-email-alejandro.delcastillo@ni.com>
	<C1999217-99AE-4AB2-83D7-8EED48D721D8@gmail.com>
Date: Tue, 11 Aug 2015 23:21:03 -0700
Message-ID: <CANx9H-Dno+VZ8jmt-WzbrXqis8tMc8S7qGUug48qOMfi0DOczw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-pyinotify: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 06:21:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Has at least one unmet run-time dependency on "asyncore".
$ python
>> import pyinotify

Please make sure all run-time dependencies are included in the recipe.

Also, as Khem mentioned, you do not need PR =3D "r0" anymore.

Thank you.

---Tim


On Tue, Aug 11, 2015 at 6:39 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Aug 11, 2015, at 8:43 AM, Alejandro del Castillo <
> alejandro.delcastillo@ni.com> wrote:
> >
> > Python bindings for Linux inotify mechanism
> >
> > Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> > ---
> > .../recipes-devtools/python/python-pyinotify_0.9.6.bb   | 17
> +++++++++++++++++
> > 1 file changed, 17 insertions(+)
> > create mode 100644 meta-python/recipes-devtools/python/
> python-pyinotify_0.9.6.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/
> python-pyinotify_0.9.6.bb
> > new file mode 100644
> > index 0000000..07e95b0
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "Python pyinotify: Linux filesystem events monitoring"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/pyinotify"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dab173cade7965b411528464589a=
08382"
> > +
> > +PR =3D =E2=80=9Cr0"
>
> drop it.
>
> > +SRCNAME =3D "pyinotify"
> > +
> > +SRC_URI =3D "
> https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar=
.gz
> "
> > +
> > +SRC_URI[md5sum] =3D "8e580fa1ff3971f94a6f81672b76c406"
> > +SRC_URI[sha256sum] =3D
> "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

