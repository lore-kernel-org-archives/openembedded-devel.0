Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PN936-0000M6-0F
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 20:06:04 +0100
Received: by wyb40 with SMTP id 40so4832153wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xTQdQ9wyzvLXSPjgo+fR8SIE6RpCd+3krZXNAQGQ2Ng=;
	b=RFPESj3Z9W2sw2nt1pjjXSagXP5wwvIBoeWuOPB/WL6pKdE4Ba1ZFcM7lMtYytZG7P
	0y95h2dZMWoanFW06tsriHyLdDJCnz4gYS1zHcuT+8Ddj4GxuGIuEEYxch9PJ5ne30cQ
	R1JehNTzVWcYAG2ASvUyZHx4kSE0K7IdqY5eU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gpRersYE3Ms6aa/e6wOAsNUV8TuGzDzv6u+LhGDeWYfhX0vMuxhnRVi1C9sFyPz1v4
	6Bf5vcfENDo18ornANGWLyKiLOi7Uqx6B/sZefNc3V710AZI/hSHoCaFyaAVJpdpaWkY
	wCMrW44Cu8EvVt7s6QGPYq/5Z1478nWdgTrQA=
MIME-Version: 1.0
Received: by 10.216.240.75 with SMTP id d53mr5356630wer.4.1291057484164; Mon,
	29 Nov 2010 11:04:44 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Mon, 29 Nov 2010 11:04:43 -0800 (PST)
In-Reply-To: <20101119091100.GJ15069@ibawizard.net>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTimHjCR5N8WDd5kz4qPqZE=-XCyzz-xqYiE6VeaJ@mail.gmail.com>
	<20101119091100.GJ15069@ibawizard.net>
Date: Mon, 29 Nov 2010 14:04:43 -0500
Message-ID: <AANLkTi=XryqcnijT-Yy0Ci_RfK3qHs-jakw7J8zSUxQB@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Mon, 29 Nov 2010 19:06:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2010 at 4:11 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Cliff Brake <cliff.brake@gmail.com> [2010-11-18 17:13:17]:
>
>> Last week's test run was a success with 38 combinations passing. =C2=A0T=
hanks to
>> all running tests:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010=
-11-12
>>
>> Due to the OE 2010.12 release effort, we are going to give the testing-n=
ext
>> effort a break for a couple weeks and ask people doing testing to focus =
on
>> the release-2010.12 branch that Khem is working on.
>
> Hi Cliff,
>
> it looks like, you've included my failed builds also :-) I don't know if =
it's
> intention, but I think, that only successful builds should be in the comm=
it
> message, right? Is it my mistake, to report failed builds on the Testing =
page?

My process right now is to export the table to a spreadsheet, and sort
by last successful build column.  If this field has a data that
matches the current testing branch, then I include it.  If you have a
build that does not work, then just leave this field blank, or at the
last successful build.  I could have very easily messed something up
as well.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


