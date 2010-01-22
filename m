Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NYGXf-0000Zy-KQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 11:15:06 +0100
Received: by ewy5 with SMTP id 5so1088627ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=vRogfllMSos4ef03voD5Z1PPRfH0l/+gqrZOcoc3Fxc=;
	b=xqVPcIRVXKpzo8bldq6MUa0htm4Vu53dj3M3mBWu+Gy0mgzIgJHBBf6v0HaWv4O1gh
	37Ie1WMgmzyxRvtXqLYa6yo4td2ucmuRS2GbPVrYtczPzMxD77Wx6BpQ/FjHHKtPf/5f
	L6AIq0mbaE0Ecr4KxyZh3TpDs96dfEJ02qvtM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YQDQmdX5t0SZdmclZvnT083ml75ZcBpAMCZeiljq/rIb21WbOhCEgREmnWx9G78Jw7
	1ZTvPIoJ8eIfnyNKtijwFLuH61XTzzSlHvEBFp1cBMCuXbMYzEGWgCnRfOR8O/DVcC7M
	1ZZBkbA1E/BX86S3DsImh3D81rhhqsZTRH/rI=
MIME-Version: 1.0
Received: by 10.213.39.206 with SMTP id h14mr3612457ebe.97.1264155165933; Fri, 
	22 Jan 2010 02:12:45 -0800 (PST)
In-Reply-To: <d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
	<201001172258.25258.jay4mail@gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
Date: Fri, 22 Jan 2010 11:12:45 +0100
Message-ID: <d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Zaurus PDA developers list <zaurus-devel@lists.linuxtogo.org>
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Fri, 22 Jan 2010 10:15:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Again about that Sharp headers...I tried to see why these were
necessary long ago:

Reading here  http://www.oesf.org/index.php?title=C3000_Device_Specifics#Creation_of_a_new_initrd_for_the_SL-C3000
it seems there was even an header appended to the kernel, not only one
header prepended to the initrd.

I suspect we have already broken the compatibility with original
layout (Version and Master version blocks)... so I'd go ahead
simplifying the script!

Regards

Andrea


P.S. about flashing the kernel (on clamshells, not collie)
nandlogical /dev/mtd1 WRITE 0x0E0000 0x140000 zImage.bin
vs
nandlogical /dev/mtd1 WRITE 0x0E0000 0x13C000 zImage.bin

What are these 0x4000 = 16KiB between kernel1 and kernel2?
( http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm )


