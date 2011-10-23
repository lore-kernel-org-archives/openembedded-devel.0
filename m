Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RI61X-0005UR-26
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 23:56:07 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 2D2C4C2DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 23:50:07 +0200 (CEST)
X-SENDER-IP: [83.227.59.253]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhEZAGqLpE5T4zv9PGdsb2JhbAAMN6kqAQEBATeCIAEBAQEDAQEBawoRCyEWBAsJAwIBAgEVARsUEwYCAQGIBLQ+iEAEkW6CG5Fd
X-IronPort-AV: E=Sophos;i="4.69,395,1315173600"; 
	d="scan'208,217";a="135312910"
Received: from c-fd3be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.59.253])
	by iph3.telenor.se with ESMTP; 23 Oct 2011 23:50:06 +0200
Message-ID: <4EA48C0E.6070700@telia.com>
Date: Sun, 23 Oct 2011 23:50:06 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com> <201110232150.53072.roman@khimov.ru>
In-Reply-To: <201110232150.53072.roman@khimov.ru>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Sun, 23 Oct 2011 21:56:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

2011-10-23 19:50, Roman Khimov skrev:
> ? ????????? ?? 18 ??????? 2011 10:03:25 ????? Ulf Samuelsson ???????:
>> Also what happens if it it built on a fast SSD, or even a RAMdisk?
> Our main build server has two Xeons X5670 with 96 GB of RAM. It's runni=
ng 24=D77
> cyclicly doing clean isolated builds of all our OE projects (currently =
five).
> "Isolated" means that the the actual build is done inside a container (=
LXC)
> with no network available at all, that is a requirement for all our bui=
lds, to
> be able to take one tarball of sources, one tarball of OE tree and buil=
d the
> project somewhere in a nuclear bunker.
>
> The system is configured in such way that container is located on tmpfs=
 (with
> size of 50 GB). The most complex build takes about hour and a half on t=
his
> system occupying about 45 GB of space in a ramdisk.
>
> So today I tried to get some RAM vs. Linux cache statistics and switche=
d this
> mount point over to newly created 60 GB LVM partition with ext4 on RAID=
0 array
> consisting of two SAS 15K drives.
>
> The system made builds for three projects is this configuration and I s=
ee no
> difference at all, usual 1-2 minutes deviation. Granted, the system has=
 quite
> powerful disks (RAID array gives about 380 MB/sec on hdparm) and things=
 might
> be a little different on plain SATA drives, but frankly I'd expected to=
 see
> the difference anyway since there are lots of small files involved in a=
 build.
>
> Maybe I should try to further degrade the disk system by creating some
> encrypted volume inside LVM, but still from what I see Linux caching an=
d
> buffering works good enough, just give it as much RAM as you can.
>
> But then also what you'll get from RAM or disk or even CPU upgrade depe=
nds on
> what type of build you have. Upgrading developers build servers from pa=
ir of
> 4-core Opterons (don't remember exact model) with 8 GB of RAM to pair o=
f Xeons
> E5620 with 24 GB of RAM with comparable disks gave about 20-30% of buil=
d time
> reduction for one project and 50% for another. But that builds are not
> isolated and use icecc cluster with all build servers available to the
> cluster, maybe that helps also in our situation.
>

Thanks,

I tried installing 32 bit Ubuntu 11.10 on a HDD and got results,
which are very close to the results of 64 bit ubuntu 11.10, but when I tr=
ied
hdparm the 32 bit system had 50 MB/s and the 64 bit system
had 100-110 MB/s so they are not comparable.

Also tried putting tmp/sysroots on a 3 GB tmpfs, and that only
made the build a couple of minutes faster on a 1 hour build.



>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson


