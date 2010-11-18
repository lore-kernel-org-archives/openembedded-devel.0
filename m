Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJ7R1-0000dz-1F
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 17:34:07 +0100
Received: by gyf3 with SMTP id 3so2026124gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3ipogkWYh/HHoqZzr8TbmqtL5wjLWv0Xp+AzXasGrDI=;
	b=lXhIsuTctrOQano1esymAsP7CxaEBEutM5NwlufT0ltwhA9X15Z/dYhBoWe7QsObLO
	Qq+ydi1O/bJC+v2PwqpTNuGeCTNon/TWKMnsy/YisZVV/72xqYoFQ6LYRo+61TVcaCwr
	eRA6pthWntjegKPy1/NWg9jxIp8AFPfNPM1z0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=eGww9Wa9ZJB5QJs3l1bRvpO+bXuMsBcU2oD9lgnkNm+3xqc3gvgQXbZRdtkNbSOsrP
	MguGlPB1Mbe22aRYwbdhqzwMlTcl5ej4AN/kBp3P1RLUCzuxsk0ly8/PGr43wSoQ+NdU
	VkQNWGKLciwzRw4xCIyHAN9UtQZyrk86XxODE=
Received: by 10.91.121.3 with SMTP id y3mr1285835agm.156.1290097970761; Thu,
	18 Nov 2010 08:32:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 08:32:29 -0800 (PST)
In-Reply-To: <1290074903.3183.202.camel@mill.internal.reciva.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 08:32:29 -0800
Message-ID: <AANLkTin_3FePb2Nv+JkAH8N=RxLnSOVKf7MPj0VJzXzk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 16:34:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2010 at 2:08 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-11-17 at 11:26 -0800, Khem Raj wrote:
>> Should we create a release branch before we release and solidify that ?
>
> Yes, please do that. =C2=A0We discussed this issue at yesterday's TSC mee=
ting
> (full minutes to follow shortly) and the consensus was that trying to
> enforce a complete freeze on master at short notice is not going to be
> practical.
>
> Obviously the exact process you use is up to you, but I would suggest
> something along the lines of:
>
> 1. make a stabilisation branch from some semi-arbitrary point, maybe one
> of the existing weekly test versions.
>
> 2. do testing on this branch.
>
> 3. cherry-pick and/or revert changesets on the branch as
> necessary/desired.
>
> 4. iterate steps 2/3 until you are happy with the quality or the
> deadline is reached.
>
> 5. tag the release from the current head of that branch.
>

Yes, thats a sensible approach. Starting from testing tag is a sane
thing to start with.

Thanks
-Khem

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


