Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpiVg-0008QF-IC
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 18:14:28 +0200
Received: by wgbdr1 with SMTP id dr1so3082168wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=5rtL9SJhgf54QA1zAL8izJ8vk0T2wc5HU9cCNrMvcw8=;
	b=pjb8J3vrvwaGq/2xWMBhuGZw7j+uqKXvUmh0Ic9IukXwsWo4kfn48cf79ToW144hJV
	a8K+uCD5KlAYDEUgeiJyDEOxHEhKQZw2QY88yKvpFGn6hQneRU35twZXGEWxGwYq4ZQl
	piD1e9iICUZhIskrkW2WxmOvXCgxkcnUnZBcY7UF3dyQcQhAwmVW1wbkx7EcHUy/sy8+
	dNUmR7i0gQbk34DKAPADBglSb/i4d2ZSeyII5yvNIBEUs2AVwDI0L8yfO7qC6Y2hR/La
	W9oLrniiLG/BjTtqdkAESGzW+Yfj+/A6KGCbNzus4zjHoY9jYJ/xUJ2BhESxeMPcg+V5
	6upA==
Received: by 10.180.78.99 with SMTP id a3mr5276888wix.15.1342195394245;
	Fri, 13 Jul 2012 09:03:14 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id y2sm3980714wix.7.2012.07.13.09.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 09:03:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <38351001.3KzA0t96MO@helios>
Date: Fri, 13 Jul 2012 18:03:08 +0200
Message-Id: <71A2669E-47B3-4F5F-B631-014BBB23CC9F@dominion.thruhere.net>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<1442756.zsKFTug4Rk@helios> <20120712195752.GN3293@windriver.com>
	<38351001.3KzA0t96MO@helios>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmKgXlCvJF/LzrcCvUFrkIFwqJ0hGC19fz3Bi/ZBuhxzE0HDZOINPi5vz1aUe2ul/FNiGwv
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 13 Jul 2012 16:14:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jul. 2012, om 17:58 heeft Paul Eggleton het volgende geschreven:

> On Thursday 12 July 2012 15:57:52 Joe MacDonald wrote:
>> Just to make sure we're got it in context, though, the open points =
were:
>>=20
>>   - tcpdump listed in meta-oe's recipes-core/tasks/task-cli-tools,
>>     under RDEPENDS_${PN}-debug.
>=20
> Koen, any suggestions? This task has pretty random contents - some of =
it is=20
> even hardware-specific. Do we really need to keep this together?=20

That's an SHR recipe, you'd have to ask Martin Jansa.

The biggest blocker right now is where meta-networking is going to be =
hosted, the layers in the meta-openembedded repo can only depend on =
oe-core and bitbake, no other external layers.

regards,

Koen=


