Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnYg3-0001qQ-T0
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 17:11:26 +0200
Received: by iwn2 with SMTP id 2so3097780iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=br417NgyuX8E0QW4/jsm9ZA9yJ0Oz966ROdEnKzZCWg=;
	b=MU43hrswi9WVu2Mo2m8brb4o/gUHF8SNd1U5m1N3ZGQ4esFsYpJx7w8R93oCZ7giOo
	Upr2AFom0nRpcP7kWV08OLyervpBkCXm9MZdSV7G6Xq/7lupbW5jybpfdb77MMxqXqTb
	8LyycISfsUMZKULoIfVu2ioqMr3X+IY0XPBXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=bXrFiv5EFXu3TUrkOPHHEToXrt3LEXUsZpL/821JuBCkZut3pL36343Z/sdKlnNHLg
	D55eLYJQu8iVeFs58sS3B7OwOSXKhDz27g9vHVjUCbG3Bpiu9gWqr/nYi7A/yN758wx/
	Gt3rAxTlcosHVkNd3bXLLWgUVEGN2+nVOKnDo=
Received: by 10.231.174.196 with SMTP id u4mr6578350ibz.19.1282576247183; Mon,
	23 Aug 2010 08:10:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Mon, 23 Aug 2010 08:10:27 -0700 (PDT)
In-Reply-To: <AANLkTimgEBu3rddBLU6OvFvjMJ3HMM1XscUOgFS-yg9A@mail.gmail.com>
References: <1282537594-18263-1-git-send-email-raj.khem@gmail.com>
	<AANLkTim6ZrUFLWNzGAfPF5f9BJZvFM2h+Cj50Zac7bRV@mail.gmail.com>
	<AANLkTimgEBu3rddBLU6OvFvjMJ3HMM1XscUOgFS-yg9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 08:10:27 -0700
Message-ID: <AANLkTin2aV4Moa8N6axw2KGPcThYu5mZ8AKZj+O_JD+M@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, v2] ncurses_5.7.bb, recipes: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Mon, 23 Aug 2010 15:11:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 12:10 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/23 Martin Jansa <martin.jansa@gmail.com>:
>> On Mon, Aug 23, 2010 at 6:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> * Select 5.7 if none pinned.
>>> * Bump PR for recipes which have ncurses dependency.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>
> Do packages with curses in RDEPENDS also need a PR bump?

> E.g. the task packages

I bumped those too in the patch which is slated to be pushed.


>
> Apart from that things look good.
> I did not compare a full list of grep -l ncurses recipes/*/* with the
> files you have modified.
> Probably the extra's are recipes that have things like --without-ncurses in it
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


