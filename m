Received: from mail-bk0-f53.google.com ([209.85.214.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNdNw-0001az-5W
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 08:10:56 +0200
Received: by mail-bk0-f53.google.com with SMTP id e19so1245052bku.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 22:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JcLOpdJO1bE+SC/1JZktxYOgE/DoaOxX0T816977h/Y=;
	b=YNJVVr9uJy4NVg/BZN0LiGjQegLCxDeACTXq+GVTUFYtZjtu6i1j72WULqdwJfnHN6
	N7Aw87R6JHgCLsl9VXPlYdI9ggq8ogo4NZpSM46LTxLM+AMfGtI/EDugDgfYIc/Zfeax
	YltZWixXVSLFERChbbRcyD+m4fj2keK0j/d6MURLhrJNl/YHPqLG2QpSD+ES3fNQRUMJ
	llNNnGfEcDaIlet9k04dgrErrui5Jm9/qxooHocHhSaIdtlXABJ4gue4W1ohGbA6i5Dr
	xrtZtYMg0oTWU5pRI8lgaha08c7xTbYzzFdj82fPbsQG8DAVat7iiqHO9pv9nPupXLf4
	rttA==
X-Received: by 10.204.229.72 with SMTP id jh8mr3293356bkb.88.1365054823703;
	Wed, 03 Apr 2013 22:53:43 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id m11sm3302146bkz.0.2013.04.03.22.53.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 22:53:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
Date: Thu, 4 Apr 2013 07:53:41 +0200
Message-Id: <C47163E6-3427-4B5F-91B7-57105A0065AF@dominion.thruhere.net>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlGrtZlvNGf5jbwjyxYGQjsoJxbdOIiqsdVD5kU5LkTyuXwGjjB2u4j84tRr5HSDFM9xWmM
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Thu, 04 Apr 2013 06:10:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 3 apr. 2013, om 23:43 heeft Otavio Salvador <otavio@ossystems.com.br> =
het volgende geschreven:

> On Wed, Apr 3, 2013 at 4:34 PM, Philip Balister <philip@balister.org> =
wrote:
>> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>>=20
>>> Just like https://github.com/naguirre/meta-cubox you're mixing
>>> DISTRO policy in the machine files by setting the tuning to
>>> hardfloat. Don't do that. If you want hardfloat, set that in your
>>> distro config, not in your machine config.
>>>=20
>>=20
>> This keeps coming up, but I do not see an answer that works for =
people
>> creating BSP's that work with just oe-core and a BSP layer.
>>=20
>> How are we supposed to set TUNE parameters for this case? And yes,
>> this case *must* produce useful output.
>=20
> I don't think TUNE is a distro thing. It is indeed a board setting and
> I expect every board to have a good know TUNE setting.

In OE classic it was called ARM_FLOAT_ABI, which shows it's a DISTRO =
thing. And furthermore, there is no real world performance difference =
between the default (softfp) and hardfloat.=20=


