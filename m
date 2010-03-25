Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1NukAg-00034f-H7
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 11:20:19 +0100
Received: by gwaa20 with SMTP id a20so1438259gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cmIloR2plzYdx/qMXG1H0x48jXF49iVseouo5sKfpe0=;
	b=KwS2Vc4BGOE1YrZJAPT8oISmhtbMH3O/fkaK6/yPdEdY3qM9pX0bKeUCA7ngJHZcLO
	w5GK+R1WQqfUIfJzIkvD5oV5rpXZcP1G9/KJTle6uYEzdCRhvYeM0S7e+itXKA7fRjF5
	ygsZ56BizeR/d19WJ5gUNX5wAhj4SDUri0Vkw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=br98Aln/0xu/+oV/PDpRSNn7Gps4XLL8Q/K2PISfj1H5wY9F+KGZ4BJwegbP9eAN1M
	cETjpZsKANuKESPST/C354mQcnbQxO7DLuhgqgqZPy44igf/HKp4rw2epzO5b+4qDdm4
	WgHoI/93QW+d+q2VSHnXVDdj2Cyr1Gn0vBxso=
MIME-Version: 1.0
Received: by 10.91.20.13 with SMTP id x13mr4040569agi.52.1269512223657; Thu, 
	25 Mar 2010 03:17:03 -0700 (PDT)
In-Reply-To: <f275a9df1003231858m12e94060sb9f8b15d9dd218d@mail.gmail.com>
References: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
	<f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
	<20100323205054.GB12446@gmail.com>
	<f275a9df1003231753y25619594i8310eb1883688fc9@mail.gmail.com>
	<f275a9df1003231858m12e94060sb9f8b15d9dd218d@mail.gmail.com>
Date: Thu, 25 Mar 2010 18:17:03 +0800
Message-ID: <f275a9df1003250317s63b00ba6m7da53862f3f2a99e@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Thu, 25 Mar 2010 10:20:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OK,

here the answer is:
some-pkg-mine.bb should include not only PROVIDES line, but also RPROVIDES =
line.

Thanks for the help, though. :-)

Thank You!
jiason
20100324


2010/3/24 Jiason Li:
> Hi,
>
> resulted two things:
>
> 1. bitbake -c package_update_index opie-image
> ERROR: Task do_package_update_index does not exist for target opie-image
>
> 2. I just found that:
> although "bitbake some-pkg" will produce some-pkg-mine.ipk correctly,
> some-pkg was still in some-image instead of some-pkg-mine after
> "bitbake some-image". :-(
>
> strangest thing is, if "some-pkg" was "virtual/kernel", then things
> all worked correctly...
>
> =A0Any info are very appreciated. :-/
>
> Thank You!
> jiason
> 20100324
>


