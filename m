Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC6077FC3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Feb 2018 01:47:35 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id p5so3749931plo.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=znnrjjLD/Aw5rqVXeRJkf0QweSdFrcULwXej2JyeFUk=;
	b=qM1rtIP/uCFNyOaQcggeZf4fALi53yASHrHLsfgpb0RCBQnAoxLXo4YO5mH/WzjhLl
	tel42Lq72Yi66UM8mNWvsWvs59uSSph/xzbfmCcm0B5GWeWdmQqzybJb2fiFqduUwlK9
	OhfQdbNK+lEbeIZ7W0Nx5fTYmx6BxMBKpATxvP6eeBTAD29DhsgxsNMxFxJ5QBvwPqOJ
	w7M3J37kkAGG3aklnr6jLgRX9hyqDm8ZKWS92JsEn/zTuMwFIvSwA9cNU84gi9vjdyIK
	HPynV1+Z1tRS8aSSd1GSkaiIxIREP2dom6xVuHhasS9ymu3s3X0nVv8uBvajCWWxr2Ww
	Hl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=znnrjjLD/Aw5rqVXeRJkf0QweSdFrcULwXej2JyeFUk=;
	b=aTpnQfQKr+luMnw4AYL8XtVsPNH/cA7/oR4/tXQwa8cVxDLpyzhzWoBQL0mTA9ICOy
	zfvza/UlTmm1D0xLBHTrsKjSDzxRA/rIZywU8F1em8hUlaDODpnt1eEIuJ/z2wRsBXA0
	5r7BRCL7MYmyXliePxE09BU5TM/WiyzltHHnqt+WUXy9jxE7wLqqE7LOqliG9TLdiYVs
	qBqL6KiXez6ywsoIa/tBatP2v2xPtMbDgjxE/a/znB+zRStDLLQbSpL3HO3Z8r0Dw7dt
	2k//WfL1JjmaCZIU48PhLiSdduintAggbNnsQYGPvfCXMMVI3ECHEA2Xp0KzLxTK/Sul
	hicA==
X-Gm-Message-State: APf1xPBMjR2QzasFvbaIxPIfCZgcqjGj0+09cccGG9r2QNJcKXCB+CXQ
	oMRPM6M6KlTkfPT1TR8Bx3QJ00ha
X-Google-Smtp-Source: AH8x224xUO8FmDkc15Fbun5YUmT/0g2YhJba4NF82oHpUu3OPWoGAZFBbgAu/QYw98ZI5by2jc/EOg==
X-Received: by 2002:a17:902:a50a:: with SMTP id
	s10-v6mr7310349plq.107.1518918456853; 
	Sat, 17 Feb 2018 17:47:36 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:8943:d12f:600:d006])
	by smtp.gmail.com with ESMTPSA id d4sm1903174pfd.88.2018.02.17.17.47.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Feb 2018 17:47:36 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1518874632-22199-1-git-send-email-kwangsub.kim@qt.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1f1d405a-33ea-980b-994f-c0e83a2e7c48@gmail.com>
Date: Sat, 17 Feb 2018 17:47:35 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1518874632-22199-1-git-send-email-kwangsub.kim@qt.io>
Subject: Re: [meta-qt5][PATCH] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Sun, 18 Feb 2018 01:47:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/17/18 5:37 AM, Kwangsub Kim wrote:
> The '-optimize-size' option would enable the compiler to optimize
> for size instead of speed. It would affect the whole Qt libraries
> and Qt applications as well.
> 
> This feature is available in Qt 5.9+.
> 
> Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
> ---
>   recipes-qt/qt5/qtbase_git.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 4f3ade2..8dda6a2 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -90,6 +90,7 @@ PACKAGECONFIG[release] = "-release,-debug"
>   PACKAGECONFIG[debug] = ""
>   PACKAGECONFIG[developer] = "-developer-build"
>   PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
> +PACKAGECONFIG[optimize-size] = "-optimize-size"

We also have global compiler options which will be passed in. So perhaps 
it should check for -Os in SELECTED_OPTIMIZATION and enable this 
packageconfig by default if found.

>   PACKAGECONFIG[sm] = "-sm,-no-sm"
>   PACKAGECONFIG[tests] = "-make tests,-nomake tests"
>   PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
> 

