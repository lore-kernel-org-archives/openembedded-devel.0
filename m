Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PC6fz-00064A-Cm
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 10:20:35 +0200
Received: by iwn42 with SMTP id 42so4101777iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 01:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=B7mmhwEfLMdGH3qCpRcHxboZgJIb1PfdpN8O+H/nO+0=;
	b=NHrCArO0i2uHxawnDrefwIrP8KT0/HXlQZARwMWY09uBo+dxW0Gnu0lHvxm9r8VuEM
	xhv9t/I0NNcu8GvO53R+PipU8aT8MoROrHQYr/LAfivzDxfbdL3GJc5N+vaZ/rUpX7X1
	F+XDTN+YgBblIuYKUQ3wGbOr4MvvGbAraKUlk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GCL2vhPQkGYKoDyZW8i48Kx6T0Wm950teI+vrRk/VoeuORtu/QhLmf2d+hT/Eo+AuY
	Y6FnNWaThiglEEeRq6QmU/2tVQbTIZdRoYWBIEOD6hQ7xfWlGmqBuA92i325LXDZ5C+g
	5zeplNL5lEf7A3zFRuVP23+k+MyTubzkucCgU=
MIME-Version: 1.0
Received: by 10.42.71.69 with SMTP id i5mr1910522icj.115.1288426785449; Sat,
	30 Oct 2010 01:19:45 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Sat, 30 Oct 2010 01:19:45 -0700 (PDT)
In-Reply-To: <20101030080536.GC3206@jama>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
	<4CCB5DC0.3030607@eukrea.com> <20101030080536.GC3206@jama>
Date: Sat, 30 Oct 2010 10:19:45 +0200
Message-ID: <AANLkTi=o1+aMfVa884ph4+jKS2UOu9_nw-3WDAsEmMZg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 08:20:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/30 Martin Jansa <martin.jansa@gmail.com>:
> On Sat, Oct 30, 2010 at 01:50:24AM +0200, Eric B=E9nard wrote:
>> Le 30/10/2010 01:35, Eric B=E9nard a =E9crit :
>> > keep the following versions :
>> > 1.2.1 (used by oplinux)
>> > 1.7.2 (used by nylon)
>> > 1.13.2 (used by angstrom, kaeilos and slugos)
>> > 1.17.1 (used by angstrom)
>> > 1.17.3 (latest one)
>> >

Seems fair to me. Haven't seen 1.17.3 yet (but don't have git head handy)
1.17.1 still has the nios2 patches.

Not sure whether we should keep e.g. the 1.2.1 version.
I'm all in favour creating an overlay called oplinux and move it there
(as per proposal of koen from a week or so ago)

Frans
>> forget this one, 1.16.2 should not be removed as it's used by shr.
>
> I'll try and then switch to latest.
>
> Thanks
>
> Regards,
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


