Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KBDMK-00033Z-FF
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 20:35:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KBDKO-0004uc-Jl
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 18:33:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 18:33:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 18:33:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Jun 2008 20:33:06 +0200
Message-ID: <g3rel4$tko$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008061003)
In-Reply-To: <20080624095735.GB3500@aquilonia.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 18:35:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
>> We've not made any decisions on what the commit/review policy should be,
>> this is open for discussion. We're thinking it may take the form of some
>> kind of kernel style Signed-off-by: tags and a switch to a partially
>> pull based model rather than just push based as we use monotone so more
>> than one developer handles any given change.
>>
> I have been thinking on this and here is my suggestion.
>
> One thing that has been noted has been the high level of work required
> to review every change to every package.
>
> Every time more than two OE people get together we keep talking about
> splitting OE into two. Maybe it is time to consider actually doing it.
> My suggestion would be along the rough lines of the following.
>
> 1) OE-core - everything needed to get upto a successful glibc build
> completed so gcc, gcc-cross, binutils and support packages. Also most
> stuff in classes/. Breakages in these two areas are what hurts the most
> and the area we have the least manpower in.

I'd expand that area to the stuff task-boot covers (init, udev, busybox, 
etc), and maybe even packages/linux.

>
> In this section we would have proper reviews and I would suggest no
> change without two OE-core developers signing off on it. (OE-core
> developers being possible a different group than the political OE core).
>
> 2) OE-universe - all the other stuff, the recipes and distro configs.
> The stuff where breakage tends to be less painful we keep as is. With
> people not being afraid to got git-revert on stupid changes. Yes you do
> need to test building all users of a .inc file or patch when you change
> them.
>
> If we find this system is working and we think we can handle the extra
> load we can always start to raise the bar. For example we could change
> core to 3 signoffs and universe to 2. But I think a little of this
> trying a new SCM will be seeing how peoples workflow changes. I know
> from OM git usage I was suddenly spending less time on complex merges
> and had more time to think.
>
> Anyway thats my 2p.
>
> Graeme




