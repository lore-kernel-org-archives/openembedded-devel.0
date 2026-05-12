Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D0FCD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 06:33:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69522.1778567594522818237
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 23:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I/mBV9YP;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a044cb827so3996370f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567593; x=1779172393; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eo2j9B/nzOyhZVomXVQM7ey8W3+BeRz0SQVe3JirYtk=;
        b=I/mBV9YPoCm7iPY3dC8CZXl7qIZQ9t9h3eQJOJOODjgPVb6iE9gbHwYdezuF60/6SS
         s63X+hTFEQGIJThyBHYaHzvJCeUlddCfTkyVOg94f/FAszqKLkJaIzsbj2Qnpe459GSx
         XpEelvUZ1nQrH9K52S1MD0YjbMF36ylPNgVC6phXVi6H1SM0W1UY4jXVGco5JnGn/br7
         3ZUhNLOOcKB7u5EmAMrogIJpofgnXj1HJBvGuTM1xQxJ+rYl6EXrL7ZZar3wb/XEawDz
         VRpdj1gBXgWUBDDDotjtcvJNkWb0BOfsjHqjc+MqmMIrGVvKuKE51fqFxdZ08RQHJXkF
         94kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567593; x=1779172393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo2j9B/nzOyhZVomXVQM7ey8W3+BeRz0SQVe3JirYtk=;
        b=JAG71z1FmzgZSeMYcnXijSlYftFR+l2XYDnUbwf6bVl0uu6FbPtxkFlPX4Wi9uKPs/
         yT68OJmtn3J3yAM/l0jXpTRNAY96Q4RZColgO/Gzvzy2N+nf9qWPjk89lfGw0zVuajno
         sFzi6w7nYUM0yvglwxx1U4OaYs9XuV0osh9zxTHjq2wJ7Ro2z7yCYzJqgNwZ597bbLKV
         51ev6t08iFbP4EfqdGn8yYJCmGdPrSEpuLtAOLiUzzg6iMvovAlZDR1jMpRAu4uW4ZB1
         5POkZbAAEE3o8Wcd9W8LD7pDpGSp7T9RkES4RCHei/VraIrIk3HeOSd3AiI0iEJeacKi
         41Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9KeM9gZzeTw0fhoIfaTrXTPl7LD2UL000iqBL5Y7uFp7K0cDWmqobWZNtK05UoSVHGQyn50eqBVgaKKzkzDlq1z5w=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXp3Y8Xf+mTu/OU2Xhn/MZVwPwrmPUpSYwxjQLyjaauiPBAlT/
	OCSgCmIPMmnQsn+stE40Rah1ai2RqwB7E6aoDkI7yBmnta2FmYF7X3yi
X-Gm-Gg: Acq92OHCGTUxhukUFBYmJgOR6CoDz3eQ45hZMDAEWZhMiLDbFo1sPucRR9dE28bRYv9
	BVN+b8IaLJbSvYq4jjjxtu4M/1GY9LKcMFgkSvqOZ0VvPSklGTuTqn1va+ILwqlORdLS4iAzujA
	p8vaxQ97JXHg5hR6Y+7tZqU2VNqvdQCxP+1LOx5ey5yyFs5RTDKEuSXC+deKgFnHQjYFLyJuXRK
	QFF2ctIAfZsjhmDR5FP1UwAvNazHnXEEf25ZGBDs3TTqSdBfXmQLNOJmu5GdZ262ODXKyfBCXCO
	0k//klxsWV4wcg6jQxy5q+ZFowGJFKL05xxamJ7JGI+wTU1fho0lPGjCh13iRavwDVC1UfKcelo
	Ny+H6J6rcpwbT3RgWVvhE21CMQeQwO+Qu5Qlo2GFlXOaREZBesegr9aiu/3MOXvF51QpwJrnOx4
	NziMFfDq+tEcJdBAe3s9bECPq09oz+zxU=
X-Received: by 2002:a5d:5f44:0:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-4515ce1c99cmr45015477f8f.25.1778567592557;
        Mon, 11 May 2026 23:33:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454917d57aesm30757406f8f.26.2026.05.11.23.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:33:12 -0700 (PDT)
Message-ID: <edfa4f65-bb88-4893-8470-e07e0b33334b@gmail.com>
Date: Tue, 12 May 2026 08:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] yaml-cpp: remove +git from version and add
 tag to SRC_URI
To: peter.marko@siemens.com, openembedded-devel@lists.openembedded.org
References: <20260512062608.22940-1-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260512062608.22940-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 06:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126858

On 5/12/26 08:26, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> Last version bump did not do all necessary changes and kept the version
> saying it's not on tag.
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
> index 5233c569d2..dafe6e5da9 100644
> --- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
> @@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
>  
>  # yaml-cpp releases are stored as archive files in github.
>  # download the exact revision of release
> -SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https;tag=yaml-cpp-${PV}"
>  SRCREV = "56e3bb550c91fd7005566f19c079cb7a503223cf"
> -PV .= "+git"
>  


This PV change should happen when there is an actual version update -
otherwise version will go backwards after this patch.


>  
>  inherit cmake
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126857): https://lists.openembedded.org/g/openembedded-devel/message/126857
> Mute This Topic: https://lists.openembedded.org/mt/119270759/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


