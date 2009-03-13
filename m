Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LiDDm-00011t-De
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 20:39:06 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1986624wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jnaqnFYcU7S4K8F/HgMdDA/H4ne5q+y5z/wdd8MEdho=;
	b=BEVCoh/mRPNa8InlInuigcHzYjRaSI0JYk84Uom5jPeAnNANrIIjEoRkXKNXfm1bbX
	pzmRB+brm7wWkWOLqZ3q95PZ0A7Ofg8VnBaUILgW+4bjFLFjfqq2tKo3rMefWFYcgoSx
	q4B0I3HrXiN2ZowfbH+iACKaoQMdtBUJmbqvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LZUZ54jhS5Hu+BFDmu8YJg3k+BF3z2zTnPYl5feBXi+xXNp2UKZtNZtFf4hT4PRB6e
	Ky/451Oxb2jQbFI4Vyb+FDZqkSsbfcp8ScIc4YZqPmmiatg5fOEvLMG0SJu+U13IJ6jq
	LtQyIVnvNjuXZHNQsiMZiFPnC+m3JPKYUpW9I=
MIME-Version: 1.0
Received: by 10.142.154.9 with SMTP id b9mr769864wfe.327.1236973125115; Fri, 
	13 Mar 2009 12:38:45 -0700 (PDT)
In-Reply-To: <069B6B31F6201B4389D7EEB9AD827BCA05005FAB@otis.burlington.evertz.tv>
References: <069B6B31F6201B4389D7EEB9AD827BCA05005FAB@otis.burlington.evertz.tv>
Date: Fri, 13 Mar 2009 12:38:45 -0700
Message-ID: <19c1b8a90903131238q5c71c641n2f6a7eb40c911c4a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: SIP recipe can't find Qt4 package in x86 build
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
X-List-Received-Date: Fri, 13 Mar 2009 19:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 13, 2009 at 12:11 PM, Rodney Lott <rlott@evertz.com> wrote:
> Hello.
>
> I am new to OE and I couldn't find anything in the devel mailing list archives for Feb and March, so I wanted to ask about the following issue.
>
> I am configured as follows:
>
> OE Build Configuration:
> BB_VERSION        = "1.8.13"
> METADATA_BRANCH   = "<unknown>"
> METADATA_REVISION = "<unknown>"
> TARGET_ARCH       = "i486"
> TARGET_OS         = "linux"
> MACHINE           = "x86"
> DISTRO            = "minimal"
> DISTRO_VERSION    = ".dev-snapshot-20090313"
> TARGET_FPU        = ""
>
> I am using the following git revision:
>
> commit 12b093a681c4e011062538e4f2c582630997855f
> Author: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
> Date:   Sun Feb 8 16:42:47 2009 +0100
>
> I am not using the latest because this was what I started with and I don't want to pull the latest yet unless it is necessary.
>
> Here's the problem I am having.  I have an image recipe that basically contains the following:
>
> require packages/images/minimal-image.bb
>
> IMAGE_INSTALL += "cron"
> IMAGE_INSTALL += "ntp"
>
> export IMAGE_BASENAME = "cp2210e"
>
> If I build with this, everything is peachy and I get my minimalist image with ntp and cron installed.  I then add more IMAGE_INSTALL lines after the ntp line:
>
> IMAGE_INSTALL += "python"
> IMAGE_INSTALL += "python-twisted"
> IMAGE_INSTALL += "python-pyqt"
>
> The build goes on fine for a while and it stops at this:
>
> NOTE: Running task 765 of 1189 (ID: 532, /home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb, do_configure)


You are building sip-native recipe so looking into host tool staging
is right here. So this file should either come from your host
installation of qt-devel  or from qt-native package(if there exists
one) which ever provides it. You might want to make  sip-native
DEPENDS on this package.

Thx

-Khem


