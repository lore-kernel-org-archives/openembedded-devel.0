Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or3VI-00011j-PE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 08:42:37 +0200
Received: by iwn2 with SMTP id 2so193093iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Yu4CKKdYpRUP0RL4Q76XspimIA4U+8ED2iMwy7ABXNo=;
	b=hkOr4CN4eEWz+/Zgcxru7SKFbAHbFTnnY1Fi+abjUCWiux+t3Y9dJkjKGcLYPcEOKM
	5yDNyn9hsYcA0ez6Ga+JHlp+Vcb7BHk01+ZVfDB3tcvUoN8N5JYLtSMCnQYb67mncZSS
	4D2xRo+OnICywQwWreutTkZ2PLFSLT6ssx5kQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=J0+QN0YPfL1tp8Flre67WEOI3bPbDPvaMuRt0/B9XxLFfU8G13+tlzlCF603bP2JZI
	w9aKcI+Do4hkGLR/Ceh0zgFFXYC8lrG+SOKC4bfgULMwZBlZ+lEa4ZLmrLOgAf1COwuQ
	mzTz4uIwyNkmzaSDygxkeC1Ci710d8OmVI2CA=
MIME-Version: 1.0
Received: by 10.231.33.197 with SMTP id i5mr498100ibd.183.1283409714897; Wed,
	01 Sep 2010 23:41:54 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 23:41:54 -0700 (PDT)
In-Reply-To: <1283382560.2012.24.camel@saphir>
References: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
	<AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
	<1283382560.2012.24.camel@saphir>
Date: Thu, 2 Sep 2010 08:41:54 +0200
Message-ID: <AANLkTimg6wRJ13gjiwkjPaHqfiNbwj9Dj_8dGHXm2QDo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SOC_FAMILY broken
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
X-List-Received-Date: Thu, 02 Sep 2010 06:42:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/2 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> Am Mittwoch, den 01.09.2010, 23:22 +0200 schrieb Leon Woestenberg:
>> On Wed, Sep 1, 2010 at 11:14 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> > Root cause: if SOC_FAMILY is not set (awhich is the case for most
>> > MACHINEs =A0and all distro's except angstrom) the test in base.bbclass
>> >
>>
>> Good point, but I never understood SOC_FAMILY. From an old email:
>>
>> "SOC_FAMILY is defining a family of processors and the features that pro=
cessor
>> has. =A0Whereas MACHINE_CLASS is defining a type of device and its featu=
res which
>> can use different processors."
>>
>> I think the first sentence is contradicting itself.
>>
>> A "family of processors" vs. "features that processor had". This can
>> be fully orthogonal (worst case),
>> so the definition of the variable is crap. I wonder, has it proven
>> more useful than cumbersome?
>
> I still don't know why we need both SOC_FAMILY and MACHINE_CLASS in the
> first place. MACHINE_CLASS has been around for much longer and if you
> look how it's being used or intended to use, you see that there are
> hardly any processor differences in the members of those classes (e.g.
> openezx, qualcomm msm7, om-gta01/02, clamshell zaurus models, ...).
>
> I'm still unconvinced that we need both variables.

Neither do I.
Also it has been requested during the review (if I recall correctly by
Tom) to provide documentation, but sadly enough that review comment
was ignored and the change pushed anyway.
Perhaps we should make explicit that the introduction of a new user
var also must come with the associated documentation.

Frans


