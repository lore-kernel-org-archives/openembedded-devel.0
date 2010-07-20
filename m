Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ObKMQ-0000q0-TE
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 23:28:24 +0200
Received: by gxk3 with SMTP id 3so3014031gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=fw7xepT9gHY/g0TVN3uj8otaXznPzcriG9n2Y8JQea8=;
	b=iw2U9IFDHlU5yeuSi7l0QwENmJ80pZkpPI0EWvZxL1InpkVd3eVnopXXKx/UmS2uz7
	kJpM1X8S/J8ulm040LcIHSsJ2HeYw+f56SkE3YrHGQIxIfdw15isy0OezGOsZtzCDMmz
	yAnOvynKn97ER3ZK70MglQlutLSGXzTBJpwZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=G0oTx2RDDYTU1YNoIM7+PsOIJKsX4NT7kyMSGuKMUVo0eUs/LIr1YVqNYTwIr2+wyj
	2lI0IQ/kw/uq26s/S4LGx6lLk+XmzKqrH8ddfsydGOni3IeCOwzsGX+cd4TgefWtKjG/
	G1d3lfd/o9I3V4W6h0WQrxG8ajAAyAPWsCD5I=
Received: by 10.224.67.193 with SMTP id s1mr6479980qai.28.1279661292121; Tue, 
	20 Jul 2010 14:28:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Tue, 20 Jul 2010 14:27:52 -0700 (PDT)
In-Reply-To: <1279656272.8360.4.camel@utx.lan>
References: <1279656272.8360.4.camel@utx.lan>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 20 Jul 2010 14:27:52 -0700
X-Google-Sender-Auth: YMNzZ7DcbeaPItRVp5dOeJOTacs
Message-ID: <AANLkTimYKKxwU7DNC-4V1ndgUD-z2BKst2iYXfWtcgpI@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RDEPENDS_${PN} overwrites RDEPENDS_foo - bug or feature?
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
X-List-Received-Date: Tue, 20 Jul 2010 21:28:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 20, 2010 at 1:04 PM, Stanislav Brabec <utx@penguin.cz> wrote:

> While verifying all aspects of proposed udev change, I experienced a
> strange behavior of an udev recipe with RDEPENDS_udev:
>
> RDEPENDS_udev is always ignored. Searching in deep, I found that
> RDEPENDS_${PN} defined in update-rc.d.bbclass overwrites RDEPENDS_udev.
>
> Once RDEPENDS_${PN} is defined, RDEPENDS_udev has no effect.
>
> Is it a bug or documented feature?


Neither, it's just the way bitbake works today.  When the name of a variable
includes references to other variables like this, they aren't expanded until
the end of the parsing, and if a variable already existed with the new name,
it gets overwritten.  One could argue that bitbake should error in this
case, but that wouldn't happen anytime soon due to the change in behavior.
 It wouldn't go into 1.10, but whatever comes after that, and 1.10 isn't
even out yet.

In the meantime, you can check for this.  INHERIT += "recipe_sanity", then
bitbake -c recipe_sanity udev, or bitbake -c recipe_sanity_all udev to check
it and its dependencies.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

