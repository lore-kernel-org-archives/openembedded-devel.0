Received: from [203.97.33.68] (helo=smtp5.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MlVFz-0006tk-K4
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 00:03:18 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp5.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KPQ001TC57KC8D0@smtp5.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Thu,
	10 Sep 2009 10:02:10 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id C70355CE258	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 10:02:08 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id N2suH5o+1+Xt	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 10:02:08 +1200 (NZST)
Received: from [192.168.1.130] (unknown [192.168.1.130])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 14F8F5CE123	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 10:02:08 +1200 (NZST)
Date: Thu, 10 Sep 2009 10:02:07 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <4AA74FEE.8060809@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <4AA825DF.70003@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
References: <4AA3ABA8.304@eukrea.com>
	<200909061703.48206.holger+oe@freyther.de> <4AA3EE5E.70409@eukrea.com>
	<4AA43612.8070808@4d-electronics.co.nz> <4AA74FEE.8060809@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-SA-Exim-Connect-IP: 203.97.33.68
X-SA-Exim-Mail-From: matthew@4d-electronics.co.nz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Wed, 09 Sep 2009 22:03:19 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: QUOTED-PRINTABLE

On 09/09/09 18:49, Eric B=E9nard wrote:
> Hi Matthew,
>
> Matthew Dombroski a =E9crit :
>> Actually, the problem is that tslib is linked incorrectly.
>> The pthres, linear, etc. modules are not linked to libts so theyre=
=20
>> missing symbols when an attempt is made to load them.
>
> ts_calibrate & ts_test are working fine : doesn't is mean the modul=
es=20
> are properly linked ?

ldd says not:

$ ldd dejitter.so
libc.so.6 =3D> /lib/libc.so.6 (0x4000a000)
/lib/ld-linux.so.3 (0x2a000000)

With my patch:

$ ldd dejitter.so
libts-1.0.so.0 =3D> /usr/lib/libts-1.0.so.0 (0x4000a000)
libdl.so.2 =3D> /lib/libdl.so.2 (0x40014000)
libc.so.6 =3D> /lib/libc.so.6 (0x4001f000)
/lib/ld-linux.so.3

I'm not sure why Qt is the only place it fails (unlinked).
My opinion is that linking properly is technically better.

~Matt




