Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oh1Fx-0003Ox-CR
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:17:15 +0200
Received: by wyb38 with SMTP id 38so6983334wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=GCDM6R35F6oRDoloPDTP36TvUOaZmegJuWp1Dw8hVaE=;
	b=Iykfm8hSyc9KF/UK4eDZ4o1/FLqKvM1BSXsHHgrvISwUPsSK4Ssocz2sAvjrW21mVT
	331Zm3WsZiNO7i6N4vYnpJxspEOjYCKex1w7Nz5sCeqvFvIPo7gsASs/rtfvUHQPN3kw
	lPIEQOvVDuHfKew2X16s6mmtLpC8lxded4f4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=k+BiH2W6wDZx7ueuR5GhOF5HQJ5Xecy6SOoR4y7hxr1shFZTVtpFKF0UxlSeMs2qvd
	HgCV9BPAf0pQoHEWwhtrCAO1/GRCspPFjnh/dn2XDwC/iMK/VopVvhfNWBgjl6v5yHOe
	UojAHzcqUZG+3VZ0rVXUZl56VcCYJ7X4KdHU0=
Received: by 10.216.167.80 with SMTP id h58mr9366311wel.49.1281017821337; Thu, 
	05 Aug 2010 07:17:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Thu, 5 Aug 2010 07:16:40 -0700 (PDT)
In-Reply-To: <20100805115745.GH28187@mx.loc>
References: <1281006613-31148-1-git-send-email-Martin.Jansa@gmail.com> 
	<20100805115745.GH28187@mx.loc>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 5 Aug 2010 07:16:40 -0700
X-Google-Sender-Auth: f9fvKHb1GZPtQYwtE6ivia-8DqM
Message-ID: <AANLkTi=B1KW7Hg_3cuqU3p+0YP3R56+dPaHEr3rfmxxw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Revert "rootfs_ipk.bbclass: install the package manager in a separate pass from the other packages"
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
X-List-Received-Date: Thu, 05 Aug 2010 14:17:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 5, 2010 at 4:57 AM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> On Thu, Aug 05, 2010 at 01:10:13PM +0200, Martin Jansa wrote:
> >This reverts commit acc720fa80227d08fd15764117e0c34e2387e804.
>
> I'd suggest to fix it instead, like put it into the properly guarded
> block:
>
>
Graham already has a proper fix for this, so consider the reversion of
acc720fa acked by me.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

