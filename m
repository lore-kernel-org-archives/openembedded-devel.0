Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74161CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:04:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.22521.1758740649502739214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fllEp+1K;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3194020e86so29399866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758740648; x=1759345448; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7+RTuW4hFZdy470n7hOHlZcTubNWGLtbOE3Rc2NcNBY=;
        b=fllEp+1K4JHabdYtNJ+wVGOkbS7eNDhJogTETvIG90mpl+IKbdanduT/2tC/k8o0Bw
         vKEWZVi6PdztLZdPQO58//8FcYSLTes4e1EfXk6mjQTGqnytyAZ97z/9pBBmNa3G30fN
         /9mupTets1UUb/8bxSgITHNav2S1lGw0fE6N8LsUpQvZqnQESYtWf5BKvenZ4C+hEflg
         ZuF9yNl4jd5ny3OoOQt6IGqPpk77wth8cGL1pdIZTPHrET+vBxTYloMLiY4Acq6LJPc5
         cSrmejNOXsOssbA7h1O0kL2p0Z/PBqq0Aaz1Yg7yJDFL69kft67ovY/JJVtCS7LEm85d
         U+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740648; x=1759345448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+RTuW4hFZdy470n7hOHlZcTubNWGLtbOE3Rc2NcNBY=;
        b=VA1RaniXqKWzcXeYUzCZElpQ2wJPxZVbF+9VDvG8W4jFG6KZRh9LnHhTQQXSQzFBqN
         6c/nrH0oBf44UAMdrtmOSOzJWSeMLpqC84vu2k0baXfG7dUUH+vaGXME1dmUDEx3KOVK
         kWGaWbSg+Bxzz3gKR8SZbJzoNz3HncVownwNh7+XMaGoKmspj42f0qT/3n4+vtzpCQIZ
         cJqbu1zxIe3luzattzdbZ9+Q8DBNkW0B6JJ11nVCg0At8FlPcuMraADtmdmvHGRXDwXj
         OKZfhfT76LFj+xmIbgPXDc2TnQ3BAMYjBwxtU8TBsC25vwNnl+3uAURSzWEMNlIWxgRm
         XQnw==
X-Forwarded-Encrypted: i=1; AJvYcCWwojNt/OqY7TIlDhAU+wa4M0wCrfL0Oaw9ez1SZ+DLP2HVaFcmiGwQqUUX+b+Q/65Tm+e7Ux/PEbpui4txdUJqbJ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzhIaVuorPQypYduLnrinfvHzcwJv00CLOT80YSZctbojjjeRJp
	Kcy2zM3NcMR0YaM7/9PknwyyOwMvfP0IdfPnZBIYen8dLbfcYd0jy0K1
X-Gm-Gg: ASbGnctKVtEJ/1tG2sxUGBoXw05efWrXFLGV7xxcg230LbjcatOE113wUxB4fTBx6Gg
	cwEqqviDzwh+QYLKYJrNESsHjUwrUzjW4788HnZlgUUP05RgRdJdmV6NuTsxdNilwdkqdOamRGa
	echVXVKD0MtHjQTCf4fivc7dcjItnfrVFbFUHpEYOlnqm+6swrqSYWSt0WtPAaU/DuMaxSu8wXT
	kWugkrV+EeJUNpiP941clgdApcFNtliWQr13jN89VA0NC89wGb8odr547BEK/JQxF4PhUlXwx/C
	YtqMsqamRvnObIc4Elym7YjhNJDQTGVb6jQULLY+NcoM4e3FUUdcTQYiVLddu0zAvIZ4WzXA3bf
	Srx+OC3Vq6BzyGrWH2Ah/rfajEzzqr9k=
X-Google-Smtp-Source: AGHT+IEXWHB+R9oV1Cfy2Y+Q6R6/rkKf0nEkfClcnqtSP/6kNGG9A4vJuqUmj5TF3PIuyh/MyRlZqQ==
X-Received: by 2002:a17:906:dc91:b0:b04:7880:3e8c with SMTP id a640c23a62f3a-b34bbbd9accmr80174666b.38.1758740647796;
        Wed, 24 Sep 2025 12:04:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f4173csm13555938a12.49.2025.09.24.12.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 12:04:06 -0700 (PDT)
Message-ID: <074adbe8-13f2-4d67-b804-2730da9ebd11@gmail.com>
Date: Wed, 24 Sep 2025 21:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native +
 nativesdk
To: jan.vermaete@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250924185113.40093-1-jan.vermaete@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250924185113.40093-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119833

On 9/24/25 20:51, Jan Vermaete via lists.openembedded.org wrote:
> +HOMEPAGE = "https://pyproj4.github.io/pyproj/stable/index.htm"

Typo: a lower case "L" is missing from the end - in this state it's 404


