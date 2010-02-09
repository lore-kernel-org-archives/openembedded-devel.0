Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NexS5-00080U-3y
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:17:00 +0100
Received: by wwi14 with SMTP id 14so266583wwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=U77OY5saiqpb2t02VcC49MLQYwpW3bybHt92R1eLeNg=;
	b=TjyDZ+eTn23AZI7smgIfkHPr7k7YFROQizM99i7Q79TVPR1zPN2BcWc8tnpKilla18
	QR/Tw6USEe5/AhtRoAG3mD4lqRvBlL1szGWIYUtQP0tgdFb+x27b9U57O7Xu/8cDc0Wm
	O9r3HTXFblR6AQvKENXLddBObCtONTiwmekEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NTcBr91LdX+ndXNycvtTOV1vxAMg7YXY/OKfJg26KAt4GldXEa6rfVGFEfUa8hazKj
	CA49IAAsFwCQERfPgXJ+Y5Q2UIsFU5Y16njWSaxJGZiNJ8jQo3FtzK9aP7Y2fldlebfs
	Rbbfu7GNMN3USqrVo/nieFOCyXGv4dSOjP0rE=
MIME-Version: 1.0
Received: by 10.216.88.195 with SMTP id a45mr1438553wef.63.1265750063993; Tue, 
	09 Feb 2010 13:14:23 -0800 (PST)
In-Reply-To: <4B7145A5.70808@dresearch.de>
References: <4B7145A5.70808@dresearch.de>
Date: Tue, 9 Feb 2010 16:14:23 -0500
Message-ID: <f96d234e1002091314n6d8d1698pc1ce00c269dc3feb@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Tue, 09 Feb 2010 21:17:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 9, 2010 at 6:23 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> I'm a bit confused about netbase and udev use im Angstrom.
>
> Here's what i see:
>
> I connect an USB-NIC.
>
> /etc/udev/rules.d/70-persistent-net.rules is created:

I ended up just removing the following files from my build, and now it
works as I expect -- the first USB NIC is always eth0, etc.

70-persistent-net.rules
75-persistent-net-generator.rules

Cliff


