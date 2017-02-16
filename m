Return-Path: <daniel@zonque.org>
Received: from mail.zonque.de (svenfoo.org [82.94.215.22])
	by mail.openembedded.org (Postfix) with ESMTP id A318E77240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.zonque.de (Postfix) with ESMTP id 05385C00D2;
	Thu, 16 Feb 2017 17:02:49 +0100 (CET)
Received: from mail.zonque.de ([127.0.0.1])
	by localhost (rambrand.bugwerft.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id y3SlbyWswZVa; Thu, 16 Feb 2017 17:02:48 +0100 (CET)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.zonque.de (Postfix) with ESMTPSA id 94CF9C0093;
	Thu, 16 Feb 2017 17:02:48 +0100 (CET)
Reply-To: openembedded-devel@lists.openembedded.org
References: <23527d9e-d36f-e9ef-1742-0510074920fc@zonque.org>
To: openembedded-devel@lists.openembedded.org
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7007b6f2-ef90-886b-699c-a69c47f0668a@zonque.org>
Date: Thu, 16 Feb 2017 17:02:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <23527d9e-d36f-e9ef-1742-0510074920fc@zonque.org>
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
X-List-Received-Date: Thu, 16 Feb 2017 16:02:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 02/16/2017 08:25 AM, Daniel Mack wrote:
> I'm using poky from the morty branch and meta-qt5 layer from master-next
> for Qt5.8 support. While the image creation works fine, 'bitbake myimage
> -c populate_sdk' fails with
> 
> error: qtbase-mkspecs-5.8.0+git0+49dc9aa409-r0 conflicts with /usr/bin/perl
> 
> This is also the case after build/tmp was wiped out.

Ah, perfect timing - the patch Frieder just posted seem to fix this issue :)


Thanks a lot,
Daniel


