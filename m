Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1OF4VV-0006Z1-Ro
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 14:05:46 +0200
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id D4C5337071
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 14:01:45 +0200 (CEST)
Message-ID: <4BF524AF.5030700@acn-group.ch>
Date: Thu, 20 May 2010 14:01:51 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF2417A.6000302@acn-group.ch> <ht374m$lsv$2@dough.gmane.org>
In-Reply-To: <ht374m$lsv$2@dough.gmane.org>
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
X-List-Received-Date: Thu, 20 May 2010 12:05:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 20.05.2010 13:41, Koen Kooi a =E9crit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-05-10 09:27, Christophe Aeschlimann wrote:
>> Hi,
>>
>> We are at least three hawkboard owners that have the same issue.
>>
>> Building org.openembedded.dev HEAD with
>>
>> MACHINE=3D "hawkboard"
>> DISTRO =3D "angstrom-2008.1"
>>
>> produces a Kernel Image that cannot be booted on our hawkboards.
>>
>> The behaviour is the following with the following kernel bootargs :
>
>>> [    0.350000] vpif vpif: vpif probe success
>>> [    0.350000] Switching to clocksource timer0_1
>>
>> And it hangs there forever.
>
> That should be fixed now with:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D49a1f4b=
db309969f2c40b5dbfefdb56c83c0b264
>
> regards,

Yes I confirm it is.

Thanks,

Christophe

>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL9R/WMkyGM64RGpERAj0qAJ4kmzsizEWt/bxA/GmfqK9wVIAjbQCePKC1
> 6bz6gYhGO+l/4TFhk9TNhcI=3D
> =3DPHmx
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


