Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4A078F6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 15:18:01 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id k38-v6so2084320qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f5cpzVKTCgz5vRXsL+IS6elP27PBhghUz9zse3K5+vw=;
	b=tFTV7z/aDzZ3FVi8Q8VEzLJNwkJIcjDI5u6gRfpCTg8lOSxpEQwumInUBTphomPO8V
	TvRwERtVotb4NJCSLC+nYPOvq7aJhvEzT63+CVftAgZbfqVgIcHyN4y4SzxsYmQAqBlI
	XdCcpQibmdRJh2JPlkY2eHbDMv/OdnCYwK+b2xRYV27cMkAF7m4MXUt5LfUxKWeJRKWP
	Ztfgv9hsSjXNObMWFeRWDmaDiqBR4nt064RXMnLkC8KxTPYQV8ETrW+9MTEjJXy6Zw8y
	JgS5RpLqeKKZXZDlvFqMy7IfheDzb+g0+j3LytLoRtRsbuGXL5Vka+eMkovQRjVE6zJg
	8cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f5cpzVKTCgz5vRXsL+IS6elP27PBhghUz9zse3K5+vw=;
	b=PS4ujwzCPCY32mLTQL+jNkIPQMPocECZnGtb4ni7JLgvuLl178M75apsaGgGncC3cp
	uVcBktQqR1ivNCU/YAdfbbrPruSpTEZvShpKTdZVc2Ztg9QoB10dyPCqOKBpWHVRY77x
	UO/7uN+vy1DjFpD/wOyq7JYOCzZhNUrjHAeWyJmUQlPizj3+CxMT1slDSqE06iggS2A0
	16L6HXytNj05XgYz4ai4nmutsvOTF7lYxKbaibubroKMcx5MX7FDTMgKPE7zSo423Q43
	l1QYUHEcp54xeE+iBbg3Bqvmn5GEGz8G+fwv1yXxbMtRnSKyISbRoUnPc2EAEZk3oMru
	0XkA==
X-Gm-Message-State: APzg51Cb7U+wmgaXzVeHwXuaL8EdMUE1cj51mlk+z0sMnpgVyMAkSzqy
	VRF0PliQQSYx0wTLxJg+6xvcoBUECEixfgZDhAWA0Q==
X-Google-Smtp-Source: ANB0VdZ1rrJX38Wck0gcfne5exxCSWJcmK++TPhdzMi3n9ePi+8xs/oi5YPyOG6trLV8mjDlv0v0X1E6gwLfTiAPNqE=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr2192229qtq.161.1535469482778; 
	Tue, 28 Aug 2018 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180827123338.7571-1-adrian.ratiu@ni.com>
	<20180827123338.7571-2-adrian.ratiu@ni.com>
	<CAMKF1sqNPEsJPsr7eQK40NW7-KHTO5iEq-Ph+S2dkktj72FfoQ@mail.gmail.com>
	<877ekauazi.fsf@ni.com>
In-Reply-To: <877ekauazi.fsf@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 08:17:52 -0700
Message-ID: <CAMKF1srdR7v7vOkNt==B33VUe-R3-bBPNcy+sHR828vBT+sLLg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/3] python3-pytest-helpers-namespace: add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 15:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 1:53 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> On Mon, 27 Aug 2018, Khem Raj <raj.khem@gmail.com> wrote:
> > this patch seems to need python-pytest-helpers-namespace recipe
> > and it does not exist. have you tested these patches on master
>
> Yes, tested the series on master but I forgot to cherry-pick the commit
> adding the python2 recipe right before sending (perhaps I should
> cherry-pick a range next time instead of going through each commit
> manually).
>
> The commit adding the initial p2 python-pytest-helpers-namespace was done
> earlier and by someone else than the p3 recipe. Do you want me to squash
> them together instead of sending them separately?


As long as they are individually buildable
Multiple commits are fine

