Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P69qv-00087f-5M
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 00:31:18 +0200
Received: by wwe15 with SMTP id 15so6059324wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=+aiVJcdvvhRYqDYYHgjJtdzkvYx0X9XRtVx1bD0PWJ0=;
	b=mqr3SRjBf4N7YQiUHUsJAywBMnmQ2P9op/NKb8DFAYfrGjfNqpV8c2PKm6nE/HsOif
	drdeZhtNTh+pxgufkv2oYZmln5lMTrFEevwbrg4cZPY5LsxN1zkkFFrb/capZggKcxBM
	654dqvi1gWOfjGP/kt/uOGigGBvFIcJrkoIvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Bh8w0+NIcF07P9il/cT9+ewZrPq4BYsfmn66PWsaN1wu0hHpIg5qa5wbx63sNlX8jS
	b1rkF9WcRCgovczvclDj6/I32ESbYffMJx4q6TGuTHTsuts50ZBQGAgDkoUwElTN74Mu
	8hal38Z3Gr3r7jpnU3jRrtpSAZzYReBXRIz7A=
Received: by 10.216.1.208 with SMTP id 58mr8999939wed.22.1287009039872; Wed,
	13 Oct 2010 15:30:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Wed, 13 Oct 2010 15:30:19 -0700 (PDT)
In-Reply-To: <1287007782-1554-2-git-send-email-obi@opendreambox.org>
References: <1287007782-1554-1-git-send-email-obi@opendreambox.org>
	<1287007782-1554-2-git-send-email-obi@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 13 Oct 2010 15:30:19 -0700
X-Google-Sender-Auth: JO7yAlWhm5QHft0CAL1EEnExVWc
Message-ID: <AANLkTim2hP8QOog74zab1gtBr3o=cXPEx4mLoKn6C8Oq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] module.bbclass: fix dependency on specific kernel
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
X-List-Received-Date: Wed, 13 Oct 2010 22:31:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 13, 2010 at 3:09 PM, Andreas Oberritter <obi@opendreambox.org>wrote:

> * Previously, the kernel version did not show up in the
>  generated control file (debian ipk).
> * Use the same format as in kernel.bbclass.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  classes/module.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/module.bbclass b/classes/module.bbclass
> index 0e0018e..601a882 100644
> --- a/classes/module.bbclass
> +++ b/classes/module.bbclass
> @@ -1,4 +1,4 @@
> -RDEPENDS_${PN} += "kernel (${KERNEL_VERSION}) update-modules"
> +RDEPENDS_${PN} += "kernel-${KERNEL_VERSION} update-modules"
>  DEPENDS += "virtual/kernel"
>

This looks just plain wrong to me.  kernel-<version> is bitbake build time
syntax, kernel (<version>) is runtime syntax for dpkg/opkg.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

