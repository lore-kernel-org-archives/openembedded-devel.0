Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCzUR-0008DX-Mo
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 18:47:50 +0100
Received: by bwz9 with SMTP id 9so6011766bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 09:46:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.153.216 with SMTP id l24mr1794537bkw.129.1259084778658; 
	Tue, 24 Nov 2009 09:46:18 -0800 (PST)
In-Reply-To: <20091124113424.GH28485@jama>
References: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
	<20091124102028.GG28485@jama>
	<6ec4247d0911240309o4f296a6cy42dcbdad758afcc4@mail.gmail.com>
	<20091124113424.GH28485@jama>
Date: Tue, 24 Nov 2009 14:46:18 -0300
Message-ID: <ae9c9a1c0911240946g506c4c9brfe8c79630f5b07ea@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-target,sdk: bump SRCREV
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
X-List-Received-Date: Tue, 24 Nov 2009 17:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2009 at 8:34 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Nov 24, 2009 at 09:39:27PM +1030, Graham Gower wrote:
>> Is there a reason why another update-alternatives exists at all?
>> Wouldn't it be better to get fixes merged upstream?
>
> I'm not sure what update-alternatives-dpkg in OE does different
> grep -R =A0virtual/update-alternatives conf/distro
> shows only mamona.conf using dpkg

I don't actually know why the dpkg version was created, but I think
mamona was using it basically because it's the one provided by dpkg.

Until mamona 0.2 we used debootstrap with chroot and qemu, but as
we're now using the image feature from OE, we switched from u-a-dpkg
to u-a-cworth, so probably no one will actually use it anymore.

> Even with fixes merged upstream we should block installing own u-a with
> images, because its really confusing to have one u-a in /usr/bin/ and
> second in /usr/sbin/ and if someone in OE doesn't use opkg as pkg
> manager then we still need virtual/u-a.

At mamona we're using dpkg and u-a-cworth.

Cheers,
--=20
Ricardo Salveti de Araujo


