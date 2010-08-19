Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Om7me-0001G1-D9
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 18:16:18 +0200
Received: by fxm6 with SMTP id 6so1217891fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=VsbCSNdoxNok5ntSNPQOaqITOG0eVha/RxXVQmvg9VE=;
	b=FII6cTEqGMscGijy/xcwjf8Tdk1AxZ2e44jsv0d+QAHGZNkY47DqtRb9xgezleoMIF
	izM2hkIMFJW1ELLYBYBy2XCPiZ8+5nTtKefkDDg46PWfjaqCbmsyLyEaMNj9yatSKjy/
	Kxbgo0WZoZ+U9eX0AWn3W6XKCS9Yx/tvXwtww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=O0TQ1LewX1NHzmR1fO2PuBdxvF4z6hwpAbYcAZSurfeJqiLG+6P/cr0bpyrq35fVYZ
	z5Nifx8aRbnDqUDtth09cfXIfvwvHEg3As6rpIXJkypHZGNBJju+u5Kuj5e8uX09AiVa
	82xXlt2LslNq8/dyAeSX1jVYJENVH1hPW3uko=
Received: by 10.216.159.6 with SMTP id r6mr856055wek.55.1282234544227; Thu, 19
	Aug 2010 09:15:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Thu, 19 Aug 2010 09:15:24 -0700 (PDT)
In-Reply-To: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 19 Aug 2010 09:15:24 -0700
X-Google-Sender-Auth: BD5t2_5ePAecBrU9NMl_aES6Vd8
Message-ID: <AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Thu, 19 Aug 2010 16:16:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Hi,
>
> Found this in our reicpes:
>
> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
>

This prepends to do_install_virtclass-native, which will then replace
do_install when the overrides are applied.  This is prepending to a variable
which overrides, as opposed to the other, which is a conditional prepend.
 The two are quite different.  It's unlikely that this is what they
intended.  Far more likely that it should be changed to
_prepend_virtclass-native.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

