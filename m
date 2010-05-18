Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OEMCA-0002vS-OZ for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 14:46:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OEKjB-00066c-Q6 for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 13:12:49 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 13:12:49 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 13:12:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 May 2010 13:12:42 +0200
Message-ID: <hstsna$uhr$1@dough.gmane.org>
References: <4BF2417A.6000302@acn-group.ch> <hstfm9$fv2$2@dough.gmane.org>
	<4BF24B6C.9030606@acn-group.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <4BF24B6C.9030606@acn-group.ch>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 18 May 2010 12:46:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-05-10 10:10, Christophe Aeschlimann wrote:
> Le 18.05.2010 09:30, Koen Kooi a écrit :
> On 18-05-10 09:27, Christophe Aeschlimann wrote:
>>>> Hi,
>>>>
>>>> We are at least three hawkboard owners that have the same issue.
>>>>
>>>> Building org.openembedded.dev HEAD with
>>>>
>>>> MACHINE= "hawkboard"
>>>> DISTRO = "angstrom-2008.1"
>>>>
>>>> produces a Kernel Image that cannot be booted on our hawkboards.
>>>>
>>>> The behaviour is the following with the following kernel bootargs :
>>>>
>>>> console=ttyS2,115200n8 root=/dev/nfs
>>>> nfsroot=172.16.147.10:/srv/nfs/hawkboard ip=172.16.100.100
>>>> eth=0a:c1:a8:12:fa:c0
>>>>
>>>>> U-Boot 2009.01-dirty (Nov 26 2009 - 02:15:00)
> 
> Try the OE built u-boot.
> 
>> Hi Koen,
> 
>> I haven't been able to boot using the OE generated u-boot so far.
> 
>> But I'm a bit confused about how everything is working together.
> 
>> Don't you have to generate an AIS image using AISGen and the OE
>> generated u-boot image before flashing it in the UBL partition
>> (beginning of the second erase block) ?

Not that I know of. I flashed uboot using tftp and that seemed to work
fine. That was on a prototype hawkboard which has released it magic
smoke since then.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL8nYpMkyGM64RGpERAqugAJ99oUDfVGTJAbIs8AQwR1HA/9iTdwCffwgQ
B6yfaXpEm0axylpQQu6q5v0=
=H6Ac
-----END PGP SIGNATURE-----



