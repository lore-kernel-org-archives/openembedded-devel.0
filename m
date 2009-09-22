Received: from [209.85.210.171] (helo=mail-yx0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MqA6n-0008Qe-Ez
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 20:29:04 +0200
Received: by yxe1 with SMTP id 1so1yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+nARZ/rRAixr1wCTdTD/2GgkQgzAU9rqwrj9UkkIID0=;
	b=hQjkRSqHjHwOEyFJUf1hW0e+UNYl3e/djLRpk2bBwkMzlyE4NutjTKLf4ynnTIamR3
	BIthRgg4o/oiBCr0GTGlEJ+1qB4LrvhQ6Q1bgtYV4Hrx+AfM+F637vrDVr3BIwJbJDo5
	X8iCQqznGWYv35CGYxJcOSkxfYF+ptCDy1T1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UYG0VwKNhWuz+agEe73uM/UbbanfUPHUMmHy/x4xhstiuG0IqUO7112kVbuAQKAzDQ
	UwDbrkceuXV/520CALxqaYv1VDSegRQYUoqpnU8j9P+D3MIROlO/5h1u2bI+VDNpuOx3
	zn03jUBVHy4vuZ6hy45/vNbpWsIeYyHWW6pTM=
MIME-Version: 1.0
Received: by 10.151.25.21 with SMTP id c21mr2450629ybj.31.1253644103451; Tue, 
	22 Sep 2009 11:28:23 -0700 (PDT)
In-Reply-To: <4AB8CF91.1070907@dresearch.de>
References: <4AB8CF91.1070907@dresearch.de>
Date: Tue, 22 Sep 2009 14:28:22 -0400
Message-ID: <f96d234e0909221128v65e7f834wc1687fe5fdf5136b@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake freeze :(
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
X-List-Received-Date: Tue, 22 Sep 2009 18:29:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2009 at 9:22 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Since a few days i see this crazy behavior. Sometimes bitbake freezes (ev=
erytime at the same stages if it freezes) when building a target (e.g. with=
 "bitbake drapptempl"). top tells me that a "make all" process is running a=
nd consuming all resources of one cpu.

I had an issue recently where opkg was prompting the user to overwrite
a file in the rootfs phase.  I would ctrl-C bitbake when it appeared
to be hung, but soon learned there were additional bitbake processes
still running.  When I ran killall bitbake, the error message showed
up.  You might find something by running bitbake with -DDDD.

Cliff


