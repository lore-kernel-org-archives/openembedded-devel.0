Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1MXYbW-0007EQ-R5
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 12:47:50 +0200
Received: by fxm24 with SMTP id 24so1954900fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Aug 2009 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Y3v6WDIndTIF9e3BnIqWZX+d5R7MdQwd4inQcp3s2Kw=;
	b=EdfIYD3pLxEwgxO/Oy8SDowE9qCuokPIrNQfwmw/55E2dx2BWYu4X0Zn+TcEofiV9v
	cW2SdNmNGvqIrZoo/OtjmDQyM+ajB+fDv/IPd+iohhQZnEO2D1XaQKFDrFnbBCxSmQtb
	/EZhcsuI3dRxb3jvh6OJkBFr4vRwXl+0WuSg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=d/TgETdWVluovDeUivHDlgOj65SzLJkY4VP2HP4CUoWEoM4AGa2ZdJMJ/B85olbe/f
	YJEMgE/oJyG5thsljujLsXrIj+G+fPLU9n8A5PjnXvn68v9+TBDodWW4qa/m70ewR/pX
	tk0P8B9tAKJL5UNHbdBl4sGkkiWSzaBgg7bTk=
MIME-Version: 1.0
Received: by 10.103.241.5 with SMTP id t5mr2680348mur.127.1249209149931; Sun, 
	02 Aug 2009 03:32:29 -0700 (PDT)
In-Reply-To: <200908021211.14793.mok@mnet-online.de>
References: <200908021211.14793.mok@mnet-online.de>
Date: Sun, 2 Aug 2009 12:32:29 +0200
Message-ID: <359c5480908020332k6db23b20o3beb90656556d85e@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Sun, 02 Aug 2009 10:47:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sun, Aug 2, 2009 at 12:11 PM, Klaus 'mrmoku'
Kurzmann<mok@mnet-online.de> wrote:
> Hello all,
>
> I have problems building correct SHR images since some time now. Don't know
> when this started exactly, but it might have been around the bitbake switch
> from svn to git...
>
> The problem is, that a whole bunch of packages does not get installed into the
> image. As far as I can see all the packages are either RRECOMMENDS or
> RDEPENDS. This was working fine.
>
> Anybody got some idea where to look at to debug it or is experiencing the
> same?

I'm experiencing some shr build problems too, but do not know if these
are related or were born from my changes or my gentoo unstable build
host.
For example, in /etc/init.d/ rcS is missing (it should belong to
sysvinit package), and the kernel is not installed in /boot, nor
modules in /lib, but the last may be as I changed the preferred
provider to linux-openmoko to try 2.6.30.1.

P.s. at first try I used the master branch of bitbake but had problems
building qt 4.5.2 (too many loop links), after I switched to 1.8
branch and the build was fine, is the 1.8 branch the right one?

Regards

    Nicola


