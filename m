Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7F59074BF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:12:07 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id b10-v6so4377263pgq.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:openpgp:autocrypt:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=R5s2GpAfk+FxG2GpPmIu39Vp03iVcjQRAyRZrkksPhU=;
	b=IlfIZGvlMosaX6zjhejFXnf8um9opjJp0JFOFBhQFlRewbMlKV0jNdjtd/hV5Lxvsy
	AeMFuR8PqP7C1j1z/h4412D2pV1zuRPw7Cmekian6fFGPtkBL40EpR4gQ+oxA9F23QjI
	x/wekzsD3UEnXisYiwbP+Dt+aDibsGtMKh6So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=R5s2GpAfk+FxG2GpPmIu39Vp03iVcjQRAyRZrkksPhU=;
	b=tcHr5dPNMvqhLBiRXEiUEJb6EO2JZ6FYyfJviMMOjp8XaXnVTrzz7o0qEZKMdkunGT
	5hwzqWaBNcQSYYUme80Sr6hRBb/ccNhrfJlAfiJJPNq3vapeN1ihK6sbvCs1aKT4WXL/
	Oy09t5RBzhBUJx2YUuqGSNynklVPqDu7H+0Zx+4btnjngGBnqe6Dj+1XWmB0+un+wAp0
	akXw0FW223P/lU0OkkTzXLyfuv5oXEKymsMbz5jiQnbzntWx3r6EAeT4MS6MReFo/BIy
	E5+G2I2oCu8KKamFJXvA2EtDnPeejfakxKPD9DmODMwKUecg4P2uasbvgYveMF3/F8JI
	SV9w==
X-Gm-Message-State: APt69E3nCJPudhZJJ4w/0cxqXOeN8mAgMa8quJ7maDGkVB9eNMirTllz
	WjSmus8+jR44fVY/dbD4vLusjQ==
X-Google-Smtp-Source: AAOMgpdQu6/kV1Q8WaUJfx2CPv40BE5Xyv+5cmVaNbOrR8kiS1Uz3nINXY+gqsGRc9tzwyAzc3z/Og==
X-Received: by 2002:a62:11c4:: with SMTP id 65-v6mr6726120pfr.54.1530299528382;
	Fri, 29 Jun 2018 12:12:08 -0700 (PDT)
Received: from [192.168.17.71] (50-39-175-47.bvtn.or.frontiernet.net.
	[50.39.175.47]) by smtp.gmail.com with ESMTPSA id
	m16-v6sm14215211pgu.67.2018.06.29.12.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 12:12:07 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	yocto-infrastructure@yoctoproject.org
From: MIchael Halstead <mhalstead@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=mhalstead@linuxfoundation.org; prefer-encrypt=mutual; keydata=
	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
Organization: Linux Foundation
Message-ID: <7320f3eb-52a3-7462-e073-8ef1c9fe0716@linuxfoundation.org>
Date: Fri, 29 Jun 2018 12:12:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
Subject: [Infra] intermittent timeouts for git.openembedded.org 2018-29-06 14:50-17:20 UTC
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
X-List-Received-Date: Fri, 29 Jun 2018 19:12:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

The infrastructure under git.openembedded.org had routine maintenance
today. It caused some sharp dips and spikes in network throughput
between 14:50 and 17:20 UTC that may have caused timeouts for end users.

This maintenance http://status.digitalocean.com/incidents/0bpv6q6bl8w0
lead to the issues as far as I can tell. I didn't expect this to be
noticeable and so I did not announce.

Everything should be working normally now. Please e-mail if there is
continuing trouble.

-- 
Michael Halstead
Linux Foundation / SysAdmin

