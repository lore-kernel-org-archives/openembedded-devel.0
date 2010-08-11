Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oj0Gj-00071V-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 03:38:14 +0200
Received: by eyx24 with SMTP id 24so4597eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 18:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=R5KxKVffuQOKa3puooepTdEh7KajSwJgktNhFfeMZFs=;
	b=KEkzAGGVbaDi+12hTlK+D2FDDpj7BfClXF2kJGS5ihrMjQ9AE+dQYAbzp1L+h89g6E
	6jxEyMuffGVYop/P3ry5TmWrt8zS4eTi8E2IFpksLLcte+xdHRv1cgL4K/Rt7kJXQBSO
	GOEIvjH8Z89jLZWu2IgrGh+macbLbwGeQakOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=mHBBOPbDIfraLjmELvi9oiZNLuZrXOMbLHUwMgP1qsQMgdLq8bDzaxHvTlxtr74d+u
	iYUDvkjW4nV/iwim7yRJ1Eu/sQx5525pKNXXr8etkzIVx/Vn738rcNbQJaJHYYzQkAWH
	EngdKMbfFF1jiURgNtNB8/X2kFWzN4sqFd0Bs=
Received: by 10.213.63.142 with SMTP id b14mr14144881ebi.33.1281490684173; 
	Tue, 10 Aug 2010 18:38:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 10 Aug 2010 18:37:44 -0700 (PDT)
In-Reply-To: <AANLkTi=1LPSYyP4HdPF6+AajoCmot2jzU2id1URxf_q0@mail.gmail.com>
References: <4C61E523.7070405@gmail.com> <4C61EE40.5020201@balister.org> 
	<AANLkTi=1LPSYyP4HdPF6+AajoCmot2jzU2id1URxf_q0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Aug 2010 18:37:44 -0700
Message-ID: <AANLkTimjTOJJf5HMvpBMhKtOdaTS-GTSyp2DHDXqKNy7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 01:38:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 10, 2010 at 6:05 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 11 August 2010 09:56, Philip Balister <philip@balister.org> wrote:
>> On 08/10/2010 04:47 PM, Graham Gower wrote:
>>>
>>> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([
>>> \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
>>
>> Shouldn't DISTRO's decide on a per DISTRO decision whether or not their
>> preferred versions are weak?
>>
>> I;m not entirely opposed to make the assignment weak for Angstrom, but I am
>> very opposed to making all DISTRO's use the same policy.
>
> Surely having disunity by giving different distros different policies
> would be worse?

whats issue with current versioning ? you always have _local override
if you want
to disregard what DISTRO sets it to. IMO it should be left upto DISTRO to hard
assign or weak assign them. I dont think its a good idea to make all weak

-Khem

>
>>
>> It is a real nuisance trying to debug someone's Angstrom build, only to fins
>> out they have loads of local overrides.
>
> Point taken. local.conf really should be a mandatory piece of
> information when reporting an issue.
>
>>
>> Philip
>>
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


