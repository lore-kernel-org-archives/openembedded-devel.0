Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2487B6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 23:41:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id x26-v6so465996pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:openpgp:autocrypt:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=71NF508EdvwuoAi8OhjfKLyjmQyvaIiodCOQ1w760jA=;
	b=Ivwl6T0E9tYSBXGXqua2vIxQCv6HlL4X9bwqb2v0oB3D0pQY1IHvMGpPRURaNJzD5m
	9w6mQdZOC6xg5Nx1OK37qUFAK9TQhUEmol9wmtv6az1LN6cSVkQVv74Hi0jUC2oVnz0E
	szQPKmBg9PFGzl3WYV/IFwZ7UdaewUOHyJ9EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=71NF508EdvwuoAi8OhjfKLyjmQyvaIiodCOQ1w760jA=;
	b=fWBfUyoC6aXA5+JCVEPhQGQ1LhfbCNumHxgCi6XRLh5IUPL669MbV7a4EZmjDHHB5r
	gV/dMvHfH65g67dSEsM2E5wGwrIicjJyxVpQnCIuO/KadJCBXz51tUajv+PNt4pnwUkc
	wB4UZ7uw7n+5cosVGqBP4ebdO9KZW2xGmyhXsOeEhhaE4+CZplBNVANesug8hJFcK4vp
	P+NSuNYHF31LNK/eUBsYYS0agfpTYXBscaLTuDo/OAZiWw1veOMZ1qfDX4NRR+v62st3
	W7ohRleVhllxuxLzW3u5zQMYPQNluAFCqq44X9W2SHrxrPHANeDbuf4uT0EftCeHso+f
	WHJQ==
X-Gm-Message-State: ABuFfojVfhtq64gPhReQL8MsIo0r9V2My8Fj/uDrplkZpRK5ypB/JJbj
	NGGsbpIw6PuLcVIOVH24GJKHD2AtM1M=
X-Google-Smtp-Source: ACcGV61cmF7UOYuStVu0i+YIwcTonK/ZH2bzKy1xygG6hxuLM2phhI9mrSYfHtTjaDHBm6sJakSg9g==
X-Received: by 2002:a62:db46:: with SMTP id f67-v6mr8440049pfg.1.1538005306707;
	Wed, 26 Sep 2018 16:41:46 -0700 (PDT)
Received: from [192.168.17.78] (50-39-175-47.bvtn.or.frontiernet.net.
	[50.39.175.47]) by smtp.gmail.com with ESMTPSA id
	i65-v6sm310976pfk.43.2018.09.26.16.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 16:41:46 -0700 (PDT)
To: yocto-infrastructure@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=mhalstead@linuxfoundation.org; prefer-encrypt=mutual; keydata=
	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
Organization: Linux Foundation
Message-ID: <7ccf040c-e09e-74a2-560e-ee656c117b79@linuxfoundation.org>
Date: Wed, 26 Sep 2018 16:41:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Subject: http://layers.openembedded.org/ offline since 23:10 UTC
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
X-List-Received-Date: Wed, 26 Sep 2018 23:41:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The OE layerindex is offline due to filesystem corruption. I've
provisioned a new server and I am in the process of restoring from backups.

-- 
Michael Halstead
Linux Foundation / SysAdmin

