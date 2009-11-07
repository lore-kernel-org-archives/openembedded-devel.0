Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6rhS-0002Ei-9m
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 21:15:57 +0100
Received: by gxk27 with SMTP id 27so673537gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=LIGzSJYKcS08gybl+ubpoDbn2bbR6HRdr9m5nJmqxTE=;
	b=oeyNZEkBRRKYR5Qd7FMSCwAcBnxuDUjcA291Z1TiPz3qE1t4lScDZif/EdaLLQ4dmk
	wf6lCRd7VdJb9tO16Eue4AfUa8+Le9eutUAuiA5zpeNUb1Wq4mRcowhkiQTacJTFrn8Z
	sQ6wkUHG35Y+UfO8xhu0WMimwWW3ANdZpxZ90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JtvnBz09vAUedmiWgYk5JZkbMXTcKz7unlOF/sArOlK2ROvEZwaVgdtyOn2qTb5EHP
	NsV7mix2+9utzIIHjQMQ35rDhhwv5oSGhsYGHaycHEUtzp9jWl4W52sLeJhKTX1KXNP4
	i/JKTSRsmvKz9oMR0uv2d6mQxixOCH3zzy1EU=
MIME-Version: 1.0
Received: by 10.100.249.3 with SMTP id w3mr5628665anh.118.1257624873577; Sat, 
	07 Nov 2009 12:14:33 -0800 (PST)
In-Reply-To: <be7a9f3d0911071101h322dfa5dte24ef89c0b214b98@mail.gmail.com>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net> <hd4108$sbn$2@ger.gmane.org>
	<be7a9f3d0911070838x34e5cce8je93bc39aeb8fb3aa@mail.gmail.com>
	<ac9c93b10911071000p51baba8fi8f4935f962eb8810@mail.gmail.com>
	<be7a9f3d0911071101h322dfa5dte24ef89c0b214b98@mail.gmail.com>
Date: Sat, 7 Nov 2009 21:14:33 +0100
Message-ID: <ac9c93b10911071214l34b38c83x3773370980a04011@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 20:15:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Otavio Salvador <otavio@ossystems.com.br>:
> Hello,
>
> On Sat, Nov 7, 2009 at 4:00 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>>>> d) rename the tarball slighty and mirror in on a known good server (e.g.
>>>> angstrom sourcemirror) and have OE use that.
>>>
>>> IMO (d) is the safest and the right thing to do; this avoids more core
>>> to be written and avoids also we use changed versions without
>>> noticing.
>>
>> Ok, I'll leave it to someone with better access so e.g. the
>> sourcemirror to change things.
>> BTW I've exchanged an email with the author of twig. He stated that
>> the version on CPAN (3.22) is the official version and that the
>> version we use is the current development version and subject to
>> change.
>> He proposed to move the 3.33 version to CPAN (which I encouraged).
>> Guess we should then move to the cpan version which is the fixed one.
>
> Even better; I fully agree with it.
>
> If he can do it, it would avoid problems to us.

I hope he can. The 3.33 version has changed again :-(

Frans


