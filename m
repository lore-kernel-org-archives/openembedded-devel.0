Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9jZl-0001jA-WA
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 21:16:22 +0200
Received: by wya21 with SMTP id 21so2012323wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Ds5r1GI7kWxKW81lNY5Wv1h1X4qgFmd/xJb3XeTtVP8=;
	b=rZzDz2xVcqR4fAzwWDbnzAXWSt/nEvAgMZEuHHR8qhKVOjuy0b+vRPZIM1Rwvi/Pkc
	5Ge5P6ebd8qhjycjA9v1FD0yqSolhxuTUMheceWk/tqbo/P46eDdy7s9sudAaQG2RBCi
	Lc/+6ch4aif7H0+liUzlodywOZH52e5CsU01s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=GDqTRUQ+KnwqZll5dhdOQyXyM78gEgoQsH22hTURESdXvB5pllJ+lyXggPUgHnf+qu
	56Y7eZUJdzcBBchJYIRTqNwOP9/GVgSU4CP9CYXx47i9UhmZ1hTNl+uq3II5tarVBzXu
	lsHrxIeIUcIH7Y731aH+KEAyFWGSolt4JxTlw=
Received: by 10.216.63.77 with SMTP id z55mr4206886wec.66.1287861342676; Sat,
	23 Oct 2010 12:15:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Sat, 23 Oct 2010 12:15:11 -0700 (PDT)
In-Reply-To: <i9v8nn$303$1@dough.gmane.org>
References: <1287841515-19825-1-git-send-email-koen@openembedded.org>
	<AANLkTinLeN9pCrmwtZYxv7HhLgzfhq+HKhkBm0hLpm9x@mail.gmail.com>
	<i9v8nn$303$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 23 Oct 2010 12:15:11 -0700
X-Google-Sender-Auth: oIlcm7rz7wFD7tp6rHOHPgY8iOk
Message-ID: <AANLkTin2aVH=VCcx-KfX5GeQ+1aBXv=pMpR5AWX7HV_o@mail.gmail.com>
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
Subject: Re: [RFC][PATCH] module bbclass: split each module into a kernel-module-<foo> subpackage and use PN as metapackage
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
X-List-Received-Date: Sat, 23 Oct 2010 19:16:22 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 23, 2010 at 11:15 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-10-10 19:03, Chris Larson wrote:
> > On Sat, Oct 23, 2010 at 6:45 AM, Koen Kooi <koen.kooi@gmail.com> wrote:
> >
> >> From: Koen Kooi <k-kooi@ti.com>
> >>
> >> Signed-off-by: Koen Kooi <k-kooi@ti.com>
> >>
> >> ---
> >>  classes/module.bbclass |  191
> >> ++++++++++++++++++++++++++++++++++++++++++++++-
> >>  1 files changed, 186 insertions(+), 5 deletions(-)
> >>
> >
> >
> > How about moving the common functions into oe.module or oe.package and
> using
> > them from module.bbclass and kernel.bbclass?
>
> I thought about that, but that needs more work :( We need to pass in a
> different path to System.map, use PN as metapackage name, use a
> different blacklist, etc.
> That requires a lot more python skill than I currently have.
>
> Apart from the horrendous code duplication, how does this look? It seems
> to do the right thing for the recipes I tested with :)
>

Looks reasonable otherwise, can always consolidate in a second pass later
on.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

