Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oq7qR-0005KY-S4
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 19:10:02 +0200
Received: by eyb7 with SMTP id 7so3379269eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=yaEyK57RTVnO/69QqiE2eUH1JH0g9J3qu/Tc12UcrLc=;
	b=x3sjyYhfDnrgvBc/3CKsTIzFs/aPH1fA0tPXCUbZdkk01IDAVSBYvlevTTgMCnIBfk
	FjuLyQ5/XpEuFJlzOPqsm2f62tHzbWyfu+eK0JH5+iOTKnVQZuQ/yc1TR9T7MYSudNcH
	oM+HKni3WRprMlYbNnKRd71ZOh/5tpS2kjOqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=K84rbLrt49yr8Qf5nWnUgl4SPrkaxx780bFennt9zJI5EzItGAxdtRiYVyyTaR2PoB
	KLehCJTzh6Dykyys483nkfiGBk62BIw9Mk4IzVQeqW6EaIB5S1COpxA7Kk/kG/gr7k3X
	+Tlz98nhOjD/LDHnfT7C3WQFiYH7KV44AeOMA=
Received: by 10.216.165.77 with SMTP id d55mr5293724wel.23.1283188077235; Mon,
	30 Aug 2010 10:07:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Mon, 30 Aug 2010 10:07:37 -0700 (PDT)
In-Reply-To: <AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 30 Aug 2010 10:07:37 -0700
X-Google-Sender-Auth: 93bRJP77PsxGeYYVlMeOxwFUKr0
Message-ID: <AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Mon, 30 Aug 2010 17:11:11 -0000
X-List-Received-Date: Mon, 30 Aug 2010 17:11:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 30, 2010 at 9:52 AM, Esben Haabendal
<esbenhaabendal@gmail.com>wrote:

> On Thu, Aug 26, 2010 at 4:27 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> > Okay, how about..
> >
> > OVERRIDES =. "${@['', 'target:']['${BPN}' == '${PN}']}"
>
> I can also think of at least one way to do this without using anonymous
> code.
>
> In base.bbclass:
> RECIPE_TYPE = "target"
> OVERRIDES =. "${RECIPE_TYPE}"
>
> In native.bbclass:
> RECIPE_TYPE = "native"
>
> In cross.bbclass:
> RECIPE_TYPE = "cross"


And nativesdk, and sdk, and crosssdk, and cross-canadian, and.. ;)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

