Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7CNt-0005WV-3S
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:25:40 +0200
Received: by gwb17 with SMTP id 17so878422gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lv1a7Afs9Z30Lyqbrs7iBef0TsXyidb3AlKeA0XOZtQ=;
	b=Q9v/i+2ISWP7AOYgcgcXznbAnXq9NxGkz+jdGiXRVz+CmbV2pUbE3h2THpNupkkHih
	xOvj+lhZ+QCc+IPi+A3d+A2i5ZvfQ7LgfLvJ5XITIb+D6PzpgxwwHGYqpW5aS6Pmh65O
	+aMArlRYoismgjELp+0jO0SdRKbGWkWkucNgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tACuwiPVDcRQlNZv8wcNQbWvzwkxp8f00KJMBUigvG5xIyZpx+IuBYZojiUHVIWtEw
	JmQf7iRWJCZSiSWp5GrJ/RCcdgPrJEkRcQ5f1y6ZuvbM2YzGm30IncimLCGyXLdaXQCt
	zArd92/31Nye0nvqyEzw5IfTJdqhXEIaKppCU=
MIME-Version: 1.0
Received: by 10.42.76.65 with SMTP id d1mr1837675ick.205.1287257101564; Sat,
	16 Oct 2010 12:25:01 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 12:25:01 -0700 (PDT)
In-Reply-To: <20101016183152.GA15103@gmail.com>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20101016183152.GA15103@gmail.com>
Date: Sat, 16 Oct 2010 21:25:01 +0200
Message-ID: <AANLkTi=xV6_7_sYi4Wf11QsFOc41PaWLdtfhycu4zZGg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 19:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/16 Khem Raj <raj.khem@gmail.com>:
> On (16/10/10 13:56), Frans Meulenbroeks wrote:
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Good job Frans. I knew this was better solution but chose the inferior one
> as it was easy but this one is more elegant and libtool version
> agnostic. Thanks for doing it. In fact this should be how we solve libtool
> update issues w.r.t. libtool 2.4 as we go forward
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Thanks for the ack, but the credits should go to Henning. He did put
me on this track and I used his patch as example.
Couldn't have done it alone, being the auto* and libtool n00b that I am.
It was solely because I could stand on the shoulders of a giant, that
I could produce this.

BTW: the following recipes seem good candidates for doing the same
sort of patch:
./binutils/binutils-2.20.1/libtool-2.4-update.patch
./gnuradio/gnuradio/libusb-libtool-2.4-update.patch
./libsdl/libsdl-x11-1.2.14/libtool-update.patch

I would prefer it if the recipe maintainer gives this a stab.

BTW, maybe a better solution would be do do this in autotools (we also
discussed this in irc) and allow for aon overridable directory
variable (with default value m4)
I feel not comfortable enough to author such a patch though.
Note also that gnutls has three dirs with generated m4 files.

Frans


