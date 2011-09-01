Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Qz1CD-0005eB-20
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 08:56:17 +0200
Received: from [62.99.145.7] (port=23367 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Qz17U-0007Q1-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 08:51:24 +0200
Received: from [83.64.51.210] (port=12140 helo=gateway1.hale)
	by smartmx-07.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1Qz17R-0001zY-OH for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 08:51:21 +0200
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id p816pFmF020538
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Sep 2011 08:51:15 +0200
Received: from entw48 ([192.168.100.138]) by hale.at with MailEnable ESMTP;
	Thu, 1 Sep 2011 08:51:09 +0200
Date: Thu, 1 Sep 2011 08:50:37 +0200 (CEST)
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
X-X-Sender: guib@entw48
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <201109010055.14620.schnitzeltony@gmx.de>
Message-ID: <alpine.DEB.2.00.1109010849170.15634@entw48>
References: <201108310825.16407.schnitzeltony@gmx.de>
	<201109010055.14620.schnitzeltony@gmx.de>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: p816pFmF020538
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1315464675.46174@7wch/aehhJ1PfRWevyBmGA
X-Spam-Status: No
Subject: Re: meta-oe: midori build fails with linker error
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
X-List-Received-Date: Thu, 01 Sep 2011 06:56:17 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463776668-1051676167-1314859837=:15634"

---1463776668-1051676167-1314859837=:15634
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Wed, 31 Aug 2011, Andreas M=FCller wrote:

> On Wednesday, August 31, 2011 08:25:16 AM Andreas M=FCller wrote:
> [...]
>> angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: note:
>> 'JSContextGetGlobalObject' is defined in DSO /home/Superandy/tmp/oe-core-
>> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0 so try adding
>> it to the linker command line
>>
>> | /home/Superandy/tmp/oe-core-
>>
>> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0: could not r=
ead
>> symbols: Invalid operation
>>
>> | collect2: ld returned 1 exit status
> we are not alone [1]...
>
> Andreas
>
> [1] https://bugs.launchpad.net/midori/+bug/799196
>

Hi,

LDFLAGS_append =3D " -ljavascriptcoregtk-1.0 "

should do the work.

Best regards,
Bernhard
--
Scanned by MailScanner.


---1463776668-1051676167-1314859837=:15634--
