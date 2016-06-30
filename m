Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 70D916E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 15:04:29 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id k68so26891646vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=DO0cJoF09i2VkDCjGlMpJgf++RHMEs6rhR2OAbbpldA=;
	b=rDxgGOruuvJxO989R0J916L7MhJ1GSqa1Ld6FORPn+9EHvas4MKq1xB11akby0zztE
	3ORC7urtq5x38onxTG0E+KtogTyOjrAHQ/wOKNMr4VUdmAulwt63SSr2Y7JnXrD6Uy1E
	yR4v5sO1pX1Cp8yzqQQoUXbORAZjsQiWFIIqVhR1HCSV87RKfuzOR/DV66D5GqFb2Z9P
	mvrpbMqBVUnCtPyoadpS9vodhUicPcrZ+3fg4sfNOWMSodVWmMqvRnrrsDA0/qPQ+bzM
	cnptadHVxSI+f9zAXv3lSWkQ73kwskMD+SZ9JnmWGy0AXks0tM9wG0vFZSUUzavFXVb5
	dxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=DO0cJoF09i2VkDCjGlMpJgf++RHMEs6rhR2OAbbpldA=;
	b=k5Hpezs/OApz/BWc3/6LZsZFkKkYE+Add3qsXnOAE6S5k1q0H1XY3t2HhUzRF5n7ka
	ZNVaKW/g+V2ktwgGy+q6lkUQAqnTHL79f9/wujjdnXsaGKbiX8a7kcJQmLKFViGKUfgg
	Ay+Bm72J9Xl7jFWUoM5eakBwyENxkzYZG1i5///FCRVe0QKFHedC8V+hv87AZHXfgGOc
	FMXAnEM4EmWUEnqvO6aj6uQgDZlPOwBH9GGc1khs80oYEUiwixhV9KrTEjghj8BqhNqn
	Z/fOJScjKvRfiLscJyG0jANa7dpN3bshlKUQ7MK2QO20s0qO8xv2xOobIUZPDRBpNW8y
	ZC+w==
X-Gm-Message-State: ALyK8tLOKdzOxQ1CNxlrmQA0FqioIRkNdR5K2tlS47mhohuqSYw5EHCTQyF83odXRFmCKg==
X-Received: by 10.176.0.210 with SMTP id 76mr4302107uaj.151.1467299069352;
	Thu, 30 Jun 2016 08:04:29 -0700 (PDT)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com.
	[209.85.213.48]) by smtp.gmail.com with ESMTPSA id
	f199sm1472516vke.8.2016.06.30.08.04.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 08:04:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f48.google.com with SMTP id k68so26890056vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:04:28 -0700 (PDT)
X-Received: by 10.31.193.4 with SMTP id r4mr6706255vkf.4.1467299067841; Thu,
	30 Jun 2016 08:04:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Thu, 30 Jun 2016 08:04:27 -0700 (PDT)
In-Reply-To: <1467206440-4906-1-git-send-email-bernhard@bdick.de>
References: <1467206440-4906-1-git-send-email-bernhard@bdick.de>
Date: Thu, 30 Jun 2016 12:04:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpx9Ny=b0_N4CFKeHgpnJfT0ZDCXcMTSZJDM7xf1zB36w@mail.gmail.com>
Message-ID: <CAP9ODKpx9Ny=b0_N4CFKeHgpnJfT0ZDCXcMTSZJDM7xf1zB36w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: Add update version and build number to the java binaries
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
X-List-Received-Date: Thu, 30 Jun 2016 15:04:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 29, 2016 at 10:20 AM, Bernhard Dick <bernhard@bdick.de> wrote:
> The OpenJDK builds did not include the update version and build number
> leading to problems when applications check for the minimum needed version.
> This commit fixes it by adding the update version and build number to the
> configure parameters.
>
> Signed-off-by: Bernhard Dick <bernhard@bdick.de>

I applied this on master; thanks for the patch.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

