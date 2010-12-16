Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PTG45-0004Op-Lj
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 16:48:22 +0100
Received: by ywi6 with SMTP id 6so1751245ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=1DUzvcTZFtXMkrSayKZg1mbPYcIoUj2UNekLXfKig04=;
	b=OWkdydtpLJ3/7d++t+7o+tFPOR2woetUrH3N62F9e4AoQR4cKSbXePlk0g9JB+sKWG
	lYoDnPCLWeu3kSjTIqiiquY40nR7OW1p4cjP9oOMsFLMg2S/9rGHctEBoh5uGiQGFa4+
	zpLRN5I9RGTml4DI/ZKLSz2dRAqDp3/2KKLOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=d/ar7ZXEeZAj56J5oJdwIOHbLfBWH0PCAZSQ7F8XQ54LhVGN3gRbrnU7Qby8pANPt/
	30IWVTLJMSLEUVAoqAZz/DItZtQ7g1hgUTBuzUT8AxvSqZkQOwVkkAKz98k9/6EtziUG
	HdNVRCyXLOvfz5w+KFlJz1MET0c4JI0TfMJJU=
Received: by 10.42.169.4 with SMTP id z4mr7420668icy.172.1292514402169;
	Thu, 16 Dec 2010 07:46:42 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 34sm134514ibi.2.2010.12.16.07.46.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 07:46:37 -0800 (PST)
Date: Thu, 16 Dec 2010 07:46:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216154641.GA22134@gmail.com>
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>
	<AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>
	<4D08B2C8.5010508@opendreambox.org>
	<AANLkTi=rzhtfxbfi8VS_R+W8uZV_qe=Ur1or861LJoPm@mail.gmail.com>
	<4D09FC00.1010304@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D09FC00.1010304@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Thu, 16 Dec 2010 15:48:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/12/10 12:46), Andreas Oberritter wrote:
> On 12/16/2010 01:48 AM, Khem Raj wrote:
> > On Wed, Dec 15, 2010 at 4:21 AM, Andreas Oberritter
> > <obi@opendreambox.org> wrote:
> >> On 12/10/2010 03:54 AM, Khem Raj wrote:
> >>> On Thu, Dec 9, 2010 at 4:44 PM, Eric Bénard <eric@eukrea.com> wrote:
> >>>> - based on gcc-4.5.2-RC-20101208 (svn 167585)
> >>>> - without linaro patches (which seem to be the root of
> >>>> problems when compiling at least on armv4 and armv5) :
> >>>>        - samba 3.2.15 or 3.3.9 : http://tinderbox.openembedded.net/public/logs/task/8666826.txt
> >>>>        - samba 3.5.6 : http://pastebin.com/yuiYX2CM
> >>>>
> >>>
> >>> as discussed on IRC may be we should try to find the faulty patch in
> >>> current gcc 4.5 linaro patches we have.
> >>
> >> I don't think that we need another svn-based pre-release recipe for gcc.
> >> But I would still prefer to have a recipe for gcc 4.5.2 once it's
> >> released, because I'd like to be able to pin a stable version with only
> >> few required patches and Linaro only cares about ARM while I do not.
> >>
> > 
> > We should avoid creating recipes for every minor release. As we see
> > minor release only contain bug fixes.
> 
> What's wrong with bug fixes in minor releases? Btw., I have no problem
> moving from one minor release to another, which means that I would be
> happy with only one recipe for every major release.
> 
> > agreed. If you dont care about linaro thats fine. Would you prefer a
> > gcc which is widely used or just used by you
> > hence supported only by you.
> 
> I'd prefer a gcc which is widely used. We just seem to have different
> opinions on what that means. IMO, a released version will surely be used
> by many more people globally (i.e. outside OE) than a random svn version
> of a linaro gcc. 

its not random svn version and certainly not of linaro.
Its a revision from release branch which means
its the latest release say 4.5.1 + fixes to this branch up until that
revision. Also note that I rely upon others from community to test
and verify patches. Its impossible for me or anybody to test the patches
for every combination but important is that we react to regressions
and we fix them. If it was ignored then I would be worried. 


Also, since Eric already sent this patch, I'm sure that
> I'm not the only one who'd prefer to have a recipe for a current,
> released version in OE.
> 
> While gcc*_4.5.bb is widely in use (well, because it's the default
> recipe and there is no alternative for 4.5 yet), its revision and linaro
> patch level changes every other day. It went from r10 to r25 during the
> last 10 weeks. This wastes a lot of time rebuilding the compiler, or -
> if you don't want to mix different gcc's output - rebuilding the whole
> system. In comparison, gcc-4.4.4 is still at r7.

While its a big feature pull so its expected a bit of developement.
and since we have a release and testing tags, that could be used.
and gives you more no churn at all and you can happily use it and then
move forward at longer intervals and you dont have to rebuild often
but if you just hate to build gcc and therefore would like to stop
its developement of these recipes is probably not achievable.
I am not averse to adding whatever version you assume will be stable
for you its just that it adds to maintenance burden and we already
have a lot of recipes for toolchain.

> 
> > My point it more common we use better we
> > have the support for it and community as a whole gets benefitted. If
> > linaro patches dont
> > harm your case negatively would you still be averse to them ? Do you
> > have some cases where they created regressions compile time or run
> > time or degraded the performance ?
> > that will be interesting.
> 
> I haven't discovered any regressions by the compiler itself, but I also
> haven't discovered any benefits.
> 

> My main concern is that a weekly changing compiler can hardly ever
> become a good foundation of a stable build environment.

yes it wont and I think the churn should reduce as we have stabilize
after all its a .dev branch and even compilers are softwares.

 Of course I
> could pin a random SRCREV, but then again I'm likely to become the only
> user of this specific SRCREV globally, some day. Oh, wait, I can not pin
> a SRCREV, because the patches keep getting added as local files.

yes they are local because

> 
> > why do you think gcc-4.5.2 will be more stable then say gcc-4.5.2 +
> > patches from upstream 4.5 branch
> 
> It depends on the patches. Most of them need testing. Releases (and
> their candidates) already would have been tested and/or reviewed by some
> people before hitting OE.
> 

in my experience OE finds bugs in any release. The amount of software we
compile is huge and way we compile is unique. Thats no different than
adding patches from Linaro or any body

> As already stated in my previous mail, I'm not against applying patches
> from upstream, provided they are _required_ to make it work in some
> configuration.
> 
> > What advantage do you see of having a vanilla gcc without linaro patches ?
> 
> See above.
> 
> In the (hopefully unlikely) event that a random svn version of linaro
> gcc introduces a regression, say on the MIPS platform, who am I going to
> report that to? Would I have to bisect all linaro patches manually?
> Surely, the upstream developers wouldn't care about reports about
> heavily patched gccs, and linaro developers wouldn't care about MIPS.
> 
Quite a lot of OE users are right now using armv7 in some form so I think linaro
patches are very helpful to them.
Well as a humble community member I try my best and so does many of us
and we find the problem and fix them. If we find regressions then we cant
fix them then we backout the faulty.


> Regards,
> Andreas
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


