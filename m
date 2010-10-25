Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARRF-0006Nx-SB
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:06:31 +0200
Received: by yxe42 with SMTP id 42so2373399yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=i1T28uxXwS3nwMQoDn3JC+KQwXL3ns9rFQ3FAK9S3VA=;
	b=YSd78O9h9KcYkcey+ci6pUn+m9ynBK+SlBQ6c64vlqCfRsuNZWHkwm1YdPuTrngzpO
	F3MmEDLgMW8qdzKZWkmQWJeV6q671E2w5C5Qf5fW1nPSF3pk9VvRDOylPE85tzib74QK
	icBQFTaooMMsW/mKeXF/YV32fPK3dhl7Y8JrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=IjBmSGdm7lpBC76PPd46PsKamYaOECWaiF3RJ8rmHA/6KvLOq5tgaWv+L2gatuvGBU
	a5c5/pacJQm0Mt6vSxTJNfevtyy/a2I0KMos/6I80FVgYyhTlIcKDHUUtIXMHvL0MrVp
	/CXG7b5CSsrFw701zsWe5xzg7RYXD++Hf2bYA=
MIME-Version: 1.0
Received: by 10.42.103.14 with SMTP id k14mr679808ico.267.1288029945906; Mon,
	25 Oct 2010 11:05:45 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 11:05:45 -0700 (PDT)
In-Reply-To: <AANLkTikOFHV-gktGKA6iB=DenaM8KBHJKh=qJ00D8R7g@mail.gmail.com>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
	<AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
	<AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
	<4CC48F7C.2000403@freyther.de>
	<AANLkTikOFHV-gktGKA6iB=DenaM8KBHJKh=qJ00D8R7g@mail.gmail.com>
Date: Mon, 25 Oct 2010 11:05:45 -0700
Message-ID: <AANLkTik9PAvhDAKMwCYM0q+8ej4btC-SWCGF5bK-my7G@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Chris Larson <clarson@kergoth.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Mon, 25 Oct 2010 18:06:31 -0000
Content-Type: text/plain; charset=UTF-8

On 10/24/10, Chris Larson <clarson@kergoth.com> wrote:
> On Sun, Oct 24, 2010 at 12:56 PM, Holger Freyther
> <holger+oe@freyther.de<holger%2Boe@freyther.de>
>> wrote:
>
>> On 10/24/2010 08:35 PM, Khem Raj wrote:
>>
>> >>
>> >> this is used in all efl recipes and I've noticed it in elementary only
>> >> because python-elementary depends on such new version.
>> >
>> > Do you have a list of recipes which use this ? I am sure with git it
>> > will be hard to use such a thing
>> > as the git revs are random and simlarily many other SCMs
>>
>>
>> Speaking as upstream co-author of OpenBSC. We are using something like
>> this
>> to
>> get the revision from the last tag of the repository. If someone is doing
>> a
>> make dist(check) we will copy a special version file into the tar.gz and
>> use
>> that instead.
>>
>> From an upstream point of view I think it is acceptable to say that the
>> ones
>> that build stuff from a SCM (in contrast to a tarball) should have the
>> files
>> of the SCM around...
>>
>> PS: I liked the --exclude patch a lot too...
>
>
> I don't think its necessarily the fact that we're building from an SCM
> that's the differentiating factor here, it's the build from a branch as
> opposed to a tag.  The tagged sources in an scm may be (though aren't
> always) exactly the same as the tarball contents, in which case the scm
> files shouldn't be necessary.  Ideally, the buildsystems would work with or
> without them, but I agree, I guess we may have to revert the patch :(

another option is a to add a qualifier to bitbake fetcher to tell it that
we want to keep SCM metadata for a given fetch and keep the default
to exclude it but enable it for such cases.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>


-- 
-Khem


