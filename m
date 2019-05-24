Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E5C317E45D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 00:37:25 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p15so3418900pll.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 17:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+JynWQ4/VbFFfUfVFjy8HFGN04J6e6mUKXeTuRghjiM=;
	b=MaMUatGfUXtJYrcm7kI1DCmn9p9enWfjpzMUFfGRkan5Rgb0wUcuwR/IPLUbmv9u6U
	U4A36TqVHTgJzVDjlTjjOWic5pWcs7XNg4x3B9tuyoZSf9vaumwLZjWN5Y6TY8uU8pE5
	16+qhhWE3pBBAEpcPMp0sO9b1wPDk4NXuBruI3oeLpAO5DMFhvFmzJHNoobAPt8LJNRJ
	SJlSgBqrQT2TBJ+l6kloyPJ8HM3nC+dLRGks2cV6kSc71u8j8A0RJf7xorrEfiAYBIIE
	ylkcVOD2j10OBtfMUKuWlK/NUL41asJD0uu03ARs3tkS3IaAzQsH5gSaxDTUQ/kvzIhu
	s5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+JynWQ4/VbFFfUfVFjy8HFGN04J6e6mUKXeTuRghjiM=;
	b=oFrkE+nJ9A/s1dhcxBd3WAd5hEN9BBFGT0nZe51rlPfDfLQ9wY3fzIPGsGiw7ksZzN
	Aujp1iPDp5NkID1VdTyrD8QYuPpVh+eghi3rt0AaySUkAjo8PngThTmpCUewTjWsZPo/
	wSSKFAcCRc6vv3DVIPxRRlAHq6VgphMK6nAljOlvDAdWbJH42Id0msMwdwWoBQ8lVY0z
	ID6Jpc/9tBsK22gFS8S109kAST8w6ZgKdHAQE6fmScEmQWjkQVflOerymPOvNW5FGpYv
	eL7dlE/4MvrwEBfpSd383MEui2+958NxmwNCz+gXa6pn7WaLdFEj/QWQxrXw4rn5vfT4
	Sizg==
X-Gm-Message-State: APjAAAX7fHuYvqaJORqP+Sww5AvfD7VbYR9p88r4qwu9MOMKJzB9wWVB
	7SoQ68pHoP+HvNqxWSo8DYpP0vo8i0A=
X-Google-Smtp-Source: APXvYqwwDM7JkT/QJVuRW6Jveyol8P8+Jj/FDHwAkZOjpnSuiaYPcswzHFV58FYzsH9TYbiOuNUEdg==
X-Received: by 2002:a17:902:bd94:: with SMTP id
	q20mr80164653pls.146.1558658246201; 
	Thu, 23 May 2019 17:37:26 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:7892:9931:70c0:491e])
	by smtp.gmail.com with ESMTPSA id o2sm488913pgq.50.2019.05.23.17.37.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 17:37:25 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523120233.GB25084@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <60975770-3d7b-b488-e2e5-874f79637710@gmail.com>
Date: Thu, 23 May 2019 17:37:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190523120233.GB25084@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/8] uriparser: upgrade to 0.9.3
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
X-List-Received-Date: Fri, 24 May 2019 00:37:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/23/19 5:02 AM, Adrian Bunk wrote:
> On Thu, May 23, 2019 at 11:54:58AM +0000, Martin Jansa wrote:
>> ...
>> -SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
>> ...
>> +SRC_URI = "git://github.com/uriparser/${BPN}.git"
>> ...
> 
> Why move from tarball to git?
> 

yeah may be
https://github.com/uriparser/uriparser/releases/download/uriparser-0.9.3/uriparser-0.9.3.tar.xz

is better here

>> ...
>> +PV = "0.9.3+git${SRCPV}"
>> +
>> +SRCREV = "737e95f67bc2e5d8b90a1392797b353b52e5124a"
>> ...
> 
> This is the release, so shouldn't have +git in PV.
> 
> cu
> Adrian
> 

