Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUM8X-0002u5-4A
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 17:57:14 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUM3v-00027D-5x from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:52:27 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Jul 2010 08:52:26 -0700
Received: from [172.30.80.201] ([172.30.80.201]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Jul 2010 09:52:25 -0600
Message-ID: <4C2CB9B6.1010509@mentor.com>
Date: Thu, 01 Jul 2010 08:52:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2AC77A.70102@gmail.com>
	<4C2ACDE8.7080801@gmail.com>	<lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<i0ian8$pt3$1@dough.gmane.org>
In-Reply-To: <i0ian8$pt3$1@dough.gmane.org>
X-OriginalArrivalTime: 01 Jul 2010 15:52:25.0859 (UTC)
	FILETIME=[66C8D530:01CB1935]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Thu, 01 Jul 2010 15:57:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 01-07-10 16:55, Enrico Scholz wrote:
>> Graham Gower <graham.gower@gmail.com> writes:
>>
>>> None of the distros in OE 
>> At least the openmoko SHR distribution fetches ipkg from network and
>> requires curl support hence.
> 
> That's not true, with curl disabled, it calls (busybox) wget.
> 
>>> appear to want/need gpg or curl support in opkg; so have opkg.inc
>>> remove them by default.
>> I do not think that supporting only offline mode (due to removal of
>> curl support) is a good idea.  Although the opportunistic signature
>> verification is not secure, it would be imo bad to remove gpg support
>> completely because updating embedded devices in a secure manner is
>> important.
>>
>> A better way might be to conditionalize your '--disable-*' options
>> resp. make them depend on some DISTRO_FEATURE.
> 
> Introducing USE flags would be a step backwards, so NAK on that.

Increasing (or decreasing...) USE flags, now there's a topic for the TSC...

-- 
Tom Rini
Mentor Graphics Corporation


