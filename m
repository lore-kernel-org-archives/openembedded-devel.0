Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 946F66110E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 01:37:20 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3794026ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 18:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=LW5VzxlBMmRw8TwNPv3SNevfZ3FCVGexrr4FmhJ0qBw=;
	b=fmJcSdVpryPls8yoUWUnKdrSLYUxJ9rxl+MJQaJqaKn+M2pf56ooyn01irEZQpnvUa
	tLssEi9/8w0/1H8hjWBLqy20nIri4nW/tKqsCVqXFa3gp2PP6ySIAWqULoi2rfFx/MQ7
	YKUtBLDevxsoQstOT5xw6xK77tETWJWuE4bG+sq9efjXnwrkByv6jAi3ma/SP//Y3WA8
	iRsC5tuUk8OV5G/n5DF1SV3tuXmIrMVDVbtR7GOui4rpEcRctESUoLJSRNUxIUXF5rpv
	h6Bkdq4BuWcQz06lWpPRD1b8ZRcpDII93RfSrL55DsIKY/CgddP9bl8aujBXv5uuCXMg
	PMSw==
X-Gm-Message-State: ALoCoQn6g40Mqe940DuVhtCAHvagZpQhhpngsfoSzKZAbW6SPP44HdcDqkdECIpoW4EsjiGAYLqy
MIME-Version: 1.0
X-Received: by 10.15.45.8 with SMTP id a8mr63676077eew.1.1379554641815; Wed,
	18 Sep 2013 18:37:21 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Wed, 18 Sep 2013 18:37:21 -0700 (PDT)
In-Reply-To: <20130918212927.GJ7313@jama>
References: <CALmOhgm8XfD31FZbAARZcpxFwH2arMX7PeNWa1TMhbzmi-pXqg@mail.gmail.com>
	<20130918212927.GJ7313@jama>
Date: Wed, 18 Sep 2013 21:37:21 -0400
Message-ID: <CALmOhgmxiMjQjUci+kectNSu7p0R57s9cRTyCkD3xgO3e+OU-Q@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qt5 qmake
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
X-List-Received-Date: Thu, 19 Sep 2013 01:37:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On 18 September 2013 17:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> Recipes internally use absolute path to qmake and other tools (through
> OE_QMAKE_PATH_QT_BINS variable) but it's true that adding it to PATH
> shouldn't cause any troubles.

Okay, thanks for the explanation. I'll create a patch and see what you think.

Best regards,
    Trevor

