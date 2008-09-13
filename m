Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KeaUz-0001oD-5r
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 21:09:37 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1806591rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 12:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EI8hEkJT+roGufTPtbzc3N1ko15cYLNhiA+8fHEzqno=;
	b=lSR5xipjN100Qc27wmlQoOhK552nZNptKfBiqPGWG8oTJCQbDmb/UYOM5GJZuYpqN8
	dF+6n8h9op3ss0ATF/azGUruod8ionuE28Mird2v/bl8NWb4+0T60KR/+1NqKRp8A2D9
	u+61n96LzNucA4Nsrp9N8J5dzmaJwV6wnYJuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xB5SaC+YMo3unpcBP7T2LCALg57HanxTQidElUZ+l685xopKXufahScdAFJEnsNBdV
	NwGFfpj6OZXvCv5R2kBkOsh2PM6iMNGP+Ty+g9j2jBetekxmQEDz1MFxexjxPYMfwKrW
	M1uVC9t2vxl6KH01CPFc42rczr2ZAkRL8BtK8=
Received: by 10.114.58.6 with SMTP id g6mr4637579waa.68.1221332806244;
	Sat, 13 Sep 2008 12:06:46 -0700 (PDT)
Received: from localhost ( [71.146.23.38])
	by mx.google.com with ESMTPS id q20sm23469215pog.7.2008.09.13.12.06.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Sep 2008 12:06:45 -0700 (PDT)
Date: Sat, 13 Sep 2008 12:06:43 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080913190643.GA14530@gmail.com>
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com>
	<20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com> <gaggd6$86a$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gaggd6$86a$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Sat, 13 Sep 2008 19:09:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/09/08 15:49), Koen Kooi wrote:
> Khem Raj wrote:
>> On (11/09/08 21:53), Denys Dmytriyenko wrote:
>>> First of all, thanks for your review.
>>>
>>> On Thu, Sep 11, 2008 at 05:02:08PM -0700, Khem Raj wrote:
>>>> On (11/09/08 15:52), Denys Dmytriyenko wrote:
>>>>> #1 gcc-cross-sdk 4.3.1 missing include-fixed
>>>>> http://bugs.openembedded.net/show_bug.cgi?id=4536
>>>>>
>>>>> gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
>>>>> which are missing in the gcc-cross-sdk version, rendering external toolchain
>>>>> unusable.
>>>> I do not like this fix. IMO Instead of copying them into include directory
>>>> they should be let alone in include-fixed directory and packaged. You should
>>>> add knowledge of this new directory to the failing package instead. What
>>>> packages are broken because of this.
>>> I agree that this is not a proper fix, but rather a hack. glibc has its own
>>> limits.h, which wants to include gcc's limits.h like this:
>>>
>>>   /* Get the compiler's limits.h, which defines almost all the ISO constants.
>>>      We put this #include_next outside the double inclusion check because
>>>      it should be possible to include this file more than once and still get
>>>      the definitions from gcc's header.  */
>>> #if defined __GNUC__&&  !defined _GCC_LIMITS_H_
>>> /* `_GCC_LIMITS_H_' is what GCC's file defines.  */
>>> # include_next<limits.h>
>>> #endif
>>>
>>> This issue was brought up before, but as far as I can tell, it wasn't fixed
>>> properly.
>>> This is initial Koen's post about the issue:
>>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
>>> And here is your own reply with one of the possible solutions:
>>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
>>>
>>
>> right. So can you try this patch and see if this fixes the problem ?
>>
>>> Here is how it's "solved" (i.e. worked around) in gcc-cross_4.3.1.bb (4.3.2):
>>>
>>> # Hack till we fix *libc properly
>>> do_stage_append() {
>>>          ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
>>> }
>>>
>>> I'd love to see it fixed properly, but for now I'm trying to bring
>>> gcc-cross-sdk on par with gcc-cross.
>>>
>>>>> Provided patch copies them in the include directory as a temporary solution.
>>>>> A similar temporary solution is present in gcc-cross_4.3.1, see
>>>>> do_stage_append()
>>>>>
>>>>>
>>>>> #2 external-toolchain misses providing runtime libgcc
>>>>> http://bugs.openembedded.net/show_bug.cgi?id=4542
>>>>>
>>>>> Since external-toolchain misses specifying libgcc as provided runtime library,
>>>>> dependency tree picks up either gcc-cross or even gcc-noemu...
>>>> This one seems ok to me.
>>> Thanks! Whom should I ping to get it commited?
>>
>> I can do it.
>
> gcc_4.3.x.bb also needs a fix since I get all kinds of limits.h related  
>, errors when trying to do native compilation on the beagle.

I only did cross build/testing no target gcc stuff so I did not see this problem thus far.
I thought gcc driver should have added include-fixed to default search paths for includes unless you disable it to do so like glibc does in such a case the application should add it to include search paths manually. 

If you can give more details about this failure on native build. I could try to dig more.

Thanks
-Khem

>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


