Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OiTHv-0001u0-S1
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 16:25:49 +0200
Received: by wwb18 with SMTP id 18so911274wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Kesv+aqKfvHuOtHyPia8GIz8xbUmX7jUsDEv7N4FmLQ=;
	b=mcnzTequoO/Th7yY9Rerq4ncVqGtmSbh5XuX+tqbhnKwKdwTB0xfCC/mbr55zWbHww
	98Y6T41WBYcxRCpR5PRe/gQrXL/8zja3w3IKyZ0L1e8qIkr78Dol0OyE1O8ud4p6VD5d
	x5PWh9rT2TSTFGTXJc6ltO1c8Oj2SVZGSXDyI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=oeQhMFAQs6Ruoen/Qr4yhtkEB9R0lXHbWW1uLicPgegswIUEgXKnhLGBe3WkfNAX/n
	WtgjhLXAoxsFCiwrFL0Ere/PKybNi5F9mPaxdQaMNnjaERHDn0DEdPERATwkmTchnG49
	0ljTozxlUlb6Li0Je2V3nsIr7sP/eSC33djz8=
Received: by 10.216.232.90 with SMTP id m68mr13891864weq.10.1281363801922; 
	Mon, 09 Aug 2010 07:23:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Mon, 9 Aug 2010 07:22:05 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 9 Aug 2010 07:22:05 -0700
X-Google-Sender-Auth: g5OO__sfYTlw9WdbHMhhkSOvJAI
Message-ID: <AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
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
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Mon, 09 Aug 2010 14:26:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@eads.com> wrote:

> Hello,
>
> I want to change some used versions of packages, so I added a
> PREFERRED_VERSION_<package>="xxx" for the packages I want to have a
> special(newer) version to be used.
>
> But e. g. for busybox the version defined in the used <distro>.conf is
> used instead of my setting in local.conf.
>
> Should local.conf not overrule <distro/machine>.conf ??


Conceptually, local should override everything, as it's the "most specific"
information available, but from a technical standpoint, we can't parse the
machine and distro configs until local.conf is parsed, as that's usually
where the MACHINE and DISTRO are set.  You can use a 'local' override to get
around it, or you can ask the distro/machine maintainer to use ?=
assignments (set only if unset).

PREFERRED_VERSION_<package>_local = "xxx" is how you use the override.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

