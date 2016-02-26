Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id EBA1F731DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 07:41:15 +0000 (UTC)
Received: from [172.16.1.4] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2E8052BB16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:41:14 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1455099698-25946-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1455112483-31048-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B01CE5BEF23@COSNADEXC13.usr.ingenico.loc>
	<CALbNGRQ=HqpiD5mDX4c5ArOixqLPaaeoGmeAD3Bax-E=GELMUg@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56D0019A.20302@pseudoterminal.org>
Date: Fri, 26 Feb 2016 08:41:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ=HqpiD5mDX4c5ArOixqLPaaeoGmeAD3Bax-E=GELMUg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] libopus: upgrade to version 1.1.2
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
X-List-Received-Date: Fri, 26 Feb 2016 07:41:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

This is because the ne10 build currently has a .text relocation problem. 
I am looking into it.

On 2016-02-25 23:11, Andreas Müller wrote:
> On Wed, Feb 10, 2016 at 3:31 PM, Matthieu CRAPET
> <Matthieu.CRAPET@ingenico.com> wrote:
>> Hi,
>>
>> I totally missed Carlos Rafael Giani's patch (2016.02.08). Please discard this thread.
>>
>> Regards,
>> Matthieu
>> This email and its content belong to Ingenico Group. The enclosed information is confidential and may not be disclosed to any unauthorized person. If you have received it by mistake do not forward it and delete it from your system. Cet email et son contenu sont la propriété du Groupe Ingenico. L’information qu’il contient est confidentielle et ne peut être communiquée à des personnes non autorisées. Si vous l’avez reçu par erreur ne le transférez pas et supprimez-le.
>> --
> We are failing here currently as ne10 was not applied - so I get something like
>
> | Missing or unbuildable dependency chain was: ['xfce4-games-image',
> 'packagegroup-image-full', 'mpd', 'libopus', 'ne10']
>
> Andreas


