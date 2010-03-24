Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NuTCr-0002jy-3S
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 17:13:23 +0100
Received: by qyk8 with SMTP id 8so38744qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=yM/2LfzzOjtx28zOj3ji7eBHyjyIeSq9Ubznuq64xMw=;
	b=bjc05HtvjLGCU9kIeKoiqoC0KPrahjZq/G3h8HBLScAT1hQ7VOVbMPgILrgTTKihog
	ntsI2wmQlnRbcfemiAO+rqFTuk9J5IhX1VFKJ0tl+zdbbQe9lBMHYNR+DaIHAEQrv4ZG
	ldDQGsbUFdc8AEoxzSaDO2kGuFVoPllXiwPW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gtJGTyyl+57wZQW+ABtgAtCF8iuqv7yvGzgVDixdaIlvtg2ji6BY6SuS/IF8BzUXns
	FgpHz57P/HLGHfABiwklfQ1aBqHICO8ufod3VnzdqKZELabik/bgyKS9hMy5qqVz2wrC
	dOKKEy8GYA857gQUtgjg0odmsqfQJSYSaOTtE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.149 with SMTP id ju21mr1006983qcb.87.1269447008076; 
	Wed, 24 Mar 2010 09:10:08 -0700 (PDT)
In-Reply-To: <201003240834.04740.ml@vdm-design.de>
References: <1269383658-27562-1-git-send-email-ml@vdm-design.de> 
	<b6ebd0a51003231748s293a4020v989b8cdf590ccc4@mail.gmail.com> 
	<201003240834.04740.ml@vdm-design.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Mar 2010 09:09:48 -0700
X-Google-Sender-Auth: 0e92dd318141248e
Message-ID: <b6ebd0a51003240909t642135dfy5b2667f6dac0a8c5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] imagemagick: convert to BBCLASSEXTEND and new staging
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
X-List-Received-Date: Wed, 24 Mar 2010 16:13:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2010 at 12:34 AM, Thomas Zimmermann <ml@vdm-design.de>wrote=
:

> Am Mittwoch 24 M=C3=A4rz 2010 01:48:58 schrieb Chris Larson:
> > This should not be necessary.  native.bbclass automatically sets deps o=
n
> >  the -native versions of what's in your DEPENDS.  Or was there a specif=
ic
> >  reason behind adding libtool-native and removing tiff?
> >
> No there was no such a reason, i just copied it from imagemagick-
> native_0.6.3.5-10 recipe.
>
> The question is, do we convert 6.3.5-10 to BBCLASSEXTEND too, or do we
> remove
> that recipe, or is there a bug about mixed BBCLASSEXTEND and -native
> recipes,
> that -native recipes are preferred?


It seems to be a bug, yes.  Or questionable behavior, rather.  It's known.
 Best to convert both, unless you're confident no one would be affected by =
a
removal of the old -native.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

