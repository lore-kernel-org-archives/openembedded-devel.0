Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NXmZl-0000ly-MN
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 03:15:16 +0100
Received: by yxe5 with SMTP id 5so3607578yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 18:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=QTDT0fe6t+Ln2jtMD69/ESe9Fn6nGBBXFWX9ZjnewR8=;
	b=QRStLuE8PSWuOaqz3DX4YRyHj/26vfFzvqNDdf+eeb1NzaEQVruwC1+MnVthR9YezH
	+5Y0qaN4YBPhO308zXQ2TUaEhbajVvtojk329hufd9KW50dLYk0BU62tbZdrPMdhwUE4
	BE4sGxYUWQh6NKajUbv/N7U65jU0mv6mJLmQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=HojKo54NE0ez+x+d5F2UqXipYfNojtXh6DxtQ63mLXSrPlNlJsDFsDn/P2sLGiyDwH
	8HTm9SOkFOoNfUGdms49chymBmB0G9IOMvUXnzMkZ7KjAVe10M38EaOjVY+EaOspYga9
	i+o5oa52utYoZACw0APKIVpqLCqdhw3qDyB04=
Received: by 10.101.132.22 with SMTP id j22mr1149802ann.6.1264039976509;
	Wed, 20 Jan 2010 18:12:56 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.209])
	by mx.google.com with ESMTPS id 23sm184181yxe.54.2010.01.20.18.12.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 18:12:54 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263733818-32111-1-git-send-email-camelguo@gmail.com>
	<201001171430.39964.holger+oe@freyther.de>
	<op.u6oir0rqmn1qzu@guohr-laptop-ubuntu>
	<20100118194137.GA31712@gmail.com>
Date: Thu, 21 Jan 2010 10:12:48 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6u1rgt1mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100118194137.GA31712@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Thu, 21 Jan 2010 02:15:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Tue, 19 Jan 2010 03:41:37 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> It takes quite a bit to validate a toolchain (gcc/binutils/libc) befor=
e
> it is pushed as default preference. Dont use sword to kill a
> fly. You could very well backport the one patch and keep using 2.6.1

I have reproduced this bug many times. And I have validated this patch o=
n  =

arm, mips, x86 platforms, it did work OK.
By the way, the patch only changes the default glibc version of  =

micro.conf, so it will not kill other distributions.

> if you want to upgrade make sure that its stable enough and tested
> enough on some common architecuture/machines but as eglibc is default
> libc for micro I wouldnt worry too much for glibc as it might not hit
> all users of micro.

As eglibc is default libc for micro, this patch just added default glibc=
  =

version, so it will not hit any users of micro using eglibc.



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


