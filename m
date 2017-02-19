Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4566FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 22:56:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1JMuZS5017936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Feb 2017 14:56:37 -0800 (PST)
Received: from yow-pgortmak-d1.corp.ad.wrs.com (128.224.56.57) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 19 Feb 2017 14:56:35 -0800
Received: by yow-pgortmak-d1.corp.ad.wrs.com (Postfix, from userid 1000)	id
	C819A2804BE; Sun, 19 Feb 2017 17:56:34 -0500 (EST)
Date: Sun, 19 Feb 2017 17:56:34 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20170219225634.GA9356@windriver.com>
References: <1487466684-16593-1-git-send-email-paul.gortmaker@windriver.com>
	<CAMKF1sqyxtRoLsi1QvABn7kVsskgLcUXXb7N_0JFct5ukiqUwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqyxtRoLsi1QvABn7kVsskgLcUXXb7N_0JFct5ukiqUwg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] netcat-openbsd: fix implicit dependency on pkg-config
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
X-List-Received-Date: Sun, 19 Feb 2017 22:56:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [oe] [PATCH] netcat-openbsd: fix implicit dependency on pkg-config] On 19/02/2017 (Sun 06:07) Khem Raj wrote:

> On Sat, Feb 18, 2017 at 5:12 PM Paul Gortmaker <paul.gortmaker@windriver.com>
> wrote:
> 
[...]

> >
> > -DEPENDS += "glib-2.0 libbsd"
> > +DEPENDS += "glib-2.0 libbsd pkgconfig-native"
> 
> 
> I think inherit pkgconfig should be the way to go here

That seems reasonable and would explain why I wasn't seeing a lot of
pre-existing depends on pkgconfig.  I'll test that and send a v2.

Thanks,
Paul.
--

> 
> >
> >
> >  SRC_URI =
> > "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat
> > \
> >
> > ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
> > @@ -42,5 +42,3 @@ do_install() {
> >      install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> >  }
> >  ALTERNATIVE_PRIORITY = "60"
> > -
> > -PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS
> > http://errors.yoctoproject.org/Errors/Details/130673/"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

