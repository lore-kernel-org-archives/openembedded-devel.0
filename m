Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PpnGj-0004rH-R2
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 20:42:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id F0BA8314DC17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 20:41:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kXUBNuNVev21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 20:41:19 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id F2AC7314DC01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 20:41:18 +0100 (CET)
Message-ID: <4D5C285A.8020203@opendreambox.org>
Date: Wed, 16 Feb 2011 20:41:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
	<201102161030.43048.marcin@juszkiewicz.com.pl>
In-Reply-To: <201102161030.43048.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] wpa-supplicant-0.7.3: use MACHINE_ARCH
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
X-List-Received-Date: Wed, 16 Feb 2011 19:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/16/2011 10:30 AM, Marcin Juszkiewicz wrote:
> Dnia =C5=9Broda, 16 lutego 2011 o 04:03:24 Andreas Oberritter napisa=C5=
=82(a):
>> * Because of madwifi, wpa-supplicant depends on COMBINED_FEATURES.
>>   Thus, PACKAGE_ARCH must be set to MACHINE_ARCH.
>> * Use INC_PR and bump it.
>=20
> What about setting PACKAGE_ARCH=3DMACHINE_ARCH only for machines with m=
adwifi?=20
> Most of out targets does not support madwifi.

Does opkg always prefer machine packages over arch packages, if you have
shared deploy directories for multiple machines? Would other package
managers like dpkg be able to handle that correctly, too? Hm, I'm not
sure whether dpkg supports multi-machine builds at all.

Regards,
Andreas



