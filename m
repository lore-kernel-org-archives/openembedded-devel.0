Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7812C7841C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 02:49:57 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id m28so726514pgc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Feb 2018 18:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=i0zMeCk/AXpcngCOsuqqmvFczbLBuZxDNg/PxcCbY/U=;
	b=NibYbOkldOYfzcgQ/LZ2TmaaEmZ+N6A9wzl9KrBiGk6/Q3J1Cr85QSpzQhH9S654eZ
	Vk1++Pj8LJIzSFlv694iCFGunLdrM7vQxJF2OlYQUB9DqAWNjpAER6UMBkaUCslrk00P
	t4ryj7/FdjJXDMLHDGoK98/zWuWYSLwXmR2kZpCGZMhTuJ02s3mCl5oSbf4hrjrLNCQV
	KYFgWyAi4cXlZute+qnaEUx6RhU/zGDxQfWNZySnyyazP42QNfzvnfo6ddgkxWozQIe1
	D2HNcIIulvBOxI0Mxyc6RAWu92+Ewq/vfc9Pge2nKZCoFfJrW3uZb+zqk/1/VUKH8Ssd
	Txtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=i0zMeCk/AXpcngCOsuqqmvFczbLBuZxDNg/PxcCbY/U=;
	b=q3eVrZTbIYF0YtkkTmh/+wtzi7EzmoDqAmcKBlr5YeOu+5yZIxKyrkEQAoVZZPCLUB
	y6oNip3AhfIKYaXiQKGDZ1R1j1qJFYmNVTOGbrLv6bF8wcrmGjV2bwWwKFpc0yLEM/hY
	/BLrF2qwSm6RgWPphcxk7nd19jT6dQ0YCoOZdgPQyV/WG75EIKuBCOqpOgFAR5LRNJRt
	SuRh8CL5fL04QT3a2A2vNLIWA8RaYgMEG7NkMoRVGm7k9k2m+n3Yci9jLO08MMs5E2W0
	D1GxQhXIuBxhAGk95N4IgVyqnsH+uIShhDAi5f1k1r6KFYI1rM7TsBkZ3Jr0ek6o8sih
	+HdA==
X-Gm-Message-State: AKwxytd392RMLRcxcyA4sZvtXasmgwjylh0wMpvyKkQ3zesyXDBTDW/l
	g5BA4cbEd/0zBUvHm4V4A4PVAg==
X-Google-Smtp-Source: AH8x225FgsPx5Eq95zINbOJgS6f62irCd0Jt0MDz0qI4abm6pyVbb9/r7wV2G7up6kC/LgkgzvZ2ZQ==
X-Received: by 10.99.174.15 with SMTP id q15mr36464788pgf.265.1517798999355;
	Sun, 04 Feb 2018 18:49:59 -0800 (PST)
Received: from [10.5.7.147] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id g8sm2267791pgs.22.2018.02.04.18.49.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Feb 2018 18:49:58 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bbc09ab4-1bc7-3120-5de5-0bf02636c629@gmail.com>
Date: Mon, 5 Feb 2018 08:19:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: World builds
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
X-List-Received-Date: Mon, 05 Feb 2018 02:49:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

There will be delays merging=C2=A0 changes into meta-openembedded.=C2=A0 =
One of
our two build nodes has go off-line again. This the second time in a
week it has happened.

I am currently running basic world builds on my home system.


Regards,

Armin



