Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6937-0005ng-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:39:51 +0200
Received: by wwe15 with SMTP id 15so6018034wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ttdHR1DAYAak7RSwb/KBUxWRevh7Bl+eROTmD83dsNE=;
	b=K/xhzdQjaj3L7u7513YAHCZM6UhNyjMLCKo5L7qAwd2sI+vsRSNWPoGRlvfgpnBc1F
	nt9WRhNVwmQXBSfFFrqXlqTnhOq4lcgq6TGUvfaXjOMki3RqiLQe1KMNnZvylcYt5d+s
	ykigNcZh5qFBc46x2XRKzWyctoYYqsieZPGBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=r+Z27SteEGOC0Qrx9a6TIZ8CtWH58jA5Y0RdWokuzQbWiOS8f47C6VGS4R36oAuWFw
	gIWCabI+2a8dypaKrPQatvM3gVoaHjJT2vIAXqKi+1F1PBRlX98H4c6m/VU4TXfcDqJI
	T2oMkSIASk3KH89QHIlkgkEzI61BtL9h24vRA=
Received: by 10.216.19.13 with SMTP id m13mr8907234wem.101.1287005956625; Wed,
	13 Oct 2010 14:39:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Wed, 13 Oct 2010 14:38:56 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 13 Oct 2010 14:38:56 -0700
X-Google-Sender-Auth: msNdTZnyCJhp18WXORHlHQGh6MM
Message-ID: <AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
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
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Wed, 13 Oct 2010 21:39:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 13, 2010 at 2:30 PM, Maupin, Chase <chase.maupin@ti.com> wrote:

> That was my thought as well but I can consistently cause this issue.  I
> have tested a quick change that seems to fix the issue by reversing the list
> before it is used in the for loop.  My change was:


From discussion on IRC, we think we should just reverse the definition of
OVERRIDES in OE, this avoids compatibility issues associated with changing
the implementation.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

