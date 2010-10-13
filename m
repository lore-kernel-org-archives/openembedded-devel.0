Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P67Lh-00049g-IO
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 21:50:54 +0200
Received: by wyb40 with SMTP id 40so1755562wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=j2LXblwtTNSPk7/Ax9rEZKhvexHTviFI7ga22ZW/VpM=;
	b=kY8pc3hLHjnNk0dPsR6w9qqDhisXenolbAZV+ha8ezO70BThAv7QTRNYt5WJNUsVsq
	4Pp6NzayPHTBJbSJFhUUxUeVHesX4v/iVzrTVfQZPrusY7uFypF40MszqEaWSVmmwvly
	HRNg/xhZvGFEpctW7MIRs9w2kV6ywW3xz/Gwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=rz4Y9MR0fZwgcVfPv4UxbMcfQXdCfE5ZN/iDl+aBjKA+vgs6fRUaezKyhh9q3XLB2W
	TW6Q+0Fuvc019EzSkZvbm59LBGcK+UXv6ZR8DFwt2SNRMl3DrJFtRhz7hxmbCiOTuQF7
	reqPOTUyl9jt+E40PE99LeqMO2/fYLwwzvrjg=
Received: by 10.216.12.8 with SMTP id 8mr394470wey.107.1286999421898; Wed, 13
	Oct 2010 12:50:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Wed, 13 Oct 2010 12:50:01 -0700 (PDT)
In-Reply-To: <1286988140-20049-1-git-send-email-bengardiner@nanometrics.ca>
References: <1286988140-20049-1-git-send-email-bengardiner@nanometrics.ca>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 13 Oct 2010 12:50:01 -0700
X-Google-Sender-Auth: PnHt5i6XH1LbccaiHRDLQujypSg
Message-ID: <AANLkTimV_Xf9geTryw8tvYknhe=5_BrSSr5YT2qHnxEJ@mail.gmail.com>
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
Subject: Re: [PATCH] [RFC][PATCH] autotools: don't specify --target when configuring gmp
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
X-List-Received-Date: Wed, 13 Oct 2010 19:50:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 13, 2010 at 9:42 AM, Ben Gardiner <bengardiner@nanometrics.ca>wrote:

> When trying to build angstrom-2008.1 from
> f58a5d59b755bdb725497f574a8059529c134c27 of master or from
> b78fc95424b5f0fb28246e8c61bb8b4d6a9d733a of stable/2009 the builds failed
> on
> gmp-native (then later gmp). The error was that "--target is not
> appropriate
> for GMP".
>

Why not fix gmp instead?  This patch is a terrible hack, and clutters up the
class.  NACK.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

