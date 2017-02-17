Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 03131772E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 00:13:03 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id y6so6573401pgy.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 16:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=8pvJTDy/53439QJmnof7acmHbS7yYMoXHx2ooaIIph4=;
	b=Fo6Cy3sLLJKKhmW3M3UUGYRDlhL87LMgBATXDN6cNvutxYySvDxriWD2HiAkUAYWWn
	qJXs4PFyjEyJoBU2vBd0UfMKU6cYGck9KeOlkT9Y+qqxfDZk5I5531a2juhxN9q/d4iB
	vN39b+1gUkWcOSH89eyG1ODmCFOo/BF9D419ExGP+ZIkM4sslDjdeFtA1hsgbOVjFZNW
	i2MfgWIrqpL0AlM2+Wmdsv7Stgq3CEXOupesj8IsDhGqxc3nuVtuNgXgVd/syzbXxCxY
	eTXYi3quteqXvLtihtCLbX7z4vud0xJg5+PQIsDZVbYwEXKH0zW0KXm/mhEexs7TqKSv
	EDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8pvJTDy/53439QJmnof7acmHbS7yYMoXHx2ooaIIph4=;
	b=FLvfQhiuJcG8X67tHqDCUKd7tJlMQeEF2TKyUK0oOVxM0socHYBjN2dJ1SUAKr+ADA
	sEvaOekTuHBrYa5Xi0ui36t1iuk4SGfS4wmvHQYXJ+Hh0MCyrKB6FgBA6xn8oKK9rE7e
	91qzLc4KWxtozrQUi7Wzyzqp0+B7mfFCqJ7ywl7C84gAgEi/zneEgi4ejlHHUgkRcOiM
	09qzZFukubp6obK6J9OLAt8fe9traYBAnYBUnJBvVfOEQqGm7cncVRnF64rOVbUlfj3z
	VIdcY0GiqCuKe+JAWsfjOCnYLBywo6K0//JCE+OUcXbjJdhX1Jv2zMFM6c9r5x9/3gk0
	dkGg==
X-Gm-Message-State: AMke39mYDFVCko/b6uDRWPT9P/Ek66ebfatf2iVw7ASYGxfsB0EUT0J6c2uRRsTOfWaInw==
X-Received: by 10.99.4.210 with SMTP id 201mr6396200pge.77.1487290383625;
	Thu, 16 Feb 2017 16:13:03 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:dcfa:13bf:34d0:bc6f])
	by smtp.gmail.com with ESMTPSA id
	e129sm15635526pfe.8.2017.02.16.16.13.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 16:13:03 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1487285523-25674-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <ea336b89-d159-da29-3374-7eadf7effaa6@gmail.com>
Date: Thu, 16 Feb 2017 16:13:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487285523-25674-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python-urllib3: update to version 1.2
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
X-List-Received-Date: Fri, 17 Feb 2017 00:13:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/16/17 2:52 PM, Derek Straka wrote:
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=06dfcbb88fb0787a2039e26af11276f5"

what changed here ? please add that info to commit message.

