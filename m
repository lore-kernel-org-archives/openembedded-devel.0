Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id DA097704A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:33:28 +0000 (UTC)
Received: from [69.196.158.250] (port=47181 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6gNk-00016H-Of; Mon, 14 Jul 2014 09:33:28 -0400
Date: Mon, 14 Jul 2014 09:33:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAJTo0LapfkxVsasW=Mt6HTVqBuDk=bE=faeW9BCzVHOF3A-9zA@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407140907400.28064@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140804360.29952@localhost>
	<CAJTo0LapfkxVsasW=Mt6HTVqBuDk=bE=faeW9BCzVHOF3A-9zA@mail.gmail.com>
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
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 14 Jul 2014 13:33:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Burton, Ross wrote:

> On 14 July 2014 13:20, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > but, as far as i can tell, that is the only class that requires a
> > package name hook, and it simply defines its own implementation -- it
> > does nothing with package.bbclass and makes no reference to the
> > exported function package_package_name_hook(). so am i just
> > misunderstanding something? what was the point of defining and
> > exporting that function in package.bbclass if no other class takes
> > advantage of it?
>
> So there needs to be an empty implementation and EXPORT_FUNCTION for
> package_package_name_hook so that you don't get "cannot find
> function package_name_hook" when you don't have the debian.bbclass
> enabled.
>
> In cleaning that up I proposed removing the EXPORT_FUNCTION entirely
> for the hook, but Richard recalled there being something out there
> that did use the ability to chain up into debian.bbclass's
> implementation, so I kept it.

  uh oh ... now i'm a bit confused again so let me back up a bit
because i really want to understand this. my apologies for the tedium.

  as i read it, the only purpose of EXPORT_FUNCTIONS is to support the
idea of being able to qualify a function with its class name so that
you can (effectively) have access to more than one function with the
same "name" at the same time. first, let's see where this is *not*
necessary.

  as an example, base.bbclass defines the routine:

oe_runmake() {
        oe_runmake_call "$@" || die "oe_runmake failed"
}

now, since every class automatically inherits base.bbclass, all of
those classes can call oe_runmake(), right? that routine is in their
namespace, there is no need to export it, and they will all get that
function as it's defined in base.bbclass.

  in addition, even if a class inherits base.bbclass, it has the right
to totally override that routine by redefining a new oe_runmake(),
yes? (or possibly _appending or _prepending to it.) in any event, at
any time, there is only one definition of a function called
oe_runmake() in scope. so far, so good?

  what EXPORT_FUNCTIONS appears to do is simply allow you access to
more than one function with the same "name", so let's look at
base.bbclass and, say, the do_fetch() routine:

python base_do_fetch() {
    ... snip code ...
}
...
EXPORT_FUNCTIONS do_fetch

what does the above do? it now allows you to define, say,
derived.bbclass, and define a new do_fetch() in terms of the base
do_fetch(), as in:

do_fetch() {
    ...
    base_do_fetch()
    ...
}

however, if i created a new class that had no interest in redefining
do_fetch() and i was happy with the base definition, i could simply
continue to use the name do_fetch(), correct? the fact that that
function was exported in base.bbclass is not relevant to me if i am
not trying to redefine the name. (i suspect i could also refer to it
by the name base_do_fetch() if i wanted, but that's unnecessary.)

  that's why i was confused by ross' earlier paragraph about
package_name_hook being defined in package.bbclass -- unless some
other class is going to try to access two functions called
"package_naem_hook" at the same time, i currently see no need to
export it in package.bbclass. however, if there was something else
going on somewhere that needed this as richard purdie suggested, then
i'd be interested in knowing what that is just to understand the whole
picture.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



