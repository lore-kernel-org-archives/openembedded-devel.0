Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7A478423
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Nov 2017 15:26:15 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j3so11305138pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Nov 2017 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=f5d5YGemj2JwzhWDguayvTabpm9DXTTAWpgfzdZpQm8=;
	b=cD8dOnndEwZ+lbxHfIEb3VqBNCUPksD7VJPaO+NBhbJJf9AOe54htVLjEd/JBUZths
	TvJa1eSvNKMVOQN0K6dT5/iLXULCautPWRzsTJk1N0tbDw6kDLx3k9fFem6B5V0MIz4b
	J7UaB3NRNrXIK2DQxVj10ZQ9inHtQsd14ahZeJEtdDcBH/c8mwIfwpnrtWxPmfZv3AyF
	EtwUGEpF82Zt3XgiAoDxt9FWJGkDa8qMRjfeiUkXX7oOqq8chLbPpx8MrwbTjBpeQDd4
	baVxGgyy/TCfSFLNAJIVrx8XrC7GNcl0sKCn7mmZgOxFrBEjrseo+f1fBJCXiRTCP6Pp
	VyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f5d5YGemj2JwzhWDguayvTabpm9DXTTAWpgfzdZpQm8=;
	b=qvfurQl/MKMHqBuxA6n+s8/5q+4osaASVqyXhyr0YRWUkc9hodEEExqs1b1MfO2AM9
	sKzscb4U5YsYb9ftVJb5Go2D5bgiWGj/kxkRYgi+6EHO4IIDCPVHAmxKvwvfyA6LyrpI
	kogr0EPHlYOb0WSlkSJDTCYIgD2TM3o68C/taMj6XmF8rLvBbbZsLfUS+rKGexOEOqeu
	0SW6FU06Nf8cyUovHcV6wl8lcrGMMk1CkWgCrCpZBPUGedgsbgVOCUNbRgkSbtuPBeK5
	Bggaqykvq2S+3Z9AywBBe2C4WUsxM7sQSodJTfn4M2dmE8/2PHHJroSu0T8KXkxEAtoS
	RoYA==
X-Gm-Message-State: AMCzsaXGtjJQFMOneYQW1lxEbC0vVvEQCT+h6czi8aUUfIZf21K4gxAc
	r85viya42ns8sL+vaF/S3aN+sg==
X-Google-Smtp-Source: ABhQp+ToPY0zqvWYJ6jLkJq1NgvzVXRN/KUiG+NSlyszuQb0rHIxa7z7zmbAVCYkEouP89jq1NYUxA==
X-Received: by 10.84.141.131 with SMTP id 3mr18483332plv.136.1510068376330;
	Tue, 07 Nov 2017 07:26:16 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:a54b:f983:3094:c1b6?
	([2601:202:4001:9ea0:a54b:f983:3094:c1b6])
	by smtp.gmail.com with ESMTPSA id
	z6sm3438499pfe.170.2017.11.07.07.26.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 07:26:15 -0800 (PST)
To: kai.kang@windriver.com, martin.jansa@gmail.com
References: <20171107052203.26227-1-kai.kang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <52a963e5-c4f0-e672-11be-395e010d21be@gmail.com>
Date: Tue, 7 Nov 2017 07:26:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171107052203.26227-1-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH V2: 0/1] Upgrade corosync
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
X-List-Received-Date: Tue, 07 Nov 2017 15:26:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/06/2017 09:22 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> V2:
> * remove gcc option '-fpie' by append configure cache value 'ap_cv_cc_pie=no'
>   to fix TEXTREL QA issue for linker gold. Build for both ld.gold and ld.bfd

thanks. I had v1 sitting my master-next stagging.

will update shortly.

- armin
>
> Kai Kang (1):
>   corosync: 2.4.2 -> 2.4.3
>
>  ...001-Include-fcntl.h-for-F_-and-O_-defines.patch | 28 ----------------------
>  .../{corosync_2.4.2.bb => corosync_2.4.3.bb}       | 21 ++++++++--------
>  2 files changed, 10 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
>  rename meta-networking/recipes-extended/corosync/{corosync_2.4.2.bb => corosync_2.4.3.bb} (82%)
>


