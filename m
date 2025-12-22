Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03533E677EC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 15:54:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82690.1766418838399131861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 07:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDpGd5TU;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: skandigraun@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-595825c8eb3so4374666e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766418836; x=1767023636; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPtSCggb5BhMz8+v2+//AciKtYHitEDvcpB81asbMZM=;
        b=jDpGd5TUoapONy5Y1Lga2iQjJhGpVP6DB1xTpnoxoWs2uQxnkBwwLFdYm2H97PgFoE
         bIEMSmDSCaq+FuxmvqG+73qf80lJIDO4FB4lTbCZVWK+0VZByje8eDXEwrWCfyDkIZOu
         J7GoQpr4UqYQ9g/CDZ3leKo72SkZ4/tPiKQs/tCL3SromN9Cv+Fyn2iESRYnCYqeIq9x
         V7qe0ekbZVhbSIgKxdJX5czCT6mnU94K9oSPr7IikNx13/Wwm9e9x+IpCJPBVJ4RFO+R
         rUvpBIY6WAzPDVivUo63UeKrhwrNtlF1SaUEGubug1EFShdj1W+Thwv1utNSDrCwK9gt
         jA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418836; x=1767023636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPtSCggb5BhMz8+v2+//AciKtYHitEDvcpB81asbMZM=;
        b=h/dd0sB7E/aqjk4tFeVjugKXjUz/SR29YaXzk6wyecUN/pA8LbHxRdq39nIlFDDpQl
         f/wr0wYdE6Nb5XTPZmn2z1oFC6Zb5oyt4XlqnM0VhB3ApsQlKI9a6n/49jjNYE2p1EXF
         XSDH1af98krDTN2ZFWIk8DnrWHHxGk+Z1xRU3SV6uYNvzsPWEhK1dtAm+DfHPvGWX3+l
         1LI46a9x0cTVwKCGO8L1MWommkqdGfYSvKAUei0MS+wjyvUgjIxgAhXXdHJz+3zYS2GN
         qj7eC8KS/qPNllRLS22LlpsDXBXG+HJ1Sm7Dk+XbvNiD6UvbWIBMP7omeyYNfnMOLmSH
         iOcA==
X-Forwarded-Encrypted: i=1; AJvYcCVMeneamY2qUsvsS2IWTEzS+sI5G1PZ7BFWlU4XtxlHIgWUuq1hIl43l92I2JXqK/Iqi0ztZlCOYex9RLGtfTLWkeA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAC2xgdiPfL7IcQ4LmayqTZZhk0RajcJFWEmJWYekwdrKjFNhQ
	Az1Tj5AOU+QZKzkBYVfwy/4RKirYBwCUNIxJ2kInyDxWTukmfJoT6+3u
X-Gm-Gg: AY/fxX5/br4sYZCY2KzXAt8Jr5CDeqBFO7SKGNXCPj1RhovLhDQgPNx2E8JNHbQSzW5
	ncazlqBituTrQzclfenUbRoj2sH7UvTJVNjh31n2Gmo6dMmJp6at5kcHlB7OeJxEhCfyj+DdMMm
	bOPQMNPkcau0GOM/o+PFHOqjPiTbDSs9nWGo+DhWEWgL6u7xu+jhRmbq/03DBBPkqyP9UZgj6nu
	k6+qto5pXQHnm25v29yQ8VzNjh2aQm5nArqdk3yBjlxLY3JruPZQn4bxvUmEYXQ1sWyt1rGJlix
	MbRDW/R3t65R0hC4WfSEqXk7mP3ss1c4EqlWp/MpkgTJE5OH8Y6/T7T9WewH+W+Ejjdacf/KzMo
	3O/Wnt1P1Uto59+/c1NA++9lspNCmh1/NeOcSDDMkpPVWFxHxF6Wrja+tUNBkyfxdzRqXFt1XyN
	2oTV6m9PbaRKFn1YQF9NI=
X-Google-Smtp-Source: AGHT+IG5swlWMcIRoXRnUUG+wMamOtq5G8bP/pIwDR5kAlhltj5sKcHrlarF1FmzF0R96CLeXmxAig==
X-Received: by 2002:a05:6512:33d0:b0:59a:10a1:19d4 with SMTP id 2adb3069b0e04-59a17d64ef5mr4109082e87.50.1766418836190;
        Mon, 22 Dec 2025 07:53:56 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd7d3sm3215128e87.27.2025.12.22.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:53:55 -0800 (PST)
Message-ID: <48f91861-0626-44b3-9848-8c512d95d8af@gmail.com>
Date: Mon, 22 Dec 2025 16:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded] [Scarthgap] [PATCH] p7zip 16.02: Fix
 CVE-2022-47069
To: vdabhi@cisco.com, openembedded-devel@lists.openembedded.org,
 anuj.mittal@oss.qualcomm.com
References: <20251211113342.3552509-1-vdabhi@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251211113342.3552509-1-vdabhi@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 15:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122792

