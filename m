Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppm2L-0005mk-CF
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 19:23:37 +0100
Received: by fxm17 with SMTP id 17so1609416fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=25nJRXRttqHZL4XShntdPOY+VVtKIHqiu3Ox4H6x2vc=;
	b=ArHUiJghsN1uIp1/DqlNkEpdAVdVDhAs8xSSQL/lbz9zLQdtcITCWRw9d5rPulqVMi
	hh++8BPAjchEUTVqqs8hkZFMms/rpQV/ttlMz99uXMZi6IZzY7E1O1BsTtUDEomevhmW
	99VARaBI/0Ktv47RoC90p0uv+kAN2iSepi6g4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=p8XHR2DnHqaVSUNsYTaN8+wdVrvGWgP++uD+RU94WfYy5c51MWGHOX4IXf828mYgQZ
	KjCho28lRdRqt04p/NR7TCSb92URewZsfvIKiIcqL1FWLAU+N4Kmx/Z1XA7ElkUdPo4U
	ZSMqGGkGon1R3pQb+Qn7K1S0yLzZRbHelTQeE=
Received: by 10.223.83.7 with SMTP id d7mr1128926fal.82.1297880545152; Wed, 16
	Feb 2011 10:22:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Wed, 16 Feb 2011 10:22:05 -0800 (PST)
In-Reply-To: <4D5BBB94.3010904@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-8-git-send-email-eric@eukrea.com>
	<AANLkTikiF9jz+OcGkDFwh1aNHK=HzhO0=bYMBhka9vxF@mail.gmail.com>
	<4D5BBB94.3010904@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2011 10:22:05 -0800
Message-ID: <AANLkTimd4xwULnfYkfJrGb+o=-jtR4r34o-e7Wjr4PKW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH 08/10] angstrom-2010: prefer busybox-1.18.3
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
X-List-Received-Date: Wed, 16 Feb 2011 18:23:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 3:57 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> On 16/02/2011 12:49, Koen Kooi wrote:
>>
>> Acked-by: Koen Kooi <koen@openembedded.org <mailto:koen@openembedded.org=
>>
>>
>> I must admit the busybox churn is getting a bit much, how many days till
>> .4?
>>
> for 1.18 :
> 22/11/2010 : 1.18.0 (unstable)
> 21/12/2010 : 1.18.1
> 16/01/2011 : 1.18.2
> 08/02/2011 : 1.18.3
>
> for 1.17 :
> 06/07/2010 : 1.17.0 (unstable)
> 25/07/2010 : 1.17.1
> 25/08/2010 : 1.17.2
> 09/10/2010 : 1.17.3
> 22/11/2010 : 1.17.4
>
> so we can expect at least a 1.18.4 (as there are fixes for 1.18.3)

I think the nature of releases could affect how we take the recipes
in. In this case if it seems busybox has major release like 1.18
and then spins out bugfix releases on top of it. So we might consider
having one recipe for 1.18 and then patch it on top as needed
and similarly moving forward for 1.19

>
> For 1.19, I think I'll wait .2 or .3 before annoying distro maintainers :=
-)
>

unless they have feature introduction in minor releases this will be a
good solution IMO

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


