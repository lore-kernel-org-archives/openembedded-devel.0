Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 72EA174803
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:17:31 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id c11-v6so3577455plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:references:subject:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z9QJixRL4D2idh/gwHI9NTRcndqqkrUfJCJt/U/7kNc=;
	b=eGvn5p3+Fuj6RM0T4CvjcMwFBzxKrqB7IKamIVOTSHpKWboIz88EVZ3rhVdU3p/5px
	tMBipCrG20oJ58niG1RXcmXwJiZxiFVwfojdR/1sYiNjF8xaNwpn/kGlKjHsiKspN0Kx
	eDhbcPscha0I/AwEFG01GjosHyzzlqz8pGIPROpUAG5hznO7EQxpHKfFdJaCz4Fovo2Q
	xw6SvaTTrZ6K8WgY6FbXEQOqW/WLTdJCAvfu2KD8qI6a8xjsBIfPuvbyRvk4KWVDKlXv
	tCT5VS6TvNYK+0HYhjVPFPZlXPgmRoufK63+4JNr2wZp4rnNiHTvQiqJq6DeV12ryap+
	114Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:references:subject:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z9QJixRL4D2idh/gwHI9NTRcndqqkrUfJCJt/U/7kNc=;
	b=EuDY2TYdvL9lsG0X5+nFjRWsIh77zkqmsdBzS/+kOmYCMdMjqKlr6/Q/9ifwCGrl1w
	Uc4yC5U8Fr0g1Gy4E4N4IZ1Np6hkQ3Hj5RDBSJnSbTbqdUWF6kneKOmscshQkOd+pC/a
	52miGTcOT9JT7scO9MeLtemvcAdPJw6C0qQr+Q+orBhisEEWcTD9wj3ZF/kvlruMwHg/
	nWBw7AwMbHy/fxnVm8O4Otuv5OCWsbOT6UWUH/Oi49pDxsDcicarP9jTazfD5Wiero1u
	As8lfhV7PL5b4VfrBQzVzXon/HMEGRZy5t+uvBAIQhsAa4YjTuETjVNG5gmKEC/R9liM
	qKsw==
X-Gm-Message-State: ALKqPwfYQ/UN93xYdmtTWC1ElMJFv7lvFLBfsB0t9QHgE7QjL7HcP9+N
	Jtgn7yvoDQfh6kTcMq6OF8mfLbZa
X-Google-Smtp-Source: AB8JxZpCXVOkYyleIsPTQqP8uKFlLwjFOuPEQwvD01paeLaxU/TmZBvdJP14EAW0nvT259XAUMn9Bw==
X-Received: by 2002:a17:902:780a:: with SMTP id
	p10-v6mr7391370pll.281.1526606252066; 
	Thu, 17 May 2018 18:17:32 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:50cf:a971:a3cb:56ce])
	by smtp.gmail.com with ESMTPSA id
	h8-v6sm7769417pgq.56.2018.05.17.18.17.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 18:17:31 -0700 (PDT)
To: dmitri.vorobiev@movial.com
References: <CAE3k13d8N02kfR+VmpXRZPywTdU1Rm6vaRhB-gb29G4Hqbo-kw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <49c90165-022b-38b9-fec7-79c492777951@gmail.com>
Date: Thu, 17 May 2018 18:17:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAE3k13d8N02kfR+VmpXRZPywTdU1Rm6vaRhB-gb29G4Hqbo-kw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Fri, 18 May 2018 01:17:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dmitri

Can you rebase this change on top of current master and resend ?

Thanks
-Khem

