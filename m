Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OiaJG-0001iA-CU
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 23:55:07 +0200
Received: by qwg8 with SMTP id 8so7894058qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a7StFwVVtgSOU+4Ra38PeJGtTZzLVFV7zu5dueYMcyY=;
	b=xr4xXMR+X9ieuJbiFllB3/H+THi0v/CSMBAGjHWZKUT+99ySkO3h+Mcvt009XUeY8t
	ex7n4f7/59GbuNUd5XYoOY+s86Hc53LoyAl0FSGSC8cOejJEOF4gYqU3PDlrLOa1VbfZ
	d0ntlmkpnLSYlKOiW9sJEAsRvdToXx6/Ik/G0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HPmeNSi5pTLAcPSHHsSw72gIaaBvxdD/DyiGlvMvNxicoDh1WezbQAJIsz+CaUYG4y
	Za3/UoNgxm19SDMi1cA7G/QUEAnYoRNhWxZPOHflA8ZOLnEqHKYAAX/pc2uXvhMcaH1/
	37kORpiYkVFR0r2wyEWe7VLayiMGj6gN2Yd/Y=
MIME-Version: 1.0
Received: by 10.224.93.130 with SMTP id v2mr8694139qam.253.1281390895247; Mon, 
	09 Aug 2010 14:54:55 -0700 (PDT)
Received: by 10.229.182.19 with HTTP; Mon, 9 Aug 2010 14:54:55 -0700 (PDT)
In-Reply-To: <E1OhMNp-0001vS-Ot@melo.openembedded.org>
References: <E1OhMNp-0001vS-Ot@melo.openembedded.org>
Date: Mon, 9 Aug 2010 23:54:55 +0200
Message-ID: <AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graham Gower : package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg. conf
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
X-List-Received-Date: Mon, 09 Aug 2010 21:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It seems this doesn't respect ${ONLINE_PACKAGE_MANAGEMENT}" =3D=3D "none"

I see a spurious /var/lib/opkg in the cpio of initramfs-kexecboot-image.

oe              =E2=94=82      0=E2=94=82Aug  9 23:32=E2=94=82
oe-all          =E2=94=82  64030=E2=94=82Aug  9 23:32
oe-armv5te      =E2=94=823637007=E2=94=82Aug  9 23:32
oe-tosa         =E2=94=82 463708=E2=94=82Aug  9 23:3


We don't need any extra cruft there ;)

Regards

Andrea


