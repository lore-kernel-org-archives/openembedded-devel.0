Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OskYM-0000Ar-J3
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 00:52:43 +0200
Received: by wwi14 with SMTP id 14so4458467wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 15:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w8X+qWLsOXomF4Mvfpz02QrEWRRvO/Ln8xQeq8TGS24=;
	b=C23ylkMB5cQHqs3BMEHBcEnRXYNk2mwsISkdmEAMxgkYtujgudetwLJ/5mUWBturW2
	OVGcnCoKwZlrzVOvOGmnkTB8bV/zdY+XNzK/rXe+yIoT8NHwsBi/3CD639SKL/0JoX64
	/H9YIJmP4HlCiKq6xNyz4ndVrUi3Kts8t+eQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NsNMytYD61fKNJbFCGbHCO4L9/ExMkJ+0WyULHGpKCN13JbXQCl0UKDkO1W4D0VqpM
	3O9ua4nOHtufiE3tqYYmmJtrLxFDOxcGZkq6OrhDT6tV/YEZ1hKoBP+vLJ4hiZWketOO
	x7LqndiNunvoCz5IpszZlvfOakTPnui8HvNTc=
MIME-Version: 1.0
Received: by 10.216.35.78 with SMTP id t56mr4307202wea.34.1283813522173; Mon,
	06 Sep 2010 15:52:02 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Mon, 6 Sep 2010 15:52:02 -0700 (PDT)
In-Reply-To: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
Date: Mon, 6 Sep 2010 15:52:02 -0700
Message-ID: <AANLkTim6mO+jXyKAdyHN_K8sDwBWwhM35XHO2L-ux_RU@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Mon, 06 Sep 2010 22:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 3:21 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> Using current top of tree to build some of my images I noticed that
> quite a few apps seems to be broken at run time (Firefox, Epiphany,
> Gnome-mplayer, and others).
>
> All were complaining about libstdc++6 being missing. =A0Manually
> installing the libstdc++6 package fixed the issue.

I have reported this on the gumstix board as well steve and Frans did
a post about this here on OE and the other one libgcc_s.so.1 that
seems to be missing. Thanks for posting your work around I thought I
had tried that on my machine but will try again. here is Frans post
this am [oe] NOTE: Couldn't find shared library provider, also my
boost threads have the errors listed in them as well.

JL


>
> Any idea what changed that introduced this issue?
>
> Steve
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


