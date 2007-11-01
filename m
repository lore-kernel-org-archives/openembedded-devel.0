Received: from [66.249.82.231] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IoFdV-0008KS-SR
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Nov 2007 10:49:50 +0100
Received: by wx-out-0506.google.com with SMTP id h27so957403wxd
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Nov 2007 02:49:21 -0700 (PDT)
Received: by 10.90.91.14 with SMTP id o14mr6985749agb.1193877051786;
	Wed, 31 Oct 2007 17:30:51 -0700 (PDT)
Received: by 10.90.66.15 with HTTP; Wed, 31 Oct 2007 17:30:51 -0700 (PDT)
Message-ID: <c384c5ea0710311730obb2c48bv8a83cbfbead10e13@mail.gmail.com>
Date: Thu, 1 Nov 2007 01:30:51 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
MIME-Version: 1.0
References: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
Subject: Re: *Very* newbie question: OE and Cygwin?
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
X-List-Received-Date: Sat, 03 Nov 2007 09:49:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Jason,

in theory, you might be able to get it (Cygwin + OE) to work. However,
after having spent months to get uClinux working under Cygwin I
*strongly* advice you NOT to use Cygwin for Linux target development.
I wrongly thought this would be the best bet to support my non-Linux
colleagues.

It planned out to be *much* easier to work under Linux, even for the
newbies. Good for them, good for me.

And the fact that your board vendor does use Cygwin (which is bad)
does not count if you want to use OpenEmbedded (which is good),
because OpenEmbedded gives you all you need. I.e. you would not want
to depend on some Linux "release" from your board vendor to build your
application.

The leverage of using Linux pays off on all sides! (test exposure,
build knowledge, build speed, power tools, ....). In fact, I also
consider Cygwin just another "vendor lock in".

These are just my two cents,

Leon.


On 10/30/07, Tiller, Jason <jtiller@sjm.com> wrote:
> Hi, All, :)
>
>
>
> [Main question: Can I use OE on cygwin to target a PXA270-based board?]
>
>
>
> My name is Jason Tiller and I'm a software engineer at St. Jude
>
> Medical, a heart-related medical device company.  I'm the only
>
> software engineer in a division that builds high-intensity focused
>
> ultrasound cardiac ablation devices for the relief of atrial
>
> fibrillation.
>
>
>
> I'm evaluating a new microprocessor for a next-generation power
>
> generator.  We hope to use a linux kernel inside the instrument.  I'm
>
> using a Logic Devices PXA270-based Zoom eval board.  I saw on one of
>
> the LD boards that OE has support for this micro/board combination.
>
> I'd like to try OE to build a kernel and throw up some simple apps,
>
> but I have to do the host development in Windows, which means Cygwin.
>
>
>
> In fact, the LD SDK is built on cygwin - they provide pre-built win32
>
> gnu cross-tools that rely on cygwin apps.  I'm in the process of
>
> updating my Cygwin installation with all of the tools that the wiki
>
> (http://www.openembedded.org/wiki/RequiredSoftware) declares are
>
> required for OE.  Some of them aren't pre-built Cygwin packages
>
> (psyco, jade (but openjade is), sgmltools, docbook-utils, libsdl), but
>
> it looks like the really important ones are there.
>
>
>
> Should I expect a major headache in this effort?  My IT department is
>
> very cautious, and they won't certify my (desperately underpowered)
>
> Linux box for a net connection, so it's a lot easier to use my Windows
>
> box for development.
>
>
>
> Thanks for any heads up from a (hopefully) new OE user!
>
>
>
> ---Jason
>
> St. Jude Medical
>
> My product: http://tinyurl.com/e6gvq
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Leon


