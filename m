Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OYU23-0001GW-1h
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 03:13:13 +0200
Received: by iwn34 with SMTP id 34so5365372iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 18:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K0rSOPlzdszcuCJmwRd6iOtR+rt+GQOWwo7pMToEYbo=;
	b=C0ODXLEB0fAQO5wGN8fVOq7iNP9Cm4YHXqqswoo6Bd8jsVqpV9aR36M/3EW4DlFMth
	7kgreGKojQ01E7I2KqnZBQqeVu3UXTTnX6gshXOj3/KAgWW7bRdmrGEgUlrOA7jLFVaZ
	d1c63GU8tV0g2Br8UVh2HUxKJZXaDmdQLgfoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZMiufs1si1GOpsPc70q9OhOv6krOzrhWbdknDwhqobolllZs6Ok+5QYxAcly3Pwzj9
	r96ky1eqX4Vys+/NjgZJtCNVJAx8mIQB5/cRtQajZZPPxBe04lR1us9THRG4v+7NWTeZ
	zVqabWZNSyh+t7iODwKYGFpLH8WGuIEGB8HKo=
MIME-Version: 1.0
Received: by 10.231.150.16 with SMTP id w16mr15158418ibv.42.1278983199513; 
	Mon, 12 Jul 2010 18:06:39 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Mon, 12 Jul 2010 18:06:39 -0700 (PDT)
In-Reply-To: <AANLkTimHCXbXrwAhwNVvnyzUprQiOqV2ONr3iGmJ09vV@mail.gmail.com>
References: <4C3ABB63.4040004@gmail.com>
	<AANLkTimHCXbXrwAhwNVvnyzUprQiOqV2ONr3iGmJ09vV@mail.gmail.com>
Date: Tue, 13 Jul 2010 10:36:39 +0930
Message-ID: <AANLkTilIOI9uv1krMRcXl9_6tQoWQ9VFy6BT0-E6-Kso@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] perl_5.8.8.bb: Don't use hostperl's $Config{cppflags} with cross compiler.
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
X-List-Received-Date: Tue, 13 Jul 2010 01:13:29 -0000
X-List-Received-Date: Tue, 13 Jul 2010 01:13:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 13 July 2010 03:42, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Jul 11, 2010 at 11:51 PM, Graham Gower <graham.gower@gmail.com> wrote:
>> Fixes /usr/local/include Badness.
>>
>> make[2]: Entering directory `/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-5.8.8-r34/perl-5.8.8/ext/Errno'
>> hostperl -I/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-5.8.8-r34/perl-5.8.8/Cross/../fake_config_library -MConfig Errno_pm.PL Errno.pm
>> CROSS COMPILE Badness: /usr/local/include in INCLUDEPATH: /usr/local/include
>> No error definitions found at Errno_pm.PL line 216.
>
> while this patch looks ok. Can you check if this is needed on 5.10.1 as well.

No. The hostperl cppflags appear to be unset with perl-native 5.10.1.

-Graham


