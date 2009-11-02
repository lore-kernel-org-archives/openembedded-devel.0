Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N4xwK-0008Fl-O8 for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 15:31:28 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N4xvC-0007TL-Q6
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 15:30:14 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 15:30:14 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 15:30:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Nov 2009 15:29:49 +0100
Message-ID: <hcmqcv$5n4$1@ger.gmane.org>
References: <1257169407.11338.71.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1257169407.11338.71.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 14:31:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-11-09 14:43, Richard Purdie wrote:
> At OEDEM two years ago I proposed radically altering the way staging
> worked. For those that don't remember the bad old days, the staging
> directory layout didn't match that of the target file system meaning
> every recipe needed a custom do_stage and things were a mess.
>
> We changed the layout allowing the use of the gcc/binutils sysroot
> options and also started widespread use of autotools_stage_all and I'd
> say things look much improved compared to how they were.
>
> Anyone who has looked at the packaged-staging code will probably agree
> there is still a way to go though - its horrendously complicated. We
> also do a lot of duplication. I'd like to propose a new simple way of
> doing things. We'd have the following work flow:
>
>
> [...]
> do_compile - up to here all as usual
> do_install - Everything installs into a DESTDIR (including -native)
> do_package - Takes a copy of the DESTDIR, applies any .la/.pc mangling
>               then splits into packages as usual
> do_populate_staging - Takes a copy of the DESTDIR, mangles, installs
>               into staging and creates staging packages from this
>
> Firstly, does any disagree with this approach or can we all agree its a
> nice objective?

Can we make the mangling a seperate tasks? I tend to do the mangling in 
do_compile_append to be able to do builds *on* the target as well.

> Pros:
>
> * Only one "make install"
> * We can start to work out the differences between do_install and
>    do_stage and minimise them (there should be none bar .la mangling)
> * Cleaner and simpler do_stage step
> * Packaged-Staging becomes much simpler
> * Builds should be faster as staging timestamp snapshots are not
>    required and staging lock taking should be minimal.
>
> Cons:
>
> * Very different to what we have now - how to get there?
> * Likely to be some breakage in any transition

And

* 'make install' doesn't actually work properly for lots of packages 
(you know, the ones with handcrafted makefiles)

But we can solve that by putting the custom do_stage() methods for those 
in do_install(), right?


> I really like the idea in principle, in practise its hard to get there
> incrementally without breaking things. I'm trying to come up with some
> code which does that and I'm hoping to have something for OEDEM.
>
> For now I'd like to ask if there is agreement we need to do this and
> support to make this happen?

You have my agreement.

regards,

Koen



