Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA3CD78754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 15:54:02 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id o76so5828386wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 07:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=a+9cQFllKfJcsKXCgBtH6fcnAUaXjLjMymI5va9CjGA=;
	b=k4sI1poLNSSVX0VHD7CQr913Ov/bfYLV3BYkmOvfsalue3vasWyoGUlu+KkU97gtw+
	FTz93tW+wyZ4hWUkEPg1QVEHGbl+LW9CLYY651U1OoKP5Z8EW5bnH+qFHdaR+7nYnxPs
	QA8R2Iqi8aPS7KYDeaWWyWFLxZ2qYh/BieFFdEMyntt0X0xYJto3sI6aqxrZnDnCxMXC
	CphVPW5geZGK+xV1a/QZzvm0Cj0KGLujrm1qJRfbR5dhqkGFFdxBgf1vIwloTuiP1cWS
	z5C25cjdqomXOY0CpRKBMyorjXosQqg4M+MG3yODhKzQ+sWnIkc12gzfURHuei0dBqR6
	FcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=a+9cQFllKfJcsKXCgBtH6fcnAUaXjLjMymI5va9CjGA=;
	b=JnZOxu5gDu5+izsLFw2ySRg1gsLcMeb4UjadWMw7VEqUCFARercHgC7tLSmQDJ+oxC
	ZmyIOejf2LFpHQEh5mNgZZR3w7TO6fbgME2Ne018IIRNHVNIulnqSjbgsOdbnYcJdG7G
	wUr/xkAfxDld69ypuCDBvrnHreGh1oCc17Bag+n3obk4wEB9joorHr7/zwQ0EWqydmLy
	OzFBr1Ju7fyZcel1heLUD8cv7EAHNK6OC3FjyftLhniXwA0A6RAP1XMcLDEYoieYctvR
	+62FVLvYLwzevPczZkjpVwSWmGB70LTn4lNvXxRAdnrc2ga2ZtfpkRS2F3LzkQavJKNu
	3o5A==
X-Gm-Message-State: APf1xPCCsTiuXjaeI1ejK4qMyIvp6eMvTuOlAiH6BWAcnrs1KvwEd355
	XXVuRR5QlRNPPfwvXgVoLsvy
X-Google-Smtp-Source: AH8x2256vztHZ6uT0XUpsE+/xPtdjYwniE3IWG48UHEvVmqvzJOOJqB9lajrPJsBVvQa7eWSMXe14w==
X-Received: by 10.223.128.227 with SMTP id 90mr3608563wrl.50.1519228443765;
	Wed, 21 Feb 2018 07:54:03 -0800 (PST)
Received: from pohly-mobl1 (p548497B7.dip0.t-ipconnect.de. [84.132.151.183])
	by smtp.gmail.com with ESMTPSA id 77sm966819wmu.17.2018.02.21.07.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 07:54:02 -0800 (PST)
Message-ID: <1519228441.6698.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, Tim Orling <ticotimo@gmail.com>
Date: Wed, 21 Feb 2018 16:54:01 +0100
In-Reply-To: <1519152750.24236.330.camel@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 15:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-02-20 at 18:52 +0000, Richard Purdie wrote:
> Even once we do that, we (as in YP) can't send out a clear message
> about what we're testing and users will clone meta-oe and expect
> everything to work. So right now I do have problems trying to get to
> a point where YP can use meta-oe effectively.

We had the same issue in refkit: the bblayers.conf.sample enabled a
large amount of layers, but the distro itself only needed and could
test only a subset of the recipes in those layers.

We solved this with supported-recipes.bbclass [1] and an explicit list
of recipes that were considered part of the distro [2] and thus got
tested. A "bitbake world" only builds those recipes. Users of the
distro could enable additional recipes, but then knew that they were on
their own regarding those.

[1] https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/classes/supported-recipes.bbclass
[2] https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit/conf/distro/include/refkit-supported-recipes.txt

Note that this mechanism also allowed us to support only a subset of,
for example, OE-core: we settled on systemd as the only supported init
system, so sysvinit wasn't listed as supported. This is something that
cannot realistically be achieved by splitting up layers and/or repos
containing layers.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



