Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id C0E6177DCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 22:10:44 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 194so39097563pfv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 15:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gOSyoKfnj8/jj3B1S1WaPYSO5TpLI4VL0u709SQ0Mj8=;
	b=JeQbf3IL8q7oytmeDZhG0DNIVUgmy7S1Uf8/CDw1xKL1ZtP8kcDmgmOXFln2R28OO8
	FbRBeg02xaknbYvWbX6hcxIZMLS5T4CtGedxj2mlJevftHfin6AIXW6ce+k1K22+9ngy
	nlMunN+dtiRzzRjX7mNya43gro3c9eHiMERYARk265sPCofhtTu2PZm59TYbDO/zoMHq
	ijrdLDfjUfBaSTkJiv+2g5r3ohieh/8+/T0VAYPvjpeyBBoYRLdevX2BcTRh3EATui8k
	1Y5v5fBI8eLTPBqV7xXIYfPF+UVTgxqyY12jjPTxtlxTvCp/JuPX53abrPGYHYYz18jN
	gWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gOSyoKfnj8/jj3B1S1WaPYSO5TpLI4VL0u709SQ0Mj8=;
	b=TRIDUWDsUWTwzdGKlVdT1qGLEaW67FgMgEVXGo6J/G0zJQLjuvaCE/yYM1+Yy7607E
	eyc7ryXDb/LM5Fs9WG0uY05OfsjmKw52/8QHFDv0ieIkx8aQ1Qt2Hwp7jy7u7doK8KGm
	+EalFcBze31f42xKASLV8n224j2ZDjc/dYN0sQh1gQEUT9/DvzFUb7EIcnFngdgYNs9V
	fGdSuTIHdG3C9LL2sgt2JG4Ub6fOrrtUQQqsnZhZtqJnVGeLWBIZ5a85s0rdoJ9F6vGo
	GPMklQawG03yHe4LczpUKfS1n4GS4navezQYLA6DWvnTkMMNooZ7Ru/97rxxBLR3X5AS
	yNjQ==
X-Gm-Message-State: AN3rC/6R3NyUN2q5ANYG2EEygovObHkXaucKIpIVouzbmGZqqSz5ubml
	i2k8c97Nr7F6RHlc
X-Received: by 10.84.210.227 with SMTP id a90mr3586118pli.136.1493331045726;
	Thu, 27 Apr 2017 15:10:45 -0700 (PDT)
Received: from [10.16.32.196] (207-114-172-147.static.twtelecom.net.
	[207.114.172.147]) by smtp.gmail.com with ESMTPSA id
	c90sm7374604pfk.96.2017.04.27.15.10.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 15:10:45 -0700 (PDT)
To: martin.jansa@gmail.com
References: <20170427211851.10351-1-andrej.rode@ettus.com>
	<CA+chaQc63KW_k+bcTj0pNL_2ztH=aHzPh4SwkbXO4y44ijhvOg@mail.gmail.com>
From: Andrej Rode <andrej.rode@ettus.com>
Message-ID: <62a58489-c7a3-809a-76a2-6c7ab4cb14e4@ettus.com>
Date: Thu, 27 Apr 2017 15:10:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc63KW_k+bcTj0pNL_2ztH=aHzPh4SwkbXO4y44ijhvOg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v3] python-systemd, python3-systemd: add a new recipes
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
X-List-Received-Date: Thu, 27 Apr 2017 22:10:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/17 15:08, Martin Jansa wrote:
> All 4 changes were already merged, please rebase and send what's left as
> follow-up patch.

Oh, last time I checked they weren't, sorry for the noise :/
I'll see what's left (:

Cheers,
Andrej

