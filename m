Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2966F70496
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:26:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 05:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="543013140"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2014 05:26:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Jul 2014 13:26:12 +0100
Message-ID: <28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1407140804360.29952@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140804360.29952@localhost>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 14 Jul 2014 12:26:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 July 2014 08:20:59 Robert P. J. Day wrote:
> On Mon, 14 Jul 2014, Paul Eggleton wrote:
> > Hi Robert,
> > 
> > On Sunday 13 July 2014 10:19:08 Robert P. J. Day wrote:
> > >   followup to last post -- all of the methods for "overriding" task
> > > 
> > > definitions in the last post can be used without predeclaring that
> > > you're about to do that; you just go ahead and do it in either a class
> > > file or a recipe file. on the other hand, EXPORT_FUNCTIONS allows you
> > > to retain the base definition of a task (or non-task function, as i
> > > read it), then define a more general enhanced version.
> > > 
> > >   (side note: i don't see a single mention of "EXPORT_FUNCTIONS" in
> > > 
> > > any of the numerous yocto docs -- i think this feature needs some
> > > explanation *somewhere*. :-)
> > 
> > Did you try the new BitBake manual?
> > 
> > http://www.yoctoproject.org/docs/current/bitbake-user-manual/bitbake-user-> > manual.html#flexible-inheritance-for-class-functions
> > 
> > Let me know if that doesn't answer your questions.
> 
>   i think that section could be extended a bit to offer more
> information, so i might take a shot at it. first, i think it should
> emphasize that it's primarily(?) used for enhancing the default
> implementation of "base" functions. just using "foo" and "bar" here is
> maddeningly vague. throwing in an (admittedly OE-related) example like
> this from cmake.bbclass:
> 
>   cmake_do_compile()  {
>         cd ${B}
>         base_do_compile
>   }
> 
>   cmake_do_install() {
>         cd ${B}
>         autotools_do_install
>   }
> 
> would, i think, clarify the general power of this feature.

Unfortunately as far as the BitBake manual is concerned, it pretty much has to 
be abstract. Remember that there are no base implementations of any task 
functions in BitBake itself; the ones you refer to are in OE's base.bbclass.

>   and a question about a particular example. richard purdie replied to
> my post a while back about package.bbclass and debian.bbclass, but i'm
> still a bit confused. here's a snippet from package.bbclass:
> 
>   python package_package_name_hook() {
>       """
>       A package_name_hook function can be used to rewrite the package names
> by changing PKG.  For an example, see debian.bbclass.
>       """
>       pass
>   }
>   EXPORT_FUNCTIONS package_name_hook
> 
> so as i read it, the above defines the function
> "package_package_name_hook" which doesn't do a whole lot, but is now
> available to other classes that inherit this one, particularly
> debian.bbclass that's specifically mentioned.
> 
>   but if one goes to debian.bbclass, one finds:
> 
>   python debian_package_name_hook () {
>       import glob, copy, stat, errno, re
>       ... snip ...
>   }
> 
>   EXPORT_FUNCTIONS package_name_hook
> 
> but, as far as i can tell, that is the only class that requires a
> package name hook, and it simply defines its own implementation -- it
> does nothing with package.bbclass and makes no reference to the
> exported function package_package_name_hook(). so am i just
> misunderstanding something? what was the point of defining and
> exporting that function in package.bbclass if no other class takes
> advantage of it?

Right, the debian.bbclass implementation probably doesn't need to be 
implemented in that way, AFAICT.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

