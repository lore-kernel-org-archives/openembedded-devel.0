Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opg4E-0001mN-I7
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 13:28:55 +0200
Received: by iwn2 with SMTP id 2so3927021iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rrz3L+ndIK/7wF6L5cRX6u8SRZOdcjRtb/runBi5kwU=;
	b=oSrnpgLj1B7B6K9UudkB6XSKXJHV6WU0/46nFWyUYkw9eav2C2lUikY1t3DbOU3bGV
	QFPmEAuEl/XouviJitVjEOIHznfg3iEPuHTOIITp1s3YC9xSDwI9gCd+YKsxPLYto84M
	Ttgj34FptgiQcQcvDYWLMqq9dJaSYSQnuNSms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tDcMOcBnaX7OxNsKp6M3Bde9oXzuNJhuCiY8yUGnGvc/4cVju7CpqqE+7IqiTyb/qH
	kSXhTaiiupUH2kPEL01E54QkosnqYozYuKB+mTspykVfWajmoz/KqVccdnyMER9eZqB4
	dUyl2ToWucjIRD5Cb6uBbkFcxqu7u/PbOTnLI=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr3686396ibk.36.1283081305270; Sun,
	29 Aug 2010 04:28:25 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 04:28:25 -0700 (PDT)
In-Reply-To: <AANLkTima-RkK3Ak4Cyi=3u2+HU=WGcUvzKjzbTZgGft=@mail.gmail.com>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<i5b7mm$iso$1@dough.gmane.org>
	<AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
	<i5b9ni$qra$1@dough.gmane.org>
	<AANLkTimqhCWD0Y0Mn0SZ8ZmCdiz4VXCofNWZrub=AzbW@mail.gmail.com>
	<AANLkTima-RkK3Ak4Cyi=3u2+HU=WGcUvzKjzbTZgGft=@mail.gmail.com>
Date: Sun, 29 Aug 2010 13:28:25 +0200
Message-ID: <AANLkTim89hvBQ9ibnEqMarQNXe_oU5qn8-Nd1aEbCtJ5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sun, 29 Aug 2010 11:28:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/29 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:

>
> I am quite aware that packet management brings additional complications.
> If you rebuild the package then at least the new package depends on
> the new lib so everyone getting the new version gets the new lib.
> And the package installer could just keep the old lib adjacent to the new lib.
> That is not so strange. On the system I am typing this I have e.g.
> /lib/libreadline.so.5
> /lib/libreadline.so.5.2
> /lib/libreadline.so.6
> /lib/libreadline.so.6.0
> That way I feel a migration from one lib to another could go quite smoothly.
>
>
Actually for openssl this is not possible as the libraries cannot coexist.
In case lib versions cannot coexist, I feel putting them in different
recipes and providing a virtual would be the best solution
For openssl that would probably mean having an openssl-0.9 and
openssl-1.0 recipe that both provide openssl, where the distro can
choose.
Different recipe names make it much clearer that it are not alternatives.

Frans


