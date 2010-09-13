Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ov9qV-0003np-KL
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 16:17:30 +0200
Received: by iwn2 with SMTP id 2so5245211iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4Y3DBPu1QRaVQzfaE+XnBDNICFakrVpi/vCqBuR1KNA=;
	b=E5MDmGJXN4EgmSXUa1BskfNNjrkvcnDLlaI4ePIvy+9uif3TsDnZA0qaliMdFutCIP
	Uqw9mTND7pZA0f5L6liGxcLndB+pzfQelM3zhr9n1Rmmh3ymRYGXydtiGeeun1jSY2aH
	ObQqLjFJaF05Y95NaR3vuQjkNU7A9Oa0w1Qqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tLPgHt60blZmQVNmY4h+JqX/qmFGq8Cr8k/VVHT4fs+5bwolTKqN2wge15VLanokl7
	GOHrLxL6yr386cgm68D+mLKNBJgF0mxMZ9Wyrz8tvLS/xuNKVWIwiVWlyXq9pezLnHOZ
	lz3mbbgvpCMdaMBlF914uAKpObUMyaKWnOCZ4=
MIME-Version: 1.0
Received: by 10.231.11.130 with SMTP id t2mr6048651ibt.154.1284387397010; Mon,
	13 Sep 2010 07:16:37 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 07:16:36 -0700 (PDT)
In-Reply-To: <201009131747.25914.khimov@altell.ru>
References: <1283644814-27013-1-git-send-email-hvontres@gmail.com>
	<201009131631.58835.khimov@altell.ru>
	<AANLkTikFZv53zicF-sUF+WZJdk=WL=_pKQSc6NNBnx7C@mail.gmail.com>
	<201009131747.25914.khimov@altell.ru>
Date: Mon, 13 Sep 2010 16:16:36 +0200
Message-ID: <AANLkTikotQtqFp4M4FAO7w-YL3MaHbyPFGUBKztXKbUQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dnsmasq: add version 2.55 from upstream
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
X-List-Received-Date: Mon, 13 Sep 2010 14:17:30 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/9/13 Roman I Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
13 =D3=C5=CE=D4=D1=C2=D2=D1 2010 17:02:59 =C1=D7=D4=CF=D2 Frans Meulenbroek=
s
> =CE=C1=D0=C9=D3=C1=CC:
>> 2010/9/13 Roman I Khimov <khimov@altell.ru>:
>> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=CF=D3=CB=D2=C5=D3=C5=CE=D8=
=C5 05 =D3=C5=CE=D4=D1=C2=D2=D1 2010 04:00:14 =C1=D7=D4=CF=D2 Henry von
>> > Tresckow
>> >
>> > =CE=C1=D0=C9=D3=C1=CC:
>> >> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
>> >> ---
>> >> =9Arecipes/dnsmasq/dnsmasq-dbus_2.55.bb | =9A 13 +++++++++++++
>> >> =9Arecipes/dnsmasq/dnsmasq_2.55.bb =9A =9A =9A| =9A =9A4 ++++
>> >> =9A2 files changed, 17 insertions(+), 0 deletions(-)
>> >> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.55.bb
>> >> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq_2.55.bb
>> >
>> > Acked-by: Roman I Khimov <khimov@altell.ru>
>>
>> No problem with this version, but is it useful to keep versions like 2.5=
2.
>> Please avoid version clutter!
>
> At least it doesn't hurt in this case IMO. Although 2.55 works fine here =
since
> July (with technically exactly the same patch, somehow I've missed it whe=
n was
> looking for things to push in OE) it has many various changes compared to
> 2.52, maybe too many for someone.

Well my main concern is that we have now 6 versions of this recipe,
and I think hardly anyone has an idea on the differences between
these.
And are the older versions still maintained by someone?

Frans.


