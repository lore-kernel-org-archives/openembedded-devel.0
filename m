Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1OLOGn-0003cd-4M
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 00:24:56 +0200
Received: by gyg10 with SMTP id 10so2016748gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=yyU/Bq5/8n51XJwwh0nLmigyNh6IHd7rcy99xJaAdaY=;
	b=vXjH4GPlYl6WxH4XW5glta7O9F84C6hDj312R4ECrY63ST73puqH4URjVCd/pb4Atb
	D6ju4BBCvYkRiguZ2FVAq+j3hre8j/v8SBX5phinL2VuyBuUeB7i1ebzRiRCw9TedGj4
	k7MWavlFkx/1UDGKbJhUGQRO4tksL3YilLRQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Y3bmXeYHApx7V1tH9AoFDMAfSUA7FRxlRpdzXu0B8iTbtwI/VQG4RmI8L7kpkU2BHF
	m0EDGnJYNKnrn1zobV2KDweYRgCSwfRoGxbYQELBkSVxYqfYDw7xZvHdioZrl6fckax7
	lI78IZrsiacDX/MbUf0iKzeeyVUH/kinS2UV0=
MIME-Version: 1.0
Received: by 10.100.74.4 with SMTP id w4mr15218124ana.117.1275862821076; Sun, 
	06 Jun 2010 15:20:21 -0700 (PDT)
Received: by 10.100.5.14 with HTTP; Sun, 6 Jun 2010 15:20:21 -0700 (PDT)
In-Reply-To: <AANLkTinHDVWr6n5UYt0Il6JMhHhhSZN5c0JIE2D4vbdu@mail.gmail.com>
References: <20100604232423.GA9174@gmail.com>
	<AANLkTimwSHpzMzYefLJglvpwptOt9cdpEOWGSmeeK6uM@mail.gmail.com>
	<AANLkTinHDVWr6n5UYt0Il6JMhHhhSZN5c0JIE2D4vbdu@mail.gmail.com>
Date: Mon, 7 Jun 2010 02:20:21 +0400
Message-ID: <AANLkTino-SfdvGfhyzN8WSU837GvBhFMj47_XjCj7mAq@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: dbaryshkov@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pcmciautils: fix build to use flex from sysroots, not from host
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
X-List-Received-Date: Sun, 06 Jun 2010 22:24:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Jun 6, 2010 at 10:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Jun 6, 2010 at 4:00 AM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> Hello,
>>
>> On Sat, Jun 5, 2010 at 3:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi
>>>
>>> This commit
>>>
>>> commit c65ee13298e8c22274b5bcabe06f2116b8b7ebf2
>>> Author: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>> AuthorDate: Fri Jun 4 16:26:17 2010 +0400
>>> Commit: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>> CommitDate: Fri Jun 4 16:44:18 2010 +0400
>>>
>>> =A0 =A0pcmciautils: fix build to use flex from sysroots, not from host
>>>
>>> =A0 =A0Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>>
>>>
>>> breaks the build when I have flex-native in ASSUME_PROVIDED.
>>> It there any specific reason why one should use flex from hosted sysroo=
t ?
>>> is the flex package on all distribution broken for some reason ?
>>
>> Then we either:
>> 1) have to put flex in prerequisites, check it in sanity.bbclass (and
>> drop flex-native)
>> 2) have to fix pcmciautils to detect path to flex
>> 3) expand some class to autodetect the flex/bison/etc. programs
>>
>> Because currently pcmciautils just failed for me because I was building =
them on
>> the box where I had no flex installed, but build (via some other dependa=
ncy)
>> in OE sysroot.
>
> Well then you only need it in DEPENDS of pcmciautils thats all and not
> hardcode it

Fine with me. I'm commiting a patch which will drop the hardcoded path
and use just
LEX=3Dflex. That should be fine for both our cases, shan't it?

>
>
>>
>> --
>> With best wishes
>> Dmitry
>>
>



--=20
With best wishes
Dmitry


