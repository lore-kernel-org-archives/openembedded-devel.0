Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6AE4774E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 22:02:57 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id f54so6818402uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 14:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Be6GDlQRiJX35cA3riPnMgCv+j0VHoRhj05A3A+/A2Q=;
	b=pz0Crrf//mLkeLEihYx1A13mcxALCXQuPYeH4zteLT+RmhGB+mk7xBxNe2xx3gPcqV
	ArOy6cPvrBANItBGl1W3mM6hgMFhmbl35jymHZ1/3176zxNnEw/ISZ1ZmQ/V8LHQKCLR
	shujAXuPp9KhC7RSxnYwuo0DCp1Tbuw6nPmZrq2NY4Nk7wJeCU+77ulvVkUD3fuJz9k1
	IU6+wkk6P9Qt6NHh00G0gOs9x8TtG4ozefp9qcfmqx3Sq3uAojQHd400jXdlqTd7gmFo
	FG0ZcrB42bmO4YzDJliMvkkjLVe+uiUrc2Jx44JL7vdWdIxbFc7ioKtNSimvstI0TbHA
	sgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Be6GDlQRiJX35cA3riPnMgCv+j0VHoRhj05A3A+/A2Q=;
	b=sSdbOxD9sUmHE3/tiTz9u0C4y5uwkKbKkQSOOJbnwZHinEYkm8XQ4YmyTRsP6ypoXS
	/WLVJjfMqEdFnZO+ivl7UmItfa3L9OA5ae5ZqBpiV2X7oe34aZW5zOT7y+QLQNgDTQS1
	upShdQPk9mU/ovK/5lmqKpV9xg77f12lDy6XC+6lUsDbDSaCAMzYAO2gJyGUUU6mDq+/
	wKTYlNBQe3Vm8PI058qUlD0douA4ONz5t8uHfAsWaJU/y5EUEwlMvCeSKyJSVGgwFEU6
	4uD9i84i6T1HfjJxxO5ZCQmMT0cODRvLhFpAytX/wexD6UFsLB672J9a/iXXI2TrjWLh
	c4MA==
X-Gm-Message-State: AMke39ljB8bLoIpbZXJO1WX8mFDNu0eTDYd7BE2Avab2jodI8Yipdp5TDxdX5iH/EGp7CkuWSKxqGs6kMdM+Fw==
X-Received: by 10.31.153.71 with SMTP id b68mr1464168vke.30.1488405778497;
	Wed, 01 Mar 2017 14:02:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Wed, 1 Mar 2017 14:02:58 -0800 (PST)
In-Reply-To: <20170301173049.1177-1-pkj@axis.com>
References: <20170301173049.1177-1-pkj@axis.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 1 Mar 2017 23:02:58 +0100
Message-ID: <CALbNGRR3DKMiSBnW+=WrWJVHqUzN5FKNoDh=4Na9s1NCnE1ysg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Make use of the new bb.utils.filter() function
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
X-List-Received-Date: Wed, 01 Mar 2017 22:02:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 1, 2017 at 6:30 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

TBH: I don't like this patch:

* It combines things which do not share same labels by design. Naming
package-configs with same label as distro-feature is a nice to have
but not a design rule.
* To me old style explains better what's going on
* Heavy-gozilla-patches tend to cause headaches when cherry-picking to
older release branches. And yes I know we had these patches in the
past and nobody complained.

Andreas

