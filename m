Received: from [203.97.37.64] (helo=smtp4.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MlaCb-0003ma-04
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 05:20:08 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp4.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KPQ006NQJWA8A10@smtp4.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Thu,
	10 Sep 2009 15:19:22 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id DFCA35CE258	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 15:19:21 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id QveW2VexGn3n	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 15:19:21 +1200 (NZST)
Received: from [192.168.1.130] (unknown [192.168.1.130])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 189E95CE220	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	10 Sep 2009 15:19:21 +1200 (NZST)
Date: Thu, 10 Sep 2009 15:19:19 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <200909100412.56615.holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <4AA87037.3030708@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
References: <4AA3ABA8.304@eukrea.com> <4AA74FEE.8060809@eukrea.com>
	<4AA825DF.70003@4d-electronics.co.nz>
	<200909100412.56615.holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-SA-Exim-Connect-IP: 203.97.37.64
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
X-List-Received-Date: Thu, 10 Sep 2009 03:20:08 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: QUOTED-PRINTABLE

On 10/09/09 14:12, Holger Hans Peter Freyther wrote:
> On Thursday 10 September 2009 00:02:07 Matthew Dombroski wrote:
>   =20
>> On 09/09/09 18:49, Eric B=E9nard wrote:
>>     =20
>>> Hi Matthew,
>>>
>>> Matthew Dombroski a =E9crit :
>>>       =20
>>>> Actually, the problem is that tslib is linked incorrectly.
>>>> The pthres, linear, etc. modules are not linked to libts so they=
re
>>>> missing symbols when an attempt is made to load them.
>>>>         =20
>>> ts_calibrate&  ts_test are working fine : doesn't is mean the mod=
ules
>>> are properly linked ?
>>>       =20
>> ldd says not:
>>
>> $ ldd dejitter.so
>> libc.so.6 =3D>  /lib/libc.so.6 (0x4000a000)
>> /lib/ld-linux.so.3 (0x2a000000)
>>
>> With my patch:
>>
>> $ ldd dejitter.so
>> libts-1.0.so.0 =3D>  /usr/lib/libts-1.0.so.0 (0x4000a000)
>> libdl.so.2 =3D>  /lib/libdl.so.2 (0x40014000)
>> libc.so.6 =3D>  /lib/libc.so.6 (0x4001f000)
>> /lib/ld-linux.so.3
>>
>> I'm not sure why Qt is the only place it fails (unlinked).
>> My opinion is that linking properly is technically better.
>>     =20

Hmm... tslib svn has fixed it anyway.
See=20
http://svn.berlios.de/viewcvs/tslib/trunk/tslib/plugins/Makefile.am?r=
evision=3D56&view=3Dmarkup

> Can you provide us with the output of the failure?
>   =20

runtime failure:

# app  -qws
Couldnt load module pthres
QWSTslibMouseHandlerPrivate: ts_config() failed with error: 'No such=
=20
file or directory'
Please check your tslib installation!

My tslib installation is fine.

~Matt




