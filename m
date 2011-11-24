Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTVeI-0000G2-6X
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 10:31:18 +0100
Received: by ywb20 with SMTP id 20so2188305ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=b4LRfWNV5XtP2JAkBK5SI8AyH6NmHvWD7TXu/M7pQio=;
	b=PPZuzdvSzD5+LwTIADdfM+48Y0+wsCKcLARKjIJCdB50ySCzEVbWvPipX32CNdmums
	n0PfxNCpjtGQFiWAq5YZP1/GF2gLnOsSJmWv4GN75aeg6kLE1o4a0SZ2Azh8kGsQpIee
	1/U2RrYiEpzLXJ2ZUlvDWibMQfFCeCV6PtqLo=
MIME-Version: 1.0
Received: by 10.101.95.3 with SMTP id x3mr6258807anl.92.1322126684256; Thu, 24
	Nov 2011 01:24:44 -0800 (PST)
Received: by 10.150.157.15 with HTTP; Thu, 24 Nov 2011 01:24:44 -0800 (PST)
In-Reply-To: <CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<20111118131116.GB3549@jama.jama.net>
	<CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
	<3257489.OMhGnQsRki@helios>
	<CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
Date: Thu, 24 Nov 2011 10:24:44 +0100
Message-ID: <CA+chaQeWRbSCXk_vxsB7Nfoarh11fTSAZsteKf62T2DaSt0-xw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Thu, 24 Nov 2011 09:31:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2011 at 3:02 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Nov 18, 2011 at 2:51 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Friday 18 November 2011 14:45:32 Andrea Adami wrote:
>>> My thoughts are that Pavel is always testing bleeding edge way before
>>> we commit it in OE while Dmitry told me repeatedly he prefers to base
>>> his patches on stable, older kernels.
>>
>> You're right, but I figure if we have the mechanism to allow people to build a
>> bleeding edge kernel already, let's keep it for the moment.
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Ok, I'll refresh and refactor the recipe then. Patch will follow.
>
> Cheers

Are you going to refresh and refactor something or is this patchset
fine if Paul applies only first 3? Because your 3.1.2 patch says it
should be applied on top of this..

If you or Paul want I can send pull request with first 3 from this +
3.1.2 and my changes to linux-kexecboot.inc + 3.2.0-rc3, because I
have it all in jansa/spitz anyway.

Cheers,


