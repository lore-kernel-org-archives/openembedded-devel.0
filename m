Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8IbH-0005lW-WB
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 22:16:20 +0200
Received: by wyb40 with SMTP id 40so2978187wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=9sxkTWu+qb0lHWmMvKvfnKf/FY/RY7qHmtlJ/Py9wco=;
	b=N0v9KwakX80R9ZphI0Dld+/3QclxN9mG5CrEN63dzoD0qv9+76nQuf0g5fSTLB2VOE
	g5e5jtET6MfnKVq2g//HGkqGuS772V93RxFYFKnmFYC43nTjGSTLBek1a7/COl0fee0F
	ZnDuFYAoFcWPN84E0uqy5x2F2fqe891rCU/Xo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=QEgDLchfF9Nh06QAkC7dhrjA2p+wR9Zqi+r1kTjPpjHsBvtL7u1yLD/dnq4X4BNi1U
	AoVWqt83A1fpvF6NTiPuZL7L4jRhxTzrWk0xb7bLAhYxj24OfWIKOH9W8iwsVHxG2pHo
	LIFwk0mgASvDSLtfshec+RxDpQR+nuAORNFEQ=
Received: by 10.216.140.37 with SMTP id d37mr7225617wej.31.1287519320811; Tue,
	19 Oct 2010 13:15:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Tue, 19 Oct 2010 13:15:00 -0700 (PDT)
In-Reply-To: <AANLkTimo5eSBO0MGTGzKpzteL0=Hv3fc7M5Fr7xwEXaH@mail.gmail.com>
References: <AANLkTimo5eSBO0MGTGzKpzteL0=Hv3fc7M5Fr7xwEXaH@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 19 Oct 2010 13:15:00 -0700
X-Google-Sender-Auth: IvR6J0KJqzEJj0TiYd-QI5T_L74
Message-ID: <AANLkTikj3er-E-jh4zbCMmzc4FQHRckJeDU8=TgAXOsf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev@lists.berlios.de
Subject: Re: weird/wrong parsing error
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
X-List-Received-Date: Tue, 19 Oct 2010 20:16:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 19, 2010 at 12:42 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> I was authoring a patch for rtorrent but forgot a / in the file:// (so
> I only typed file:/)
>
> This gave me the error log below.
> It starts off saying Unable to open the bb file and only much later
> there is a MailformedURL message.
> This is fairly misleading (I started to check first if the file was
> there); suggest to improve the error message.
>

Agreed.  It also shouldn't be showing a traceback for that sort of issue.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

