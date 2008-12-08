Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1L9fij-00029R-R5
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 14:00:18 +0100
Received: by yx-out-1718.google.com with SMTP id 4so460872yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 04:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=lRHRQUMl2IBRCozgMky3QfhfWOnJooL4yLFE46OfrY8=;
	b=qfkHEekItCHPOqow5zGkM2QzPWKD84p/DXQelo3BIRKaBDkpP5Tfmb7TCuRAhcDGq+
	dJjQ9dMWpmZZtIzvnzfQ0iyWzjQYBTiJtxUNacgigTrUbFA3/t4znCbFChvd0GcwSXwy
	7qVMrJA+2b/cPtEInPIAc6vhaFsOW3xqrmSOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=QxMa+gz4CVxA6X9H3JaN/EegW0l9ajihYMVD5911i9b8MkehHPMCj4CmxdQJ613CyJ
	K2wCX2cXoDVXgB4KigiUNQRUmA72pf5VV/RzdGNC50fO/KPufbuD/vvjlm9W8HIf/wVz
	a0GftFTvFaB/UUzN/zkrHKS9XlcZIQvmTzTj8=
Received: by 10.150.157.17 with SMTP id f17mr167117ybe.3.1228740985733;
	Mon, 08 Dec 2008 04:56:25 -0800 (PST)
Received: by 10.150.137.10 with HTTP; Mon, 8 Dec 2008 04:56:25 -0800 (PST)
Message-ID: <48239d390812080456t3791c662r96f5e2496047d43a@mail.gmail.com>
Date: Mon, 8 Dec 2008 15:56:25 +0300
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C41AF57F04424526AD798F542197E674@aeglos>
MIME-Version: 1.0
References: <C41AF57F04424526AD798F542197E674@aeglos>
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 13:00:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 8, 2008 at 1:48 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> I have now succeeded (after some hassle) to build
> Angstrom for the AT91SAM9263EK using:
>
> linux-2.6.18-rc7     Requires new recipy
> u-boot-1.3.4          Requires new recipy
> dataflashboot.bin    Requires a patch and updated recipy.
> shasum-native        Recipy need bugfix.                   qemu
>         Need to update host files for OpenSuSE 10.2.
> checksums.ini        Needs to be updated with data for four tarballs.
by the way I've added at91bootstrap .bb, that might interest you.
afeb9260 machine is also at91sam9 architecture, runs recent enough
u-boot and kernel. So, why don't you use oe-dev branch for your work?
or might use your own branch, if that matters. That will make merging
your work much simpler.

Hope, that helps,
S.


