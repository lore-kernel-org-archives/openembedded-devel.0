Return-Path: <mbc@koumoul.net>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCE760232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:04:53 +0000 (UTC)
Received: by iofh134 with SMTP id h134so49768451iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=ZRCcevG2OP2AcVFCbdB43tvlxMPmLSCT1x2vEGInU74=;
	b=RidYc3sqTP+4QgyYKj3KRx/B1XuYiJkuF/Hc2p9qEwfNc9gkK/fmg330fvYl40eHem
	T0AbsT4pZMvPJvc7pt0giO9gmNoJ4MJqwdp1VeyyWmVpv8r42WiT0Yve+MOJfwWtGStS
	MLgzYcmOYtDZxaqwHW69dUHmK33Kw89C9FhHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZRCcevG2OP2AcVFCbdB43tvlxMPmLSCT1x2vEGInU74=;
	b=j9+aYTh3+j4o/HbTemI6d8jTXjymdqM1tXRli5MSp7qLTRmdBFXnDvnKjkbesFCIHP
	//6Pr1MbHl5qVJhzJqj5JD0CEgY5shWH0Du/4xQmcJ6pP9uJSqmjQ2gyzkqgBjI6my0z
	Kd8sOYlp422TU319CjcsI5DunIVyEC99vezFUnpTP6n4IepyT/EeecNpQ0s7SCIX6pnT
	lhSsQnHaril2yxPtFk7wns2yegZ2MD6ydftxSlO6UKAFaiwSBoEwXrteQSnGu8qJj0jC
	P36+aFwWIEmsz7CGkVhAnvPrzqSg9UnMjbuxRNgDXCWno4XDwa16hoyQhP4bap590FQA
	i4tQ==
X-Gm-Message-State: ALoCoQmNztw9+DrCnSeU1rdG9653pp3sFwSv+CqMuZnvAvN+kSn8HddOYBa/bIlg+egVC647KMoO
MIME-Version: 1.0
X-Received: by 10.107.19.161 with SMTP id 33mr8179035iot.62.1444291493338;
	Thu, 08 Oct 2015 01:04:53 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Thu, 8 Oct 2015 01:04:53 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <52347.10.252.34.237.1444025438.squirrel@linux.intel.com>
References: <1443904562-21819-1-git-send-email-manuel.bachmann@iot.bzh>
	<52347.10.252.34.237.1444025438.squirrel@linux.intel.com>
Date: Thu, 8 Oct 2015 10:04:53 +0200
X-Google-Sender-Auth: lG7ECY-3I33Q6fmbN-xBDahBp9g
Message-ID: <CANTDXNd-Otw7iT84cC-GBeQ4bU6O8SViEL5BS-ac7B5eAkktHw@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/3][meta-multimedia] rygel: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 08:04:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Alexander,

This is correct ; I prefer pulling the latest 0.26.x though, because it
avoids updating some recipes -such as core gupnp- until I have a clear view
of what it implies.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-05 8:10 GMT+02:00 <alexander.kanavin@linux.intel.com>:

> > Rygel is a UPnP Audio-Video media server, that allows to
> > share media files to other devices. It can also become a
> > MediaRenderer controlled by UPnP or DLNA Controllers.
> >  meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb     | 32
>
> Latest version is 0.28 though.
>
> Alex
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

