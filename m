Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nwfdh-0001QJ-Fx
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 19:54:10 +0200
Received: by iwn8 with SMTP id 8so306518iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=t2KPK9z00tJxMj8yWOsbZB1oGxl8Olml2PcPVYYy4YU=;
	b=eU/52hGfh7/a9gCbsNI6D8l08FDcKD/laBKVZYVe95nut5Vr89IS164cjB8GmOIv34
	E/RPr6qyLBM/IEB+GBFrIc6ntLXl31VBVPMbw1vEnEQdnYGeTkQISnHPjTGmOymsLbGf
	Yy0mdCaf2HTUA05g2PMHWCHg2ck6YOep60zUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NIC8Dc1PFry0wrinO2GKBeul7WIqZ0o3xclx6M+E/UFNSCuKR79cvx4BsyYcuP6X9B
	FJI91fck5hfhmXuHInui5I27JX+mp/v64pyR6owx5c4PgpiaAT2PJs5v91d+ql9kv8U0
	M5Wt3GBte9JFDdCWT86PJu8zWpnavD2SRa9V0=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 10:50:53 -0700 (PDT)
In-Reply-To: <1269944947.1681.905.camel@rex>
References: <1269878004.1681.331.camel@rex> <20100329174253.GC25428@gmail.com>
	<1269898959.1681.692.camel@rex> <hosgi3$v83$1@dough.gmane.org>
	<1269942145.1681.859.camel@rex> <hosiv0$875$1@dough.gmane.org>
	<1269944947.1681.905.camel@rex>
Date: Tue, 30 Mar 2010 10:50:53 -0700
Received: by 10.231.167.208 with SMTP id r16mr76391iby.57.1269971453713; Tue, 
	30 Mar 2010 10:50:53 -0700 (PDT)
Message-ID: <19c1b8a91003301050rd662a03n9d11165b833ed2da@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Standalone gcc library builds
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
X-List-Received-Date: Tue, 30 Mar 2010 17:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 30, 2010 at 3:29 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2010-03-30 at 12:14 +0200, Koen Kooi wrote:
>> On 30-03-10 11:42, Richard Purdie wrote:
>> > On Tue, 2010-03-30 at 11:33 +0200, Koen Kooi wrote:
>> >> Can't we have seperate recipes for ssp, stdc++, fortran, java, etc? I
>> >> don't think we need USEFLAGs for this when we build them seperately anyway.
>> >
>> > We'd not be using USEFLAGS, we'd just be looking at the line which tells
>> > gcc itself which bits to build. Having separate recipes doesn't solve
>> > the problem since we'd still have to work out whether the compiler for a
>> > given lib was built and then we enter a dependency nightmare working out
>> > which packages need which combinations of compilers and compiler libs.
>> >
>> > So we can have separate recipes but think through the issues and see
>> > whether you still like the idea...
>>
>> Let's put it in a different way:
>>
>> Can we stop artificially limiting the toolchain options and have people
>> opt-out instead of opt-in for stuff? I really need a full featured
>> toolchain :)
>
> I see no reason why the default compiler shouldn't be the fully featured
> one and then distros and users can turn off the bits they don't want if
> they choose to.
>
> Is that the issue you mean or is there a concern I'm missing?
>
> I can see the other side though, its a pain having to fight fortran
> build failures when upgrading the compiler if you never use fortran. Its
> this point where it becomes a pain to have so many old versions of
> things as this would be much simpler to arrange and maintain if we had
> less gcc versions. I worry about trying to add gcc-runtime to OE for
> this reason.

I think we should default to C,C++ which is most commonly used combination
but at the same time it would be nice if developer could disable C++ or enable
fortran or java or objc, ada, go language or whatever



>
> [remark about Poky removed]
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


