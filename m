Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id F320F79DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:39:55 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2A1025C0187;
	Thu, 17 Jan 2019 19:39:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547750396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=sN5bQn7aqm0D+kWoVQTvwEbbYsfXpIHLs0DvFofDB/g=;
	b=VO9KXWVybX2dYQwe8JJDkXrmz6eQmPv9YCDzNDqgr8yg7qeZP+7y7S7AfhhM1i/9sazhHE
	pHnVWQJMP6yeIBEBSztKEpbnahlwWodFI007qvX3qCAWy4S/dX/AQQ7Ns2QtOKFiqUT0Ca
	HTUyPxlVDr1wSYDjPZwMPzQCmpTzdss=
MIME-Version: 1.0
Date: Thu, 17 Jan 2019 19:39:56 +0100
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
	<CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
Message-ID: <d198417638781fb108e77e953ae95550@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 18:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2019 18:53, Andreas Müller wrote:
> On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> systemd and polkit are not directly related. It is just fine to build
>> with systemd but without polkit.
> Surely it builds but is it still usable as unpriviledged user?

TBH, I don't know, did not run XFCE.

If it is unusable, we probably should not make it an option anyway? Just
enable it always and make polkit a fixed dependency?

--
Stefan

> 
> Andreas
>> Rename the systemd package config
>> to polkit and enable it depending on whether polkit is enabled in
>> DISTRO_FEATURES.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb     | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>> index ed117b0a6..1cdcb4160 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>> @@ -20,8 +20,8 @@ EXTRA_OECONF = " \
>>      --enable-panel-plugins \
>>  "
>>
>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>> -PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
>> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
>>
>>  PACKAGES += "xfce4-powermanager-plugin"
>>
>> --
>> 2.13.6
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

