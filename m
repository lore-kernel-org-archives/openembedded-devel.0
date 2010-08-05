Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgwER-0006ar-Oo
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:55:23 +0200
Received: by bwz10 with SMTP id 10so3258201bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n5NI4LvcV87nyI4Hys+T3AAYDa8z60ERoEJVsep3aAM=;
	b=sKHGk3mJcTzaFHDb/UMu/dmv5xoLV2OCRTbq2Wz0tzyfbVI7WWH+rFADE2ORr29Pu+
	Ztqofo+5ebMFLMndTKHRqKivLdjTrAof7Kt+OeERkLtSxQXMAPx1iXbUIBT+VWwfVNxl
	AX+DlOhcM51Z2gClnSVuINFea7Qb992V8fETc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ur1FVf99BJ6pxkTOs7vXxwgRo8dNIg2eqvjRD1mJ8EtUKDHwUEDbsaLd9RyuQeX0al
	zjomAhu0cFfHPTRTZsv2nRrbW78e5lomi/J87M6wsIG7wjyaWabV10ayIx8WwiB2xC5M
	J9FIH+K6X3s42CYan+sCxxoBeZpMkiTme3MZU=
MIME-Version: 1.0
Received: by 10.204.128.130 with SMTP id k2mr6995596bks.159.1280998506020; 
	Thu, 05 Aug 2010 01:55:06 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 01:55:05 -0700 (PDT)
In-Reply-To: <201008051241.24091.khimov@altell.ru>
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<201008051138.00510.khimov@altell.ru> <20100805082440.GE29578@jama>
	<201008051241.24091.khimov@altell.ru>
Date: Thu, 5 Aug 2010 10:55:05 +0200
Message-ID: <AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 08:55:23 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/5 Roman I Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 05 =C1=D7=C7=
=D5=D3=D4=C1 2010 12:24:40 =C1=D7=D4=CF=D2 Martin Jansa =CE=C1=D0=C9=D3=C1=
=CC:

>
>> I don't know if it's worth it to force builders to upgrade subversion or
>> add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.
>
> IMO we should not break support for major stable (or LTS) distros, so my =
patch
> is broken.
>
I agree that we should not break support for major distros. but
without your patch some of the recipes cannot be build easily.
The solution of Martin seems a good inbetween.

Frans


