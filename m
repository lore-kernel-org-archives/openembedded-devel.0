Return-Path: <ross@burtonini.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E6D8F605EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 21:32:15 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id b1so12420405pgm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=bFq4BLu09PS8U8P/M23mhkSjbxl/Se7bRBhMcY33Y7Q=;
	b=FWQsr5S4c2+SE7iePd9BkwUWlAkM/VxGahNBH3RMIYc4CNHAoVm1G5rPc0smS/pD4O
	xNzylCgU1/CfGfByhNop4aIThDuHrBRs2v35VctonLFdnxtx7kSfEgX5NZxKYBrjnbTB
	v3DdRne4/7ocYgEkiAV3ii8piTFUq/mfwCv5q/4xAgXVf7Gz8N2Hzze+Kcjp1BSSNf4g
	Yd5l3/y9X+9hw5Lc5/tsngA8fQ4Zk0Cak3/V5OhqZ4tlIQZMV+r+8CHsGhejpvsd9G3S
	hXJceiSndVVnNHS8Ot8asQ8PHqaOqMPt5GJjpREDX/WdcF7VB7vUpdXL3to4GtySCFeg
	FxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bFq4BLu09PS8U8P/M23mhkSjbxl/Se7bRBhMcY33Y7Q=;
	b=pEN5YgzPF3YXV4aVNzVRCd16ovkeqiI7sghemuP1B7D4SKKPXu6XxV5cVkfRxyf7ET
	o6TyHU2IGcnMZli9qhVENoRNdIICuGrRW5H67TgjRDnwasbmxAgQ1KJk2tnl1isr9fP+
	hHPEW67iSwq/y1jSxmMgw4VRuHuEvo7aH2jXt/IeGHJhx5kAksCwqNMxxgPJ5MBr9ZGj
	cZmO4VgzpYeNoeChC30J5lz+hSIrVdbpmXjpebUmZBpwNGChzyERtpSAvDGl90Ac9BmS
	vMZATrDHqHglppr94ctYzITO/4HlJ4EzN7+4wk936hJfZ9eSAsmrsWh3myqkOb0DAzkB
	2wKg==
X-Gm-Message-State: ANhLgQ3VeIXIZygjjasHgqdfL4IHOWPbPjfw1aZen1ZQVxltcM5iV949
	jbRaxU40CXok1uSz0H4I2y/HKqPy7oFLTQ==
X-Google-Smtp-Source: ADFU+vtXtbXZgxFHiTVFKHUeiJRNV//UhxJF9VtqX54WQKaezFJ4PU1M6s9/LjsGYNrmkNAW0qNbGA==
X-Received: by 2002:a63:2323:: with SMTP id j35mr1187541pgj.440.1584480736133; 
	Tue, 17 Mar 2020 14:32:16 -0700 (PDT)
Received: from cjmcquil-mobl1.ger.corp.intel.com (jfdmzpr03-ext.jf.intel.com.
	[134.134.139.72]) by smtp.gmail.com with ESMTPSA id
	t142sm3532402pgb.31.2020.03.17.14.32.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 14:32:15 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
From: Ross Burton <ross@burtonini.com>
Message-ID: <06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
Date: Tue, 17 Mar 2020 21:32:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
Subject: Re: should indent recipe use "${prefix}" instead of "/usr"?
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
X-List-Received-Date: Tue, 17 Mar 2020 21:32:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 17/03/2020 17:22, Robert P. J. Day wrote:
>    just noticed that ./meta-oe/recipes-extended/indent/indent_2.2.12.bb
> on master branch contains the line:
> 
>    FILES_${PN}-doc += "/usr/doc/indent/indent.html"
> 
> should that not properly read:
> 
>    FILES_${PN}-doc += "${prefix}/doc/indent/indent.html"
> 
> or am i misreading something?

Recipes should never use /usr directly unless they're relocating 
something from e.g. ${D}/usr/lib to ${D}${libdir}.

The recipe should be telling the Makefiles to install into ${docdir} 
(typically, /usr/share/doc).

Ross

