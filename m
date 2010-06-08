Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OM3NV-0008Nj-PY
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 20:18:22 +0200
Received: by iwn6 with SMTP id 6so2914791iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7RVvv7ADrCxuQ7ykZIwdlgwIGwTxLCKahIyiCW8DAhM=;
	b=NhnD5JGeX99efluThTPix8++G1nkRCStSzqRnutYMNHj43yoQ61omBdJUxfqgR/GUx
	2C+yi2odYiQXyEdKrc24/N4vK257a8LGpU+Rz2B980WtfCEL6LylT3LBdqsjKStcj93a
	7Od3RejWgSGwXBmBRoV4vIpEQWrYjC2So2/2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DNhXFyFzK6T0wOkl9FhsCSy8/hJ3VD0LCivm4N2MNQ68oxHfdSLfNqyph9h8rDmlSF
	WcBZEDr9DD25zTm3BnRa91NCDW5rqtSSoKi1m4dBIy+lVpXKrjsGQpmRr+7qBA4Nb7LR
	EPnqbw/eFp/1VHgX+DcY/oZFnLnsh2gfitwmQ=
Received: by 10.231.188.150 with SMTP id da22mr6280426ibb.191.1276020840296; 
	Tue, 08 Jun 2010 11:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 11:13:40 -0700 (PDT)
In-Reply-To: <20100608172005.GA28481@rainbow>
References: <20100605204019.GA1403@jama>
	<AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com> 
	<20100608172005.GA28481@rainbow>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 11:13:40 -0700
Message-ID: <AANLkTinx7ElAXde__dWP6Eufdr4XtPl1uzzXE2srNGRP@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 Jun 2010 18:18:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 10:20 AM, Dmitry Artamonow <mad_soft@inbox.ru> wrote=
:
> On 23:14 Mon 07 Jun =A0 =A0 , Martin Jansa wrote:
>> On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > FYI:
>> >
>> > If you run into issue
>> > ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid bfd=
 target
>> >
>> > Like I did in:
>> > http://tinderbox.openembedded.net/packages/601631/
>> >
> Yup. I got this breakage too, only binutils-cross version is 2.18-r10.2
> and error is:
> ar: can't set BFD default target to `i686-pc-linux-gnu': Invalid bfd targ=
et
>
> see for example http://tinderbox.openembedded.net/packages/602258/
>
> Though I didn't dig into problem deeply and simply workaround it by
> reverting 208ece17f76686e0faa44b2a9223fcadb692a991
> But I'll gladly test any patches fixing the issue (whatever it is) in a
> proper way.

proper way is to fix binutils on your host.

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


