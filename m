Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Oqum6-0000n0-ED
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:23:20 +0200
Received: by wyg36 with SMTP id 36so9144538wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gV+h6jy8Z0n3g3oF30i7rcnYGy2PWUz06qZRYcwprFA=;
	b=LWsfOuWWg0wt9U7haDx+BCS4X472WQTyqqVlS+bJX2HgbCm3kCmEBlNrRS9gyWbjeF
	Uqrkew9y5krvLyBbeNS4Vv4F+nbKjQCYJYQrecwnrmqlsCQ+ofk4psExLofyZWA6wOPk
	dtTkAIK3PSFB5o+cNtKLo6/AobP3ULV1uVK5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VNE6jo/RYir5se/3OeaZQ1zh0T48GCjHsQOWzMzkCBbioGQ26O0GW+x/cWDBcdiSzI
	45wWs73bBp9bWs73pVMc3ULTAXp2S2i1qjO/x6XXjO/HRqsYpLZEIp1Pal68BuxTsv06
	/pnl1Xnx69aZg8sn1wJK3d8T7hV6oIPi9miqA=
MIME-Version: 1.0
Received: by 10.227.128.13 with SMTP id i13mr8769841wbs.31.1283376161160; Wed,
	01 Sep 2010 14:22:41 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Wed, 1 Sep 2010 14:22:41 -0700 (PDT)
In-Reply-To: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
References: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
Date: Wed, 1 Sep 2010 23:22:41 +0200
Message-ID: <AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SOC_FAMILY broken
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
X-List-Received-Date: Wed, 01 Sep 2010 21:23:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Sep 1, 2010 at 11:14 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Root cause: if SOC_FAMILY is not set (awhich is the case for most
> MACHINEs =A0and all distro's except angstrom) the test in base.bbclass
>

Good point, but I never understood SOC_FAMILY. From an old email:

"SOC_FAMILY is defining a family of processors and the features that proces=
sor
has.  Whereas MACHINE_CLASS is defining a type of device and its features w=
hich
can use different processors."

I think the first sentence is contradicting itself.

A "family of processors" vs. "features that processor had". This can
be fully orthogonal (worst case),
so the definition of the variable is crap. I wonder, has it proven
more useful than cumbersome?

If it truly has a clear function in OpenEmbedded that can apply to all
processors, can someone explain what the variable should be set to?


Regards,
--=20
Leon


