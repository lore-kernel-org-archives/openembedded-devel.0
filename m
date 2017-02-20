Return-Path: <daniel@zonque.org>
Received: from mail.zonque.de (svenfoo.org [82.94.215.22])
	by mail.openembedded.org (Postfix) with ESMTP id 015F371C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.zonque.de (Postfix) with ESMTP id 114E4C00BC;
	Mon, 20 Feb 2017 12:45:35 +0100 (CET)
Received: from mail.zonque.de ([127.0.0.1])
	by localhost (rambrand.bugwerft.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ng9kN4srLDUv; Mon, 20 Feb 2017 12:45:34 +0100 (CET)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.zonque.de (Postfix) with ESMTPSA id A3C65C0019;
	Mon, 20 Feb 2017 12:45:34 +0100 (CET)
Reply-To: openembedded-devel@lists.openembedded.org
References: <23527d9e-d36f-e9ef-1742-0510074920fc@zonque.org>
	<7007b6f2-ef90-886b-699c-a69c47f0668a@zonque.org>
To: openembedded-devel@lists.openembedded.org
From: Daniel Mack <daniel@zonque.org>
Message-ID: <13fc3dcc-fc11-e154-c241-7c2a0f602f50@zonque.org>
Date: Mon, 20 Feb 2017 12:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <7007b6f2-ef90-886b-699c-a69c47f0668a@zonque.org>
Cc: frieder.schrempf@exceet.de
Subject: Re: qt5: qtbase fails to populate SDK
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
X-List-Received-Date: Mon, 20 Feb 2017 11:45:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 02/16/2017 05:02 PM, Daniel Mack wrote:
> On 02/16/2017 08:25 AM, Daniel Mack wrote:
>> I'm using poky from the morty branch and meta-qt5 layer from master-next
>> for Qt5.8 support. While the image creation works fine, 'bitbake myimage
>> -c populate_sdk' fails with
>>
>> error: qtbase-mkspecs-5.8.0+git0+49dc9aa409-r0 conflicts with /usr/bin/perl
>>
>> This is also the case after build/tmp was wiped out.
> 
> Ah, perfect timing - the patch Frieder just posted seem to fix this issue :)

Hmm, no, I spoke too soon. In my tests, I disabled qtwebkit in
'myimage', but after I switched it back on, the issue reappeared.

I have a patch that fixes the /usr/bin/perl in
qt5/mkspecs/features/uikit/devices.pl, but with that applied, I'm
getting errors like this for hundreds of packages:

  error: package acl-2.2.52-r0.aarch64 is already installed

With only qtbase, but not qtwebkit, this doesn't happen. Any hint where
to start digging?


Thanks,
Daniel

