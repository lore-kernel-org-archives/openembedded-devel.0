Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 528D97878B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:58:39 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id c11-v6so779267plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pmqUDZ2ZDZW6dXx/QBedTvaeOJtPIFS7dtZIHRBAGS4=;
	b=sIwqeQQlEkJwh0bj9D4EiF7ByWpDDEtDzg5o7etSFDCFrM849yP8/DufuM7XoeOd4f
	IJhIHyilPW6tbbSPPQWwSLly680dmwAeFdOyXHE3/OY3thwzouWxpqJ8T7hJA5/AXG5U
	Co1BE5sHDkFqztAweUpa3iFWo2pbRALADxlUCoe0wpx+99Ugq+rHreBqwN3NC10xN7w5
	bBVSf6lS3cTgfAAMdNXlxdUcJR89cryVoHTV0jkOwBnA4I0nwD13ndEU2i0qshXE3wxA
	nc9HTDz84ISh0dnPOMlWRr3/goTAqUjcnM9f1PE5VNjaOBX3BZBHy1uF8mfzV6V3Q0VT
	SLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pmqUDZ2ZDZW6dXx/QBedTvaeOJtPIFS7dtZIHRBAGS4=;
	b=ft+nsJnc+PPDSxovCGNWzrEfdAhfD/ANPQ51gEOJSOCWtzUanGvggbuNvTi3ZTqSHh
	PEUf7ye+ONVrhQziI9SIK8a9PBOxDe9o1RiUeeBo06SxBbLPOyfBhLi1TIISJ448uPZO
	UkdIHGwYP2hoFRMCuv+5phwNBmYOHxgp9hw5NAPSKmVTL1XXpddAq9bfo1V6lEcpgklZ
	OZg026p/58FfH5zHRbpyWDOLMmE/MnroSr+3nA79h1H07+lB2lOFqyZLxWRYcXugyxyu
	j2SkCS5fUfGYm0paTdy1EDkJ5SzWw/95G0KLoC/7YBtBdaFXIB+pYF9WVFJ+TlHee4CQ
	mX+w==
X-Gm-Message-State: APf1xPBZYJpahOSqC47VlPzpK4C5+TPMZ5Yrja2yvx+wQQ5uw0x2/zdi
	21CCfgcl7eiJG8vEQRYHDzBADS94
X-Google-Smtp-Source: AH8x226yiPUfeJhlpImCOdXZT7tM3EONJizVhq2vuZVlXH1IvMGigNgEKzhN4yozFh6Z2IrRkzx/vQ==
X-Received: by 2002:a17:902:74c3:: with SMTP id
	f3-v6mr16617958plt.444.1519790321133; 
	Tue, 27 Feb 2018 19:58:41 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:812d:b93c:3785:4a27])
	by smtp.gmail.com with ESMTPSA id
	b88sm894660pfd.108.2018.02.27.19.58.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 19:58:40 -0800 (PST)
To: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
Date: Tue, 27 Feb 2018 19:58:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
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
X-List-Received-Date: Wed, 28 Feb 2018 03:58:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/27/18 7:48 PM, Md Ismail, Zakiah wrote:
> Hi,
> 
> I want to enable cyrptsetup in systemd by adding PACKAGECONFIG_append_pn-systemd = " cryptsetup" in my local.conf; however, I encounter the dependency loop issue. The issue is similar to this: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11856. The difference is I'm using the latest commit from meta-openembedded rocko branch. Please advise on the steps to solve this issue. Thanks in advance!
> 

are you using latest of rocko for OE-Core as well ?

> Regards,
> Zakiah
> 
> 

