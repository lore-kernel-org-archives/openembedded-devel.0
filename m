Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OI2Vm-0002Vr-3L
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 18:35:44 +0200
Received: by yxe42 with SMTP id 42so104008yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=CWoz8S6bCPyDxV+beEbPIF5W9OaBjFOeIwoem970Ei4=;
	b=mlWzj4oq86L948r/Qn2kswv3sLCza2eOPMuoKcnS7IEBVujCxU5TNd24boTOF+8IOh
	kOcC2nXylhg2vgqciX8hTMJu2QFxIm+L80+doFkId/tfFUWzxnT7aJg/BHuFBfh+8fJA
	jiGuO4z5xpnJoSIh1gbHxxsQu1VqCq0Dqhk98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ALekUUdC72T4u1M149zdrueMn+/0MdiwvnwlDQw1WYBMhoCMe4MJ7Bpc0N2X1oYH/S
	XiqpYL0vwpXwV1O1575qU7rF/fvwWgpdZ+qJv8OtIf7cie2SIT54FIIss+7t5O8lMJcx
	bUOcxPU8wWLKAgjCqQAlB7AyPotR3CnrIz4SI=
Received: by 10.224.87.83 with SMTP id v19mr325008qal.392.1275064207138; Fri, 
	28 May 2010 09:30:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Fri, 28 May 2010 09:29:47 -0700 (PDT)
In-Reply-To: <AANLkTinA_A7Ja4Go6H7MlOxFM4uLsfiQCyJnRodHHCpo@mail.gmail.com>
References: <AANLkTinA_A7Ja4Go6H7MlOxFM4uLsfiQCyJnRodHHCpo@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 28 May 2010 09:29:47 -0700
X-Google-Sender-Auth: TuvC1WE4Q_VZcRRgS9tD9rDtsWw
Message-ID: <AANLkTikmIaqai1TRdoU2SlybGF4JmdS57AJnA6sngrSS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: additional bitbake test
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
X-List-Received-Date: Fri, 28 May 2010 16:36:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 27, 2010 at 11:36 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Hi,
>
> I'd like to propose to add a test in bitbake to see if an overlay dir
> exists when specifying overlays.
>
> In the past I bumped into a problem where BBFILE_PATTERN_local =
> "^${OE_TOPDIR}/myoverlay/recipes" was not processed properly because
> OE_TOPDIR was not passed using BB_ENV_EXTRAWHITE, resulting in the
> regexp match with the dir always returning false due to OE_TOPDIR not
> being expanded.
> A simple test could warn users against errors like this one.
>

Hmm, I'm not sure how best to implement the warning.  I'd rather not grep,
and we don't currently have a way to determine what variables a given value
references.  I guess we could notice if a given pattern didn't match any
files in BBFILES, and warn on that.  Does that sound reasonable?

Aside: the fact that a nonexistant var is left as is, to be expanded in
shell, is horrible, imo.  They should expand to the empty string when unset,
or error, or something.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

