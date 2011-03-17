Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q07nX-0000Nf-0I for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 08:39:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q07ln-0001uV-KR for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 08:37:19 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 08:37:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 08:37:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 08:37:07 +0100
Message-ID: <ilsdn3$dg5$1@dough.gmane.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>	<20110317014349.GN3042@denix.org>
	<4D817F36.30900@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D817F36.30900@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 07:39:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-03-11 04:25, Khem Raj wrote:
> On 3/16/2011 6:43 PM, Denys Dmytriyenko wrote:
>> An alternative solution, is to build libatomics-ops with emulated CAS
>> (Compare
>> And Swap), as otherwise those non-emulated primitives are not
>> available on
>> armel and sparc, according to [1]
>>
>> Let me know if fixing libatomics-ops is more preferable and I'll make
>> a patch.
>> But I figured that since cairo used to build w/o atomic ops anyway,
>> it's safer
>> to just forcefully disable the check for them.
> 
> I am inclined to get the libatomic-ops if possible.

Yes, me too

> 
>>
>> [1]
>> http://us.generation-nt.com/answer/bug-566850-ao-compare-swap-full-not-available-armel-sparc-help-169012241.html
>>
>>
>> BTW, the correct name is libatomic-ops and not libatomics-ops, like
>> it's named
>> in OE...
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgbojMkyGM64RGpERAjL9AJ9VS80ebM6fnzCAusGTYRXp4p6E9wCfchxY
QgG4eqdx70cqeSWwD0CP7o8=
=+AU8
-----END PGP SIGNATURE-----



