Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4y1p-0005Dg-1K
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 17:41:37 +0200
Received: by wyf23 with SMTP id 23so2128071wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=LIJTePpALjxW1DdQ/mcb200oUQG9a6OMyyGbKZ3IOHw=;
	b=lpvknYcfuEHfZ+/UT6hZpOVXC0r9FGoNP43FAs1HTTFE4naieVV8GGYisKQSKqUgto
	DSUrWajaX9Km+8RJk+Ni8LEgwTX76PRAHhYcvuHSgEC32+h6C+EQ1oLmNbwqgRpyc1K6
	e0k1CW9yhG71FwVco50fV+oZ5Rxk4S6S2OzgQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=U6uUmX5aFroZSFyAzCA9dFPxFaSIo8Zl0NeSIWjvFPtYeTOEIgf+OcVOWQ7mgy9YAx
	71pIV1X9PUl3bEpprmFQHcwj77+C5I5+S/lay37IvUdcVpqrSn6n8clFjerRIjeXsKFL
	dDYTZ8J+MRbeICvswngfoFpdI052t9EalcSn8=
Received: by 10.216.11.205 with SMTP id 55mr4547110wex.51.1286725270237; Sun,
	10 Oct 2010 08:41:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sun, 10 Oct 2010 08:40:49 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 10 Oct 2010 08:40:49 -0700
X-Google-Sender-Auth: JLoWptZ_Iajeaxqd9mp0KI3E_B0
Message-ID: <AANLkTinXMTt3EOwSTnFaeXH7tSKBAjRTiH1DddrBSUVG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: NOTE: <type 'exceptions.AttributeError'>:type object 'itertools.chain' has no attribute 'from_iterable' while evaluating:, ${@' '.join(oe.packagegroup.required_packages('image_base '.split(), d))} ${@base_conditional("ONLINE_PACKAGE_MANAGEME
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
X-List-Received-Date: Sun, 10 Oct 2010 15:41:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 10, 2010 at 6:04 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> Since this weekend I can't build anything due to parsing errors:
>
>
> NOTE: <type 'exceptions.AttributeError'>:type object 'itertools.chain'
> has no attribute 'from_iterable' while evaluating:
> ${@' '.join(oe.packagegroup.required_packages('image_base '.split(),
> d))} ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "opkg
> angstrom-version angstrom-feed-configs opkg-collateral", d)}
>

Oops, my mistake -- forgot that from_iterable is only available in some
python versions.  Should be fixed now.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