Anuj,

Do you see showstopper issues with this patch? Or did it just fell
through the cracks accidentally?

On 12/11/25 12:33, Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE
LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Vrushti Dabhi <vdabhi@cisco.com>
>
> Upstream Repository: https://sourceforge.net/projects/p7zip/
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
> Type: Security Fix
> CVE: CVE-2022-47069
> Score: 7.8
>
> Note:
> - Commit [1] updates complete p7zip archive source for v17 and includes changes
> that fixes CVE-2022-47609, adapted fix related changes in current p7zip v16.02.
> - Similar changes via [2] have been integrated into the upstream 7zip package,
> which replaced p7zip 16.02 in OE-Core master.
> For the testing:
> - Verified fix using steps mentioned at [3], trace not observed.
> - Validated against known malicious ZIP samples [3]
>
> References:
> [1] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
> [2] https://github.com/ip7z/7zip/commit/f19f813537c7
> [3] https://sourceforge.net/p/p7zip/bugs/241/
> [4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2022-47069
>
> Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
> ---
>  .../p7zip/files/CVE-2022-47069.patch          | 63 +++++++++++++++++++
>  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
>
> diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
> new file mode 100644
> index 0000000000..586c0e82dc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
> @@ -0,0 +1,63 @@
> +From 633f61e2eaf6530cf7e53c702c06de1b7a840fa7 Mon Sep 17 00:00:00 2001
> +From: Vrushti Dabhi <vdabhi@cisco.com>
> +Date: Thu, 27 Nov 2025 01:36:55 -0800
> +Subject: [PATCH] Fix out-of-bounds read in ZIP archive processing
> + (CVE-2022-47069)
> +
> +Add bounds checking and replace unsafe pointer arithmetic with index-based
> +access in FindCd() to prevent out-of-bounds read when processing malformed
> +ZIP archives.
> +
> +Testing:
> +- Verified fix using steps mentioned at [1], trace not observed.
> +- Validated against known malicious ZIP samples [1]
> +- Changes merged in upstream p7zip via [2]
> +
> +CVE: CVE-2022-47069
> +Upstream-Status: Pending
> +
> +References:
> +[1] https://sourceforge.net/p/p7zip/bugs/241/
> +[2] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
> +[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2022-47069
> +
> +Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
> +---
> + CPP/7zip/Archive/Zip/ZipIn.cpp | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/CPP/7zip/Archive/Zip/ZipIn.cpp b/CPP/7zip/Archive/Zip/ZipIn.cpp
> +index c71c40f..84213b4 100644
> +--- a/CPP/7zip/Archive/Zip/ZipIn.cpp
> ++++ b/CPP/7zip/Archive/Zip/ZipIn.cpp
> +@@ -1095,11 +1095,11 @@ HRESULT CInArchive::FindCd(bool checkOffsetMode)
> +     
> +     if (i >= kEcd64Locator_Size)
> +     {
> +-      const Byte *locatorPtr = buf + i - kEcd64Locator_Size;
> +-      if (Get32(locatorPtr) == NSignature::kEcd64Locator)
> ++      const size_t locatorIndex = i - kEcd64Locator_Size;
> ++      if (Get32(buf + locatorIndex) == NSignature::kEcd64Locator)
> +       {
> +         CLocator locator;
> +-        locator.Parse(locatorPtr + 4);
> ++        locator.Parse(buf + locatorIndex + 4);
> +         if ((cdInfo.ThisDisk == locator.NumDisks - 1 || cdInfo.ThisDisk == 0xFFFF)
> +             && locator.Ecd64Disk < locator.NumDisks)
> +         {
> +@@ -1110,9 +1110,11 @@ HRESULT CInArchive::FindCd(bool checkOffsetMode)
> +           // we try relative backward reading.
> + 
> +           UInt64 absEcd64 = endPos - bufSize + i - (kEcd64Locator_Size + kEcd64_FullSize);
> ++
> ++          if (locatorIndex >= kEcd64_FullSize)
> +           if (checkOffsetMode || absEcd64 == locator.Ecd64Offset)
> +           {
> +-            const Byte *ecd64 = locatorPtr - kEcd64_FullSize;
> ++            const Byte *ecd64 = buf + locatorIndex - kEcd64_FullSize;
> +             if (Get32(ecd64) == NSignature::kEcd64)
> +             {
> +               UInt64 mainEcd64Size = Get64(ecd64 + 4);
> +-- 
> +2.35.6
> +
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> index 31a12fdb04..3ac0ed03cd 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
>             file://CVE-2018-5996.patch \
>             file://CVE-2016-9296.patch \
>             file://0001-Fix-two-buffer-overflow-vulnerabilities.patch \
> +           file://CVE-2022-47069.patch \
>             "
>  
>  SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122584): https://lists.openembedded.org/g/openembedded-devel/message/122584
> Mute This Topic: https://lists.openembedded.org/mt/116727783/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


