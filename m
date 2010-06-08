Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OM6Dt-00084o-1t
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 23:20:37 +0200
Received: by iwn6 with SMTP id 6so3114477iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 14:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=87sxpdRwYMHUlOQM9OiHgknk7Sn8sF0m3+eTLF5eJcg=;
	b=MjV1snxykGL8Z9EAVbOEcs4wF87zbD00s8tX6YpgF+ttcu9dGMZ/Rp+WmeBfnZqoyZ
	hNLiGTw0e8keunay5xGHgW+NI+yJ1hACagnj6BVQnO2rWLarr6jL2gBDFcrDwEi2bxnL
	4nuN4ut5Kh8+i9/z7Afdj81+fr2BzgHELDfuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uJfl7TS+iUWwk7jqmtjTuY7g2hARWlnU/O/sytqaywOyakPS+QSnTucq5LFYPhLPtd
	l1XUlgVSrUvUMI5YCgWhyp6eCcirnEE5CCEYI887y22J6m58MrF3RJUfeccTJX8jiAhg
	eh2Mk5V/0M0fde7kGS8MVwsZiXE2s0BS6+iyI=
Received: by 10.231.157.73 with SMTP id a9mr6765467ibx.123.1276031776283; Tue, 
	08 Jun 2010 14:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 14:15:56 -0700 (PDT)
In-Reply-To: <20100608200539.GA2568@rainbow>
References: <20100605204019.GA1403@jama>
	<AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com> 
	<20100608172005.GA28481@rainbow>
	<AANLkTinx7ElAXde__dWP6Eufdr4XtPl1uzzXE2srNGRP@mail.gmail.com> 
	<20100608200539.GA2568@rainbow>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 14:15:56 -0700
Message-ID: <AANLkTimYL2e7H6guEY3NMVq5SZoqeCf_ajxKWf0J_C9k@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Tue, 08 Jun 2010 21:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 1:05 PM, Dmitry Artamonow <mad_soft@inbox.ru> wrote:
> On 11:13 Tue 08 Jun =A0 =A0 , Khem Raj wrote:
>> On Tue, Jun 8, 2010 at 10:20 AM, Dmitry Artamonow <mad_soft@inbox.ru> wr=
ote:
>> > On 23:14 Mon 07 Jun =A0 =A0 , Martin Jansa wrote:
>> >> On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > FYI:
>> >> >
>> >> > If you run into issue
>> >> > ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid =
bfd target
>> >> >
>> >> > Like I did in:
>> >> > http://tinderbox.openembedded.net/packages/601631/
>> >> >
>> > Yup. I got this breakage too, only binutils-cross version is 2.18-r10.=
2
>> > and error is:
>> > ar: can't set BFD default target to `i686-pc-linux-gnu': Invalid bfd t=
arget
>> >
>> > see for example http://tinderbox.openembedded.net/packages/602258/
>> >
>> > Though I didn't dig into problem deeply and simply workaround it by
>> > reverting 208ece17f76686e0faa44b2a9223fcadb692a991
>> > But I'll gladly test any patches fixing the issue (whatever it is) in =
a
>> > proper way.
>>
>> proper way is to fix binutils on your host.
>
> Ahh, sorry - misread original Martin's post. So it's seems to be
> Gentoo-specific problem (yes, my OE is on Gentoo too).
> Still wondering why it worked before and how it's connected with adding
> "--enable-shared" in 208ece17f766. Weird, because it breaks on building
> static library.

it is a latent problem in there which just gets exposed with this change.

>
> --
> Best regards,
> Dmitry "MAD" Artamonow
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


