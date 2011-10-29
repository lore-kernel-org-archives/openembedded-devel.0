Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RK9uJ-0005WD-9t
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 16:29:11 +0200
Received: by qam2 with SMTP id 2so4205529qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HyvfOWlGFP/EkvNjPE6v0hl76V4vOBLirOOaCyqoiog=;
	b=CuyRynCuXboqlWuir/lAWd3eQWXfAqvFPfTyVA/K9miHKzgimk4AvGUPcj1cgfUmDk
	O3jDyiLlu9jfoOP8huilTfD+glleMy/yAROph+yHQZ1Y2BfVg01MsK6a3mx0yk0XZH0Y
	B4iopkkE+YXu5pP0vvXnKZPyMoGiOroPtZ7ng=
MIME-Version: 1.0
Received: by 10.229.180.105 with SMTP id bt41mr1675260qcb.194.1319898188243;
	Sat, 29 Oct 2011 07:23:08 -0700 (PDT)
Received: by 10.229.169.73 with HTTP; Sat, 29 Oct 2011 07:23:08 -0700 (PDT)
In-Reply-To: <201110232150.53072.roman@khimov.ru>
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com> <201110232150.53072.roman@khimov.ru>
Date: Sat, 29 Oct 2011 16:23:08 +0200
Message-ID: <CAFU7RzPorTswwvdUwUAUNqtO=6T=4N-SRLBieNrgxNJa4VrP_Q@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 29 Oct 2011 14:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> Our main build server has two Xeons X5670 with 96 GB of RAM. It's running=
 24=C3=977
> cyclicly doing clean isolated builds of all our OE projects (currently fi=
ve).
> "Isolated" means that the the actual build is done inside a container (LX=
C)
> with no network available at all, that is a requirement for all our build=
s, to
> be able to take one tarball of sources, one tarball of OE tree and build =
the
> project somewhere in a nuclear bunker.

So, LXC sounds a better way than qemu for performances, isn't it?
Portability issues (next years operating systems) moving around the OE setu=
p?

> The system is configured in such way that container is located on tmpfs (=
with
> size of 50 GB). The most complex build takes about hour and a half on thi=
s
> system occupying about 45 GB of space in a ramdisk.

I'm now building on xeon 5530 8 core (HP Z800) with 24GB DDR3.
20GB for tmpfs where I put only the tmp directory.
Recipes dir is on ssd 480MB/S writing speed.

> So today I tried to get some RAM vs. Linux cache statistics and switched =
this
> mount point over to newly created 60 GB LVM partition with ext4 on RAID0 =
array
> consisting of two SAS 15K drives.
>
> The system made builds for three projects is this configuration and I see=
 no
> difference at all, usual 1-2 minutes deviation. Granted, the system has q=
uite
> powerful disks (RAID array gives about 380 MB/sec on hdparm) and things m=
ight
> be a little different on plain SATA drives, but frankly I'd expected to s=
ee
> the difference anyway since there are lots of small files involved in a b=
uild.

You say you have no big differences between all tmpfs and SAS one?
I have instead SAS 15k RAID1, but I don't remember now their speed.
Moving from a complete SAS 15K setup to tmp dir in RAM I've instead
reduced from 4h to 1.5h for my image.

> Maybe I should try to further degrade the disk system by creating some
> encrypted volume inside LVM, but still from what I see Linux caching and
> buffering works good enough, just give it as much RAM as you can.
>
> But then also what you'll get from RAM or disk or even CPU upgrade depend=
s on
> what type of build you have. Upgrading developers build servers from pair=
 of
> 4-core Opterons (don't remember exact model) with 8 GB of RAM to pair of =
Xeons
> E5620 with 24 GB of RAM with comparable disks gave about 20-30% of build =
time
> reduction for one project and 50% for another. But that builds are not
> isolated and use icecc cluster with all build servers available to the
> cluster, maybe that helps also in our situation.

In my opinion the best setup is the one that I can move from a box to
another one without problem,
to be safe in case a box stops working.
If it stops I go to another one, I rsync download from the backup
server and restart.

Redundancy of cpu power should a different approach, but you "nuclear
bunker" contraints doesn't include this possibility.
I was in the past thinking to get a 15k=E2=82=AC building system with 2
computational nodes and a fast storage, with a standard debian on it.
A "small" blade center.
A developer ssh into it, he can do meld through nfs mount, start it's
own tagged qemu and compile his image.
If one core crash, the other one works anyway.

But now we are instead moving from 8 cores to 16 cores (IBM I don't
remember the model, something about 7000k=E2=82=AC off full price w/o
discount) with 64GB ram in order to be able to compile at least the
compilation at the same time.

Anyway it is difficult to convince developers to use central machine,
instead of using their own awful pc.
It's an hard job, but it's needed to speed up the stupid compilation job.

To complete the redundancy idea I'll have soon the 16cores with arch
linux and qemu through virtual manager.
If I have 16cores pb I'll get the used qemu image to the 8cores and I go on=
.

Bye,
Raffaele

--=20
www.opensurf.it


