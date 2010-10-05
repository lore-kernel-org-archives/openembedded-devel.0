Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P39FQ-0000we-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 17:16:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P39F1-0006Pq-Uc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 08:15:43 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 5 Oct 2010 08:15:43 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 5 Oct 2010 09:15:42 -0600
Message-ID: <4CAB4112.3070505@mentor.com>
Date: Tue, 05 Oct 2010 08:15:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<i8ev7s$ts9$1@dough.gmane.org>
In-Reply-To: <i8ev7s$ts9$1@dough.gmane.org>
X-OriginalArrivalTime: 05 Oct 2010 15:15:42.0494 (UTC)
	FILETIME=[2D2203E0:01CB64A0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 15:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 05-10-10 09:43, Khem Raj wrote:
>> Hi
>>
>> Following set of patches is intial support for getting libtool 2.4 into
>> openemebedded. I have so far built minimal-image for two machines successfully
>>
>> The big change that libtool 2.4 brings is sysroot support and I have added
>> support to use this feature. It should make our life easier.
> 
> I'm a bit concerned about the way this is implemented, it seems to for
> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
> that intended? If so we need signoffs from each and every distro
> maintainer *and* from the maemo-compat folks as well.
> Unless there is a way to make the new features conditional on the
> libtool version.

It shouldn't be too bad, implementation wise, to set LIBTOOL_HAS_SYSROOT 
or similar and test for that.  But can we also set a phase out date for 
older libtool, even if maemo-compat isn't possible (given chinhook pins 
to 1.5, I bet it's not) ?

-- 
Tom Rini
Mentor Graphics Corporation


