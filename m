Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id CB35E6072C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFEDD20992
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:26:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id VSeCA6z_uaSa
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:26:37 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A76D92001A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:26:37 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 374CF162175; Tue, 18 Oct 2016 13:26:37 -0400 (EDT)
Date: Tue, 18 Oct 2016 13:26:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161018172637.GK2494@denix.org>
References: <1475783887-20739-1-git-send-email-denis@denix.org>
	<1F10663F-D6B7-4A28-BB4C-0F8E65B0D5CD@gmail.com>
	<CANx9H-Bc5OT+VogpFWhciMt=aPi0_Lyzu_F-666QBWF0+i=-MA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-Bc5OT+VogpFWhciMt=aPi0_Lyzu_F-666QBWF0+i=-MA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-python][PATCH] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Tue, 18 Oct 2016 17:26:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Khem, Tim,

http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109403.html


On Thu, Oct 06, 2016 at 06:07:28PM -0700, Tim Orling wrote:
> Agree with Khem, we don't use PR in anything new anymore.
> 
> I built (on krogoth) both python-pybind11 and python3-pybind11 and both
> import inside their respective pythons. I did not do any more testing than
> that.
> 
> I'll try on master too.
> 
> As always, it would be nice to add ptest, but hardly any python recipes
> have it. :/
> 
> --Tim (Intel)
> 
> On Thu, Oct 6, 2016 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> >
> > > On Oct 6, 2016, at 12:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > > meta-python/recipes-devtools/python/python-pybind11.inc       | 9
> > +++++++++
> > > meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb  | 2 ++
> > > meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb | 2 ++
> > > 3 files changed, 13 insertions(+)
> > > create mode 100644 meta-python/recipes-devtools/
> > python/python-pybind11.inc
> > > create mode 100644 meta-python/recipes-devtools/python/
> > python-pybind11_1.8.1.bb
> > > create mode 100644 meta-python/recipes-devtools/python/
> > python3-pybind11_1.8.1.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc
> > b/meta-python/recipes-devtools/python/python-pybind11.inc
> > > new file mode 100644
> > > index 0000000..e13f6a5
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-pybind11.inc
> > > @@ -0,0 +1,9 @@
> > > +SUMMARY = "Seamless operability between C++11 and Python"
> > > +HOMEPAGE = "https://github.com/wjakob/pybind11"
> > > +LICENSE = "BSD-2-Clause"
> > > +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519
> > ea"
> > > +PR = “r0"
> >
> > Drop this
> >
> > > +
> > > +SRC_URI = "https://pypi.python.org/packages/89/0b/
> > f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9
> > /pybind11-1.8.1.tar.gz"
> > > +SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
> > > +SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bb
> > aaa2c479a44e67e642820fe0f329a4fff8"
> > > diff --git a/meta-python/recipes-devtools/python/python-
> > pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python-
> > pybind11_1.8.1.bb
> > > new file mode 100644
> > > index 0000000..e567430
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> > > @@ -0,0 +1,2 @@
> > > +inherit pypi setuptools
> > > +require python-pybind11.inc
> > > diff --git a/meta-python/recipes-devtools/python/python3-
> > pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python3-
> > pybind11_1.8.1.bb
> > > new file mode 100644
> > > index 0000000..355e284
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> > > @@ -0,0 +1,2 @@
> > > +inherit pypi setuptools3
> > > +require python-pybind11.inc
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

