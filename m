Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 408187FCB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:10:06 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y4so10802120ljj.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=iSyvtKkoUTa3/mtCcxXxEwo4Y6KD8rDEfaXMfDf/TIw=;
	b=k3SC/WYP771wHSCr9Hk6J29Mrn4yYDNhtqDcNspIDJrw7DhfhNftmc74PSmQEDvW1h
	Psar0INKvgCX0jkHpuRHmLlFuliS2XA4EZbweHQFQhA/vEgYuZUg8bbGP55aNEbojn7V
	PLNB43eYemtHmyfbaAC8bdyfN9Y1XOaJLugLgQNX795Cfy1R1zqiI2ZN5q0EDCJoI3Hm
	UO5nE0kaQKGLe+QRHpFlx1n1yBLO0LD+Os3DSaDy1MvJQYBdCOmtKnIHEFKKPeUL6+CL
	2roJOZ/l/VRwENHmaEyr5TJF8tVsx023jcjMb/9CtbUEMaIzD4NvSv76tUrbYg1Bv2bS
	6qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iSyvtKkoUTa3/mtCcxXxEwo4Y6KD8rDEfaXMfDf/TIw=;
	b=GL6YCcBkormL4w7UdjT8jT4GsFla/PMt8RelcUEBhLcxEI5ic9PW3eKMLGEncyfADQ
	97bVknZiDE4bjl4BCcPG4SwDdsqWGAi6d+qpn8o7hCPEd//Po5cfxXNH2ab6cZRP/Aw0
	nP7ZYUjqwHvtR2FwZtq6klamU2nYj6NLeLSqe2reDOWQjVxpgLc/ZrURLhAVsFJtMoyb
	+Cz0Oq6CbvYf4Wtucy/1tG+qeH62Vn2PBIY2HyoBkGY1UuYRzzxU56edvX2duxGYrC8d
	4S2EnKfzuw5uhaXcmUgOu9gejByyHIvNKjGXp56iAtjEFbRfWtwZ7Qu1U9qnpFey3kgW
	9LOw==
X-Gm-Message-State: APjAAAVngYlo1BxuSL5wxsirlJ4bpbiCvbCJBGR7wpUesY4/DeJSOLMU
	A0K/FBHS7nbE5xs840Irp03yQzBp
X-Google-Smtp-Source: APXvYqwN3sS8CM+TxM8YkshL9FTcuw1LpVA/6nz4Id5f73Iw+iHrI5zgrqf+tuWXP6or78z6aCwuNg==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr10097954ljj.270.1580134206736; 
	Mon, 27 Jan 2020 06:10:06 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	g15sm8202080ljn.32.2020.01.27.06.10.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 06:10:05 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Richard Leitner <richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
Date: Mon, 27 Jan 2020 15:10:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127112451.165555-1-richard.leitner@skidata.com>
Subject: Re: [meta-java][PATCH 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Mon, 27 Jan 2020 14:10:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/27/20 12:24 PM, Richard Leitner wrote:
> This series updates Openjdk 8 to the latest "ga" release 242.
> 
> Successful testing has been done on a fedora-31 build host for
> qemuarm64, qemux86-64, qemuarm32 and armv7a.
> 

<cut>

I don't know if it is related to my setup, but "bitbake openjre-8" 
insists on rebuilding itself every time I run it, and I don't see any 
sstate cache being generated for it.

/Jacob

