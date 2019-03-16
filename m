Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3EB600BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 19:51:41 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t82so10022562oie.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 12:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=HxHrIT446NdxLuUPRWflN2jsJxhkpIlUOs/qIpZDxbY=;
	b=dj06XIkP+JwxkKYcAv5LFBr5xKAMFwF772qIsZNHdbkqAWJe5R5cRJqPzJsDIlixxR
	dGS+Nhtf94+LwfDHns+bBRaYLeq8SiRRdfXx8DOLqM3bDdPlkSOX9Iz8by32ty/ZCK2b
	7r2Gz49cS8l4hqaSlYMt6o52J/pImZ4rL6JwkwmIi66Zm+RGAbXpfkUmHcaKclUk2k9X
	rHjOTeQrT2GSd7yxL7YEjiILRpx6ZeeOFrijYjyXi9xpAUrEZW1VEEOD+QXoJnhGqi4U
	hT1rTB8szI0wvAYMByxN4Zw3rxm8RYJOfSZIoRW/WJ8uu0lDLdv6kOSvE4IlS8DgySO8
	FDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=HxHrIT446NdxLuUPRWflN2jsJxhkpIlUOs/qIpZDxbY=;
	b=NSdlEWHM7xuXKyuRGDl0F712g1GtK8SOa3HIx/8rhBJplpaQT5mOnN3uRva44WBCzP
	gIFwDjI3byDHdX38SJRyx3SqEGKoXqufYdYivwrOcC2V1UUHxb+npLEJKmctITH5Nz6L
	pW0aJ3DSnQCIeQUe543Y1ID4WnnJ1MVJ/r334+PJluMJAdIvC+MySLoKIqhquBCoZPc6
	i90Rv3fVAohRAyR+wnrw3qqMHoJRMu9mgaQZyLJgjRb9sF5au71r1L09ADV/2TJgGF14
	wRgLPTNVPMb6c4jat4jq7Oa0+4QSUqIDBm25/jqWby2YiAhKHYaoeELg85UuPG1BEnbF
	O7Xg==
X-Gm-Message-State: APjAAAVUEkvYXgSG1VGHZB/asqkdaEXFAwi+6zCBsrhAQj3FSo6S13fP
	9nVqm6vTb48TVfYX61m5QVHOBnZ3SS1xBg==
X-Google-Smtp-Source: APXvYqzSWKC+w3psqPv7eHHz0HgHzqmfyXryS57h7iKp6/FQbjk1agEM5gQdba08zKo4M5Zg54Akmg==
X-Received: by 2002:a54:4f0f:: with SMTP id e15mr5171244oiy.66.1552765902261; 
	Sat, 16 Mar 2019 12:51:42 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com.
	[209.85.167.176]) by smtp.gmail.com with ESMTPSA id
	o17sm2087792otl.27.2019.03.16.12.51.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 12:51:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f176.google.com with SMTP id t206so10054649oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 12:51:40 -0700 (PDT)
X-Received: by 2002:aca:ac45:: with SMTP id v66mr5029929oie.134.1552765900025; 
	Sat, 16 Mar 2019 12:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <1552692315-22023-1-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1552692315-22023-1-git-send-email-peter.griffin@linaro.org>
Date: Sat, 16 Mar 2019 16:51:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp0e=g=Awom-aqRKmP-QXwCL-Rr=JM31PQ+avQcMCb2jQ@mail.gmail.com>
Message-ID: <CAP9ODKp0e=g=Awom-aqRKmP-QXwCL-Rr=JM31PQ+avQcMCb2jQ@mail.gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: stanimir.varbanov@linaro.org, Denis Carikli <denis@eukrea.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] chromium: add 2 fixes for v4l2 VDA support
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
X-List-Received-Date: Sat, 16 Mar 2019 19:51:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

On Fri, Mar 15, 2019 at 8:25 PM Peter Griffin <peter.griffin@linaro.org> wrote:
>
> The first patch allows GpuVideoDecoder to actually get created.
> Without it chrome://gpu report hardware video acceleration is
> enabled, but actually ffmpegVideoDecoder is used for the decode.
>
> The second adds NV12 & YVU420 formats for all ARM platforms,
> otherwise V4L2 VDA on dragonboard will error with NV12 buffers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Thank you for working on this; please open a PR on github as we have
been using it for the layer as a way to get more people to contribute
to it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

