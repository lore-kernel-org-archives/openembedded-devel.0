Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1OEPKu-0007kg-Sn
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 18:08:05 +0200
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 787A4370B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 15:36:40 +0200 (CEST)
Message-ID: <4BF297ED.9060301@acn-group.ch>
Date: Tue, 18 May 2010 15:36:45 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF2417A.6000302@acn-group.ch>
	<hstfm9$fv2$2@dough.gmane.org>	<4BF24B6C.9030606@acn-group.ch>
	<hstsna$uhr$1@dough.gmane.org>
In-Reply-To: <hstsna$uhr$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 195.160.190.3
X-SA-Exim-Mail-From: c.aeschlimann@acn-group.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [hawkboard] OE Kernel Not Booting
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
X-List-Received-Date: Tue, 18 May 2010 16:08:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 18.05.2010 13:12, Koen Kooi a =C3=A9crit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-05-10 10:10, Christophe Aeschlimann wrote:
>> Le 18.05.2010 09:30, Koen Kooi a =C3=A9crit :
>> On 18-05-10 09:27, Christophe Aeschlimann wrote:
>>>>> Hi,
>>>>>
>>>>> We are at least three hawkboard owners that have the same issue.
>>>>>
>>>>> Building org.openembedded.dev HEAD with
>>>>>
>>>>> MACHINE=3D "hawkboard"
>>>>> DISTRO =3D "angstrom-2008.1"
>>>>>
>>>>> produces a Kernel Image that cannot be booted on our hawkboards.
>>>>>
>>>>> The behaviour is the following with the following kernel bootargs :
>>>>>
>>>>> console=3DttyS2,115200n8 root=3D/dev/nfs
>>>>> nfsroot=3D172.16.147.10:/srv/nfs/hawkboard ip=3D172.16.100.100
>>>>> eth=3D0a:c1:a8:12:fa:c0
>>>>>
>>>>>> U-Boot 2009.01-dirty (Nov 26 2009 - 02:15:00)
>>
>> Try the OE built u-boot.
>>
>>> Hi Koen,
>>
>>> I haven't been able to boot using the OE generated u-boot so far.
>>
>>> But I'm a bit confused about how everything is working together.
>>
>>> Don't you have to generate an AIS image using AISGen and the OE
>>> generated u-boot image before flashing it in the UBL partition
>>> (beginning of the second erase block) ?
>
> Not that I know of. I flashed uboot using tftp and that seemed to work
> fine. That was on a prototype hawkboard which has released it magic
> smoke since then.

Ok then I assume you had a pre-installed working UBL (User Boot Loader)=20
in NAND @ Block 1 (0-indexed), that would initialize the board HW (EMIFA=20
timings, SDRAM refresh cycles, etc) load block 2 in memory (U-Boot)and=20
executes it. Then you could just overwrite the U-Boot NAND partition=20
using U-Boot tftp and nand erase / write.e commands.

But AFAIU if you don't have an UBL (E.G. because you don't have a CCS=20
license to modify/rebuild it) you can workaround it by using the AIS=20
generator that generate a "self-bootable" image. In this case we want=20
the OMAP-L138 RBL (ROM Bootloader) to read the AIS image from NAND (@=20
block 1, where the UBL is normally stored) configure the HW and start=20
executing U-Boot.

Does this tell you anything ?

Regards,

Christophe


>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL8nYpMkyGM64RGpERAqugAJ99oUDfVGTJAbIs8AQwR1HA/9iTdwCffwgQ
> B6yfaXpEm0axylpQQu6q5v0=3D
> =3DH6Ac
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



