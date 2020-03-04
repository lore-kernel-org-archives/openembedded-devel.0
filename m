Return-Path: <leo.yan@linaro.org>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92C9561308
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 03:39:05 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l184so229978pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 19:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6PNF58DwgOthxMhS6Fo1vN34IS/v9htePXs7UhYXN8g=;
	b=zYA9QqG4OS/jAOepcLtyMI1UzmTEI0f+e8Iddap8tKgyLyafvz479+B1b2kSzW7KO7
	FXHhKkqTHUe9MmoIc62c1Z7pq0YeD40WlZ2a/m3N1Eiuvs0koANAPvjvT0LO+rgQmAKe
	NZoHzwByQi9MTMsB5W06GBhtcVbhAcHAWvTz92Wv+765LNGhXD2NAQ5KkIbrWVZNIBEJ
	akxrNozDai65r7Lf1BU9QcJubAB4Hi4eTpJdzdGCU3Mn3FYmJPy/B0ABXY+Q7SXW2pAp
	0+hcoj8zE5Rum5tu+xxWNv1x5ud0hbdEcQCj/QSdCaebX0MqULEGJpysXGCw8BP/n4il
	4vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6PNF58DwgOthxMhS6Fo1vN34IS/v9htePXs7UhYXN8g=;
	b=saQnCPH3m7RJ8y8Q6zKJ6her+L/7tsZIzw9Qc80VAUSIH1qEt9PzsqX4xSh9PXvzZS
	bx+DB20EO2kvw1s5ogEZlOAx+IXoZGvp16v9BBLwTMqhKT8Gzvl974QOk9UEyQ1/66eH
	AvyWCSolEmKhABbuH1DogNHrTaRALkXZJpLHKh/YejMl55xpRLu/TDbBCDTUdzqUaG3S
	NmSlIQQuXxlq/nVVTIOJRFRrcy55MjLfUm8C5sxDzL9xfnzKnrrwwM0J7El2mBk004Q+
	JRXWsHJgxRo1AWqvgehQekSqu/p15q1ib1n4o+fQgoya+QSpcSrTsavQAjuRD3H8FI8O
	84NA==
X-Gm-Message-State: ANhLgQ3KxtFezeYKTxIOSifARB1MHCUQH/FTrgUi7vsgesWKD688V1PX
	PgUyud3l8Yup3G5Jy65tGRCcpA==
X-Google-Smtp-Source: ADFU+vvaafX3p9OEn/7NHE0PbdDwVpCSnAaAuxm1GpC0gZyj58L3IMduieUJa932hq0nPf9l9JQnBg==
X-Received: by 2002:a65:420c:: with SMTP id c12mr679523pgq.270.1583293146288; 
	Tue, 03 Mar 2020 19:39:06 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id
	193sm3796705pfu.181.2020.03.03.19.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Mar 2020 19:39:05 -0800 (PST)
Date: Wed, 4 Mar 2020 11:38:55 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200304033855.GC8032@leoy-ThinkPad-X240s>
References: <20200226122622.33171-1-leo.yan@linaro.org>
	<CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
	<20200304030048.GB8032@leoy-ThinkPad-X240s>
	<CAMKF1soEtOcQaWbJ7CEwJO1Ck_jHejZVHcQwmMZrH19mUyVgcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soEtOcQaWbJ7CEwJO1Ck_jHejZVHcQwmMZrH19mUyVgcQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Wed, 04 Mar 2020 03:39:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2020 at 07:25:07PM -0800, Khem Raj wrote:
> I have pushed a fix with ~

Ah, I see that: PV = "2.1.0~beta3".  Thanks a lot!

Leo

