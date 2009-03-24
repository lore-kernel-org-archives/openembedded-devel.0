Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1LmCBE-0003mr-Vr
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 20:20:57 +0100
Received: by qyk30 with SMTP id 30so3525505qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=ukybzdC20eWNs4ViswQlaSlQGmODIspKwvHXXbc/Yuo=;
	b=tx4FdrAKzgCWWcUbgAdpG08BINlP1u9YcvmTKfQBfjdX3bZgPdwSeVxrDfA7yT/U3K
	fgtbUEtSCgKfgrr51B2YpA2nW7+lk+vjmMOAuf1DuBmW/2efw8Nr8ARRCMvnhqIuUmNu
	DA3EqdpPe9HcSEnA/7qo5RMNHQfcIR2nk54rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=DHuhnG2jjibMhI6KWIi3P/T1ouImYA9Fl6+/yi2OBLQcwq5HjCN8xeyu/msXk0xbc7
	yMBz/suqj/B0jgBYLTaqOljHHKOLFCeV5Iojbl7tyMq6LmqGz+doEMgTgIrBTGS/pi4q
	/r1aS/zPOEuPqkGFb3lp+gHsZGfmf8PScUVb4=
Received: by 10.142.13.14 with SMTP id 14mr3519299wfm.275.1237922364363;
	Tue, 24 Mar 2009 12:19:24 -0700 (PDT)
Received: from ?172.31.11.36? (mscitspubwlgw.wustl.edu [128.252.55.250])
	by mx.google.com with ESMTPS id 29sm14158543wfg.13.2009.03.24.12.19.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Mar 2009 12:19:23 -0700 (PDT)
Message-ID: <49C93237.7010205@gmail.com>
Date: Tue, 24 Mar 2009 14:19:19 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>	<1237885606.5348.8.camel@dax.rpnet.com>	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>
	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
In-Reply-To: <b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 19:20:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2009 02:05 PM, Chris Larson wrote:
> On Tue, Mar 24, 2009 at 11:56 AM, Junqian Gordon Xu <xjqian@gmail.com> wrote:
>> On 03/24/2009 01:36 PM, Frans Meulenbroeks wrote:
>>> Disadvantage of a Maintainers file is that it is yet another file to
>>> update when you create a package (adjacent to the checksums file and
>>> of course the package recipe). Guess it will be forgotten regularly.
>>>
>>> Also I fear we're going to end up with a lot of orphaned packages.
>> One possibility is to get statistics about the committer from the last X
>> commits, calculate the mean and standard deviation (STD) of the age of the
>> last X commits to indicate how likely the maintainer is alive, and
>> automatically update the Maintainer file every month. There will be other
>> details to discuss, but the maintainer file would look something like this.
>>
>> Recipe name     Maintainer      Mean Age (last 5)       STD (last 5)
>>
>> gcc             Koen            2 month                 10 days
>> binutils        RP              1 year                  2 month
> 
> That's an interesting possibility.  I'd thought about looking at the
> committers, but didn't think about using the age.  How would you
> handle something that's had 3 commits by one person and 2 by another?
> And those 3 were minor bugfixes by a contributer, not someone who
> plans on taking any responsibility for the state of the recipe? :)

That's the details I'm thinking abouts.

1) For a recipe who has a strong opinion on taking responsibility. We 
can use the logic of strong assignment for that person, so the 
maintainer field won't be overwritten by the weak assignment generated 
by the statistics.

2) For other recipes, I would use winner-takes-all (who has the most 
commits) for the last X commits, whether it's a bug fix or contributer. 
If the contributer really cares, please go back to step 1). If there is 
a tie, just list all the winners or list the last winner.

Regards
Gordon


