Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpoDB-0007Za-Ka
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 21:42:58 +0100
Received: by iyj8 with SMTP id 8so1612700iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ulFbg3QA3zxf/PeDmzAC2gpOXdtofy51MvPQyU3PpZ4=;
	b=rEtp/qlFvsloKdPAWYrZbB8nVMXdjYaD1sV6ngbFBtTi8UARZVNPYC++mu6he6RBGB
	jW+ID0RDLK0+DXNttXWliipQPj7zhoV9JC/MDAg70How6+Wo/GhaMKsk16cuTyWryMBV
	WF9qJcvchwqOWOAyV46TAYJgYFVSHiZuWlpvE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GdOAH7+K3SExjmjYDc6A0g8FWG0/PT9QLILxl/92hFtA23WOhrJHRV3Pai0MCF2L6C
	5RyHwaLSB1SQ59joh+fV+Fpik/HzJLc/3spka6Ckie34DHBrIZ8k7GDfmkHI+B2tIsXU
	9NvvBzgHa8cKFZrbrhzfdVLvauT7o/ydP8UbM=
MIME-Version: 1.0
Received: by 10.231.205.194 with SMTP id fr2mr876543ibb.197.1297888904580;
	Wed, 16 Feb 2011 12:41:44 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 12:41:44 -0800 (PST)
In-Reply-To: <AANLkTi=mnegYRtiQKnpw6sPjBJRSFrcaH_99LJ8q4-=F@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
	<AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
	<AANLkTi=mnegYRtiQKnpw6sPjBJRSFrcaH_99LJ8q4-=F@mail.gmail.com>
Date: Wed, 16 Feb 2011 21:41:44 +0100
Message-ID: <AANLkTi=KmmjLkMg-pHJk0LnZ66UxC09ikSg8m7Gijb1d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 08/13] cdparanoia (svn): use build variables to fix packaging when using empty prefix
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
X-List-Received-Date: Wed, 16 Feb 2011 20:42:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/16 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Feb 16, 2011 at 3:48 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Did a quick check. We have 24 other recipes that refer to ${D}/usr/bin:
>>
>> frans@frans-desktop:~/workspace/openembedded/recipes$ grep '${D}/usr/bin' */* -l
>
>> mokoeightball/mokoeightball_svn.bb
>> openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
>
> those 2 fixed, will push as soon as I get home..
>
>> Guess ideally these should all be fixed
>
> agreed, but be aware that sometimes fixing it in recipe is not enough
> and actuall code (like those 2 above) expects /usr/bin/
> so fixing it only in recipe would create recipe respecting
> bindir/datadir, but failing in runtime which is worse then not
> respecting bindir/datadir but with working runtime.
>

Actually I can imagine there are more of these. I only peeked at
${D}/usr/bin but I can imagine that e.g. ${D}/usr/lib gives more or
other hits.
And of course we should not break things. This is definitely not a
thing for an automated edit script or so.

Best regards, Frans


