Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B4028782A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:34:20 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id g2so8139470ybb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 00:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xFsBywSRxcRsRZoJob0F0rs/E//FccpOu3xfmCHpw2c=;
	b=rVgTXytnASJ3JpddnvcRbVRWpSuDtJhMkXZOAjBugtffr5/l4L5/G4kh00fDqjjOVG
	ci5JoOP6Li76tM8YBtc20BXuvfe7PRP1jXQqE0T2/EZFkdHXzBACqA0Lsgg6Uzpva2rf
	J7TVHQtnw9BWeYdDVC8yiW68fhAv5SJygL/qB4DZQcE5WqbZBpc/A2f5ddkOLbIbUY6H
	N4mol1Yl1BnV+GsADqv9YYFrtox/pG10QiU6Gjvdk73NmNGVWzznojd0Vax39ns2DfuZ
	YdUniPk3iHyHOhjD4qUHnAIoy5U++8Q3Fvkw4olpuY2rSmQ8aeBJZ56AWpbYgC5lyqeW
	Q6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xFsBywSRxcRsRZoJob0F0rs/E//FccpOu3xfmCHpw2c=;
	b=bMxc+RaHu0bezYyRroBnPReO2+zin/2KGoPeW4KLggURfKoCKdaHGQYGUxgJE0r5Oz
	pAf1jaR+niipgsiES1R7JX0T1fKjYlfiUMVL+YgQlB0W+4Jk/d7yAd8VqYHtH1oJ1wi4
	Jz6cMtdOnPIDria1eZSXa/KnexeRRpHOGpt1drynPn0smAXJ/Tf/1JFPh7KTORT22mEj
	o8SzTokfYq+NrzvSULa7eYjbyba+RsGULtxCplFdQ26sixeKmTe0GE4g5g/qENs9m2Ih
	ebmsl0iGJ8Xx+urlad22Ys3wPqiiJCbSbyd1PGoZJ2xhftzCVtRpYMzP9tJ1GhBP5wSx
	19tg==
X-Gm-Message-State: AJaThX7K463IK5Ufpwr8Eg5kXc6AAtoGl0XXFvSZGq1S1CW0iODbPKB/
	xGp6M3wlH4sldyFubYtPwsONIqeII8ArKx1k3u8=
X-Google-Smtp-Source: AGs4zMYh71+dWRJz5CopslCWtDJnsw4wPkB0S6RpB3ryeiqt3X+Wf7yleY+CUayPVaa8yUp6L+sc1XJRUoRuQsaQpr0=
X-Received: by 10.37.124.193 with SMTP id x184mr4064692ybc.219.1511858061712; 
	Tue, 28 Nov 2017 00:34:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Tue, 28 Nov 2017 00:34:21 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA3E0F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1511511021-50020-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CALbNGRQZzzwRJgGUR=Cx_KY=SahwuRiYGFHv2Zeq4-PpT2BF=g@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA3E0F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 28 Nov 2017 09:34:21 +0100
Message-ID: <CALbNGRR47Sp734uF6B-w7H3Dx1Qa0wW2H-tgdoKSCxz5ngwKGA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xrdp: new recipe
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
X-List-Received-Date: Tue, 28 Nov 2017 08:34:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 3:34 AM, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:
Hi Ruoqin,

> Hi Andreas:
>
>     Do you mean use git SRC_URI and SRCREV instead of tarballs?
>
Yes please. There were some discussions - the last I found is at [1]

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142519.html

Regards

Andreas

