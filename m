Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OQo95-0006BI-Cj
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 23:03:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OQo4d-00040Q-WE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 13:58:32 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 21 Jun 2010 13:58:31 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Jun 2010 14:58:30 -0600
Message-ID: <4C1FD274.8000306@mentor.com>
Date: Mon, 21 Jun 2010 13:58:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <113134CF306E8E4CACC27BE5937261B2092DE57AC9@AUSX7MCPS303.AMER.DELL.COM>
	<4C1FCE17.6010409@mentor.com>
In-Reply-To: <4C1FCE17.6010409@mentor.com>
X-OriginalArrivalTime: 21 Jun 2010 20:58:30.0731 (UTC)
	FILETIME=[80F869B0:01CB1184]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add a waf bitbake class. (Koen Kooi)
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
X-List-Received-Date: Mon, 21 Jun 2010 21:03:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Sean_Hudson@Dell.com wrote:
>> On 18-06-10 21:58, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> ------------------------------
>>> On 18-06-10 21:58, Sean_Hudson@Dell.com wrote:
>>>> Hi All,
>>>>
>>>>   We are using waf for some of our modules and decided to add a 
>>>> class to make it easier to write recipes.
>>> Why is there still a staging method in there? Those have been deprecated
>>> for months now.
>>
>> Thanks for taking the time to reply.  To answer your question, the waf 
>> class was cloned from the autotools.bbclass, so the staging stuff came 
>> from there.  Is there a better way to handle the staging?
>>
>> It's a fairly trivial class, but I'm interested to hear if anyone had 
>> any additional thoughts on ways to improve the class?
> 
> Koen's point is that for a long time now do_stage has been set as legacy 
> and 'do_install' should instead set things up such that a package can 
> then be installed into the sysroots/ directory and reused.  Like 
> autotools.bbclass does today :)

And to be more clear, see is_legacy_staging in staging.bbclass

-- 
Tom Rini
Mentor Graphics Corporation


