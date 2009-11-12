Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8Url-00073G-2f
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 09:17:20 +0100
Received: by yxe5 with SMTP id 5so1785440yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 00:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=msKD4iDV29vJ9V/d9tzNhxn/2y5s0VvXVhrp74TgwOs=;
	b=Y8/6NvMrieAxKhNRzgNYoV0ZWXgvRjFKL1xtfe7VeTscNGMc+iQQuwNuGtWBslq2aZ
	5mgIrCtm2Ei7LbsCFXbZ+oSug0OhWcCNDlAgsrYei3ucXjn3DGgoc+mdbWevLs/uJzJG
	wDBAJTVgMoVj72pn964Rs5a1yJUhPhEAsGFAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vkNG92T61b+0gCDLbnKJp4ff0I50iTYKuQi99QRgjA/RM65aDCrr3XJBeeBi5d95kc
	v6huQ7nKi6up8PnFo7fP69MFecQDowqezsM/xx4WE68IjLeuzJE6m3EBlEX6q8rQybJt
	FTBbH/Fnlfjj25wjVo0h0SjPa9PzDFknb1X2M=
MIME-Version: 1.0
Received: by 10.100.200.9 with SMTP id x9mr2234781anf.172.1258013757785; Thu, 
	12 Nov 2009 00:15:57 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911120125380.1977@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
Date: Thu, 12 Nov 2009 09:15:57 +0100
Message-ID: <ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 08:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/12 Robert P. J. Day <rpjday@crashcourse.ca>:

> the above is switching on a symbolic mode, and that final line is
> using sed to convert the symbolic mode to the corresponding numeric
> mode for installation.
>
> =A0that worked fine a few years back, but it fails on newer linux
> distros for which the long listing might have a trailing period, as
> does my fedora 11 system:
>
> $ ls -l /etc/passwd
> -rw-r--r--. 1 root root 2474 2009-11-09 14:59 /etc/passwd
> =A0 =A0 =A0 =A0 =A0^ there

Hm. I've never ever heard about this trailing period. Where does it
come from/how was it introduced?

IEEE Std 1003.1, 2004 Edition does not specify the trailing dot
(http://www.opengroup.org/onlinepubs/000095399/utilities/ls.html )

My OpenSuse 11.2 system also gives no period and as far as I know
neither busybox nor the gnu coreutlis ls gives this period.

Personally I'm inclined to say that fedora's ls is broken.
Adding a dot after the mode bits seems meaningless for me and will
break more than one shell script.

But of course anyone feel free to enlighten me where this dot comes
from or what the use of it is.

@Robert: do you have any info where your fedora ls comes from? Is this
a shell builtin (and if so which shell), is it a busybox ls, a gnu
coreutils ls, something else?
what does
which ls
say ?

(btw sometimes /bin/ls and /usr/bin/ls and ls produce different results).

(and yeah trivial patches mailed to the list seem to be applied fairly
quickly, if more work is involved the chance decreases that someone
picks it up, especially when things seemingly work for them).

Frans


