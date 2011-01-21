Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgLSC-0003ZA-22
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 19:11:20 +0100
Received: by gyh20 with SMTP id 20so684179gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=TKTeseXmJ3DvfKLen58b1UoqGL+HyEhc6i8pK3QtrpE=;
	b=buTeTRQLeeUEYCMVYVnVjHkM5WdZNw0SHM2CVeW6g21Br48CG3yFDCZL/ZrYyyqS8M
	yuC27wI2q19r0AGdmG/85/gTktsj7iLoZKcJ3iu2x+al4Gz6KA1o1LNRvEj4ySzFfPW8
	+9r0Xx/ufg55So3GuJWS3bdKqVrreqU3CglsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=KU/uEOVSeEYwrLGnenv+NxmXoJiO6aUh2g998EZnMhHe9EHcV2BlFvS2Vk5vGehUwT
	8IMfGnjJbVp5s7pjP6gw+vqMO3zEZQuaNAVsTAIwktHN2+oSXGJ/p4U97A5snsu1YON9
	ReQa8aYNOFPdOLdPcmyIXX0EpqxCHBczqcylI=
Received: by 10.90.100.4 with SMTP id x4mr1190232agb.4.1295633437459; Fri, 21
	Jan 2011 10:10:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 21 Jan 2011 10:10:17 -0800 (PST)
In-Reply-To: <1295608972.12720.47.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2011 10:10:17 -0800
Message-ID: <AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Fri, 21 Jan 2011 18:11:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 21, 2011 at 3:22 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
>
> `bitbake -k vdr` was executed with 6db34075 (uClibc 0.9.32-rc2) [1] and
> `minimal-uclibc` for `MACHINE = "beagleboard"`. I guess it is related to
> the uClibc upgrade.
>

Did it work before this? I guess not. Upgrade has nothing to do with
it. Its gettext/libiconv issue
in the faulty recipe itself I believe

> Using `angstrom-2008.1` or `minimal` the recipe builds fine.
>

Sure that uses glibc/eglibc with full gettext/iconv support


