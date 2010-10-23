Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9ff3-0004Wu-TN
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 17:05:34 +0200
Received: by iwn5 with SMTP id 5so871784iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1JOCHdqyEgl92ZeOWPjtol8mS+JDnr34asdrEZWjzCM=;
	b=RUwXMQlzXbJ8Zw5xpGrPmmsQr0eYbXFChbrXyLuz7CUBPF2wyGNCly8eOPORhxe6GB
	Ejyb6KcdMxLjH7wvYIjU7B1dOfG8S81fwsM3QElQre4wW00iXxZac8H0ZNcRnGIuW8L7
	RT7pAEjzOsIQpYIENj0+ArCqyqdeetlVvyjac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ujsRwzv4duZVD0kK3de4OeyPPmA+sUb9TKzg7fjLuwyn46NnhFL2vKdk4+UVo3FLms
	K/+AoVEdvoTUj1DalPsdWstAPnHPCJVAD2IZCbQ1R1iBXA+9OXJo20VZKmrLUCCZFhwu
	Wia9arlJSjKVgLZ8pV5e8LPVSTksjZiT52Sdk=
MIME-Version: 1.0
Received: by 10.42.209.70 with SMTP id gf6mr2891878icb.520.1287846290966; Sat,
	23 Oct 2010 08:04:50 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 23 Oct 2010 08:04:50 -0700 (PDT)
In-Reply-To: <AANLkTikpZZ-k7sOiFP1yZhR8N8hqp5TKUxVhLddgLh1W@mail.gmail.com>
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
	<AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
	<AANLkTikpZZ-k7sOiFP1yZhR8N8hqp5TKUxVhLddgLh1W@mail.gmail.com>
Date: Sat, 23 Oct 2010 17:04:50 +0200
Message-ID: <AANLkTin9Mpd9CYy6H49iugO03_Lc=ARTKayAv2tHb5WC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: empty strings
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
X-List-Received-Date: Sat, 23 Oct 2010 15:05:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/22 Chris Larson <clarson@kergoth.com>:
> On Fri, Oct 22, 2010 at 2:00 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> ping.
>>
>> people don't care?
>> I feel there are some issues in the examples below (and some easy
>> cleanup actions).
>>
>
> Feel free to use my ack for the series, the ones you've sent patches for
> seem pretty obviously correct to me. =A0The other empty strings may need =
more
> review.

pushed the patches posted before.
also fixed (as a starter) the EXTRA_OECONF =3D "" things
(ran bitbake -e before and after and compared the differences)
Might peek into some other things later

There are still some EXTRA_OECONF_virtclass-native =3D "" in glib-2.0;
we can eliminate this once we have the -target suffix
(and rename EXTRA_OECONF to EXTRA_OECONF-target).
tthen again: glib-2.0 with 10 recipes (and a native one) could perhaps
use some pruning)

Frans


