Received: from [65.254.253.34] (helo=mailout04.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=i4+37W=6D=ngndg.com=tim@yourhostingaccount.com>)
	id 1LTLNM-0002pK-Tn for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 20:19:33 +0100
Received: from mailscan11.yourhostingaccount.com ([10.1.15.11]
	helo=mailscan11.yourhostingaccount.com)
	by mailout04.yourhostingaccount.com with esmtp (Exim)
	id 1LTLFl-0004tt-Fm for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 14:11:41 -0500
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan11.yourhostingaccount.com with esmtp (Exim)
	id 1LTLFl-0000Yq-4P for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 14:11:41 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8])
	by impout03.yourhostingaccount.com with NO UCE
	id AKBg1b0010ASqTN0000000; Sat, 31 Jan 2009 14:11:40 -0500
X-EN-OrigOutIP: 10.1.18.8
X-EN-IMPSID: AKBg1b0010ASqTN0000000
Received: from 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	([92.237.114.21] helo=[192.168.1.104])
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1LTLFk-0003Jn-GE for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 14:11:40 -0500
Message-Id: <5A59353E-03CA-4097-B54A-13C34C9CFAA9@ngndg.com>
From: Tim Ellis <tim@ngndg.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49849F35.60509@dls.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Sat, 31 Jan 2009 19:11:37 +0000
References: <97574E2A-03E4-421C-8C29-21A6556D4F7E@ngndg.com>	<EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>	<498473E8.1010707@dls.net>
	<8145A528-65C8-4B2A-B7BB-D006779396B8@ngndg.com>
	<49849F35.60509@dls.net>
X-Mailer: Apple Mail (2.930.3)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 92.237.114.21
X-EN-OrigHost: 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
Subject: Re: samba-3.2.5 missing
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
X-List-Received-Date: Sat, 31 Jan 2009 19:19:33 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Thank you for re-clarifying this yet again, I had accepted the feature  
parity issue several emails ago and agreed to fix it as soon as I can  
test and get a proper fix up and was just seeking clarification. If  
you just can't wait for this - sure go ahead and submit another package.

Thanks for being so patient and helping to educate me on these  
undocumented policies.

Tim

On 31 Jan 2009, at 18:57, Mike (mwester) wrote:

> Tim Ellis wrote:
>
>> Is it right that you will want every single point release of samba  
>> I add
>> then?
>
> You need to re-read my mail.  It is NOT about point releases, it is  
> the
> fact that you did NOT just do a point release; you added major new
> dependencies and then deleted the original recipe.  It also has  
> nothing
> to do with the desirability of the new recipe -- heck it doesn't  
> matter
> if your recipe will solve global warming if it won't build.
>
>> working with as it works for all the distros I tried it on, however  
>> this
>> is a dev branch right? Occasional breakage happens sometimes, despite
>> best efforts. I hope you can see the benefit in the samba cleanup  
>> as it
>> was very messy and repetitive before.
>
> I acknowleged that.  That's not the problem. And neither is a  
> cleanup a
> problem.
>
> The problem is that you added major new dependencies in a new version
> and deleted the old one.
>
> It has nothing whatever to do with anything you're talking about --  
> it's
> really very simple!  And don't quote OE guidelines at me either.   
> Please
> grep for "_slugos" and other things in the recipes -- you'll find all
> the places where I've taken enormous pains to ensure that the  
> changes I
> make do not risk anyone else's environment or builds.  I'm not even
> asking *that much* -- I'm just asking that when someone commits a  
> major
> new recipe, that they don't delete the old one -- so that I can go
> adjust my environment to build the old one until I can debug and
> troubleshoot why the new one won't work.
>
> There would be no problem at all if, in fact, your change was a minor
> update - but it wasn't! You added major new dependencies in a dot
> upgrade, and then deleted the original recipe.  That combination of
> actions, together, is the problem.
>
>> I will probably be able to push changes discussed at some point  
>> today,
>> but after I'm happy they are all working. Normally if I get a  
>> blocker I
>> would try and talk to the maintainer and remove the package until its
>> fixed - I suggest you do that unless you are testing samba.
>
> Again, I can't follow what you're saying here.  You want me to send an
> email, and then wait for you to argue with me via email, and finally
> commit a fix that may or may not work?  That's what we're doing,  
> right?
>
> But look - I've now spent more time in trying to get this all fixed,  
> and
> in discussing this than it's worth.  Really.
>
> So just forget it completely.
>
> I'll just commit my own samba-nokrb recipe (I recovered the old stuff
> from git; it's really quite easy when one is wide awake), and we can
> move on.  I'll even put it in my own package directory to avoid any
> confusion.
>
> Thanks
> Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



