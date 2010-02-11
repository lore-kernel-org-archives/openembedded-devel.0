Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1NfWik-0007Qt-Jb
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 11:56:33 +0100
Received: by gxk7 with SMTP id 7so1659114gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=VsuBvUslNlAcFvHkBKIdCoJa2VRX2CwvTlQLIrP19oc=;
	b=CbTGmQABUzv7TIRuRIiN6IgDngkvL3lVzgQ9SGRW1ow5UNFQSizezsvSipzYS7LMRF
	6ssUjAVnHCaTXFgRcNPVoytsFLZ6s6L95h2zYIOkmVs48vaaCxvHhwDLQjK7oAEhjyVG
	32x26GU51X6SU2zH3lWn4CSpt3ekpFnxOxC7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VPUJfVPw7iYbesFY94J8eWsbrspG8Z92Rowaz+FZwlz+wewhH02v7/XRnbDsTuhd1F
	sFAw+s0KM/WawZ49AZ0N0yyRiEDhjapjOVsIu5nEG9tmKKZapjKt+pw8vP+B+InGYOEy
	hzy3MfoxSKhvBGEX8lKYK13XzqDpdMv8ocIS8=
MIME-Version: 1.0
Received: by 10.150.119.42 with SMTP id r42mr4254203ybc.325.1265885635686; 
	Thu, 11 Feb 2010 02:53:55 -0800 (PST)
In-Reply-To: <201001310412.08413.holger+oe@freyther.de>
References: <201001310412.08413.holger+oe@freyther.de>
Date: Thu, 11 Feb 2010 08:53:55 -0200
Message-ID: <37367b3a1002110253h1d555c4cy9c74713202cead87@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: acassis@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Searching for (remote) access to i.mx27ads
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
X-List-Received-Date: Thu, 11 Feb 2010 10:56:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Holger,

On 1/31/10, Holger Hans Peter Freyther <holger+oe@freyther.de> wrote:
> Hi all,
>
> does anyone can give me (remote) access to a a i.mx27ads? We seem to have a
> MACHINE config for the i.mx27ads but it appears to not work in some cases.
> E.g.
> when trying to use the internal flash.
>

I think you need to update the kernel recipes to imx27ads, I just
created that recipe to basic NFS boot. Linux kernel 2.6.32+ has better
support for i.MX27 processor.

Best Regards,

Alan


