Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8vmA-0003WD-3J
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 16:05:50 +0200
Received: by wyb40 with SMTP id 40so5139114wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=blrc9fwFzEzCBzDY6Y3WqtIe2BiwtOXvjSkhJhP/l1Q=;
	b=qevajwzTQuGEbfsQURr+m36qDMPtmVZjlbkVjzWOykUHI4mjMNbttdnLOLA0bRJCQ0
	IQ8/qEge8lNyVcl1sLj9HeE4EKC05YovP87ZqOBYc46+QbwrrlcDNsZ6O85e7bsiy5Ku
	VfdUQTtKH1f73Xe1OthUaegF3QTggOis2wJX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=NUmAmp3sw2VUq5Wj+lSjRFE3WyiJP1FcfJu9h0K36b6i7vLnst2pCvKO0e32QbXKTl
	cpDY79hgybs1ldByJN44UXFmKT+hyOaZDW7FyNOpHxYoTicnnDn5XKaQ3svXtSwmOuok
	mdOMJLHYYL/TQy/CSgQDE4GyXcvVPOOwLmW1o=
Received: by 10.216.51.21 with SMTP id a21mr1033988wec.50.1287669911855; Thu,
	21 Oct 2010 07:05:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 21 Oct 2010 07:04:50 -0700 (PDT)
In-Reply-To: <20101021062755.GB13082@jama>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
	<20101019192458.GB6202@denix.org> <20101020232906.GY11514@denix.org>
	<20101021062755.GB13082@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Oct 2010 07:04:50 -0700
X-Google-Sender-Auth: PR9ggDkiCCzUC_POixvwEuEu89A
Message-ID: <AANLkTikiiJn9ECC_eHYgoVt+cpKww8yGKTzy1C9LJx21@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 21 Oct 2010 14:05:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 20, 2010 at 11:27 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> I've marked it as "Superseded" when Chris pushed that filtering and I've
> checked
> that it fixes my case.
>
> Maybe we can resolve it by using limited OVERRIDES in FILESPATH as
> suggested in "[RFC] do we really need all OVERRIDES in FILESPATH?".
> Instead of creating more complicated constructs to be able to push more
> stuff to FILESPATH (without '::') and then never use it.
>

MACHINE_OVERRIDES aren't specific to FILESPATH, as far as I know.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

