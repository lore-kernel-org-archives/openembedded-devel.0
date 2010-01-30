Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NbGOy-00042y-5Y for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 17:42:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NbGMf-0002DY-CU for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 17:40:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 17:40:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 17:40:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 Jan 2010 17:35:36 +0100
Message-ID: <hk1n4n$vao$2@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>	<hk1iso$j38$1@ger.gmane.org>
	<1264865833.18482.56.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100114 Shredder/3.0.2pre
In-Reply-To: <1264865833.18482.56.camel@mattotaupa>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 16:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-01-10 16:37, Paul Menzel wrote:
> Am Samstag, den 30.01.2010, 16:23 +0100 schrieb Koen Kooi:
>> On 30-01-10 11:35, Frans Meulenbroeks wrote:
>>> Today I bumped into console-image and noticed the following:
>>>
>>> IMAGE_INSTALL = "task-base \
>>>             ${ANGSTROM_EXTRA_INSTALL} \
>>>             ${SPLASH} \
>>>             ${ZZAPSPLASH} \
>>>
>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>> DISTRO_EXTRA_INSTALL ?
>>> This under the assumption that console-image is a distro independent
>> recipe.
>>>
>>> Or, in case this is an angstrom specific recipe shouldn't it be
>> better
>>> named angstrom-console-image ?
>>>
>>> your views are appreciated :-)
>>
>> I vote for leaving it as it is, it gives some credit to where it
>> originated from. The image name already has been forcefully renamed to
>> strip out 'angstrom' so lets keep at least this bit of heritage.
> 
> I think the VCS (Git) is a good tool to find out where something like
> this originated from.

It isn't when people copy stuff to overlays, or just blindly copy it
into other files.

The angstrom core developers already have a betting pool on how long it
takes for kaelios and minimal to copy newly committed changes from
angstrom to their distro configs without credit.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLZF/YMkyGM64RGpERAm3kAJ942+gMJVOCoprsQ0/4Yp2pC20TSACfQD3j
cEgUrBGvdmzm5ZoWIzZf1EU=
=kYQ/
-----END PGP SIGNATURE-----



