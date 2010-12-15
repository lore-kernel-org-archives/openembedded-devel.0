Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PSuLz-0001pc-FB
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:37:23 +0100
Received: by wwi17 with SMTP id 17so1330703wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 08:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=D8va4M3wLtUJdrg/LL9waiOF9EPPFMIiW9aNdC++EKw=;
	b=EoNPvfnKPdY9Zvo81iHMa38zgOkFg+uYYxBzzMr2jeklPY5NFhpe20Wl7xeyim93f6
	3ppAFI49vkr8piEX8rsw0VtT+F0LiGyJd5qqNkhN0gesP2YJX75z4q4hvCGdBMkkZTvy
	ozIuh+0LZuXAMU6MQCle/OLuGF66mGOS6h69s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=JIY/CzKf81kZ2eOO91JmT52CPKkyDZhAxP8RrcicDVNzx02ds4bJQuuDQR55I+xAbz
	n3hvX6XSakXXMIihIcOeUJagLIrDzk92xO3Z89Pk838n0s8GmCk2OKhrmH3AWoU0i+w5
	vD1FEEeYBsI9jtSC07C8j77q9n19wAqI7pwts=
Received: by 10.216.59.193 with SMTP id s43mr74429wec.42.1292430945898; Wed,
	15 Dec 2010 08:35:45 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 15 Dec 2010 08:35:25 -0800 (PST)
In-Reply-To: <AANLkTinBqEGcOWys5+C3y8bGo0AMEiiOa8QTfgTxOgQ-@mail.gmail.com>
References: <4D065431.6080304@dell.com>
	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
	<4D079B88.9010503@dell.com> <4D07A19D.8090602@mentor.com>
	<AANLkTinBqEGcOWys5+C3y8bGo0AMEiiOa8QTfgTxOgQ-@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Dec 2010 09:35:25 -0700
X-Google-Sender-Auth: Bi7dbCFZnbG__lmSd90DNFlRRjk
Message-ID: <AANLkTin3EjUBP6Q84g-3B=rgO7Z_04oTUYqFN8hcR3a-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Wed, 15 Dec 2010 16:37:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2010 at 10:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Note that if you use a mirror site with the SVN checkout archive in it, =
you
>> won't try and do the fetch at all. =C2=A0This may or may not be applicab=
le to
>> your case. =C2=A0For your case I think what we really want is a way to g=
lobally
>> toggle the svn protocol argument.
>
> yes that would be something more useful. I guess we could add it to
> all SCM fetching recipes.

I wonder if the PREMIRRORS/MIRRORS handling is smart enough to let us
use its regex for the components to replace protocol=3D in the url
parameters.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


