Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 90CFA719A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 11:20:35 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id z134so7210601lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 03:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=hVT9BsCBMGZ5bpRjCRqLnqnL204TrazOshOFmdFle4U=;
	b=PLCGAIk8EazraTSdu9CRX3czA2TvwPxYLxqv3Dv0dT8oMidYG+/HkJHUvjySNIiZDC
	l+d8Qsvkc5ENNHj9DUI1snea7+VCviFdQT22Vvo9JHHzEIb80khB5GRMdk1X66EFYlum
	IzDavRWq+9h+KJv7d7dDBNU91idfIthyVLGAPNApyr6wQWm1bviQNFB1JHP74ElBHaGL
	pH0vyIygIfaiYncUGo9tQroII+m7syI8tpdf9UolUHQ38/CJdsSwwKXjfiO0FWVX+3rN
	vRFzb1Amblyfq6F1mSWyTA5YGVxJy80W3CYUccf4FKvy4ulkZr+MTCC930izI/SXUe8/
	nXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hVT9BsCBMGZ5bpRjCRqLnqnL204TrazOshOFmdFle4U=;
	b=R3W6WzmUiTiUWTmpnwtOZaX2GeOEOsviCdscbmKs4y/JgYw0wInaKXm8Kij5KbcaAo
	kbvTLclKNpzS0b4nddYEySNWSWA/0opcTFM7C6Pl+acW63HEqgxFHp/OkCLb1ZhYx5r7
	E7WagTXfEgeYMVbgsyItSnMsM5VNxTnMQeyPPQNKGRPgssMF2kMW/m54xn6y9aZ4OsaD
	+7vJv1sSTlynJWVcnGaINOfVc00nr7+xTgc8h3nn5CIfFp334wn9o39iSsacdER34zNw
	IS8LCLHgGiYcoTwgDZBLseXwT0Kw9hRebkj/UBm8462Z5lvZWtZ3ZxtDgnpdax/csI+e
	Ebpg==
X-Gm-Message-State: AIkVDXLfE+apsqKKdkJOPQzuKd0AOfQrcrYnKc14sOWagpRkFqUCcDdHoB5Ful5Rgxunmw==
X-Received: by 10.46.5.196 with SMTP id 187mr4862114ljf.36.1484220034757;
	Thu, 12 Jan 2017 03:20:34 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	g201sm2221094lfe.21.2017.01.12.03.20.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 03:20:33 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
	<bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
	<20170102184751.GC3954@jama>
	<CABXoSoUXF7y7w76bH7pWZa6oPwXzOtcSKeyRhoy-dHWQqb+ikQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <d4475f50-e24b-6326-6f4c-c7fd21155e6d@gmail.com>
Date: Thu, 12 Jan 2017 13:20:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CABXoSoUXF7y7w76bH7pWZa6oPwXzOtcSKeyRhoy-dHWQqb+ikQ@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 12 Jan 2017 11:20:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

The release date for Qt 5.8.0 is fast approaching (current target 17th 
of January).
Would you prefer a v5 patch of this one or a new patch on top of v4?

-samuli

