Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgLAr-0006uU-3Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 19:21:10 +0200
Received: by iwn34 with SMTP id 34so5276006iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=jq0bLI+jOuspIgDwy/KHwOlboFNseRFzP6mHfhhqfyo=;
	b=bdD/vJI/vDQNVVvgZE0xSz5wp7MiKjJ9t9dEa7eIi9Qq9yuJgNrRpB5Zm3dvuY/ZU1
	N5HuWygL8qovaDGYQsf7jEFlbAWZNvm4jqxGFByzkS04Pj1eCOM0pYY3lvEpD2D4sYUe
	cr7sOp5lB+Bcc+3RxacPsAL+HSpc3zdw3N6Rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=iiOF4jU4OTPUNGLZiowjLSTWfPqu+CkH/0XkHLe64xirU2NooPEuYm4uNfbaryp9bh
	+oy0xI0zWnHKqdEMjBz60N8PKMATbzHe5JfCywkQtrSmL20LJHoPQwnJ8C4vYx7/WCid
	V1LnkeTxCjv3EZJ3EwH4mfP44v7ZOuwHH7fJA=
Received: by 10.231.35.10 with SMTP id n10mr8708915ibd.161.1280856063204; Tue, 
	03 Aug 2010 10:21:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Tue, 3 Aug 2010 10:20:42 -0700 (PDT)
In-Reply-To: <i39d10$d2f$1@dough.gmane.org>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com> 
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org> 
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org> 
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com> 
	<i38q56$4hq$1@dough.gmane.org> <20100803133515.GD12134@jama> 
	<i39d10$d2f$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Aug 2010 10:20:42 -0700
Message-ID: <AANLkTimTwxV7=xOF+t6fB5iC-2p4ODH89z40HwR3kiDp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 17:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 3, 2010 at 8:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 03-08-10 15:35, Martin Jansa wrote:
>> On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Acked-by: Koen Kooi <k-kooi@ti.com>
>>>
>>> If noone objects, can we get this in ASAP?
>>
>> Building from scratch armv4t then armv6 was ok, building few more
>> packages for armv4t again still worked, but now I've upgraded gcc/eglibc
>> and building eglibc-initial for armv4t first fails:
>>
>> http://tinderbox.openembedded.org/packages/665289/
>> http://build.shr-project.org/tests/jama/config.log
>>
>> see
>> configure: error: compiler support for __thread is require
>> and
>> Fatal error: Invalid -march= option: `armv4t'
>
> I had that with a previous incarnation of that patchset, but it seems to
> have gone away.
> Do we want to solve this problem first or apply the patches and solve it
> later?
I would suggest that I push these changes and meanwhile
I will try to reproduce Martin's problem it will take few hours on my
box. It seems that the binutils got wiped out
when Martin cleaned stuff and then building eglibc resorted to
assembler on build machine
and that bombs later.


>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMWDdgMkyGM64RGpERArNxAJ9bR5166BqmDfHPUakhlptOhZSfAQCfRZI4
> mUb3gJOmb3+3ajmmqC5Ht3w=
> =TBbU
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


