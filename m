Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 928207029E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:18:58 +0000 (UTC)
Received: from [69.196.158.250] (port=40608 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6dLX-0002b2-Kp; Mon, 14 Jul 2014 06:18:59 -0400
Date: Mon, 14 Jul 2014 06:18:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1407140614070.4257@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jul 2014 10:19:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Paul Eggleton wrote:

> Hi Robert,
>
> On Sunday 13 July 2014 10:19:08 Robert P. J. Day wrote:
> >   followup to last post -- all of the methods for "overriding" task
> > definitions in the last post can be used without predeclaring that
> > you're about to do that; you just go ahead and do it in either a class
> > file or a recipe file. on the other hand, EXPORT_FUNCTIONS allows you
> > to retain the base definition of a task (or non-task function, as i
> > read it), then define a more general enhanced version.
> >
> >   (side note: i don't see a single mention of "EXPORT_FUNCTIONS" in
> > any of the numerous yocto docs -- i think this feature needs some
> > explanation *somewhere*. :-)
>
> Did you try the new BitBake manual?
>
> http://www.yoctoproject.org/docs/current/bitbake-user-manual/bitbake-user-manual.html#flexible-inheritance-for-class-functions
>
> Let me know if that doesn't answer your questions.

  actually, i worded the above *really* badly. i see it in the bitbake
user manual, i was referring to the "yocto-docs" layer, which contains
all of the yocto docs but not the bitbake manual, which might mislead
some people into not knowing that the bitbake user manual is even
there.

  i know bitbake is outside the scope of what belongs in the
yocto-docs layer, but perhaps there should be at least a pointer to it
in the yocto-docs README file?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

