Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9164E6AF53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 12:47:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2013 05:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="360482353"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 05:48:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Thu, 04 Jul 2013 13:47:27 +0100
Message-ID: <1519816.5pLVqjn9PM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <20130704111809.GA3831@windriver.com>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios> <20130704111809.GA3831@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, b40527@freescale.com
Subject: Re: [meta-networking][PATCH] dnsmasq: install .service only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 04 Jul 2013 12:47:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 July 2013 07:18:09 Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with 
systemd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:
> > On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > > ---
> > > 
> > >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> > >  1 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > > 0f5b273..0710893 100644
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > @@ -30,9 +30,11 @@ do_install () {
> > > 
> > >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> > > 
> > > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf
> > > ${D}${sysconfdir}/
> > > 
> > >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > > 
> > > -
> > > -    install -d ${D}${systemd_unitdir}/system
> > > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +
> > > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > > then +        install -d ${D}${systemd_unitdir}/system
> > > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +    fi
> > > 
> > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
> > >      ""
> > > 
> > > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
> > 
> > I think we should really have a global fix for this issue rather than
> > hacking up every recipe:
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=4309
> 
> I'm inclined to agree, but looking at the bug it looks like the
> potential solution was discussed in February and it's on the schedule
> for Yocto 1.5, but that's October.

The thing is it could be done by anyone at any time - the bug is at status 
"NEW" which means the assignee hasn't actually accepted it yet, and the 
solution being suggested is fairly straightforward. Given that I think it 
would be easier to just fix the class and then we never have to worry about 
this issue again.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

