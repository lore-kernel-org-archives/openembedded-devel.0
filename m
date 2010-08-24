Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Onuxs-0000Xe-UY
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 16:59:13 +0200
Received: by eyb7 with SMTP id 7so3283353eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=lQQ4zRgVRyvj7ibPaumzUU3pf01ShXv/13Y6Py2dVUc=;
	b=hfc0xkHEv0vKaUjwN/ERWDShEXz47RYFqt+2+Tho0cPm+MlPo+reZXm4RY5ycXFF9e
	oFJOw36HPin1LP1knSi0iCTtddefdYuEXTFK8MHjrOxVDDPU8mzFR1/21ZkL/iKCu8ut
	EwtmkrVdXFPMTpJeZSy+0/FSGLq0B7nPYs72M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=D623GiiE/UkFK5Y3KzBmqdCar2i8MAbpilR7myWsRonj033zhQ0YD4+UwiPcdB03Pm
	c6z+vM9To0GBxd+OtNp1AV9dtrgqyTeLwH40+ex7QOzRjraQ5l8n8nAYnjDNSzCrRbbi
	BKAaszA8FlB1rUzbDLTEsPWnAVp5Sqi626S84=
Received: by 10.216.45.6 with SMTP id o6mr885235web.74.1282661905645; Tue, 24
	Aug 2010 07:58:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 24 Aug 2010 07:58:05 -0700 (PDT)
In-Reply-To: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Aug 2010 07:58:05 -0700
X-Google-Sender-Auth: _Q-LDYJUTnQeBtAQYUCL_4fIxiQ
Message-ID: <AANLkTikMx==1HnsZ12pGdWi4hdyzKmg4NJNO23EdACJS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Tue, 24 Aug 2010 14:59:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 23, 2010 at 4:49 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

> Hello,
>
> As detailed in the following page, we are trying to get a testing
> branch going where we try to verify OE builds for a number of
> combinations of distro/machine/target/
>
> http://wiki.openembedded.net/index.php/Testing
>
> I have branched dev.oe.org to the testing-testing branch, and have
> verified it builds the following.
>
> beagleboard     angstrom-2008.1         beagleboard-linuxtag2010-demo-image
>        Ubuntu 10.04 64-bit     User:Cbrake
> beagleboard     angstrom-2008.1         console-image   Ubuntu 10.04 64-bit
>     User:Cbrake
>
> Next Monday, we will merge testing-testing to the testing branch, and
> tag it with the testing_2010-08-23 tag, and note the combinations that
> build in the above wiki page.
>
> We are looking for people who are willing to test clean builds of
> other combinations on a regular basis, or other ideas on how to make
> this "testing" concept work.  My initial thought is to work on a
> weekly cycle, but of course not every combination will be tested every
> week.
>
> If this gains enough traction, perhaps we will want to make the
> testing branch the default OE meta-data branch so that new users by
> default get something that will probably build.  I think its also very
> useful to give users a known starting point.  With the myriad of
> combinations available, its useful to know what is a good baseline.


I like the concept.  It seems not unlike the 'master' vs 'next' or linux vs
linux-test, or indeed, as you imply, unstable vs testing in debian.  I do
want to point out that you could, if you chose to, include the tested
baselines in the message attached to the tag (if annotated).  The only
downside to that being you couldn't add to it after the fact the way you
could with a wiki.  At a minimum, I'd link to the wiki page for that tag
from a tag message.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

