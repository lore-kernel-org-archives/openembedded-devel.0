Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OUN2j-0002au-Al
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 18:55:19 +0200
Received: by pwi10 with SMTP id 10so894853pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YgtWRGmM74PmgpU92L2n+LlZDR8B2lB/xIKwY8d8Edg=;
	b=VY/e7Uhah+u5U8snepRt+ph8Ft4QFiJg/DrWpqjmtCp81Oc+yLJJg4h3z0IycK54c0
	2CjVkoVfZ+xwIYAuaOqENruxeYk8SIwq1O1ZAqnhsOI/5BSOD/aZ5uqPtCx764HhxMab
	mRBkHD6zjC6W5l/Q1gyFPyE5LTeB7JBNzaO+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=LzMy3cQ87JwqGXYHz1Pg0vy96n775Ltz1P44jS8gO3q0/zbgelLLIG0PXR5f4dvD1v
	5Ys9iCGAcaKNOi41qJXjoEBkorI1I3OEikqzgfC2Rgg/CDP6TNSmEsVbVkw3uFHH+lix
	xaa3ZKCFZQlssxa6FRu7YsRkdXQ4wgepgmR6g=
Received: by 10.142.193.19 with SMTP id q19mr9189956wff.265.1278003031255; 
	Thu, 01 Jul 2010 09:50:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.177.19 with HTTP; Thu, 1 Jul 2010 09:50:11 -0700 (PDT)
In-Reply-To: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Jul 2010 09:50:11 -0700
X-Google-Sender-Auth: sLchRDdy2nylMmm2ir2vwubIXWE
Message-ID: <AANLkTilv__N5dfMDXUfNYcvave3Hajfjk-QulXke28GA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 16:55:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 1, 2010 at 9:24 AM, Graeme Gregory <dp@xora.org.uk> wrote:

> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
> can use overrides to change behaviors of recipes.
>
> Maybe USE flags could be implemented in a similar fashing.
>
> DISTRO_USE = "nossl nox11"
>
> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
>
> ${PN} of the recipe becomes XXXX-nossl


Any particular reason to not leverage the existing DISTRO_FEATURES,
MACHINE_FEATURES, COMBINED_FEATURES for this?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

