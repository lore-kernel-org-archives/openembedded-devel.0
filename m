Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1H4GTj-0006Vr-Mv
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 13:53:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1H4GRt-0007o3-W4
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 13:51:31 +0100
Received: from r76b2.r.ppp-pool.de ([89.54.118.178])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jan 2007 13:51:29 +0100
Received: from no2spam by r76b2.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jan 2007 13:51:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 09 Jan 2007 13:51:16 +0100
Message-ID: <eo0344$or0$1@sea.gmane.org>
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>	<20061230235938.GC16490@hezmatt.org>	<1167523571.5626.59.camel@localhost.localdomain>	<459786C7.70000@dominion.kabel.utwente.nl>	<1168200264.15021.54.camel@ip6-localhost>	<1662139633.20070107231632@gmail.com>	<20070107220333.GC6625@hezmatt.org>
	<ens65m$i2b$1@sea.gmane.org>
	<1168279741.4526.12.camel@ip6-localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r76b2.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
In-Reply-To: <1168279741.4526.12.camel@ip6-localhost>
Sender: news <news@sea.gmane.org>
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 12:53:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Patrick Ohly wrote:
> I have done the same before, the only difference was that I used Holger
> Schurig's "patcher". The method has some drawbacks:
>       * you have to keep track of which patches have been applied, and
>         you cannot let tools do it for you

I am not sure if Holger's patcher can do this, but quilt makes this real 
easy.  "ls -l patches/" or "quilt series" depending on what you want to 
know.

>       * you cannot easily(*) find out how your patch was modified after
>         you submitted it; this implies that learning how to write better
>         patches requires extra effort and thus becomes harder (more
>         unlikely?) and that mistakes made by the core developer when
>         merging the patch might not be detected by the external
>         developer (hey, it might happen, so for the sake of the argument
>         bear we me when I mention it ;-)

This one is a little bit more work but still doable.

mtn can give you the diff between any revision.  Get the one that was 
applied to OE with "mtn diff -r $rev1 -r $rev2", output it to a tmp file 
and compare to your quilt patch.

mtn can also restore the state of your OE tree to any revision you want. 
  "mtn update -r $rev_just_before_your_patch_was_applied;quilt push 
-a;cp $dir_you_were_working_on /tmp;quilt pop -a;mtn update; diff -Naur 
$dir_you_were_working_on /tmp/$dir_you_were_working_on|less"

IMHO this is all easier than the rigid regime you are proposing that no 
one is going to stick to anyways and that the main devs have already 
rejected.  The beauty of it is that you don't have to rely on anyone 
else to behave in a particular way for this work for you.



