Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcE0u-0006JR-By
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 14:07:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 04:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,670,1363158000"; d="scan'208";a="333826374"
Received: from unknown (HELO helios.localnet) ([10.255.12.153])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2013 04:49:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 14 May 2013 12:49:14 +0100
Message-ID: <2217036.tZJrAExl06@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CANyK_8dZ+LZtpXhQ27frs6wX6PVzdBi=aHAeoJTQQKKwL+M-0w@mail.gmail.com>
References: <CANyK_8dZ+LZtpXhQ27frs6wX6PVzdBi=aHAeoJTQQKKwL+M-0w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] Unshipped systemd files
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
X-List-Received-Date: Tue, 14 May 2013 12:07:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 May 2013 12:37:56 Paul Barker wrote:
> This is drawing on a build done over the weekend so apologies if these
> have already been fixed and I've missed them.
> 
> gpsd-3.7: gpsd: Files/directories were installed but not shipped
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/gpsd.service
>   /lib/systemd/system/gpsd.socket
> 
> zram-0.1: zram: Files/directories were installed but not shipped
>   /lib
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/zram.service
> 
> cloud9-0.6: cloud9: Files/directories were installed but not shipped
>   /lib
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/cloud9.service
> 
> Further QA log and build details available at
> http://www.paulbarker.me.uk/yocto/20130510_poky-raspberrypi_userland/

This is a generic issue which really needs to be fixed in systemd.bbclass 
rather than individual recipes:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4309

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


