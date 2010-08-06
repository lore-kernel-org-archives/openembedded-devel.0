Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OhNNk-00020Z-6p
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 15:54:45 +0200
Received: by fxm12 with SMTP id 12so4040887fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gds5coZ5OTV+wSNNrYDxOInluQTtpPf4yqoPikAwMrI=;
	b=FXrEQ4GC1Opr8LDLDkIQS4EEGlR11KtD9uYZFtzcnLW6dNPQWEgg+M20QLMYcBsB/n
	iQFgOwp+BYDDQcTKwDV1+MlCwmp/5kMEBppNDNCtMSg6Jz0SpT4uFkfSXTVIL5QczSCG
	0NmA1bsOq7VQiqbYGMLBaYEddUea67MV0jOFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pfeeSRT/InOaAkOqIyDBk6pmZf2vXdiwyy99v+FcN8y7giMFEzQlmt5YBVX0Ghr4uq
	aVTKsF7eoKK8FlBD14w76Jhs9ugDR+6bk3EZ6Jt3agnrjSMHHaKNNSwsPgW4mdzEQaKf
	ZwpHWRKqgxGgYS8X/99J/5VB3bLldTnw+BRVc=
MIME-Version: 1.0
Received: by 10.223.125.196 with SMTP id z4mr12861878far.80.1281102874806; 
	Fri, 06 Aug 2010 06:54:34 -0700 (PDT)
Received: by 10.223.164.79 with HTTP; Fri, 6 Aug 2010 06:54:34 -0700 (PDT)
In-Reply-To: <AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
References: <4C5A612E.9040702@gmail.com>
	<AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
Date: Fri, 6 Aug 2010 15:54:34 +0200
Message-ID: <AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Fri, 06 Aug 2010 13:54:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 5, 2010 at 4:15 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Aug 4, 2010 at 11:58 PM, Graham Gower <graham.gower@gmail.com>wrote:
>
>> rootfs_ipk.bbclass already pulls these in, so avoid some confusion.
>>
>> This is totally untested.
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>
>
> Looks reasonable to me.
>
> Acked-by: Chris Larson <clarson@kergoth.com>

I've already pushed it, but too late I noticed that only rootfs_ipk is
handling DISTRO_PACKAGE_MANAGER and rpm/deb based rootfs will probably
loose DISTRO_PACKAGE_MANAGER from image.

Should I revert now or can we fix it soon?


