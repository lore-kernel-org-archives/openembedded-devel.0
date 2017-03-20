Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id A182C7797E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:04:02 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id u30so75487754uau.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o+pdv/mqlcKy3+SqWjX2WYOPMUhUk+gvWTFhGdwgakY=;
	b=bKML+FqaiV07sjdbtWJpOnZo8zPirJUP2/NtRmvEwILNIx9XupCcxwDB8hi5YcWftm
	xhk921GQ8g/4L1JLdf75LF7cxtTKSmhwfTPALIOnIfMBVpTmlvumajXZkpxeEyCkTjlU
	R6U7EOUngLM8DxaXPaFnNB96VUgRpZJxlT4VCRFEPYTQt4M3bEDU/hcQRsrvnM+2ND+E
	scrK3Y8C2jeiX1FG+GPVifWd6SVmyxkYtL9Y95SMtJf36Vbhok+Zdq7aoqrr9XUMvZSd
	/na5v11ba8euwgC4IOEqNLM5LxPUmPDKSXl+gxxCS4bRr7oF0nHKUQrgBWBIFO2drkxA
	E17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o+pdv/mqlcKy3+SqWjX2WYOPMUhUk+gvWTFhGdwgakY=;
	b=rjJauyUICZkOU5DEDiAYPCAI8qUip5PU2YbIrCSoJ7TgHJBaEH2IRkzIUKTL5GS+Sa
	NPHtG6ehqjxeKJoUz+/ApwZWA7cZXIr283ARhweWN6JJ11y8u8i5+Zsi/C1gqeswDSYe
	khhFTbSxico2DjR4139pgc8pKlBWpKxUVX4+FSa9vHvkqqi95hgDINcvaVuAQh2Z6b+G
	k6vViZPHxzIDBjM7Y9Jgng295yvaGeloPniEBLOIpnpS3MQwhA7fu4SujwaINU4Z9bhy
	dBsrFGBpCKaENKJVxNQNJIXk355IqeHv0T9r+nTZBGBfQ+knhq1AGHIYsZWElYuEF8/5
	Amaw==
X-Gm-Message-State: AFeK/H27TLOXYRzZsySA6CzIZ7V7s8SUX6j6UmSfCqDs9WwdXka3+r4Vin7GoD6Bw7ennJhNik0fu1w+ewOaAg==
X-Received: by 10.176.1.241 with SMTP id 104mr11815992ual.44.1490015043391;
	Mon, 20 Mar 2017 06:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.71.83 with HTTP; Mon, 20 Mar 2017 06:04:03 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 20 Mar 2017 14:04:03 +0100
Message-ID: <CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: blacklisted accel-ppp (under binutils-2.27) seems to compile under binutils-2.28
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
X-List-Received-Date: Mon, 20 Mar 2017 13:04:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 12:56 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   current meta-openembedded recipe for accel-ppp reads:
>
> PNBLACKLIST[accel-ppp] ?= "BROKEN: fails to build with new binutils-2.27"
>
> with error logged here:
>
> http://errors.yoctoproject.org/Errors/Details/81003/
>
>   just tried under latest poky pull containing binutils-2.28
>
> and it seems to compile just fine. should it be unblacklisted?
>
> rday
>
How about sending a patch and give Martin's world a try?

Andreas

