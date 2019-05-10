Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4474D7C131
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 21:09:42 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d21so3380997plr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Dcj9/Zv8B5625UC+bHY5P2s1vl+555qShKGNUH8WmrE=;
	b=XdQl0x5obLZkfJaF5yhz0RrGYLYyCcsTLmzB/KeaORdz/wug6AGyoeUsvBxG79lDq+
	AXeki0ahV5MWdi+z9Sgb/uLAEDIyPAZD1PWKgPy+u1spcLskJTyWnYs7UnIetpN9vCEC
	eb+Xfrb+jv1GjnFjuC3kFi+CK9adtYufvTpbhlOBFmv+XA2Yhk8eDWnquYTx3XInWDb0
	DNGcqksXCgyYQDtuvxIYs2uCsRIZ2ARQFBj4nHF42eV+zzp42e5LGuW3ZL8UE0rRjEhr
	V/WCCbaAn9Fl6jvyIur7vpJSuDw9I4KopjMK8cLn8Aha8F1JaNvO8buUefQAJwOYZ9Y/
	SxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Dcj9/Zv8B5625UC+bHY5P2s1vl+555qShKGNUH8WmrE=;
	b=asdK/4z81MP9Z59CtYNas55l4LhDd5w4UjdWsXRF8qcmOabUq66cuhY/WJ5JB/l7A8
	RlwLM2JDbhtueTR0wyiJKC2eIbZWYnB5OgDDK2ZBDZpb2VST09g0Gz6yNy9Fu9CNPF3h
	wLcpfwDo8mO73JhmgQz8bheKwSul7I222sEwUK2kshX2m1x4U66GvUchDjzYYV6u5eI3
	7D1IZJZlgT3rYT505u11HV9IjfX67zipc7PFPM6Igj5b2m4pNkVITYQfEmM1kH8LChGa
	ApebIlczfVmXSMNtLM+djrKg7ZMD6KMLXv2DbTB26rpx+bd0GjvRVcdg0egbX/nycTRw
	nSWg==
X-Gm-Message-State: APjAAAU9bkpfKWk23Uqy2MrxzWPZyYS+hGySrfT/cjOKyx42z2ViXPnq
	IGBWgL7Gquv6ID/89BnH+P4PUaseOBo=
X-Google-Smtp-Source: APXvYqyyuuJcct18glW/h3/DMh0DUMkLFO0u7CdpMWj70F7iXfdC1o59keH3EMLYp0RKmROo0vvyLA==
X-Received: by 2002:a17:902:b492:: with SMTP id
	y18mr10871609plr.96.1557522582997; 
	Fri, 10 May 2019 14:09:42 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	i65sm10204219pgc.3.2019.05.10.14.09.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 14:09:42 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190510115515.19491-18-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3ca09975-b24f-4408-3272-d22ab2e5eff4@gmail.com>
Date: Fri, 10 May 2019 14:09:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190510115515.19491-18-bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] rdfind: Upgrade 1.3.4 -> 1.4.1
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
X-List-Received-Date: Fri, 10 May 2019 21:09:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

license checksum failures seen

https://errors.yoctoproject.org/Errors/Details/240051/

On 5/10/19 4:55 AM, Adrian Bunk wrote:
> Remove patch for issue fixed upstream.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../rdfind/files/reproducible_build.patch     | 46 -------------------
>   .../{rdfind_1.3.4.bb => rdfind_1.4.1.bb}      |  5 +-
>   2 files changed, 2 insertions(+), 49 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/rdfind/files/reproducible_build.patch
>   rename meta-oe/recipes-support/rdfind/{rdfind_1.3.4.bb => rdfind_1.4.1.bb} (62%)
> 
> diff --git a/meta-oe/recipes-support/rdfind/files/reproducible_build.patch b/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
> deleted file mode 100644
> index 36728a788..000000000
> --- a/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Description: sort the filelist when it is complete to get reproducible behaviour
> -Author: Reiner Herrmann <reiner@reiner-h.de>
> -Bug-Debian: https://bugs.debian.org/795790
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
> -Index: rdfind-1.3.4/Fileinfo.hh
> -===================================================================
> ---- rdfind-1.3.4.orig/Fileinfo.hh
> -+++ rdfind-1.3.4/Fileinfo.hh
> -@@ -189,6 +189,10 @@ public:
> -   static bool compareondepth(const Fileinfo &a, const Fileinfo &b)
> -   {return (a.depth() < b.depth());}
> -
> -+  //returns true if a has lower filename than b)
> -+  static bool compareonfilename(const Fileinfo &a, const Fileinfo &b)
> -+  {return (a.name().compare(b.name()) < 0);}
> -+
> -   //fills with bytes from the file. if lasttype is supplied,
> -   //it is used to see if the file needs to be read again - useful if
> -   //file is shorter than the length of the bytes field.
> -@@ -235,6 +239,10 @@ public:
> -   static bool equaldepth(const Fileinfo &a, const Fileinfo &b)
> -   {return (a.depth()==b.depth());}
> -
> -+  //returns true if filenames are equal
> -+  static bool equalfilename(const Fileinfo &a, const Fileinfo &b)
> -+  {return (a.name()==b.name());}
> -+
> -   //returns true if file is a regular file. call readfileinfo first!
> -   bool isRegularFile() {return m_info.is_file;}
> -
> -Index: rdfind-1.3.4/rdfind.cc
> -===================================================================
> ---- rdfind-1.3.4.orig/rdfind.cc
> -+++ rdfind-1.3.4/rdfind.cc
> -@@ -349,6 +349,7 @@ int main(int narg, char *argv[])
> -   cout<<dryruntext<<"Now have "<<filelist1.size()<<" files in total."<<endl;
> -
> -
> -+  gswd.sortlist(&Fileinfo::compareonfilename,&Fileinfo::equalfilename);
> -
> -   //mark files with a unique number
> -   gswd.markitems();
> diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
> similarity index 62%
> rename from meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
> rename to meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
> index 4d984ee05..6eab78630 100644
> --- a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
> +++ b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
> @@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
>   DEPENDS = "nettle"
>   
>   SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
> -           file://reproducible_build.patch \
>   "
>   
> -SRC_URI[md5sum] = "97c0cb35933588413583c61d3b5f9adf"
> -SRC_URI[sha256sum] = "a5f0b3f72093d927b93898c993479b35682cccb47f7393fb72bd4803212fcc7d"
> +SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
> +SRC_URI[sha256sum] = "30c613ec26eba48b188d2520cfbe64244f3b1a541e60909ce9ed2efb381f5e8c"
>   
>   inherit autotools
>   
> 