>
>
> > On Mon, Aug 27, 2018 at 5:32 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
> >>
> >> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> >>
> >> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >> ---
> >>  .../python/python-pytest-helpers-namespace.inc        | 10 ++++++++++
> >>  .../python-pytest-helpers-namespace_2016.7.10.bb      | 11 ++--------=
-
> >>  .../python3-pytest-helpers-namespace_2016.7.10.bb     |  7 +++++++
> >>  3 files changed, 19 insertions(+), 9 deletions(-)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-helpers-namespace_2016.7.10.bb
> >>
> >> diff --git
> a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> >> new file mode 100644
> >> index 000000000..a69867d91
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> >> @@ -0,0 +1,10 @@
> >> +DESCRIPTION =3D "This plugin does not provide any helpers to pytest, =
it
> does, however, provide a helpers namespace in pytest which enables you to
> register helper functions in your conftest.py to be used within your test=
s
> without having to import them."
> >> +HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_saltsta=
ck_pytest-2Dhelpers-2Dnamespace&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1=
jjZZuIPelcSjixA&r=3Dfzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=3DW74ODSS=
r60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=3DWFg4fgnvlpFzm8uQU1eEL1mn2d55j6iZhs=
og43LOoPA&e=3D
> "
> >> +SECTION =3D "devel/python"
> >> +LICENSE =3D "Apache-2.0"
> >> +LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3D71fac4dfeee99c39c51f617e9486237c"
> >> +
> >> +SRC_URI[md5sum] =3D "80fe3e515f640b1459709b539f6b857e"
> >> +SRC_URI[sha256sum] =3D
> "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
> >> +
> >> +inherit pypi
> >> diff --git a/meta-python/recipes-devtools/python/
> python-pytest-helpers-namespace_2016.7.10.bb
> b/meta-python/recipes-devtools/python/
> python-pytest-helpers-namespace_2016.7.10.bb
> >> index afca48702..2b6ee8550 100644
> >> --- a/meta-python/recipes-devtools/python/
> python-pytest-helpers-namespace_2016.7.10.bb
> >> +++ b/meta-python/recipes-devtools/python/
> python-pytest-helpers-namespace_2016.7.10.bb
> >> @@ -1,13 +1,6 @@
> >> -DESCRIPTION =3D "This plugin does not provide any helpers to pytest, =
it
> does, however, provide a helpers namespace in pytest which enables you to
> register helper functions in your conftest.py to be used within your test=
s
> without having to import them."
> >> -HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_saltsta=
ck_pytest-2Dhelpers-2Dnamespace&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1=
jjZZuIPelcSjixA&r=3Dfzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=3DW74ODSS=
r60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=3DWFg4fgnvlpFzm8uQU1eEL1mn2d55j6iZhs=
og43LOoPA&e=3D
> "
> >> -SECTION =3D "devel/python"
> >> -LICENSE =3D "Apache-2.0"
> >> -LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3D71fac4dfeee99c39c51f617e9486237c"
> >> +require python-pytest-helpers-namespace.inc
> >>
> >> -SRC_URI[md5sum] =3D "80fe3e515f640b1459709b539f6b857e"
> >> -SRC_URI[sha256sum] =3D
> "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
> >> -
> >> -inherit pypi setuptools
> >> +inherit setuptools
> >>
> >>  RDEPENDS_${PN} +=3D " \
> >>      python-pytest \
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-helpers-namespace_2016.7.10.bb
> b/meta-python/recipes-devtools/python/
> python3-pytest-helpers-namespace_2016.7.10.bb
> >> new file mode 100644
> >> index 000000000..f03f5d415
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/
> python3-pytest-helpers-namespace_2016.7.10.bb
> >> @@ -0,0 +1,7 @@
> >> +require python-pytest-helpers-namespace.inc
> >> +
> >> +inherit setuptools3
> >> +
> >> +RDEPENDS_${PN} +=3D " \
> >> +    python3-pytest \
> >> +    "
> >> --
> >> 2.18.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org_mailman_listinfo_openembedded-2Ddevel&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&r=3Dfzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=
=3DW74ODSSr60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=3Dmx9ylPEFC1TJQvgUNe0p5wvC=
czXDM7g8SVJAM3rDwxM&e=3D
>

