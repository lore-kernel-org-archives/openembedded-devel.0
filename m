Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 08D0A78A5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:37:28 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id l4so8324470pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=H6EcXojM88H0phEpp4eeQ0mUAfFcjUYSE23cKqKCehI=;
	b=S1F8CDf1+6XceU5/admW6j3FsaEYqAkfejigQKjsAaRD0flI2Jd8Swn+a3hO0nGvpG
	KstCRacKhc0C2bZLil/Op05IevE2AklnTDrkNJ+5whv5Ex/pD7BTtX6mDmZ14RVA/yR1
	qs7cNRac160JucxGskJS66hN8s0MlTCJcGKdErlZMqmr4gD5jKzCOkEM2BrV8Fhq02qc
	pN8jdgeMWBd93n9VczN9bbk3FNRMXKwPhd3kevyfZZTcl1fIrgWjiCS7yuoUZf5MTPeK
	2TYXWp2ZzrtJPAExaWEKYVXga78lLcMye7lcNqMo0Au6i98oba+2derUg6cJeL+KEYAR
	bSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=H6EcXojM88H0phEpp4eeQ0mUAfFcjUYSE23cKqKCehI=;
	b=AozVno9yhUBo4U1xzdzUhigFF0Blo9onvsmkjgndM0YNKA9LNQWLp9E3gKohJRuJh9
	zb+Mm4ksKr5/0PX4AHvWdzif2hmW7lBjDgmxUFBbdlJcm0JGQWGQIxMtUh7HpvG390oM
	6SYZZ5eoVbcKSzMO/WhpX5tspeG9BuvaE8K5Xi9i0dkHZnyITg8mT1LlvKM6mHzK9BDZ
	yg2w0wkFVl75ziQLZ4WW4AoYRnxJxu3HKKeFDPRh9SS/XsAODbiB+/C9GDQ2MGPz1/B5
	nTlJo8qaIjQa2eHa2TWARoHY6k3YOLwe9idj8o9zDyc9YhF2MS70fYKDBwMo8GfsmsyS
	Z7Cw==
X-Gm-Message-State: APf1xPDi8Mb+ossY29smLRfVfcXGLwOyYWC60PuNZkfXf3pNKQopqesg
	QKMulULiwZ7ayuekQvbxQsTtgQ==
X-Google-Smtp-Source: AG47ELujWgeUf1z6M9kdEqDQm1LIVvsI42OyyErbtUY2Y9/S/NP6H7eWp2aYAl8HFfNsLkY3udHCzw==
X-Received: by 10.98.198.146 with SMTP id x18mr19077202pfk.22.1520347050085;
	Tue, 06 Mar 2018 06:37:30 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:19f8:73b2:93e:af3a?
	([2601:202:4000:1184:19f8:73b2:93e:af3a])
	by smtp.gmail.com with ESMTPSA id
	p14sm24806657pgu.44.2018.03.06.06.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 06:37:29 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
	<1520301312-29879-2-git-send-email-akuster808@gmail.com>
	<CA+chaQdRsH54+GBVbW_FmaVoBz0Ry=CORNi5-uzy-gnBDHN3gg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9000ed57-bf18-e3b6-87de-bd16aea7bf7e@gmail.com>
Date: Tue, 6 Mar 2018 06:37:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdRsH54+GBVbW_FmaVoBz0Ry=CORNi5-uzy-gnBDHN3gg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] xorgxrdp: require x11 and pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 14:37:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/06/2018 01:16 AM, Martin Jansa wrote:
> Duplicates:
> https://patchwork.openembedded.org/patch/147412/
> +
> https://patchwork.openembedded.org/patch/148545/
>
> But ok.
i'll take those.

>
> BTW: The first one is "StateMaster Next, archived", but it isn't in:
> http://git.openembedded.org/openembedded-core/log/?h=master-next
> something might be a bit off with your scripts.
Me ;)

I'll double check.

Sorry for the noise.
Armin
>
> Regards,
>
> On Tue, Mar 6, 2018 at 2:55 AM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb> | 4 +++-
>      1 file changed, 3 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     index 0c779b5..e86ebb5 100644
>     --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     @@ -4,10 +4,12 @@ LICENSE = "X11"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
>      "
>
>     -inherit autotools pkgconfig
>     +inherit distro_features_check autotools pkgconfig
>
>      DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>
>     +REQUIRED_DISTRO_FEATURES = "x11 pam"
>     +
>      SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git
>     <http://github.com/neutrinolabs/xorgxrdp.git> \
>                 "
>
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


