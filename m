Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKuau-0003W2-8f
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 16:15:44 +0100
Received: by ywo32 with SMTP id 32so412004ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=w6Eo3ksLYlzo5MY6zH+8Ss8jxeYSxA5Kg9G8d6XR8d8=;
	b=PXjwsFRT8pufR3luSLMy9CSwBUW9eI15aaf2mgwU48BDjk7KepkZ8GcaRkGbV820hc
	LgJ89gaiP8PrAKX/BVK7yj+7OpZiyiLkOdZxFhYFcSpIbjZ5XblzGtgUSDDcgoy6x8BC
	enNvyhmf4pepECMdiJ6TcO9bHfjj4vzv0kNOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=JTRz2s+JQPRTbMnUPC2m2dKz90AZLrz9VKZPN8c2aJxtMTxZrCw3U9h0Ex3R0nH0a9
	fOqQ0PVErsFWKKHQp/oBqisIRXdDcudanFQp0Z7/5ZPZUNUjp/Fh953H2m8Q1tP9LiNV
	Z9AX9DLxiZkzzllhye3APvf4btAmI9FjJKeo0=
Received: by 10.216.22.70 with SMTP id s48mr1140345wes.27.1290525269453; Tue,
	23 Nov 2010 07:14:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 07:14:09 -0800 (PST)
In-Reply-To: <AANLkTik5MzXj0ndLMxQvE9+MCkq=s8qOc7re1ZaWtGE4@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<icgjd2$7oa$1@dough.gmane.org>
	<AANLkTi=A2j2hR6xtdB+JVe7ktUZcS2gA5QOT_GbH-McL@mail.gmail.com>
	<AANLkTik5MzXj0ndLMxQvE9+MCkq=s8qOc7re1ZaWtGE4@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Nov 2010 08:14:09 -0700
X-Google-Sender-Auth: MPf24aBJcyht3N2hQ6_1LGZOlbs
Message-ID: <AANLkTi=exRLQKd3DWgW0wdM1oiVSOSE=Woxf+NvoW3Vs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 15:15:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 8:02 AM, Robert Foerster <robert@erafx.com> wrote:
> Bitbake 1.10: 3m2.185s
> parallel-parsing (BB_NUM_PARSE_THREADS=3Dnum_cpu): 1m48.232s
> parallel-parsing (BB_NUM_PARSE_THREADS=3D2*num_cpu): 1m1.869s
>
> Parallel-parsing of recipes is excellent. =C2=A0Well done, Chris.

Hmm, maybe I should revert the change that made it num_cpu instead of
2.5*num_cpu by default :)  Figured better to be conservative and not
kill anyone's machine, but..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


