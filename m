Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.21367.1621267551665179572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 09:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bruwZUd0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t4so3408438plc.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=jmFSfdTY7HkHDdwIs9vpTA+DNZnZVqUL5Zr4YqE2D8M=;
        b=bruwZUd0a69TIqZvXxNfVak/ooaypt2TzbAymn0ZI8qjgCFkIq+d1yFYOxsGbP2hBq
         X9669qaVxfHC4HSYUBWvOVySWd6oYDAjGJFA/P41xfiSj+hkcVtAsN7VuE7RGPe5IHM9
         51yIM+pNFoA5AtHAMlVlW6qb+6M39SSlZLm+W2YAxVtQ6wMUyVEapwLXYNyMcstLD8NX
         qjmd1PEYb9FiS8M91UIAJUNbEa3U8HNSXJgMSQtS7qVUzR1c/XuggsJLkYzA6WuZffJ+
         zJkRjAXnYcRkIDcOk/VyCGRg0z/jNw2vNlLUToYM2XTyCBXgQ9L+3kc5VLTj5fJla7fj
         T2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jmFSfdTY7HkHDdwIs9vpTA+DNZnZVqUL5Zr4YqE2D8M=;
        b=R5GkJKPPph7iHFr2UHTL/7j7LM/u/nF+NtRFUmh1wdjiXBG9nkVIq2FkOkM6sKgC4F
         4Cxj0EBa5M99Enj5Ru1DkHQTo4otB5iYlF6QIbPoNpG3h0e8RieN5xL+rgyi+FtGR90w
         CZdmVpj50O/8hX9frzDX08y6tqxxmEfEYAcoNyXgnsG+IT+l5Knk+iBeRe3NBlD7o8NO
         rsFGNOTb5MIrfggFFGLxLYNDmP0ni1feEkWNKi51CkB5Wv+N5l+WvWgI1VM99fOd0G4x
         pdpt9nMBZ/JpvzbzAf37iyx4PjbdLJgB3M6Ma8BDjeliTMs9VswtyeT1aYA5kfn+7kTR
         wEiA==
X-Gm-Message-State: AOAM531Zzr70HtP58nO7pICJ3eILKpa7reTf8F3m39UXn4np58HfOBms
	9SlCTGeOlulDa1JBt0m9uDGPF8w+0as7tw==
X-Google-Smtp-Source: ABdhPJy0sH1GVnbgW95SR/UbNAY7T1i+CqYLGZp9cRgj5oGUjpTV4ABZWtKVvbkuWHWCVmy1vEMHFw==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id z10mr22186pjn.22.1621267550601;
        Mon, 17 May 2021 09:05:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id k7sm10374683pfc.16.2021.05.17.09.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 09:05:50 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH v2 1/2] http-parser: add recipe
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>,
 openembedded-devel@lists.openembedded.org
References: <20210517060920.109438-1-stefan.wiehler@missinglinkelectronics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8b674e57-0e9d-2f67-b794-211aff8b2060@gmail.com>
Date: Mon, 17 May 2021 09:05:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517060920.109438-1-stefan.wiehler@missinglinkelectronics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Stefan

I accepted the V1, so if there is delta on top of that then rebase these 
patches on top of master or master-next and resend please

On 5/16/21 11:09 PM, Stefan Wiehler wrote:
> HTTP request/response parser for C.
> 
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>   .../http-parser/http-parser_2.9.4.bb          | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> 
> diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> new file mode 100644
> index 000000000..2d04ded34
> --- /dev/null
> +++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "HTTP request/response parser for C"
> +DESCRIPTION = "This is a parser for HTTP messages written in C. It parses \
> +              both requests and responses. The parser is designed to be used \
> +              in performance HTTP applications. It does not make any \
> +              syscalls nor allocations, it does not buffer data, it can be \
> +              interrupted at anytime. Depending on your architecture, it \
> +              only requires about 40 bytes of data per message stream (in a \
> +              web server that is per connection)."
> +AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
> +HOMEPAGE = "https://github.com/nodejs/http-parser"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
> +
> +SRC_URI = "git://github.com/nodejs/http-parser.git"
> +SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +    oe_runmake library package
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
