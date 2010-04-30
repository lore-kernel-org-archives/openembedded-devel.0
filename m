Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O7vp0-0001ws-9G
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:24:23 +0200
Received: by gya1 with SMTP id 1so234798gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=spAsxMleAD14/uew0pj+C/4j/Dt9+Qg6tH/1N6OMg0M=;
	b=th5ffBrEbkri90Byv5g3q42ajh8jrXT0cK5FlHGjrZTcPjP714Un79HxeE8e+m9OLo
	gRcHdHx7UGRofPrEAggY1MnQPVySgw3Qrpz3VasRTJvS9uFNrUy+kvywSsoHE1kXu0Zc
	v740SwlMOjlc+yIF9UpxEkmMTs1cVdaRYxn0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=v+LQmo/zFr6RS9dVIQOOMW9IiWlxsxXQ1wQ7MSIEn5Z0XCQvkqwlUttqqjckMjdltx
	XkqwXxMm53xW7WjIAti5RzaGrPauldQX2uxyrBlmzWGFja0wSVuW2bGpXRuk8o/uocEc
	mXRj6LMl5fxegCK0CzWN4Yn8QbtAfJdN2US+I=
MIME-Version: 1.0
Received: by 10.231.160.209 with SMTP id o17mr3466206ibx.20.1272655238126; 
	Fri, 30 Apr 2010 12:20:38 -0700 (PDT)
Received: by 10.231.16.198 with HTTP; Fri, 30 Apr 2010 12:20:37 -0700 (PDT)
In-Reply-To: <20100430174108.GA5713@denix.org>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400> <hrcim7$8ge$1@dough.gmane.org>
	<20100430174108.GA5713@denix.org>
Date: Fri, 30 Apr 2010 12:20:37 -0700
Message-ID: <h2h19c1b8a91004301220m5bf0571bp73182ad46530f812@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible 	fall-out
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
X-List-Received-Date: Fri, 30 Apr 2010 19:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2010 at 10:41 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Thu, Apr 29, 2010 at 08:20:55PM +0200, Koen Kooi wrote:
>> On 29-04-10 16:49, Tom Rini wrote:
>> > On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
>> >> -----BEGIN PGP SIGNED MESSAGE-----
>> >> Hash: SHA1
>> >>
>> >> Hi,
>> >>
>> >> I've been talking to RP and we both like to merge his branch as soon =
as
>> >> the last problem (the cross lamanger) has been addressed. RP estimate=
s
>> >> that will happen early next week.
>> >> But after it has been merged there might be some fallout, which we wo=
uld
>> >> like to have some help with. If you don't want to help out and and do=
n't
>> >> want the possible breakage: don't git pull for the time being.
>> >
>> > Related, do we have people signing up for building ___ targets? =A0I'l=
l
>> > assume angstrom + beagleboard + beagleboard-demo will be covered :)
>>
>> I'm going to do angstrom + beagle/hawkboard +
>> console/beagleboard-demo/angstrom-gnome-image
>
> I'm currently quite busy, but hopefully in a week or two will be able to =
do
> DaVinci and some OMAP3/L1 EVMs...

I will do minimal-uclibc and all qemu machines.

-Khem


