Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 169887743A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 19:27:22 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g1so1716890pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 11:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=A2QUepOUjjONkboCrE9eog5g/bQb9woQ6xiJ+iiqqHg=;
	b=eMSryQ+UccjLPkSKQkzQLVPCvEPWbbH3ERvxTvHoD0LrkvvfIE+td8s5oJxkbUGRa3
	ypZbbuHR2ZOwflNNpTn9/5tTBw6qpPSrYcFhXEn1X0ydbLY59+39gxd+XDMrWCr8sqmw
	wHs9qhBcHRl8V9j6zBodkmbA2WchwmbYKkldMBJs9AMSDGfFbQDsFynd9nCpkamRwj5d
	pfttNWKW11wCWMwj8oNBl99b3aB7d3ph/XrU+c52OTB+Oi8Kry1A6fG9Q6QZHmDv48KF
	5ie5jL2KMh8rUpwhPCgLKq1PDLBU6cAaxSwfcmWD6dffBhz4/4met5ZfS/HL0UpplasO
	puyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=A2QUepOUjjONkboCrE9eog5g/bQb9woQ6xiJ+iiqqHg=;
	b=dTYVhrxy49zeTMg2loi+sycs9iZ69bETAL9m8HW7YRc4IHVeuW97YpoFDTqjw+cbYv
	jHeiud52JHIzPn/rM25RxAHxTqP5kE7j1gWu5mYhPxT9F2+LTbs08FIAX82cu90NJZc2
	srzAkGI4z2nlGj7AiCbtEcV+WN295L7sehhXcrJvSbYWPlrfl64DUD+vlPss1Nkl5Enp
	WQ9m5kdCyZU5mRB/uX9D7SbMKKj1Jwv8+gxFz8djuKfYWxiyGRu292nTCmHFDON/zpms
	Lz1YwTY8Cj2vkjZEDJOoqXrEbxPCXC2E7WVHDdiou0nJKsjyMHOzfT6aCBP3gwUX0oP8
	WFIw==
X-Gm-Message-State: AKaTC01Gxnkwz1iwIyznWMZ/wDUIlGMrKKg/Q6l2hYMN5Z2CwCC9mEq6o+5Gqqcc5dMpbQ==
X-Received: by 10.99.218.85 with SMTP id l21mr15906040pgj.102.1481996002854;
	Sat, 17 Dec 2016 09:33:22 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:80fa:6c06:b6c6:ea41?
	([2601:202:4001:9ea0:80fa:6c06:b6c6:ea41])
	by smtp.googlemail.com with ESMTPSA id
	w125sm20290151pfb.8.2016.12.17.09.33.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Dec 2016 09:33:22 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ef51199a-f11d-ecad-0211-bb966df53d77@gmail.com>
Date: Sat, 17 Dec 2016 09:33:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH 00/11] samba: refresh pending patches
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
X-List-Received-Date: Sat, 17 Dec 2016 19:27:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 12/16/2016 06:15 PM, Joe MacDonald wrote:
> As I mentioned earlier this week, I'm taking a stab at updating the samba
> patches from Andreas Oberritter that now have conflicts due to other
> changes queued up for samba.  Quite a few of them actually applied cleanly
> after resolving earlier conflicts and the basic smoke tests seem to pass
> for me, but this definitely needs a bit of soak time in master-next and if
> you're around, Andreas, and can double-check my work on your patches,
> that'd be much appreciated.
> 

Are some of these changes appropriate for Morty?

- Armin

