Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K4uHp-0008L8-6g
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 11:00:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K4uCz-0003Vs-8L
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 08:55:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 07 Jun 2008 08:55:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 07 Jun 2008 08:55:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Jun 2008 10:55:20 +0200
Message-ID: <g2didp$ul2$1@ger.gmane.org>
References: <48486D5B.4060000@nospam.arcornews.de>	<200806061502.02821.mickey@vanille-media.de>
	<1212789415.6840.30.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <1212789415.6840.30.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: RW for otavio
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
X-List-Received-Date: Sat, 07 Jun 2008 09:00:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2008-06-06 at 15:02 +0200, Michael 'Mickey' Lauer wrote:
>> Ok, seems people are convinced this is a good idea.
>>
>> Otavio, please send your mtn and ssh keys to
>> Koen<k.kooi@student.utwente.nl>  and me<mlauer@vanille-media.de>.
>
> I have no objection to Otavio having access so please don't
> misunderstand this email in that regard. This is more a general issue I
> want to raise.
>
> What I'd like to see is some kind of code of conduct for developers,
> particularly new ones to ensure changes get appropriate review and we
> don't see cause any conflict.
>
> As guidelines:
>
> * Changes to class files need review on the mailing list
> * Changes to more global .conf files need review (e.g. bitbake.conf)
> * Changes to core toolchain components need review (gcc, binutils,
>    libtool, pkgconfig, automake, autoconf etc.)
> * Machine configs are less sensitive but machine maintainers should be
>    consulted where present and known
> * Distro config changes should be reviewed by the distro maintainers
>    where known
> * Recipe changes are less sensitive but maintainers should be consulted
>    where known
>
> The point here is to let people build up gradually. Changing the core
> infrastructure can influence a lot of people and whilst I don't want to
> discourage people hacking on it, we do need to take more care on those
> changes than ones in "lower" level recipes. I'm fairly sure most of the
> devs know and respect this, I just wonder if having some kind of more
> formal policy written down would be a good idea so people know where
> they stand?
>
> Opinions?

Developers that get access trough proper channels get this text sent to 
them after their key has been added:

---
Hi,

If you are reading this, you have been granted commit access to the 
award winning OpenEmbedded Project. To make things go smoothly we have 
some basic rules:

  1) Everything outside org.openembedded.dev/packages/ should be treated 
with extreme care. Please communicate with other developers first if you 
want to touch that area. If you are a distro maintainer you are of 
course free to touch your distro config files without asking. If you are 
a machine maintainer, please communicate first, since it's easy to get 
things wrong and not all machines are good examples to copy from.

  2) Think twice before using an override, usually overrides can be 
avoided, especially ones like these:

      do_compile() {
          oe_runmake
      }	

      do_compile_myfirstdisto() {
          oe_runmake -D_GNU_SOURCE
      }

     You may think "I don't want to break other distributions", but in 
99% of the cases your fix will unbreak other distros as well, so using 
an override will cause more work for other developers, since they have 
to work out the fix by themselves. You don't want other people to spend 
weeks trying to solve a problem which solution is masked by a bogus 
override.

  3) It's fine to fix a recipe you don't maintain, but if you are unsure 
of your change, try to contact the maintainer or, if no maintainer is 
listed, send a note to the OE developer mailinglist.

  4) Split your changes into their logical subparts. It's easier to 
track down problems afterwards with a binary search.

  5) Have a clear commit messages, and mention the affected bugnumbers 
if appropriate.

  6) Sync early, sync often. Nobody likes to reinvent the wheel. Merging 
is easy with monotone, so don't hesitate to run sync just before your 
plane takes off and your wifi gets disconnected.

You can view our policies and cheatsheets at:

  * http://www.openembedded.org/wiki/Policies
  * http://www.openembedded.org/wiki/MonotonePhrasebook

---

I think we discussed the above text at the first OEDEM :)



