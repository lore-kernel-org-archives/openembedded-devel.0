Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0KuM-0005ga-K5
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 22:39:02 +0100
Received: by fxm19 with SMTP id 19so3107810fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fbP2IB/KHvDdYq1jdNvR5/orT1vDFs8Vt2RV/9ZlTWw=;
	b=Dki/782e9qZMTRy6HS6JDL6IG3tW1vlVNp0VU2pQyF7fzRMiaBlB+Jv9E7S6xr96uw
	w9l1k72bcNDOTNm43juJ2pM7C8jXH32IXksD/OV8RRUggJGpNiqzJ3IHPSkkuatY5xiS
	Kl5DIw44Oi9lGYLcpX3glyHII7TxJp/QUhY/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=jTV3cyYrVa7zFlXu/VIa4KmJwK07A1jIAqXS3RohJIy0bJkkYsQ63pl9WpawIswo/1
	Nn2aFvE3aHCQcgn1Lgm3YsX4Dm4m+LcZREKTmmj0bGYSKKyFR3jYqc/l907XViUR8cIB
	6spt8dXOnh/QKD98ErM0wQlEhD5LLQ1zDfzr8=
Received: by 10.223.20.144 with SMTP id f16mr328997fab.68.1300397838130; Thu,
	17 Mar 2011 14:37:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Thu, 17 Mar 2011 14:36:48 -0700 (PDT)
In-Reply-To: <20110317191748.GO3042@denix.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317141220.GA16796@rhein.zuhause.netz>
	<20110317191748.GO3042@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2011 14:36:48 -0700
Message-ID: <AANLkTimAMd88wthcF_fqG5+9rE1UjLmayMPFco7xhS2d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 21:39:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2011 at 12:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Mar 17, 2011 at 03:12:21PM +0100, Henning Heinold wrote:
>> Hi,
>>
>> I looked deeper into the problem.
>> Cairo looks first for:
>>
>> return __sync_fetch_and_add
>> __sync_val_compare_and_swap
>>
>> and defines it as cairo_cv_atomic_primitives="Intel".
>>
>> According to http://gcc.gnu.org/wiki/Atomic
>> arm and sh3/4 should work too.
>>
>> If the configure compile fails
>> cairo is looking for libatomic-ops
>> support.
>
> Similar to what I observed (if not reversed):
>
> * If libatomic-ops is not available (no atomic_ops.h), it chooses/falls back
> to "Intel" provider (i.e. kernel/gcc), which also works on ARM. It's similar
> to --disable-atomic

are you sure that --disable-atomic will still prod for atomics in
gcc/kernel my guess is it
will disable atomics for good.

>
> * If it finds atomic_ops.h previously staged, it chooses that as a provider,
> but since libatomic-ops was not built with emulated CAS for ARM, it later
> fails with the build error.
>
>> The libatomic-ops in oe is very old and misses diffrent bug fixes and is only
>> needed for ppc and mips.
>>
>> I will try to clean the stuff up this evening, which proably applies to
>> pulse-audio too.
>
> If you are going to update libatomic-ops anyway, I won't bother adding
> AO_REQUIRE_CAS define myself. Thanks for looking into it.
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


