Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NdoTl-0003mP-Oc
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 18:30:00 +0100
Received: by iwn35 with SMTP id 35so5168903iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zBdIpgDDELSjb49crKhDkqm8q1mOYCwSAEx4mRiJEss=;
	b=TWTxkuKGC7GFcV3lX0yIPA3dfXVH4goZ+7O9UINoL/Z+UYxORIgbNq1iXuwf4CMj9g
	EZ+j/barA42KY6gYznjc0Wwe72/hLTaC6Y9TkjzNDyqO/tY9Ka21RLCkYxGjKEBlKxWy
	kK0P+QvP5gX7QIHl9SNPTqTc7LB3QJFp+Qc6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=daXba3tQwS68Ru0TQQynmwYk7FDymb/wwRuW3hITJkDcnpZXh4+E2Oe0prb8vGqTpD
	BteY1jbuW36Ke9Rkofcu1neTMC12zscr26ihUwhJQimrJPp0CmmIzI/WCDYHhli6R83p
	9qvSCZH0GYTrgKR2pr9yCXR1ogUjsZSYYgc/0=
MIME-Version: 1.0
Received: by 10.231.161.69 with SMTP id q5mr735844ibx.57.1265477246648; Sat, 
	06 Feb 2010 09:27:26 -0800 (PST)
In-Reply-To: <1481725733.574451265474339086.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
References: <19c1b8a91002060827g8336a7uda4dce4652548846@mail.gmail.com>
	<1481725733.574451265474339086.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
Date: Sat, 6 Feb 2010 09:27:26 -0800
Message-ID: <19c1b8a91002060927n255e2db7xe618110ffdac6623@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Sat, 06 Feb 2010 17:30:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 6, 2010 at 8:38 AM,  <pspreadborough@comcast.net> wrote:
>
> ----- "Khem Raj" <raj.khem@gmail.com> wrote:
>
>> >
>> > Perhaps it's time for me to try the OE EABI compiler. Can you advise m=
e
>> > on which OE recipes to use for this?
>>
>> use 4.4.2 or 4.4.3
>>
>
> Mmmm, I don't see any 4.4.? targets:
>

are you using .dev branch ?

> bitbake -s
>
> gcc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A00:4.2.4-r3
> gcc-canadian-sdk =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0:4.2.4-=
r2
> gcc-cross =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00:4.3.2+csl-arm-2008=
q3-39-r1 =A0 =A0 =A0 =A0 =A0 0:4.2.4-r5
> gcc-cross-initial =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00:4.2.4-=
r5
> gcc-cross-intermediate =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0:4.2.4-r5
> gcc-cross-kernel-3.3.3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0:3.3.3-r6
> gcc-cross-kernel-3.3.4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0:3.3.4-r9
> gcc-cross-kernel-3.4.4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00:3.4.4-r13
> gcc-cross-kernel-4.2.1 =A0 =A0 =A0 =A0 0:4.2.1+csl-arm-2007q3-53-r4
> gcc-cross-kernel-4.2.4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0:4.2.4-r5
> gcc-cross-sdk =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00:4.=
2.4-r5
> gcc-native =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00:3=
.4.6-r10
> gcc-noemu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
0:4.1.2-r0
>
>> >
>> > Regards,
>> >
>> > Pete
>> >
>> >
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


