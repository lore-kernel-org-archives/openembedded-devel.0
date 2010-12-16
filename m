Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PTGCV-0004hO-Mb
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 16:57:05 +0100
Received: by pxi9 with SMTP id 9so755097pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=D+435D9lXkDzZqFKGXjy9f0h5Sm/IGqyY1nuwv+wKPo=;
	b=dsu6tA+TFRs3Krtmkm9aojVdAl2p7qdla6PrBUskw9KG6r4mlRzQLDMw4GJfA62rEN
	7n22cDzu3HjGplDt03YoaxzCP6z19DnGDKl8st78CtzE+6nDqUS31vd2gmGpgEqARThu
	mxcDo0Rj1Mxle7w6y5qwYgb1IJln/1mmCPEVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nOhoTFfQAxaN9UU/H41OSOa65WHOmWxgUKLcySXXFLxSdzEc5KUIaf91kl+UdDwuAP
	hTLkITXCy+/9yX1+YWKvus3O1zoieMM55j7blIfsuRmfbdQBJOavuvfo5WawO+rON6pB
	0zqSMHjOikrZo6nTk9D2JRz6iELjH+y9rs3qw=
Received: by 10.142.69.1 with SMTP id r1mr7078130wfa.114.1292514921015;
	Thu, 16 Dec 2010 07:55:21 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm226617wfh.15.2010.12.16.07.55.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 07:55:19 -0800 (PST)
Date: Thu, 16 Dec 2010 07:55:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216155527.GC22134@gmail.com>
References: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
	<4D08D3F5.1060608@mentor.com>
	<AANLkTimuRa8EC=U_CvgiZV1tWySg_AQTwWBQTxdpv7Zn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimuRa8EC=U_CvgiZV1tWySg_AQTwWBQTxdpv7Zn@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Thu, 16 Dec 2010 15:57:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/12/10 08:33), Cliff Brake wrote:
> On Wed, Dec 15, 2010 at 9:43 AM, Tom Rini <tom_rini@mentor.com> wrote:
> > On 12/15/2010 12:51 AM, Frans Meulenbroeks wrote:
> >>
> >> Dear all,
> >>
> >> I just wanted to update the testing table with my entries and I
> >> noticed two (possibly related) things.
> >> - no other entries for 2010-12-10 are there yet (and it is already
> >> wednesday)
> >
> > I haven't updated the stuff we're building since just about everything
> > failed due to the gcc issue Khem fixed in
> > 2c8570552549da2e11428d08b2bc08849cac39b1.  This is why I sometimes wonder if
> > it would be desirable to cherry-pick a few things in to the testing-next
> > branch.
> 
> One of my concerns is coordinating with all the people doing testing
> if we start committing to the testing-next branch.  How do we know who
> restarted builds, etc.  I guess we could assume the cherry-picked
> changes would be minor enough that people who have already finished
> builds would not need to re-build.

yeah without autobuilder which triggers a build on everycommit 
its hard

> 
> At this point I'm just more inclined if the weekly testing branch
> crashes and burns horribly to just throw away that week, and focus on
> getting things fixed in the master for next week.  Its not perfect,
> but with so many people participating, it seems like we need to keep
> it as simple as possible.  But, keep the ideas flowing, and perhaps
> something better will emerge.

I think the current method is good. What I do is if I see a problem
in the testing then I fix it there locally and keep going with build to
find more and apply the patch to master
for next cycle so far it has worked well.

> 
> Thanks,
> Cliff
> 
> -- 
> =================
> http://bec-systems.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


