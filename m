Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Npkyn-000565-AG for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 17:11:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Npkvs-0001Xy-Ch for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 17:08:20 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 17:08:20 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 17:08:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Mar 2010 17:08:08 +0100
Message-ID: <hnb4h8$234$1@dough.gmane.org>
References: <4B990C32.6000906@dresearch.de> <hnb3e4$t8v$1@dough.gmane.org>
	<4B99132A.1060608@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <4B99132A.1060608@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom opkg feed config
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
X-List-Received-Date: Thu, 11 Mar 2010 16:11:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-03-10 16:58, Steffen Sledz wrote:
> Koen Kooi wrote:
>>> At the moment recipes/angstrom/angstrom-feed-configs.bb creates
>>> also config file for ${MACHINE_ARCH} specific packages. But at
>>> least for the machine arch 'hipox' (i'm not sure for other ones)
>>> the given URI does not exist. This results in an error when
>>> calling 'opkg update':
>>
>>> Collected errors:
>>>  * Failed to download http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv5te/machine/hipox/Packages.gz, error 1
>>
>>> Does this directory intentionally not exist?
>>
>>> Wouldn't it be better to create an empty Packages.gz if there
>>> are no machine arch specific packages?
>>
>> Feel free to volunteer to support this machine in angstrom, ask on the
>> angstrom devel mailinglist about it.
> 
> I'm not sure if i have the time to handle this. Sorry.
> 
> But as mentioned before, wouldn't it be a good idea to create an
> empty Packages.gz for all OE known machine types which are not
> officially supported by Angstrom just to avoid this error. That
> sounds easy to realize.

Feel free to volunteer to do that for all current and future OE
machines, for all current and future angstrom releases[1].

regards,

Koen

[1] Extending contrib/angstrom/sort.sh would go a long way
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLmRVoMkyGM64RGpERAvIvAJ9au96yM7Q4DhHCbz3VIRELDiQRagCgqtCZ
UU13RDLsxeaIH6RQr+2RU4g=
=tNNv
-----END PGP SIGNATURE-----



