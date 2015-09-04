Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1325277016
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:45:19 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so5426767qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f31563PmXrvlKnwEhw9JFcxlho2j8v9KQsw5YY5p6zI=;
	b=gYh4Kbah5gRntqaQ3CzfY/QtjcERzrGk55tGcYprJoBfPtDVa71MI4UBwhL/pDGv0n
	u+u8M4qXaybVAwwB2C0LHJA7Pp3oTRObsSby6+CNHk4cjIochwqkDC40D0BDielM/9oX
	vqkXfNddSee/TRmgMC4hrweBS+xSPCcw0aPFInpWwuXcqL8L7jivt4CERk0uGs7YvUQU
	bujK8jk0pOCQxHL1GW9LCG3rU9h4a2PCe9scQW2rKPdIWcfdLXpwccvLNMKpQIvO+DI2
	K/xE7JLMG1LYonfAL+bEfx6bwrIekEFbAIeosrokT83QFcym14uYgW9LMwxmOWD5/vaC
	1bNw==
X-Gm-Message-State: ALoCoQmva6kGmSKg0UYT/zPXEV8khHMLqeDtbxPS1ke8RUeEVwyXsFzemJeirkVkd7PzfkN92kXQ
X-Received: by 10.55.209.210 with SMTP id o79mr3197874qkl.43.1441352719924;
	Fri, 04 Sep 2015 00:45:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Fri, 4 Sep 2015 00:45:00 -0700 (PDT)
In-Reply-To: <55E949A4.9050805@dresearch-fe.de>
References: <55E949A4.9050805@dresearch-fe.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Sep 2015 09:45:00 +0200
Message-ID: <CAP71Wjzcr_ByLfCnAgQ3t2MYv+D88iTL5_VJ4Cdn23iAnyHfhg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Fri, 04 Sep 2015 07:45:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 4, 2015 at 9:35 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.
>
> Does OE have concepts for this? Or any suggestions to realize this without building for many machines?

most BSP layers use SOC_FAMILY, see [1] for this type of things, such
that you can create 'SOC' specific packages that are reused across
multiple (OE) machines. That sounds like that would help in your
situation.


[1] http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SOC_FAMILY

