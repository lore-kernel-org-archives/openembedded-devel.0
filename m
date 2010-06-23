Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ORO17-0007Fj-JJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 13:21:18 +0200
Received: by bwz14 with SMTP id 14so2127531bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+PrC/4BOgpoDGPjRcmj91mSARZPkrQAs3yUUsLKKZQo=;
	b=BjxZn2Wsv3rewgZWZH+65KV1ZDNm7M8RTPJF94933qefk+IXqWA9XkdEeBSYiuxFWf
	OfnsvILVRk+k3GGkW/nRc0kLWSnUvOT76QB6Dh4kiYchsr363fRbpZMeSa5RI9xf9uwd
	fjcfzDqMBOkaWJfJu0SmCFEKSGP2c6RJbUslY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dTBLd+1OTwp8etMbh1dwT47FABJ44dg5nHOT+6Vztsfw1jCVy4vofrq1ff9+TGEItr
	TVZljRUaDQXl+T/oIaoK3i3Sm0sDzh/nnvqFAcEshcR5g1Q7hhM7MKfY3zcI8TWOnxLD
	6OIINQPO4elukp9PECH6JIjaMH0KSEySZiPBE=
MIME-Version: 1.0
Received: by 10.204.47.11 with SMTP id l11mr5408830bkf.96.1277291802749; Wed, 
	23 Jun 2010 04:16:42 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Wed, 23 Jun 2010 04:16:42 -0700 (PDT)
In-Reply-To: <hvsnsn$mvd$2@dough.gmane.org>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
	<20100623110315.16293a95@xora-desktop.xora.org.uk>
	<4C21DCD6.4090509@balister.org> <hvsnsn$mvd$2@dough.gmane.org>
Date: Wed, 23 Jun 2010 13:16:42 +0200
Message-ID: <AANLkTilv_BG9-Ksq5-fraEY4edmdFhfKTIgM-B2Gojq1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Wed, 23 Jun 2010 11:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-06-10 12:07, Philip Balister wrote:
>> On 06/23/2010 12:03 PM, Graeme Gregory wrote:
>>> On Wed, 23 Jun 2010 11:54:21 +0200
>>> Frans Meulenbroeks<fransmeulenbroeks@gmail.com> =A0wrote:
>>>
>>>> 2010/6/23 Graeme Gregory<dp@xora.org.uk>:
>>>>>>>> Also I don't feel empowered to make changes in distribution
>>>>>>>> specific files.
>>>>>
>>>>> Why not, chances are Angstrom maintainers would be quite happy for
>>>>> you to patch angstrom*.conf if you ask us.
>>>>>
>>>>> Graeme
>>>>
>>>> distribution !=3D angstrom
>>>> There are more distributions out there.
>>
>> Right now, toolchain selection is done in distro files not machine
>> files. I agree this is not the clearest approach, however adding the
>> toolchain selection to the machine files may have unexpected side effect=
s.
>
> Think of multimachine builds. What happens when someone else adds
> *another* nios2 based machine with different toolchain versions, how do
> I know which toolchain avahi_1.0_nios2.ipk was compiled with

If toolchain is interesting to know in ipk's it should be part of the name.
And note that I am really in favour of an architecture specific
solution, not a machine one.
That is why I used an include file to contain the pinnings.

And actually the situation with nios2 is much much worse.
As it is a soft-core people can come up with all kind of variants.
(e.g. with/without fp). Actually nios2 adds pragma's to gcc to select
which instructions are there and which not.
Not sure whether the latter is a good idea as it is one of the things
that fail moving to a newer gcc.

The good news is that most of the variants used have different
peripherals, but seem to stick to just a few cpu cores.
(nios2 is used as a generic name for the SoC as well as the core,
doesn't help to separate things either).

Frans


