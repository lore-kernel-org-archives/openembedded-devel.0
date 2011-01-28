Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PiodU-0004ZG-8Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 14:45:12 +0100
Received: by qwi2 with SMTP id 2so3230001qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9FC6YE+mFitkRxGE5a6OYd9cwO4d4XxsqgjGe/pfVUc=;
	b=djZkdC2l7OcR+b+WaUgT1GkJZ2XlHBkmh95JLr+mpc5yTDlqA7Qs8xw2M0E0+u/HXz
	Y+/mTgPS/kt+3C04rHHdE+mlL58CwoL9b1UodGscMHHx9VAVsQ0JGi9/RhTlpGHpcdYE
	QXmdLimYU7oghPVM7cNHCKPtOixVq/a2anBEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZruA3XXyDwtjg6rojsZyB9USFyJnJ2adxKa6bH6Z4oq920fV6vDfi8Im7hIeA1zim7
	6Ms92SJx3v5lQaOT2NOkEBxE4dQXmHkoouX1ezByefnrSkJHVKMCUSuZguCyme5j2AsF
	CJv8LYXQnkg9SBHTUeytk6annigCXuoYD38LI=
MIME-Version: 1.0
Received: by 10.229.216.193 with SMTP id hj1mr2640808qcb.35.1296222261287;
	Fri, 28 Jan 2011 05:44:21 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Fri, 28 Jan 2011 05:44:21 -0800 (PST)
In-Reply-To: <1296220508.3831.8.camel@mattotaupa>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<1296220508.3831.8.camel@mattotaupa>
Date: Fri, 28 Jan 2011 14:44:21 +0100
Message-ID: <AANLkTi=Oqmf7KsN=_ygrZ4YkuO+aLCTsyn9e1jE13QYo@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 13:45:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear Paul,

I'm sorry that i don't typed that.
I checked:
console-image -> OK
base-image -> OK
x11-image -> OK
qt4e-image -> +/-OK (Alignment trap)
qt4e-demo-image -> +/-OK (Alignment trap)

It depends on:
barebox 2010.10 + patch.
kernel 2.6.35 + patch.

I will commit these files today.

There are of-course bugs in kernel, but the images works fine for me.
I corrected my Git username as you recommended. (thanks)

Best regard
Marek

On Fri, Jan 28, 2011 at 2:15 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Marek,
>
>
> Am Freitag, den 28.01.2011, 14:00 +0100 schrieb sujak.marek:
> > * Add config file for http://voipac.com/#X25-DKT-265
>
> could you please add a short note in the commit message if all board
> features are working as expected with this configuration or if there are
> any =93bugs=94 left.
>
> What distribution is your board build and run tested?
>
> > Signed-off-by: sujak.marek <sujak.marek@gmail.com>
>
> Please configure Git properly with `git config user.name "Marek Sujak"`.
>
> [=85]
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

