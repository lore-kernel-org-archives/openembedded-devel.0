Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web08.6089.1605195826616167336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 07:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kOCo0Ht7;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id y11so2930653qvu.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2020 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLhpi9SEwAEkOscHQlmKamy21JSV0GzTpvdqze+qLiM=;
        b=kOCo0Ht7JF+LUpYF9kYjbqTD83vN+dJqxeiolaj1jSQ+uxv5K8yPBv4VixcKtFr4yG
         aOut6cAnuJjiC5ewzFWS/6LWoc3qZbj+zsjzJSttivmalsrsrc0AurTpid3dbBuxHkQI
         vGHSwWkR28sgXZqM923JvFg4wOcxCf5417+5YhzmvyovQQWGu6L5DRfz3n39ntwaTBMA
         my53vkpkRAvjNhcyJColi8FxH+FgdYg8wQCHzBqz2Dr53OeldkmOhZZU+NibzqLh/Di3
         eu8dJ7kc5oW0HYUX83ZUpiVife6HxO8P7ocsCr3nsKCTSseTx71G6HxwjOBldx3fbcN3
         jtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLhpi9SEwAEkOscHQlmKamy21JSV0GzTpvdqze+qLiM=;
        b=V9/zxvL1gafOeJ4JWlfT1Ln9i4vjH+/l+MPU2HCE2Kz7vKU8k8B0GFCqsQmQJfI2Mr
         sRDjbaIMOeys+URSjvZEbHAP3gOXyVMOxYyY4SoOnlTb2AFQu/c15j2gw088p4+A90Uj
         jSxJkS2/uudHpZehVQ7Ls5IZxZOkbo81oNVhoAYylYY+tQjEmBt4tTJ4Vflsv+Gz+J0b
         cH6nQsOh8Q4aqOzPdesPc2y+PpdoHamrylR44mmjcuwevAyNftuwOud/oXMMDNqSI+19
         08FPdAcTE7MW4bZR6H9EiYbMNAGiULxcBE9X60KabNVBJ3UIIcTRMzydsXSLLzYOu9CN
         Zicg==
X-Gm-Message-State: AOAM531BRMgV2F4kV8V9PmxgW1hYb3Ca+xBrbCIdu2ek3B57Hkw3A6o+
	PdAu0kwy0H85S7DRkYHmXUkVMXy800sx6dsQx4+ga0Wczkc=
X-Google-Smtp-Source: ABdhPJzHdRvvqlyE4ZwdnDqCPfkqh9Xjxq32eZz4b5PvGVkhHsVLXiSbZWIRcDSJk8ERcBfcdawPoyDMxMasSO0COVM=
X-Received: by 2002:ad4:4052:: with SMTP id r18mr353108qvp.38.1605195824598;
 Thu, 12 Nov 2020 07:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20201110191114.2682229-1-raj.khem@gmail.com> <4cb913fe-1cda-5cbb-9726-9ca6187f8853@windriver.com>
In-Reply-To: <4cb913fe-1cda-5cbb-9726-9ca6187f8853@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 12 Nov 2020 07:43:18 -0800
Message-ID: <CAMKF1sonO-yPcTCtvhXd074F1Bbis1XOAqo9OCa2ULb0XKp9PQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-icu: Update to 2.6
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 5:45 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 11/10/20 2:11 PM, Khem Raj wrote:
>
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Among others, it supports latest ICU 68.x release
>
> My build pipeline is encountering this error:
>
> ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue: /usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so contained in package python3-icu requires libicui18n.so.67()(64bit), but no providers found in RDEPENDS_python3-icu? [file-rdeps]
> ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue: /usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so contained in package python3-icu requires libicuuc.so.67()(64bit), but no providers found in RDEPENDS_python3-icu? [file-rdeps]

it seems you tried it with and older oe-core master ( before icu 68
upgrade ) can you retry it with latest master or master-next of
oe-core/poky
>
> Looks like something needs to be added as part of the build?
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/{python3-icu_2.5.bb => python3-icu_2.6.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb => python3-icu_2.6.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
> rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
> index 5e8c8a3a02..58f5e563bf 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
>  DEPENDS += "pkgconfig icu"
>
>  PYPI_PACKAGE = "PyICU"
> -SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
> +SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
>
>  SRC_URI += "file://fix_host_include.patch"
>
> --
> 2.29.2
>
>
> 
>
