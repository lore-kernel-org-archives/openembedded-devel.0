Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id C8FDA601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:58:17 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so124582140igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=gsnkHIp5i1Pho9QkzMeAOuNAZR2SCy56pcSTIEOVfbA=;
	b=wytwhGBDFGw/QS2bNcvDBeNarCi8wplhsh8ty3rU3sYPEHmdVnBlwASgVDD8GHTFC4
	ib+Pk84h84qNAKvwjOhQtikfkUZO2zPlRorpjbQxhqvCbD4TTfg0RtWJUt8OXDU2JuAJ
	x1/aNP1ap/XcryRHnSfZxiewY2+dMmD4z4hg/B64fSvC3J4ePLj5XpWp/QkvMQ2axj/8
	GBVY02dzF3csDcWq/0wKB+M7i3wRYYyI89f8iFA41JgKLhLOomZX2wdjUWTVsdmizatC
	MKWOZBSxWt0PDUe0rDyqU83yrUGIFKaIAtBWnTeClwL0/Uq1NT1dKMslKuqd4w59OZU4
	+FmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=gsnkHIp5i1Pho9QkzMeAOuNAZR2SCy56pcSTIEOVfbA=;
	b=qu6kfQPD7f2q4oHrJl+klASRg/LQEI11mftOGau3sA3qrnHpREriVVJv52RQyYegWB
	rN0YQeS6CeEgykzdrP1t8hUsCmPy74fkJkYWY2drRCHylckqBbHVCpxXAIyj0HXplqpe
	yNTHgy/BVrI5OEvK+ormqeSkOx7BYl3nDdYQrob1hjvwNGIjmgNokz2BKSluGBjIDuVQ
	1GR0zF32M5RQqu9toRlL3oMlAInnbnzMgMqvHCyQ0ZjWhSVDQKjsikS5CsTzcKe2Wo5N
	CG3VVCcgxpJftOUM/LaqTsbWCjtG01sfta8/j/EEUqgzFhJBtfO66unPMDS+4udBNjKu
	HF9g==
X-Received: by 10.50.92.41 with SMTP id cj9mr11254414igb.38.1449683898232;
	Wed, 09 Dec 2015 09:58:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Wed, 9 Dec 2015 09:57:58 -0800 (PST)
In-Reply-To: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 9 Dec 2015 10:57:58 -0700
X-Google-Sender-Auth: NS2YUoAWqV1bW9-CNBMaEGgXEO8
Message-ID: <CABcZANk4m2MOyh+D_yqdVyzAtRPfaHxz5bs3f46MZS7gRaqWOA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2][RESEND 1/3] canutils: rdep on iproute2
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
X-List-Received-Date: Wed, 09 Dec 2015 17:58:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 10:41 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> busybox ip fails to configure can interfaces, so we need iproute2 to do so.
> See also http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver
> .
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Note: dropped the talloc/tdb/tevent attr change from this little series,
since Jens Rehsack is working on that.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

