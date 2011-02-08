Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PmwQn-0007tv-CL
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 23:53:09 +0100
Received: by fxm17 with SMTP id 17so6590490fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=MeiDlVE1R11x2TXYqtLjJ1th7cdjfIjtkjb6IHq9HEQ=;
	b=ij9xPh34ogB4ZyVDocQ4AkLd34Iy+F3jQoDo/hqEP9mn2X8eMlmciGxzBbPTogjsWE
	9MHArSzdqHXQPwldzKQqgh1/i8QmqRT2HMcuG18ZWxlD6F9JMBGlHfxpNvMK9Ccdqn9T
	JOveSTO3VVbcR8kZ2COPCNp7bDJ3ky6Q2JnAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=S5lojXprONhBpScrAVGMz2gkodmucX66CqZRUDzrjZcJ2ZTNurrg0WT5U+T+xqeCPh
	OXpP64pwk2/hoXnoUtj7jbL6WRMlC8tVq9gM+LfuWru3hDnOLcFXN3atPOOvFr+lDHcQ
	Pc6OvdGxc+/nSyzeor3xgcSoVUr+kErsEhZoE=
Received: by 10.223.71.199 with SMTP id i7mr3520033faj.57.1297205526113; Tue,
	08 Feb 2011 14:52:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Tue, 8 Feb 2011 14:51:45 -0800 (PST)
In-Reply-To: <4D51566B.9060603@mentor.com>
References: <4D51566B.9060603@mentor.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Tue, 8 Feb 2011 15:51:45 -0700
Message-ID: <AANLkTik=O8Pq202JH5qFLrO7fGEcBJjsRnScQoc7AvRO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 22:53:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'd be happy to some hardware testing on Angstrom / Gumstix Overo +
desktop-image (or just console-image) if you add it to the matrix.

What all does the hardware testing entail?

AJ ONeal

On Tue, Feb 8, 2011 at 7:42 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Hey all,
>
> As March is fast approaching I want to gather the list of DISTRO / MACHINE
> / BBPKGS targets that the various distributions would like to see at least
> compile tested (volunteers for HW testing welcome!). Today, I have the
> following setup to be built:
>
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb +
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
>
> slugos / ucslug:
> nslu2be/le + slugos-image
>
> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be adding
> Ubuntu 10.04 for the next run.  What more do people want added? I'm looking
> to fill this matrix out to something that runs "over the weekend" and I've
> still got plenty of room to spare (which is why I've bcc'd everyone in the
> MAINTAINERS file with a Distro by their name).
>
> And of course if you wish to handle building what you care about yourself
> instead, that's great!  Please just take this as a gentle reminder that
> there's a release coming up so it's time to crank the builders up and make
> sure your stuff is working.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

