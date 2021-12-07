Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F1C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:22:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.66828.1638883338686077259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=Zp/QZ9Nx;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0353C82F3E;
	Tue,  7 Dec 2021 14:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1638883336;
	bh=CZIJV5Wfg+N+6rZ2cL11S7DgVo5uV8DwoudAiRV5Jfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zp/QZ9Nxk/1wGZjrDzchmbwVfqH+nZscilVNNDXZ+MVy6JdDeVhS5ubF6COwp7Gtf
	 JBexIYZns2G0bmClFfgA8AERRn69NJ6XKnJq5i3+ggUmzfmiUQlA7XttSBhrJlvSWx
	 8ufEiiDUL664XcEaPLCPa/1T2l6/F7vOa7KR/MnXcnuw7jlqnEwETDNVXto0zKriqn
	 VC/1bvq6NFdA57u42f5YmJsOSilVbGrXULFJnURGvDuJWYUVyZoMUwnr5GYf7UUzno
	 oMH19Rh1dFYCl4ZCrRxV82eGxk/rH23BZZK4CEeg6lYKswH5sl6dYfduTtwvvhOIwO
	 eunGsKfENVJNA==
Message-ID: <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
Date: Tue, 7 Dec 2021 14:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com,
 Alexander Kanavin <alex@linutronix.de>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:22:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94231

On 12/7/21 13:35, Martin Jansa wrote:
>> The build system might have put something into DEPENDS already
> 
> There is only copyright notice before this chunk, so this doesn't make much
> sense to me (and no other recipe does this).

At least oelint-adv warns about it here:
https://github.com/priv-kweihmann/oelint-adv/blob/master/oelint_adv/rule_base/rule_var_depends_append.py

And as far as I can tell, bitbake can stick something into DEPENDS 
before it parses this recipe, so the :append is valid.

Furthermore, git grep through oe-core already indicates a few recipes 
which use DEPENDS:append.

