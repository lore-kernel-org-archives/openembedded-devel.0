Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRSQh-0004XU-3d
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 19:08:31 +0200
Received: by wye20 with SMTP id 20so3980746wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=TKNzbH6CXiYRCHahtqcI4dRwRgoWqYp1DFMTNbgD7zw=;
	b=QiXUQNusDgFQ5j7RaTr90GbXVP664Uek5A4NPwjS8X9upzw6Rjt7uoGT52OteWlXnM
	ZsFiC0z7guBMxrvfhHPYdm27gyTV1SXWNhEUHZL5/5CTsaOFdD3VA/jttJpdmF8mNFFV
	D3S03EqLDw5gThcxPkJm9ZtvgKS3YJcaNOtXI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fqQ9INs3ejwVBVemZG4CPrpbJkgJLiBR3AzZ5SKoWj/WABsMqfXEDUt+h2qWiQEiWs
	wPr1WCOBHF0x5e5ytWjiiie1altIl+gb2oIDoSTwHw9MnDOlt63GroLzqk9FKRyQwTJJ
	wn7ytW45MOQe4ji2DKWolbTOz2HQ+T/g8BWY0=
Received: by 10.216.67.72 with SMTP id i50mr6221726wed.29.1306861521109; Tue,
	31 May 2011 10:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 31 May 2011 10:04:51 -0700 (PDT)
In-Reply-To: <1306848827.5488.18.camel@desktop.home>
References: <1306848827.5488.18.camel@desktop.home>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2011 10:04:51 -0700
Message-ID: <BANLkTiks=fC27YHTaNEbFwObRGO0U=cVeg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core and mercurial
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
X-List-Received-Date: Tue, 31 May 2011 17:08:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 6:33 AM, Chris Elston <celston@katalix.com> wrote:
> I'm just getting started with oe (specifically oe-core) and ran into a
> confusing problem that took me a minute or two to sort out.
>
> The instructions here (which I think are for oe, not core)
> http://www.openembedded.org/index.php/OEandYourDistro don't mention that
> you need mercurial, whereas the page here:
> http://www.openembedded.org/index.php/Required_software
> does.


that page needs updating

>
> I believe that this doesn't matter for oe because it has the
> mercurial-native recipe, but this isn't the case for oe-core.
>
> Admittedly sanity.bbclass does check for the presence of hg and warn
> that it's missing. I initially didn't see this message and as far as I
> could tell my bitbake command returned success having only built the
> native recipes.
>
> So the question is, does the OEandYourDistro page need updating for
> oe-core? In which case, where do I request a wiki account to do so?

yes send request to Tom King. account creation is protected for spamming
reasons.

=C2=A0Or
> alternatively, should oe-core include the mercurial-native recipe to
> cover this case? =C2=A0Discuss :-)
>

Well it can but usually OE does not need a captive version of mercurial
so it can use the one installed on the build machine.

> Cheers,
>
> Chris.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


