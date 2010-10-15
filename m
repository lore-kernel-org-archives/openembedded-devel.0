Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6r0l-0005fu-B5
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:36:20 +0200
Received: by wyb40 with SMTP id 40so1152629wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=T5TzHDp58aCp+hQhUv4sJlwsH9RtJUaKrutif2qRIVs=;
	b=Cxm3SSCnWxV6pdjyMlkVUFv5T0iYOJcc6ISpKAfEGf0jKaNCJAE4A2ZQpuAYBHkQRV
	YDTJRlvNuP7ctIeY2vNux3BURwIOrHh+WJ7DfW43wRm05lERMmFUY8kz38OdUpVdQRxC
	AqcJDiJ5Fmb0L8u5JrOUyfwbrcnRMLuaLieWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Hvmv+f3tMAnb/uwLbgwVVrb4GAYlKl8sf4ZTDhaGYt8ch/BRpw4J3kuU/LjMDF9fMs
	bG8SfI+6aPrGk8H2/Vmddn699G+84rBpxJyr1OL367S6xLrJZZ0ov+yEkNNd32sNME0a
	L0+uyGaQ9MTq8ADR3VPCmS49p9anCs0SU2+V8=
Received: by 10.227.58.82 with SMTP id f18mr1605941wbh.12.1287174948821; Fri,
	15 Oct 2010 13:35:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 13:35:27 -0700 (PDT)
In-Reply-To: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 13:35:27 -0700
X-Google-Sender-Auth: dmuymF6BjSIdFVCv2TPNWz9Nuzk
Message-ID: <AANLkTi=hQkg3uEsjsPkH8WbVO0xciLVTNBXzSBfwOAGu@mail.gmail.com>
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
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 1/2] Fix Angstrom OVERRIDES settings
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
X-List-Received-Date: Fri, 15 Oct 2010 20:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 1:32 PM, Chase Maupin <chasemaupin03@gmail.com>wrote:

> * Use the new MACHINE_OVERRIDES variable in angstrom.inc to
>  set the FEED_ARCH and SOC_FAMILY OVERRIDES
>    * NOTE: These were left in their orignal order which will
>            result in the SOC_FAMILY being more specific than
>            the FEED_ARCH.  This was done on purpose as the
>            SOC_FAMILY should be more specific.  i.e. for omap3
>            the omap3 override is more specific than the armv7a
>            override.
> * Modified the glibc include files to prepend libc-glibc, etc
>  to the OVERRIDES list.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

