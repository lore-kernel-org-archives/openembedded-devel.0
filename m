Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6rtx-0002Uk-SN
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 21:28:53 +0100
Received: by yxe5 with SMTP id 5so1819068yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 12:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=h8FIktpZH83TsFAnpNqsSXlLO4sqKaZbs4cn1UKqf6U=;
	b=LPC8CpZBqHVbmK7nbJ5SmRiLmP4xo4uhKGSdnFhjknM3pM8iYL3VSMItwGXcecawyF
	jFTNqC19Mp/Bh8DGPbwl0PpefWYbw22kfp2KG2W/t28akRDWyCPVI2bkWVfNgfTLr61Z
	KeibkCMwT36FXjc/inwxN2NLf7RmP2cWsVp9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tL/HnTnBc+ZrngVT5Xke8b6E2LIefad1/6kyRlZeJvvz3eyuJkeKfnYkdLN15PPWOA
	p52WdDbSdAU5oZ5PirJ9a5Ai6ukg2IEC2Rf0ZE9O9e0NGiSIu77GUeiYNVdc/pdhD7LG
	Eb5f1nvYXh/a9ZQmoDfkA5QNoL9vyd1wcqbe4=
MIME-Version: 1.0
Received: by 10.101.106.9 with SMTP id i9mr3132937anm.128.1257625654230; Sat, 
	07 Nov 2009 12:27:34 -0800 (PST)
In-Reply-To: <c384c5ea0911071049r28092a79s5dd782c93f0a08a3@mail.gmail.com>
References: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>
	<217663.38369.qm@web112503.mail.gq1.yahoo.com>
	<ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>
	<ac9c93b10911060633h7240008eqd035499cf052af1e@mail.gmail.com>
	<hd40rf$sb7$1@ger.gmane.org>
	<ac9c93b10911071001l1e556324q467845ef4771e864@mail.gmail.com>
	<c384c5ea0911071049r28092a79s5dd782c93f0a08a3@mail.gmail.com>
Date: Sat, 7 Nov 2009 21:27:34 +0100
Message-ID: <ac9c93b10911071227o955e293q831e11c873f5f148@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mysql 5
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
X-List-Received-Date: Sat, 07 Nov 2009 20:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Leon Woestenberg <leon.woestenberg@gmail.com>:
> Hello Frans,
>
> On Sat, Nov 7, 2009 at 7:01 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2009/11/7 Koen Kooi <k.kooi@student.utwente.nl>:
>>> On 06-11-09 15:33, Frans Meulenbroeks wrote:
>>>>
>>>> when installing mysql5 client or server packages they insist on
>>>> installing libmysqlclient-dev
>>>> No idea why this should be the -dev package. Content seems as expected.
>>>> Solutions are welcome !
>>>
>>> Probably a .so file that isn't a symlink to so.4.5.5.64.4
>>>
>>
>> Guess so, no idea how this symlinking exactly works and how it is
>> split over the normal and the -dev package.
>>
> The package itself contains the version-named library.
>
> The -dev package contains an non-version-named library .so symlink to
> the (version-named) library itself.
>
> Typically the -dev package should thus package the .so symlink.
>
> Regards,
> --
> Leon

Leon, Koen, thanks, I think I found it, testing my work now, will
commit a fix later today or tomorrow.
Frans


