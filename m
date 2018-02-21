Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 625E8784E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 15:01:12 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id l124so1314890oib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=xP3nQ/AP2XGZ7MDQChLFPmLTr0advL/qbaVR9JYO2jE=;
	b=wqz9n/NSY6kF7zlxWZWkHHydildxFxRM43pWayd7l4eIqXSUfsAqyozrd16UANI5lw
	cEeOBlTk8AOQkVCzCO6UaaMPY3DnjI8W08irLc/wvSyQv+tCZ1tLx9MgK09jx2FHImtV
	1aygSXEk95QggCwIjPnNpm35dpC4sTSQXV3iYVjKQW8VDH+3JhPUZ/w+aNloGPRlz7oE
	qG7ebs0m9uxFJXmoLChluxHX71/UkkBYnXz76Q/xnjDj+/zl8G2bvnqVrHOqqnd5zDMQ
	YQNMeLGEpglEr0byQ+UZiIintD0SdaIiptvSKCPX30GCfPzu2ZKGyktI9BBd6y+CF1zT
	D0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=xP3nQ/AP2XGZ7MDQChLFPmLTr0advL/qbaVR9JYO2jE=;
	b=mRk9GBy02wuIzfxPkqTfEXic5PL58SZKJWMVCdSkkwaHVMhMeeLPB1FwlBIVh6VhIu
	CgOwY4/WKiQ9RbDNQvJ9VgjKUYJEpoFDBmcdfh0CTlYHrJwrjB9Ra9AyW7X5+ZLiBiXh
	c4Viho17+iJmjV8A/GnHcHuSKRf11Vyn3YaY2eSLpeD+fgWfFGGj3BQti15/UqPvyG+T
	hzN+XxAMF4/Cq0VX6itz1XRw0qVWKvHt5f5QRs5nHGA/QsCC1lbgJ9Ui5EoS/QhE+Ach
	wb4Z0RMBtYwzDkp0WYCFbE5cNWOxPFleuVVe4tneM5a9tLui+2pc9ZFFRoPw/TAeqXF8
	uKEA==
X-Gm-Message-State: APf1xPAxTOQmc1fXbimPjG3YFP8Vz5Iu0OefOGsCgM8bq0Yi6+yAYTW+
	19fq6zVLMBwlewrqXsYJsq5DR/jq
X-Google-Smtp-Source: AH8x227PNw5njXpp8TeV+W0108cVHr7rGH+oOTlPU+eowOPU+WYr2VtodUfwHyAbkAvlfzvZOdeQ6A==
X-Received: by 10.202.26.18 with SMTP id a18mr2150653oia.223.1519225272942;
	Wed, 21 Feb 2018 07:01:12 -0800 (PST)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	v81sm13921307oig.12.2018.02.21.07.01.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 07:01:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id b8so1300605oib.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 07:01:10 -0800 (PST)
X-Received: by 10.202.68.213 with SMTP id r204mr2431563oia.80.1519225270234;
	Wed, 21 Feb 2018 07:01:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Wed, 21 Feb 2018 07:01:09 -0800 (PST)
In-Reply-To: <1519225097.6698.8.camel@intel.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
	<CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
	<1519225097.6698.8.camel@intel.com>
Date: Wed, 21 Feb 2018 12:01:09 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrGH+77XRa9TPbzLxdGWY0z4EE2NBue+YciYkf1Na_rQQ@mail.gmail.com>
Message-ID: <CAP9ODKrGH+77XRa9TPbzLxdGWY0z4EE2NBue+YciYkf1Na_rQQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 15:01:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 11:58 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2018-02-21 at 14:14 +0000, Burton, Ross wrote:
>> > But that kind of mechanism seems highly prone to breakage and
>> > likely to
>> > be highly contentious even if it was shown to be reliable, so it
>> > may not
>> > get beyond a "that'd be nice" thing for me.
>> >
>> > Unless someone else has already implemented it and I'm just not
>> > aware of
>> > how to use it?  :-)
>> >
>>
>> meta-freescale (iirc) does this, conditionally adds
>> sub-layers to BBLAYERS based on what other layers are already
>> enabled.
>
> The approach used by meta-freescale works with older releases.
> BBFILES_DYNAMIC [1] (supported by bitbake 1.36/Yocto 2.4) is a bit more
> robust.
>
> [1] https://patchwork.openembedded.org/patch/140532/

That's nice; I will update our use for rocko and beyond! :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

