Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8HZX-0000GE-SB
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:10:08 +0200
Received: by wwi17 with SMTP id 17so21416wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=jatw5eSWFnrwm+Hh+jfDBCGJXWUm1AT8C+/eJ4/x9VE=;
	b=n28i6v2EetTtdPfOOFmR2vnsKXyKbGOE+2TpsAdE9n/NgBVwm0LdbBho5adLIij/v9
	lBkeXjwpDnmcs6iRHuJa+4yLRU7LppS1nQWlrbEbx7i2dNtrd3eTMTB39hYwtkYLpdSD
	kAzckXIVGkN4XwsGm3qNc5KG8UCXKz7vvmfpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=xx1ZbU9LoCEy7T2iOLG6CjURwZ2jLghyBqrHu5tuJCRsfxrFq0UcspedonHjDU6eCI
	6+h546oUSov944SvxaJ68PSd8oqft4QIrdYg0LznIvmGh+KFFSjUMPexVbKdMVlw/o/S
	rD+N/L6rtKCb6MbQ/cf5FwhL0IhdAff0m7BsQ=
Received: by 10.227.156.67 with SMTP id v3mr6649799wbw.147.1287515373076; Tue,
	19 Oct 2010 12:09:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Tue, 19 Oct 2010 12:09:12 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 19 Oct 2010 12:09:12 -0700
X-Google-Sender-Auth: BTiPoOmf0miaiRNF-PWy0DsaQsc
Message-ID: <AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
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
X-List-Received-Date: Tue, 19 Oct 2010 19:10:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 19, 2010 at 12:05 PM, Maupin, Chase <chase.maupin@ti.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Saturday, October 16, 2010 2:25 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
> > OVERRIDES when it's empty
> >
> > * empty MACHINE_OVERRIDES adds :: to OVERRIDES (then in FILESPATH skips
> >   every directory after this)
> > * strip() is needed to remove space in case some distribution has ie
> >   MACHINE_OVERRIDES ?= ""
> >   and then
> >   MACHINE_OVERRIDES += ""
> >   or
> >   MACHINE_OVERRIDES ?= "${MACHINE_CLASS}", where MACHINE_CLASS is empty
> > again
>
> I saw this issue in my overlay of having a "::" in my OVERRIDES which
> caused my parsing to fail in angstrom.inc.  Applying this fix from Martin
> resolves the parsing issue.  My OVERRIDES appear to be in the correct order
> with this change:


Can you explain this?  "caused my parsing to fail" is not very useful
information.  What exactly failed?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

