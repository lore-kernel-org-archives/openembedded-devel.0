Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OtQ67-0001xk-22
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 21:14:19 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OtQ5Q-0001MO-UW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 12:13:36 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 12:13:36 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 13:13:35 -0600
Message-ID: <4C87E05A.6050004@mentor.com>
Date: Wed, 08 Sep 2010 12:13:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
	<lybp88kr5j.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lybp88kr5j.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-OriginalArrivalTime: 08 Sep 2010 19:13:35.0951 (UTC)
	FILETIME=[EF9F75F0:01CB4F89]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libtermcap
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
X-List-Received-Date: Wed, 08 Sep 2010 19:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Enrico Scholz wrote:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:
> 
>> Eric peeked into the termcap problem. I've tested his patch and it
>> works. He will probably push a patch later today.
>>
>> The termcap problem from asterisk is not related. It cannot find
>> libtermcap. This one does not exist any more with ncurses 5.7.
>>
>> People how should we fix this? 
> 
> I added 9e58422868a03eeafa72781477174850d1c5abe7 some hours ago so that
> '-ltermcap' should work again.  Patch does not break my builds but I do
> not know whether it unbreaks the problematic ones ;)
> 
> Things are too different across the distributions (some have the
> ncurses-config binconfig tools, other the .pc files, some have
> libtinfo, some not) to find *the* correct solution.

Maybe I'm jumping in too late here.  Why is the correct solution not 
"make our ncurses-native build and install what's required by other 
recipes, fix broken recipes that look for the wrong thing" ?  IMHO, if 
you ASSUME_PROVIDED and things break, thats not our problem, its your 
problem (Doctor, it hurts when I do *this*.  Don't do *that* !)

-- 
Tom Rini
Mentor Graphics Corporation


