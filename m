Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbUqP-0000dS-6s
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 12:49:05 +0200
Received: by wgbdr1 with SMTP id dr1so3584134wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=HJgg1J6LSA0k7/XSXUUBWgBV4EneCgMvZygZyuqUUL0=;
	b=eevjjq/JB+0SraFhDJ8eL9vt0qk8aSlgTz8m5m/B9D9FN1dPDzYB4HuBRiRhn9DcZw
	Z0t2ziwBS9rlyvIOG13tNhkDv4afckHTNMiLdSUwh53x7vD54Ztw8NsYJwRnnzQ1Agxn
	uEoay8bLGKQcsw1FWlnUAfezFkRPkO9NdNzH3K8e39z10/5cnOhXX0UgKiff/XlyPjnu
	jEUzC2BNEOhdDbC9VYpRgzvOPRvBc6wbjFcnBXteerMixe1Y830nOoX5SHEDAe/dMaZh
	lYPeyzdf7MbcBoS1kITN1hyE7N7odHrh4Yb5LpsV+dPr/8dTD5BU8QyMxViYrrvnWOSE
	ggUw==
Received: by 10.216.218.138 with SMTP id k10mr11077195wep.222.1338806320602;
	Mon, 04 Jun 2012 03:38:40 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id gc6sm19360887wib.0.2012.06.04.03.38.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 03:38:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
Date: Mon, 4 Jun 2012 12:38:38 +0200
Message-Id: <CF97D988-4144-4C6F-89AA-05007F762E61@gmail.com>
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 10:49:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jun 4, 2012, at 11:07 AM, Elvis Dowson wrote:

> I've originally built my yocto images for a virtex5 machine, and would =
like to test it on an emulator. The Virtex-5 FXT processor is an FPGA =
which contains an embedded  PowerPC440 CPU
>=20
> Now if I specify machine=3Dqemuppc, wouldn't that just be generic =
PowerPC CPU?=20
>=20
> There are so many ppc CPU variants, like ppc405, ppc440, ppc603e, etc.
>=20
> Can the yocto build environment be modified so that the qemuppc =
emulator emulates at least the ppc440 CPU subset?

After downloading the QEMU sources, I see that there is QEMU support for =
the Xilinx ML507 development board in the file hw/virtex-ml507.c

I guess now the next step it to configure Yocto to build a specific QEMU =
machine for the Xilinx ML507.

Elvis Dowson=


