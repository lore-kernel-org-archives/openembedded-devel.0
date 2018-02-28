Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 97E41788C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 04:11:10 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id ay8-v6so793733plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 20:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=16gg8gltGnkMMgJQM9W3bQ+PYuANyezdQBIfQGT9dZo=;
	b=QWfgG1DK2/7Qy5Kqd5rmjB7j0MYZeS7cSsxRkdTEDQu0BqJ6dJS02Lr2e2ca4drS+h
	EsAxgOQZvC5luJvGRU9fll/GFuoAWIyBWJSZreK9O3CLfuLU4fqlnHDRZlve2wDdGOvV
	xpUtKRS+AonowO8Hq2LRrf1rkILf1EdW4ISEelMdp0PRwl7snucWyxRpwtXYZtw0aUNz
	nc/c541a5tNj/4nAgpMS+g9ozASODMve/lOrOY5naBnKFRH7u6RUOV2n6Z7rZn1skqec
	GT3K3q6gG5pbRsCDvYyuEsP7glxlWRfKhWlVcMz/5MJS5RlN+KOXOR9URam8MO2AoxWL
	7++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=16gg8gltGnkMMgJQM9W3bQ+PYuANyezdQBIfQGT9dZo=;
	b=Bzye8N5dfAw4lpkU30bmNuS5QTXNfPj64ZMphIXmSHYhBLOVbRY7v68OGvgg6jdlVM
	6aTbSAvCgjBWIGRWBu6mb7yqLzaeMVD33HF4zc+skHqJoxD/6KFuRAA+ZDCqGgBOO1F8
	7Hk4qNC1eps7LoXjOxDPW/ySCP9GETqWjLSduYx7r2rGW52BzLBhqRaHgPEYKYTMVlI/
	jfwv5yumyjo6QUBL4DYYAugOPApUcLNxIOy5MhxiObhtmTmCH/ILG4gji6Pw+tJ4k3tO
	IZhAe/OLrNYfCz8cOeDwWCiGHd2/zqGBONK18cQWBG+iNxiIbAPW5Lx+Y5x+s3WC5prI
	dYhg==
X-Gm-Message-State: APf1xPBQumlTnP+E3PIJKJ9xJ6vtjIQm7vnqJVC36Vrpmk6AgeUxDruM
	UpX3gsVX1R0L5VFANtjSOP31AjA8
X-Google-Smtp-Source: AH8x227lW2rKVUejKbf3pYqcFmk5G84n+10axmGiJu55pk/qz+CI4Ihy3tsmvGfrLvalaPK0Dehxzg==
X-Received: by 2002:a17:902:7d17:: with SMTP id
	z23-v6mr16390726pll.427.1519791071447; 
	Tue, 27 Feb 2018 20:11:11 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:812d:b93c:3785:4a27])
	by smtp.gmail.com with ESMTPSA id u28sm973133pfl.19.2018.02.27.20.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 20:11:10 -0800 (PST)
To: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
	<0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
	<1A5BB22468458840B08C979DDA869BF27EB7CA@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4d770b95-e279-7fda-8322-64911ac47431@gmail.com>
Date: Tue, 27 Feb 2018 20:11:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1A5BB22468458840B08C979DDA869BF27EB7CA@PGSMSX103.gar.corp.intel.com>
Subject: Re: Dependency loop in cryptsetup
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
X-List-Received-Date: Wed, 28 Feb 2018 04:11:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/27/18 8:01 PM, Md Ismail, Zakiah wrote:
> Yes. Currently using OE-Core rocko branch, commit a8eb060cbbbb00581e8260dd6bfc31cff5558e8f.

Does removing libgcrypt from DEPENDS in
meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
help?
> 
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Wednesday, February 28, 2018 11:59 AM
> To: Md Ismail, Zakiah <zakiah.md.ismail@intel.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Dependency loop in cryptsetup
> 
> 
> 
> On 2/27/18 7:48 PM, Md Ismail, Zakiah wrote:
>> Hi,
>>
>> I want to enable cyrptsetup in systemd by adding PACKAGECONFIG_append_pn-systemd = " cryptsetup" in my local.conf; however, I encounter the dependency loop issue. The issue is similar to this: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11856. The difference is I'm using the latest commit from meta-openembedded rocko branch. Please advise on the steps to solve this issue. Thanks in advance!
>>
> 
> are you using latest of rocko for OE-Core as well ?
> 
>> Regards,
>> Zakiah
>>
>>

