Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 11DBB703EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:19:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2014 08:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,659,1400050800"; d="scan'208";a="572862613"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 08:19:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Jul 2014 16:19:45 +0100
Message-ID: <2878422.ErTPFzgSnK@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1407140907400.28064@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<CAJTo0LapfkxVsasW=Mt6HTVqBuDk=bE=faeW9BCzVHOF3A-9zA@mail.gmail.com>
	<alpine.LFD.2.11.1407140907400.28064@localhost>
MIME-Version: 1.0
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 14 Jul 2014 15:19:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 July 2014 09:33:25 Robert P. J. Day wrote:
> On Mon, 14 Jul 2014, Burton, Ross wrote:
> > On 14 July 2014 13:20, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > but, as far as i can tell, that is the only class that requires a
> > > package name hook, and it simply defines its own implementation -- it
> > > does nothing with package.bbclass and makes no reference to the
> > > exported function package_package_name_hook(). so am i just
> > > misunderstanding something? what was the point of defining and
> > > exporting that function in package.bbclass if no other class takes
> > > advantage of it?
> > 
> > So there needs to be an empty implementation and EXPORT_FUNCTION for
> > package_package_name_hook so that you don't get "cannot find
> > function package_name_hook" when you don't have the debian.bbclass
> > enabled.
> > 
> > In cleaning that up I proposed removing the EXPORT_FUNCTION entirely
> > for the hook, but Richard recalled there being something out there
> > that did use the ability to chain up into debian.bbclass's
> > implementation, so I kept it.
> 
>   uh oh ... now i'm a bit confused again so let me back up a bit
> because i really want to understand this. my apologies for the tedium.
> 
>   as i read it, the only purpose of EXPORT_FUNCTIONS is to support the
> idea of being able to qualify a function with its class name so that
> you can (effectively) have access to more than one function with the
> same "name" at the same time. first, let's see where this is *not*
> necessary.
> 
>   as an example, base.bbclass defines the routine:
> 
> oe_runmake() {
>         oe_runmake_call "$@" || die "oe_runmake failed"
> }
> 
> now, since every class automatically inherits base.bbclass, all of
> those classes can call oe_runmake(), right? that routine is in their
> namespace, there is no need to export it, and they will all get that
> function as it's defined in base.bbclass.
> 
>   in addition, even if a class inherits base.bbclass, it has the right
> to totally override that routine by redefining a new oe_runmake(),
> yes? (or possibly _appending or _prepending to it.) in any event, at
> any time, there is only one definition of a function called
> oe_runmake() in scope. so far, so good?

Yes.

>   what EXPORT_FUNCTIONS appears to do is simply allow you access to
> more than one function with the same "name", so let's look at
> base.bbclass and, say, the do_fetch() routine:
> 
> python base_do_fetch() {
>     ... snip code ...
> }
> ...
> EXPORT_FUNCTIONS do_fetch
> 
> what does the above do? it now allows you to define, say,
> derived.bbclass, and define a new do_fetch() in terms of the base
> do_fetch(), as in:
> 
> do_fetch() {
>     ...
>     base_do_fetch()
>     ...
> }
> 
> however, if i created a new class that had no interest in redefining
> do_fetch() and i was happy with the base definition, i could simply
> continue to use the name do_fetch(), correct? the fact that that
> function was exported in base.bbclass is not relevant to me if i am
> not trying to redefine the name. (i suspect i could also refer to it
> by the name base_do_fetch() if i wanted, but that's unnecessary.)

Yes.

>   that's why i was confused by ross' earlier paragraph about
> package_name_hook being defined in package.bbclass -- unless some
> other class is going to try to access two functions called
> "package_naem_hook" at the same time, i currently see no need to
> export it in package.bbclass. however, if there was something else
> going on somewhere that needed this as richard purdie suggested, then
> i'd be interested in knowing what that is just to understand the whole
> picture.

I'm not sure what that example was I'm afraid, but maybe Richard can fill in 
the blanks.

Cheers,
Paul;

-- 

Paul Eggleton
Intel Open Source Technology Centre

