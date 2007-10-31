Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1InKLE-0004TJ-E7
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 21:39:08 +0100
Received: by an-out-0708.google.com with SMTP id c31so43046ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 13:38:55 -0700 (PDT)
Received: by 10.100.202.9 with SMTP id z9mr2512210anf.1193861527307;
	Wed, 31 Oct 2007 13:12:07 -0700 (PDT)
Received: from lenovo ( [75.121.134.164])
	by mx.google.com with ESMTPS id 20sm1030795nzp.2007.10.31.13.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2007 13:12:06 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Wed, 31 Oct 2007 15:12:02 -0500
Date: Wed, 31 Oct 2007 15:12:02 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071031201202.GA32237@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
	<20071026134528.GA6182@lenovo> <1193483219.6376.100.camel@toontown>
	<20071027153928.GA6118@lenovo> <4728747B.6020805@vollmann.ch>
	<1193856210.6376.155.camel@toontown>
MIME-Version: 1.0
In-Reply-To: <1193856210.6376.155.camel@toontown>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: getting started - docbook
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
X-List-Received-Date: Wed, 31 Oct 2007 20:39:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Now that is /exactly/ what I was trying to say earlier, only you nailed
> it better on the spot. This TOC looks like information you can find in
> various books on embedded linux practices or linux kernel development in
> general.. What's actually lacking is *OE specific* information.
> 
I agree with you both the the OE specific information is what is going
to be the key.  This chapter is going to be pretty brief.

chap 1 intro -15 pages
part 1 embedded device.  Review of the key components.  Will direct
the reader to other resources for more background.

part 2 distribution.  Review to the key components. Will direct the
reader to other resources for more background.

part 3 developing a distribution.  Very general overview of what is
involved in developing a distribution for a device.  Introduction into
how bb/oe can be used to develop a distro.

chap 2 getting started -25 pages
1 install bb
2 install oe
3 configure
4 build
5 test

chap 3 bitbake tutorial - 20 pages

chap 4 Language specific details - ??

chap 5 standard libs/classes

I am still hashing out how to organize chaps 3-5.  A lot of the
information is already available on the wiki or current users manual.
It just needs to be organized and/explained.

For the time being I am thinking a recipes/classes/configs as being
written in the language bb.  This language, like c, is very simple. I
defined variable, tasks(for functions), and a couple of
keywords(inherit, require,...).

Most of the functionality comes from the standard libs(or classes).

I am note sure if this technique will hold or not. It is certainly
helpful while thinking about how different elements of recipes are
written.  I'll let you know in a few days if it seems to be a logical
way of explaining how to write recipes.

I am not sure if you meant to write a new language, but it looks like
you have done so!

Thank
David Farning



