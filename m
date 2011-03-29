Received: from harad.oktetlabs.ru ([89.163.14.95])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <helen@oktetlabs.ru>) id 1Q4aHB-0004AS-N5
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 16:52:10 +0200
Received: from aule.oktetlabs.ru (aule.oktetlabs.ru [192.168.37.14])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by harad.oktetlabs.ru (Postfix) with ESMTPSA id 8ECBC7B4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 18:50:11 +0400 (MSD)
Message-ID: <4D91F1A2.8010609@oktetlabs.ru>
Date: Tue, 29 Mar 2011 18:50:10 +0400
From: Elena Vengerova <helen@oktetlabs.ru>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.38.b3pre.fc13
	Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D91C2FE.4000905@oktetlabs.ru> <4D91EE16.8060104@mentor.com>
In-Reply-To: <4D91EE16.8060104@mentor.com>
Subject: Re: patch 2.6 rejects relative paths
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
X-List-Received-Date: Tue, 29 Mar 2011 14:52:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29.03.2011 18:35, Tom Rini wrote:
> On 03/29/2011 04:31 AM, Elena Vengerova wrote:
>> Hello,
>>
>> I have patch 2.6.1 on my Fedora.
>> I've found out that it rejects patches like
>> recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch with relative paths:
>>
>> --- ../generic/tclStrToD.c.orig
>> +++ ../generic/tclStrToD.c
>>
>> I failed to find the reason, but my colleague said me (she was unsure)
>> that it was security hole fix.
>> Thus looks like it's no way to force patch behave like old one.
>>
>> I wonder if some work around is possible (except patch downgrade) or
>> it's necessary to fix the recipes.
> What metadata are you using (and branch name)?  This should be fixed in
> current openembedded.org master.
>
I use release-2011.03 (I hope).
Sorry, I'm new in OE, not sure what do you exactly mean by "metadata" 
(the term itself is bit ambiguous).
I'm trying to build meta-toolchain recipe with local config almost same 
as sample one.

Nice to hear that it's fixed.

Thanks a lot,
     Elena



