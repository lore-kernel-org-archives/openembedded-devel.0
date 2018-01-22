Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8B477DAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:54:26 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id m8so12094039lfc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=to:from:subject:cc:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=tC7uob8KHR3okY/yhaJRV6ojqEogtsJTC3wp9T3CFyM=;
	b=TA7+0qNuorrVvaRy0oQvWAgLanbIenY+IDkZ6SoSAoZiIybQ5pDrcwQdU3vCzkvvhC
	+tWVba93y0ZYdeBZco3dMrSEa4yURRxXu4gVCrMoPwBatPMjrigsFi8uyLWkzbMIUvNA
	uuu1i6cQ9E7Id7l/6/xS2v2qHSUGFZy2S1C6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=tC7uob8KHR3okY/yhaJRV6ojqEogtsJTC3wp9T3CFyM=;
	b=XA4JwxhJymXcANX5uuSytPukkrne96UituWUA3x2yadoXlwshOCatQHxNCy7/VeRHo
	lrfyNY74Sjm0M3uBxC3y6yPNSlkquPhZmXhsMmWsVxd/Uf/CAAEb0TMCifd+ZyGOO7dd
	FnTCXse6eg6cgWWFddhadBA5V5crxFZYDZrN+IiTWY0B9OIE4RrYTbnQPKY0L47hlTEd
	n/78YrHpqKDx4jQLGOAo0r2ddNCkTHXxLtrP+l1JwDs/LYv5AEivaCRzEIRU5gYcZ9XM
	4P+FT1a/w6Ror+K/YPMUVR5CRoU1+FX0WrWD9SCNU/Nl/h5NjvN0Rg4Qk5kgZl7xgZrf
	+Bqg==
X-Gm-Message-State: AKwxytdyOyi67WDl/gIh/ZV9Fvs5fnmZXfO5F2jzy5rQMnx2gCzBY7k3
	yw0qowwO/g8TvK/a7inB1XU6bA==
X-Google-Smtp-Source: AH8x225HlxAopdghMkdwVjjOkDtQqorCH2pRdHYHVhMOt314/00qOS4RVtMKGDiVRHA6ELz3SnswBA==
X-Received: by 10.25.31.200 with SMTP id f191mr6547lff.68.1516650867564;
	Mon, 22 Jan 2018 11:54:27 -0800 (PST)
Received: from [10.5.20.18] ([62.117.114.130])
	by smtp.googlemail.com with ESMTPSA id
	78sm2888730ljf.0.2018.01.22.11.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 11:54:26 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <63d85ca3-162a-84de-65af-dde8e02403ab@linaro.org>
Date: Mon, 22 Jan 2018 22:54:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Cc: msisov@igalia.com
Subject: [meta-browser] RFC: updating chromium-ozone-wayland to 65.0.xxxx.0.rxxxxxx.igalia.1
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
X-List-Received-Date: Mon, 22 Jan 2018 19:54:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello,

chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb from current meta-browser [1] didn't
quite worked for me: e.g. I was getting the "Aw Snap" after filling in the search text box and pressing <Enter>
at youtube.com; sometimes when moving the mouse pointer over the screen the mouse cursor became the arrow
and was not changing for quite a while when moving over the chromium window (looks similar to the issue [2]
though it should have been fixed in r517731 if I got it correct).

But when I tried updating chromium-ozone-wayland to version 65 using [3] as the basis,
those two issues were gone, and chromium became much more usable for me. Then I did the following:
   * from [3] took only the changes relevant to the version update,
   * rebased on the current OSSystems/meta-browser,
   * replaced the patches added to SRC_URI with the upstream versions where applicable,
   * updated to the latest tarball at [4] (though I don't see a difference in how 65.0.3298.0.r524623
     and 65.0.3315.0.r527534 behave, any of these are OK for me)
- thus ending up with [5] (the 3 topmost commits).
(If we go with r524623, the topmost commit is to be dropped. Or if we go with r527534, the two topmost commits
are to be squashed into one.)
Basically this is still the subset of Maxim's work [3] with minor changes.

Does it make sense to update chromium-ozone-wayland to version 65 now?
One of my concerns is that it was only tested on an aarch64 target (dragonboard-410c) in rocko, and build-only-tested
for an armv7 machine (am57xx-evm, rocko as well).


Thanks,
Andrey


[1] https://github.com/OSSystems/meta-browser/tree/master/recipes-browser/chromium
[2] https://github.com/Igalia/chromium/issues/317
[3] https://github.com/Igalia/meta-browser/commits/ozone/wayland/65.0.3298.0.r524623
[4] https://tmp.igalia.com/chromium-tarballs/
[5] https://github.com/andrey-konovalov/meta-browser/commits/my.master

