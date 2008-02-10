Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JOKhK-000648-3x
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 23:30:54 +0100
Received: from andromeda (e180132137.adsl.alicedsl.de [85.180.132.137])
	by drlauer-research.com (Postfix) with ESMTP id E5780584C28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2008 23:35:51 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Feb 2008 23:31:20 +0100
User-Agent: KMail/1.9.7
References: <E1JO1gA-000658-1E@linuxtogo.org>
	<20080210220226.27a2612f@widy.localdomain>
In-Reply-To: <20080210220226.27a2612f@widy.localdomain>
MIME-Version: 1.0
Message-Id: <200802102331.20332.mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev SlugOS: make "turnup nfs" work correctly with the new network driver (loads
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2008 22:30:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 10 February 2008 21:02:26 Paul Sokolovsky wrote:
> > ============================================================
> > --- packages/netbase/netbase/slugos/if-pre-up.d/test-nfsroot
> > 225fbcdfa332608a2c8f1360fc922261f28ba694 +++
> > packages/netbase/netbase/slugos/if-pre-up.d/test-nfsroot
> > 225fbcdfa332608a2c8f1360fc922261f28ba694 @@ -0,0 +1,10 @@ +#!/bin/sh
> > +#
> > +if [ X"$IFACE" == "Xeth0" ] ; then
> > +  nfsroot=`grep ' / nfs ' /proc/mounts`
> > +  if [ -n "$nfsroot" ]; then
> > +    echo "WARNING: Refusing to ifup eth0 when booted to a
> > nfs-mounted rootfs."
> > +    exit 1
> > +  fi
> > +fi
> > +exit 0
>
> 	Is this something which can be readily applied as general
> feature - NFS boot doesn't work out of the box for any ditsro since
> that eth0 dhcp change.

+1 from me, I'm using nfsroot a lot -- it's invaluable for rapid distro 
debugging.

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


