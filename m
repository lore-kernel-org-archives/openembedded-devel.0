Return-Path: <brgl@bgdev.pl>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C5EEF7857B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 11:00:54 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id i197so3009ioe.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NuSiFE219yHpMJLxU66iME0D/jlCib//RXUGExfZad0=;
	b=XUdR8kLJd73qbSo//lCYK6++kdJ1VY9PlWIhRYCXV5vzMf41zUORLLGVzzZPAQgzER
	vgisUaqXo0+cmPy3KfOZVMUqqpmyxpqrU+jzA1WEgGu2w70g+JoflhrALTNAd6mq27d1
	sCbN/jTiftItAEvtvoS6apGdSXV01MrjaN+mXF0TT34ykSeVvQSXYylj2//+aPdz7Lw8
	8tP8qGOVJ3ARyDWPZsyX+RSdwmkt7kZJ4bzyYj5OAmfALxnLIP8bAH9KgD8r/5GY6F9W
	BXvII4VszNzydyuNPegUSIJ9/qvvl6hLqQHBQzzA4HrQuLEr7VmWAXJjUJsRE26khghH
	L/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NuSiFE219yHpMJLxU66iME0D/jlCib//RXUGExfZad0=;
	b=Q3QgHVihWpupSaxSbiB57AYHgg3HR22OrEUHIO/ETQkNgX9ZpJTeUJJsJbs/um4B5o
	LJHGqdemhiQhcOqmHAByad8a/EBWlnhp7+zps6t4y2GwejUw4mecVlyULkGfieoHiOPl
	gI/HXxzy0b9qDVj4c3OOuYTf37zmxdVBD9rPc+dJ6J+QO8w2DcCrDYRilK+64nDjO/KN
	GsFXKdU37zHoIFjHwoWUAIhF+2rQB3cpDMs767Y7Cpnx8n8oSTZtt3BGYTKXAeQhPcJo
	H1ww5mkFLqYHOA9INjgsu8vC+kICGdP7gCf35fvJhj3JCWd7yJytYj8AlIuezEV0B98C
	/yOg==
X-Gm-Message-State: AHPjjUhmps7yGP0x94y2WC5k2O5FvaH+isynbfxXy8zIXSF/P1IH+FNq
	LbWnBUt8C3p2v0fj3EypQ+cKg5VomJ7iBWB4tPaIJQ==
X-Google-Smtp-Source: AOwi7QCTORVUTxiYZ7uJvSKwMHa2fp4kaqCRuiv/pnWNuEMcM96Mvn0fPwDXy7HLtHxUduiMLbP81uKvQa5v5UWe6ws=
X-Received: by 10.202.93.136 with SMTP id r130mr24682263oib.144.1505386855968; 
	Thu, 14 Sep 2017 04:00:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.10.46 with HTTP; Thu, 14 Sep 2017 04:00:55 -0700 (PDT)
X-Originating-IP: [83.150.126.21]
In-Reply-To: <CA+chaQc7n8tEJb2q2k1YQg2exQ5ho_GfJq89g3jvz4+sEc-xUg@mail.gmail.com>
References: <20170914081341.25163-1-brgl@bgdev.pl>
	<CA+chaQc7n8tEJb2q2k1YQg2exQ5ho_GfJq89g3jvz4+sEc-xUg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Sep 2017 13:00:55 +0200
Message-ID: <CAMRc=MetDvpN0WpmkqghvkEXqNiPPgPiya=MSugZ-oWznZg1hg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] ceres-solver: add new recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 11:00:55 -0000
Content-Type: text/plain; charset="UTF-8"

2017-09-14 12:53 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Why do you prefer useless empty package to be installed together with the
> ${PN}-dev?
>
> RDEPENDS_${PN}-dev = ""
>
> was IMHO better.
>

Because then you can simply add ceres-solver to INSTALL_IMAGE and the
headers from ${PN}-dev are nicely added to the SDK, otherwise you
cannot select ceres-solver for the main image but instead must
explicitly add the dev package to SDK. IMHO it's simpler that way.

Best regards,
Bartosz Golaszewski

