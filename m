Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pf6Gd-0007eX-I1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 08:46:16 +0100
Received: by iwn8 with SMTP id 8so5512236iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 23:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=gCXokY+L0pGg/k3xZdGiafVVEwL3CyXDuTVTG8engIs=;
	b=hpejKFs+jBDc6g7TiR51tMroLRs2mQTT/Tfe72iWxDOXgn9GIDzghHULA65chqwI3Y
	PEXArl4MeKLB/uX34Aq/ydGq6DSkXM7OFYHYJZRVpJTooCTxrhiummFBNX/vLLwSaSQF
	P8+IA3gxkXJ/HpcS35Ctbf0Uesje/f8ameFys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Lgex20P0x/ajtAT9JZgG1vFha1YD3vdG8MXfGagAot1hZP8tD0daYKdEyFH9KKmxSI
	N8+1mdomahZfiR6FYeZbAMQfsQFuwRmSSaZ4C6RxKxCuUZOaZF0YU53+VilFDLetgSJI
	ZNBZIuehiNq7/MUDLvL95p2iWzPo2cifyqbvA=
MIME-Version: 1.0
Received: by 10.231.11.204 with SMTP id u12mr5559018ibu.109.1295336712497;
	Mon, 17 Jan 2011 23:45:12 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Mon, 17 Jan 2011 23:45:12 -0800 (PST)
In-Reply-To: <4D34BD0A.3010206@atmel.com>
References: <4D34BD0A.3010206@atmel.com>
Date: Tue, 18 Jan 2011 08:45:12 +0100
Message-ID: <AANLkTik5ORHVa=Xuc4kAbEee+inHYUMme2y4fW7P3t+X@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bulding multiple U-Boot configs for one machine
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
X-List-Received-Date: Tue, 18 Jan 2011 07:46:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/17 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> Managed to get some time over and checked in a recipe
> for u-boot-2010.12 which builds all u-boot configs
> specified in the UBOOT_MACHINES (note "S" at the end)
>
> The frecipe is available in a private branch:
> =A0"ulf/linux-2.6.30-2011-01-16" =A0(or similar).
>
> There is a SAM9M10 machine checked in as well as a test case.
> grep for UBOOT_MACHINES in the conf/machine directory to find out which.
>
> Note that
> UBOOT_MACHINE =3D "at91sam9m10g45ek_config"
>
> but
>
> UBOOT_MACHINES =3D "at91sam9m10g45ek_dataflash at91sam9m10g45ek_sd"
>
> I.E: No "_config" in the list.
>
> The goal of the new branch is to test booting from an SD-Card
> without any other flash in the system.
> Have tested this outside openembedded so far, but
> the current branch is still to be tested on a board.


Cool.
Calamari currently does this (in u-boot_git.bb) by having a dedicated
do_compile etc that simply builds all targets, but this seems much
more elegant.
(calamari has a different u-boot for sd and for nand.)

Frans


