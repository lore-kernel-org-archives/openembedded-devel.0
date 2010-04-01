Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1NxH8z-0003EK-E1
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 11:56:58 +0200
Received: by ewy3 with SMTP id 3so60542ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:received:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=OGPWXE0Ekpt7QOehrwfuigpyi2WgE0+ilg8lVEcu3Ug=;
	b=JMUEfxQVvlQHBdtB5ZH9U8OfUnLtY9I9HgMyxtpWxVVmGjzHkxSUdLdjVbAun9gTLb
	8kzWMynsLtd1Dk56ZFrWp3xwcLlCRCe3uNR6U0v9+Ok8EnmBvxBhQxBDdwcqP+oYxNUB
	3NBnRf0Bu3iv8jbT05cil5yyP7UnwOt8FJZrM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=RcGLL9XD5JJvNUdktCGMM0vL/3a1m0igszQh2WKfE2y5syWH5xMArAcf5GHTXJePkR
	QkUwKQur0UirhmmWTtooHatMl6NGWR78qLrcLznFiMj8uAD3JHEBwEHt02h8YgNWS/mW
	OdaIBver8SQK6utkYsH3gtW+goa7B5dVfQ3Hk=
MIME-Version: 1.0
Sender: mickael.chazaux@gmail.com
Received: by 10.213.4.70 with HTTP; Thu, 1 Apr 2010 02:53:40 -0700 (PDT)
In-Reply-To: <20100331204928.GB14197@gmail.com>
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
	<20100331204928.GB14197@gmail.com>
Date: Thu, 1 Apr 2010 11:53:40 +0200
X-Google-Sender-Auth: 7aee51ebf84032c8
Received: by 10.213.43.135 with SMTP id w7mr295147ebe.89.1270115620942; Thu, 
	01 Apr 2010 02:53:40 -0700 (PDT)
Message-ID: <o2hbc36f8ed1004010253k464e88d7j99e74a4fa1104bac@mail.gmail.com>
From: Mickael Chazaux <mchazaux@adeneo-embedded.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Thu, 01 Apr 2010 09:56:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/3/31 Khem Raj <raj.khem@gmail.com>:
> On (30/03/10 09:46), Micka=C3=ABl CHAZAUX wrote:
>> This patch adds support for the i.MX25 3Stack platform.
>>       It is based on the patches released by Freescale as
>>       part of LTIB.

> We also have the latest minor patch on top of stock 2.6.28 as well which
> brings it to 2.6.28.10. Can you
> try to check if you can build on top of that ?
>
> Just SRC_URI_append_mx25-3stack =3D
> "http://download.berlios.de/mx25patches/linux-2.6.28-imx_4.5.1.patch.bz2;=
patch=3D1;name=3Dpatchmx25"

Using the patch command, the LTIB patches did not apply on top of 2.6.28.10=
.
That is why I used 2.6.28. But I just tested and the patches seems to
apply cleanly using git. I'll test
this a bit more and let you know.

Regards,

Mickael CHAZAUX

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


