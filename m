Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 23F8E7F8B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:43:21 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id r24so1045732otk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=ehH6X0XTMeixB4qIZcMvoNmlOOg9UnTXhaStHP6zWA4=;
	b=rI/m6dsLBQ4KLfYg0giJT2muChkLui2DV4fGSOvpl4om6NLWJMs+ssax094MSpIf+j
	q9Ayx7MqsHDJuNS3MTskZI0v/dqhDlQDXxjeEBMdFSmBXbeMocpVDgxWXUPF9Ncml+oF
	q/Noiaskzg2Gbht/uD/NgMGlWGV8UH7BPCvbMP31qR0fbZLpgxnJxYm7ImXzYmQ/wFM8
	sDqKQcQfqeEXPRKS/9ocFHyD0+u3LNYvPh5PBNvWxTOn9iiZBW+huWZrcJKU/6WAZYu6
	cu5J0WFGjmuvPD2ZvFolLWu3Y6t+RBZdOX3btuZl+kPPTe2+modYwoPpVeq2bVMWKnJP
	uVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=ehH6X0XTMeixB4qIZcMvoNmlOOg9UnTXhaStHP6zWA4=;
	b=lQJWJrWcWGCwcAY9Y09yhPfU3BAxRgcI+XOGNFWe2JFeHDihkR62llxKUtqDjpKvJM
	y3T/uBRe2Wgzzxc3RR4JQfffxfPEgXFqf/VuYAw4hvaFPf2XxxbbvWUlAdDKBmogqB7/
	ve99ESeuqEup5an3YZ1kkrIE8q+c62lUUgBCtuzSoFP09tNPFRCeVzaHhNiWJbaSfaHx
	VyeF5jHEDbmjFb4R64gK0upA2ObkEizVahjlRfyrMycpJdQUh7X/uFqcHhgn2ny16ctN
	Y16qehGyDdjNKVJFtGAWz+POxGoQNi/lllleYkZ/e8MiZ2yj+UCq+eRWhW9WD5oeyXXC
	1P/Q==
X-Gm-Message-State: APjAAAXLfgbuAkvE1NtCwKAfxSKtmaNxM0uYwrvXFPkuB8+VXrh8dcH2
	Me3fDAGhP+IpcbC/FtRQD26k7JKzf9WYRg==
X-Google-Smtp-Source: APXvYqys3LvZGneaU/Qmm1DnDiWKU4AQ9REhCH4bLnO9BXQvTzxun1yiEahmDbBtyjpMvpQs7Jr4lw==
X-Received: by 2002:a9d:3b76:: with SMTP id
	z109mr21400759otb.193.1572954202484; 
	Tue, 05 Nov 2019 03:43:22 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
	[209.85.167.173]) by smtp.gmail.com with ESMTPSA id
	t32sm6248179otb.28.2019.11.05.03.43.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 03:43:21 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f173.google.com with SMTP id j7so17237098oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 03:43:21 -0800 (PST)
X-Received: by 2002:aca:5955:: with SMTP id n82mr3432716oib.37.1572954200501; 
	Tue, 05 Nov 2019 03:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20191011212120.11453-1-alistair.francis@wdc.com>
	<CAB2nKc8MA7uLUxbJrzh-a48AHe66XoghYaGLxF0PRH7y45RiWQ@mail.gmail.com>
	<e3824981-20c0-b5e2-752b-e63ad6df771b@skidata.com>
	<CAB2nKc9VVvMDFKJ6oD972qV2grS5m26Mzg0tujFX-+Uqy7nM5g@mail.gmail.com>
In-Reply-To: <CAB2nKc9VVvMDFKJ6oD972qV2grS5m26Mzg0tujFX-+Uqy7nM5g@mail.gmail.com>
Date: Tue, 5 Nov 2019 08:43:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoRdkypab2kp+5oHMFOUoq_B879VApmfAtkE1ghx7Ti3A@mail.gmail.com>
Message-ID: <CAP9ODKoRdkypab2kp+5oHMFOUoq_B879VApmfAtkE1ghx7Ti3A@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] layer.conf: Mark as compatible with zeus
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
X-List-Received-Date: Tue, 05 Nov 2019 11:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 5:58 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
> Thanks Richard, no problem for delay, we all have lot of work (and
> hopefully it will continue)

Same here. We are focused on other customer stuff and didn't use java lately.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

