Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Pklig-0003Kv-Pa
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 00:02:39 +0100
Received: from homiemail-a18.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id BD9C01783C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 15:01:43 -0800 (PST)
Received: from homiemail-a18.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTP id 0C0BB250071
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 15:01:36 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=GY0dGM2g2DNKV7UxtYfdR0SsR6x4FSSFN9ScqyZOPsFrHRSvnXI+7fzBJtnP2
	Wx/EsfX9PfrGthvdaddn5imEN4zMWWWNhHi16rFz5XmN5+r1qgwVr89iEQq7Pry8
	p1gWPA1O0QpCdE/XB0O9+6nj6RsPEMyx8Eq2hjqNcyvYeE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=j1BEq
	NpVN7YR6Uk9EZjOBFgxjnU=; b=J5Oj4wIs7BfSdLUM0Kob5slr0+Vjjvr1Rl9ex
	4F48kyJ5pT4CXRcDMYFrV+5Z/nohj27f0h+Ov3aYqrA7Jez9IU6UbvFnlJzKjhVQ
	VFqGk6/MrE2/3TM3g3xkkxFqlx3qCi9+94CPKorwjf20XJ+kbi4yfJYZ61DNj8Qb
	Dtt2p0=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPSA id D331125006C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 15:01:35 -0800 (PST)
Message-ID: <4D49E252.6090502@gumstix.com>
Date: Wed, 02 Feb 2011 15:01:38 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D347C60.6000805@gumstix.com>
	<20110117185830.GL21179@jama>	<4D45E172.4030105@gumstix.com>
	<20110131130937.GE3265@jama>
In-Reply-To: <20110131130937.GE3265@jama>
Subject: Re: EFL_SRCREV bump breaks GPE/enlightenment
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
X-List-Received-Date: Wed, 02 Feb 2011 23:02:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11-01-31 05:09 AM, Martin Jansa wrote:
> On Sun, Jan 30, 2011 at 02:08:50PM -0800, Neil MacMunn wrote:
>>>
>>> does it segfault or something? I haven't seen it with illume2 profiles,
>>> but I'm not using gpe-dm..
>>
>> I don't see any messages about what's happening but I seem to remember
>> something about a missing function in a .so. There was another EFL_SRCRV
>> change recently so I undid my revisions and accepted all of the upstream
>> changes. Unfortunately still no luck.
>
> Have you tried to remove ~/.e first?

Yes. The problem occurs on a fresh install.

> Someone reported similar segfault and removing ~/.e helped him.
> Otherwise "something about a missing function in a .so." doesn't help me
> much to reproduce it.. :/.
>

This is the only relevant log entry that I could find.

overo gpe-dm: gpe-dm: session pid 1409 exited with status 1

I put a video of the desktop at http://74.3.164.55/evidence/nocrash.html 
that shows the display problems. If I mouse over the menu any faster it 
crashes.

--
Neil


