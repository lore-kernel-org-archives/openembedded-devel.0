Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A1A34770E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:54:39 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f65so38437806wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XU347zPbT6GEIAtdL+iYz3rWcebMTPLkHnSxqF94Axo=;
	b=QZR+thqhU+7q51IEXSBKhDqrHYKAEwFXJxx7nAjYBX4nL/TPAKsp5ZxNouZN0zjC2H
	uXx5SiEeGRzuV3Bm4ontp/JFxpeVBBfaO1D8kOg5XZleacLW19QmJP6Bvz7WKDgyRxHh
	ErP+5Zm2WJ14Dx7TfDH9wvmRC5zYoe8ynKh2H3av2nGYoO9ogaV7ehkakYGo4j7pizTl
	prUeBh5oKd5ZJj/BH5kAcfQzpEY0Jg3yucsx7NcZvBOCalk1pZ3TsjYvxtVfzkQINUBO
	AAOazIM1zuAy+u5c6Oe571mPEz/CXY/UfROaYiIioFmh2YcVQbCuqLcVgEcrmIRbnurk
	rE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XU347zPbT6GEIAtdL+iYz3rWcebMTPLkHnSxqF94Axo=;
	b=m0bdnwbp5zoQezC4gRzWbx+9ex5goersmGeUtPcXvo89N9q7qDEKAcuxLIa+90fpiy
	3faX7SQtHuFnGdF+OKXEKY/gDkaSlrP1SQpyzwaHBS5LqbikdiUZ/IW/J/yWYyugggPs
	deafaaSj/ZXREIkRTK/DqUvbdJ/K8Bg+HqqzaKhUf05uLVKkzmX6k8iH5U+ZVQqBT5HL
	Wz51JcmWcxHTPko1h1uEzfN98UfKARV+Ga8wHFwwH+gOBLsJXwgpPrYKkde7MhjmdFGq
	EoCWJf/Gply9CWxE46BC/yyi9cbTJNQrNFAAor8rjMA8Jwtq/V1EeV4RVpQge2Jl+8qd
	sRLQ==
X-Gm-Message-State: AEkoouujYvfZcbX1z3L6/hXwvZJMScRz6Qav+quBMfDY87yU38Siceh0Kyz5lKnh5ofOLdNhvkKiQoQ3ErpQ4Q==
X-Received: by 10.28.163.199 with SMTP id m190mr4551146wme.5.1470416079624;
	Fri, 05 Aug 2016 09:54:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 5 Aug 2016 09:54:19 -0700 (PDT)
In-Reply-To: <A052AFE4-6611-45D2-B559-73E38E398FCF@gmail.com>
References: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
	<A052AFE4-6611-45D2-B559-73E38E398FCF@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Aug 2016 18:54:19 +0200
Message-ID: <CAPybu_2JrgNVwE2bp8Rg=HpJ+hWZxWgFhJQvvgydsXN526uVNg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:54:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Raj

On Fri, Aug 5, 2016 at 6:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +
>> +diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
>> +index 3a23cd73633d..1fea1578b1d9 100644
>> +--- a/cmake/OpenCVUtils.cmake
>> ++++ b/cmake/OpenCVUtils.cmake
>> +@@ -76,7 +76,11 @@ function(ocv_include_directories)
>> +     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR "${__abs_dir}" MATCHES "^${OpenCV_BINARY_DIR}")
>> +       list(APPEND __add_before "${dir}")
>> +     else()
>> +-      include_directories(AFTER SYSTEM "${dir}")
>> ++        if (gcc_compiler_version VERSION_LESS "6.0.0")
>> ++                include_directories(AFTER SYSTEM "${dir}")
>> ++        else()
>> ++                include_directories(AFTER "${dir}")
>> ++        endif()
>
> I would rather prefer to see if need for -isystem can be completely removed.

I googled a bit, and they use -isystem to avoid that warnings from
system files scalate into build errors :S.
I prefer only modify the build with the compilers that crashes and for
the others keep the upstream behaviour.


Regards!

