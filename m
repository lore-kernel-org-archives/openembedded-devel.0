Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtDjb-0000jK-RD
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 08:02:19 +0200
Received: by iwn2 with SMTP id 2so5956640iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K5oW+KA5rm0lLq8eTknlAPRI2mXi9DyW9+QS9hGVtUA=;
	b=Jb0wK1wDTYEVz4cBIoS+Rbx4iX4u78vpX1/iLshpPl/nosvt8XwjTJq9GK74ORjTuR
	g+bJQr69Zq6Ws24O85ZLgJQD9yhJQuei/a0aIBl523zYoCiJglfpy9XpLj+Irl3M/2KY
	DYIEOtM7Ghev6g1JTHzMhAca5NsZTJ/IrCGsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MymHmvL/E7vTCmE61i0nbe2BcHtn8m9UhHx7/teEEbi1T6iZ24sGmXYmRlRd1KJGAh
	hCpE37r8FWsfoqqo8E088TBI0sKrizOPYrsKyI709oe28VuieyunfIMu8ZSaDg1Vwydv
	vGdS8+6PUIFd0+fYz/qfJV1ngFsJvW8ymLvm4=
MIME-Version: 1.0
Received: by 10.231.11.9 with SMTP id r9mr7974721ibr.47.1283925696106; Tue, 07
	Sep 2010 23:01:36 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 23:01:36 -0700 (PDT)
In-Reply-To: <i6629i$d5c$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
	<i65ci4$4c3$1@dough.gmane.org>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org>
Date: Wed, 8 Sep 2010 08:01:36 +0200
Message-ID: <AANLkTi=SGktOR00Kz-f7DCEc+xCJ=TGqgnYrcYY_4q2B@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Wed, 08 Sep 2010 06:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-09-10 18:18, Khem Raj wrote:
>> On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>>
>>> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
>>> create a libstdc6++ package, but it does create a libstdc-dev package.
>>>
>>
>> I see thats plausible. I think its time to look into separating gcc runtime
>> from gcc on the lines of poky.
>
> I put back libgcc and libstdc++ for the time being:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=241b8865f20b9e3c3beb334535e6cd8452cbf47d
>
> I have a feeling the others needs to put back as well (e.g. fortran),
> but this fixes the immediate problem.
>
> regards,
>
> Koen


Thanks for the workaround, but what happened to the rule that changes
to the toolchain should be reviewed first ?????

Frans


