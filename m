Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOyyX-0007wC-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 00:21:45 +0200
Received: by lbbgo4 with SMTP id go4so2170865lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=L3NmhYLEe0BCmF8Z7ic/3/NsTwkwoj9FfVDfgNU1otk=;
	b=UuV55tBsLHDWr+DmosTNoYPi/VaN2JLzRy796tW/ppaJxQRQoN6wPDFfOYEa3vmfHO
	j7y7DKJHvZ0sxJH8fYAqC54jSjlq5RbJ6Xky6wxf+rFhl5poJfxbp0YOwgM0uJEkQ9xs
	ZlbFPMQJT2keHJ/ymETCHSCkzb5jPWEtVKFfODxXYT2UVQtWgwTYgFzok/dcr4cpaufr
	KKhQpim9vt80QAGVhN/6WG7OCGWzYerqw1nmcClhA6zv9yLzMm3I90iDKTQeTOpd0CyD
	fchKnnq+ATYCSxcq4UnO5SF4HWtFTQpy8JBX5/IIemnFiqj6kCbI3eCMEgQwrfyMrvyl
	UsyQ==
Received: by 10.152.145.228 with SMTP id sx4mr20400547lab.45.1335823923438;
	Mon, 30 Apr 2012 15:12:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 15:05:01 -0700 (PDT)
In-Reply-To: <4F9A932F.1020400@gmail.com>
References: <4F9A932F.1020400@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 15:05:01 -0700
Message-ID: <CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Mon, 30 Apr 2012 22:21:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 5:38 AM, Martin Erts=C3=A5s <martiert@gmail.com> wr=
ote:
> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
> PVR drivers, which conforms to the result that arose from
> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>
> We have applied the patch at the bottom of that page gcc, and also a
> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
> instead of ld-linux. Problem is, this gives us a kernel panic when it
> tries to run init.

interesting bits are why kernel panics ?
what error do you get from kernel ?
is it some illegal instruction or something like that ?
Do you have VFP enabled


