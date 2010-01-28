Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NadEG-0000Xa-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:52:51 +0100
Received: by ey-out-1920.google.com with SMTP id 13so278248eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=lcotl2PxPAkEU5DcJ0HEZvGqiwIm0eMUSs0myQImE5o=;
	b=ggm/LsCRG2NyQPFGIu/nyWrw83Vf8LTBdZQeO6fqYBtBYQpsv3ObPxUDmrExmvxDuj
	q1otDOjircA9pe2Y2PbUccJlxon2MecOUXzKlEmGhoLbpsqQ18EBFNqLMj5VN5OjPO/F
	guGMKxVjIuqP3/PqSuKeXpd5TbQ3UBJmgnFQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kD9wpcsI0B5N+3qJ4jrHGsViqPywdmghUuDIx2+9E3YJB4kpBO2CMyyo8mo3VBCGK6
	qCHuCCnISH0hI92OxUiZNALoY2OSdHKcYPN1sX3TpFrpGSkj9ayFIAZWM1zquxdz8jqU
	WW6n2Aeo3aQXj11oELEIQulZceX3wOCxiHBoI=
MIME-Version: 1.0
Received: by 10.213.50.67 with SMTP id y3mr5188080ebf.31.1264719026850; Thu, 
	28 Jan 2010 14:50:26 -0800 (PST)
In-Reply-To: <hjceds$nsr$2@ger.gmane.org>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
	<201001172258.25258.jay4mail@gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
Date: Thu, 28 Jan 2010 23:50:26 +0100
Message-ID: <d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Thu, 28 Jan 2010 22:52:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just for sanity I repeat here the command for c7x0:

nandlogical /dev/mtd1 WRITE 0xE0000 0x13C0000 zImage.bin

I'm still dubious about the extra space at the end of mtd1...after checksums?

Andrea


