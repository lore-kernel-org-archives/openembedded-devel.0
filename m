Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JOIKP-0006Fp-OX
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 20:59:06 +0100
Received: by ug-out-1314.google.com with SMTP id i24so196941ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2008 11:59:20 -0800 (PST)
Received: by 10.66.233.10 with SMTP id f10mr8190459ugh.25.1202673559834;
	Sun, 10 Feb 2008 11:59:19 -0800 (PST)
Received: from widy.localdomain ( [78.164.233.103])
	by mx.google.com with ESMTPS id 40sm1502696uge.2.2008.02.10.11.59.17
	(version=SSLv3 cipher=OTHER); Sun, 10 Feb 2008 11:59:19 -0800 (PST)
Date: Sun, 10 Feb 2008 22:02:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080210220226.27a2612f@widy.localdomain>
In-Reply-To: <E1JO1gA-000658-1E@linuxtogo.org>
References: <E1JO1gA-000658-1E@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 10 Feb 2008 19:59:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 10 Feb 2008 03:12:26 +0100
"mwester commit" <openembedded-commits@lists.openembedded.org> wrote:

> SlugOS: make "turnup nfs" work correctly with the new network driver
> (loads firmware, and ensures we do not ifup the interface if the
> rootfs in nfs).
> 
> Author: mwester@openembedded.org
> Branch: org.openembedded.dev
> Revision: 7787114b2180be3c68b345096ba1efb73b3e8371
> ViewMTN:
> http://monotone.openembedded.org/revision/info/7787114b2180be3c68b345096ba1efb73b3e8371
> Files: 1
> packages/netbase/netbase/slugos/if-pre-up.d/test-nfsroot
> packages/netbase/netbase_4.21.bb
> packages/slugos-init/files/boot/network
> packages/slugos-init/slugos-init_4.8.bb
> Diffs:
[]
> ============================================================
> --- packages/netbase/netbase/slugos/if-pre-up.d/test-nfsroot
> 225fbcdfa332608a2c8f1360fc922261f28ba694 +++
> packages/netbase/netbase/slugos/if-pre-up.d/test-nfsroot
> 225fbcdfa332608a2c8f1360fc922261f28ba694 @@ -0,0 +1,10 @@ +#!/bin/sh
> +#
> +if [ X"$IFACE" == "Xeth0" ] ; then
> +  nfsroot=`grep ' / nfs ' /proc/mounts`
> +  if [ -n "$nfsroot" ]; then
> +    echo "WARNING: Refusing to ifup eth0 when booted to a
> nfs-mounted rootfs."
> +    exit 1
> +  fi
> +fi
> +exit 0

	Is this something which can be readily applied as general
feature - NFS boot doesn't work out of the box for any ditsro since
that eth0 dhcp change.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


