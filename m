Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NtdB9-0005X2-Nb for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 09:40:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ntd7Z-0006sB-OZ for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 09:36:25 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 09:36:25 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 09:36:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 09:35:11 +0100
Message-ID: <ho7a3v$6v8$1@dough.gmane.org>
References: <ac9c93b11003210557u1fcbcc21jb0dafb9fa16ccc96@mail.gmail.com>	<ho5b8b$oao$1@dough.gmane.org>
	<ac9c93b11003211238p38d25065p73841962f1ce2789@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <ac9c93b11003211238p38d25065p73841962f1ce2789@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hawkboard at 456 Mhz?
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
X-List-Received-Date: Mon, 22 Mar 2010 08:40:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-03-10 20:38, Frans Meulenbroeks wrote:
> 2010/3/21 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 21-03-10 13:57, Frans Meulenbroeks wrote:
>>> Hi,
>>>
>>> In the openembedded repository I saw the following patch:
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-davinci/da850_omapl138_opp456mhz.patch
>>> This seems to suggest that it is possible to run the hawkboard at 456
>>> Mhz (and yeah: I know it is out of spec and out of warranty, but for
>>> an experiment it would be quite helpful for me).
>>> I've build the kernel with openembedded, the patch is applied,
>>> CONF_CPU_FREQ is defined, but the control hook in /sys is not there.
>>> I've also tried tweaking the file with the settings (ds850.c) but to no avail.
>>>
>>> Anyone a suggestion on how to get this done?
>>
>> You need a newer kernel that doesn't rely on the TPS part for cpufreq
>> (hawkboard lacks a PMIC, the evm uses the TPS). You can build from the
>> ti/staging[1] branch to get such a kernel.
>>
>> Or wait a week for that branch to get merge, internal testing is finally
>> wrapping up.
>>
>> [1] http://gitorious.org/angstrom/openembedded/commits/ti/staging
> 
> 
> Koen,
> 
> Thanks alot!
> As patience is something that I don't have an overdose of, I decided
> not to waste any on this issue.
> So I checked out the git and rebuild the kernel. Works like a charm.
> 
> For those who want to reproduce this:
> Be sure to adapt defconfig (CONFIG_DA8XX_MAX_SPEED_456=y)
> 
> I changed the speed setting with cpuspeed, this one is not on the
> angstrom feed, so you need to build it yourself too.

I use cpufrequtils, is cpuspeed a better option?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLpyu/MkyGM64RGpERAp9qAJ4ppZ8U3HCBTD+zp+TUs2Y6+vNeAwCdElnj
0Lk6h8fnSQjG2G58ihbMy20=
=6PRK
-----END PGP SIGNATURE-----



