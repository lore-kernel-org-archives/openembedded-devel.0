Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcbGt-00021X-If
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:44:01 +0200
Received: by iwn34 with SMTP id 34so1084722iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YdsCNmMY5NhzeAh7pApfZPuUekjydfL2UWZlVMsu6Hc=;
	b=jT+VXUEqemXWU1njgJ2pjVAY9X+yo9Nq/DJX2kDVgAhojzy7ljG8Gsc1bR7KbMSbYe
	jVoJ4ku1hV9Ap/5maASJh0SbHzzUVCC0TPdT1Amr2XlNN2drE9f2KdzK3DZ9JYQRrQkk
	fpojkyhR05xCLq7FIGuoClPRptUUSLXy28GBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=X65bnXJUkM2pP3L03G1DDhzJahO5NxF2MIQFwT+jlVKpxSv+8Ly47F5B94+5dWHNj8
	AqXVi/DNsne1Z5CJiCJ/OSibyiYgkScqS5S+38lhexYr8ipnNaHJxzcBhqZw8S/gC8Go
	PLyvABJAxRKEBTTNtm6xhvrnnCq9rgTMH29NE=
Received: by 10.231.33.73 with SMTP id g9mr5358086ibd.62.1279964616154; Sat, 
	24 Jul 2010 02:43:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Sat, 24 Jul 2010 02:43:16 -0700 (PDT)
In-Reply-To: <20100715073247.GB5745@jama>
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com> 
	<20100715073247.GB5745@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jul 2010 02:43:16 -0700
Message-ID: <AANLkTi=0stDrv15yUrN6mryycSNJmwk_r92atg2deSsj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Sat, 24 Jul 2010 09:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2010 at 12:32 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Jun 30, 2010 at 02:24:00PM +0930, Graham Gower wrote:
>> None of the distros in OE appear to want/need gpg or curl support in opk=
g;
>> so have opkg.inc remove them by default. This diff makes things more con=
sistent
>> across all distros/tasks/images.
>>
>> The slugos recipe is kept intact and further divided from the more moder=
n
>> recipes. The opkg-native recipe is the sane-srcrev version even when bui=
lding
>> slugos, which should allow for changes to opkg related bbclasses without
>> breaking the slugos build.
>>
>> Build tested for qemumipsel/minimal-image and nslu2/slugos-image.
>> minimal-image builds 10% quicker in my setup and is 1mb smaller.
>
> Tested on SHR/om-gta02
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


if there is no objection to this then I will like to push this patch
with my next
set of patches. Please let me know if you have concerns.

Thanks
-Khem


>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


