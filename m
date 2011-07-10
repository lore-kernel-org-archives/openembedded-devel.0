Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qg3qV-0007nD-DS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 01:55:32 +0200
Received: by ewy5 with SMTP id 5so1163857ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 16:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=KuwLUiM1DL/NpvM+E7VSoJoqDU1mnM33fqhDamOgLWM=;
	b=osPy4OZHNyqyqxY3xxVRRMPKJnjsRsWLCOtyzgiB+sJh/YBds3NA+27eaM7x9ZIrVA
	0Q77FwQvWT5JsNM4Oi0gDSjHuD0Zm1+QsedZd78HS9vR1Rn+TsfoCePufZnBnRWuZVtF
	X0X5pfklSps5KXeoVwdM8slo4TGJLaLvQ0DEs=
MIME-Version: 1.0
Received: by 10.213.105.135 with SMTP id t7mr828234ebo.22.1310341895798; Sun,
	10 Jul 2011 16:51:35 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Sun, 10 Jul 2011 16:51:35 -0700 (PDT)
In-Reply-To: <1309968166-23347-1-git-send-email-agnel.joel@gmail.com>
References: <1309968166-23347-1-git-send-email-agnel.joel@gmail.com>
Date: Sun, 10 Jul 2011 18:51:35 -0500
Message-ID: <CAD=GYpbbzjU0_3mJcUuqNEzhv5=qXAjdcew95033WifxzVGkLw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCH v3] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Sun, 10 Jul 2011 23:55:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 6, 2011 at 11:02 AM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> The user-button wasn't working for me with the the linux-omap-psp-2.6.32 =
kernel, this change fixes it. I noticed the correct value in the linux-omap=
-2.6.39 sources
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Changes since v2:
> * Bumped PR
> * Made the commit summary more descriptive, removed full stop
>
> =A0conf/machine/include/omap3.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0...agle-cleaned-up-board-revision-conditions.patch | =A0 =A04 ++--
> =A02 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc

Could this patch be ACKed and/or applied to the dev and maintenance trees?

Thanks
Joel


