Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 019CA6FF77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:43:17 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so129088961igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=JpASJuut/dzVTcoqz6pPqfGePpeUsVboX8YjUQKiODE=;
	b=pQl2IM+hwqpwJP1rbmoaFJkS6ctvjOubYIRvwr4PoT+1cod8Y1y9qkG4/SqaI0EBRh
	Me9xAWjLg3IY/nSRips0d2dUGaLu7aILQmGOhsTyBl59YRot9GswwSw6yaIyJuD4PZpT
	FGgTKoytX36Wp4d166qR6Zh2boVLAW/uro47sapCYNIsZ8ncjBluGXNv2eiflZMGhu9K
	qJPdAaaJu2G3XHlDueNJmM3op1++o7TGKYnoQoqBg1SzhXvYszloH34P2zh6E+s7rUU0
	Apen40vmHcY5bUR/4fT1m4rDTurEUFALmsnHsgW7TPyrKLJG3Lrd8wvGJEtjMpTi7Y8E
	HYqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=JpASJuut/dzVTcoqz6pPqfGePpeUsVboX8YjUQKiODE=;
	b=GhEDCU+tYOc4zrhpBsoeHVwwNru6bOJpBLRu1ODV3QEB3Zy7t5x3Y566SSfq2XVTBE
	BSS42o5B57n7CAdnjEo3SZpxxCj2LPP/jJgmF9KcaPyui/9paBgFB+rZIDQqMs/sLlJ7
	7CsEgyehI7yTpx5mrbkfteGXKpUsrSITHUTbnvs+ODXRmchznsSU3TTGVply965m2OdH
	CLwRuPRh6NGskMNlLgUXGnuWm4i4w4eS+XpawPwRshSygMlNaBiOplpNv+SmSnofTFuJ
	cIpdWWkAcnEYR1IUB4vwL8A1pAlmiIfPh5vQWh2hN+qtiOjCruGz59DkY9HX+dRNt9hx
	Bo9A==
X-Received: by 10.50.150.71 with SMTP id ug7mr10582912igb.68.1449682998128;
	Wed, 09 Dec 2015 09:43:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Wed, 9 Dec 2015 09:42:58 -0800 (PST)
In-Reply-To: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 9 Dec 2015 10:42:58 -0700
X-Google-Sender-Auth: ELs5vxrsStY4udXXDWgIp2H2v6s
Message-ID: <CABcZAN=F3T7NMZLnkgAHnEPSaBM+h+Wt6f_FwDk6_fDtgPDy1w@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Dec 2015 17:43:18 -0000
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

