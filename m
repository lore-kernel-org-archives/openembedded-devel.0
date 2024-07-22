Return-Path: <csokas.bence@prolan.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982FDC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 08:48:43 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web10.13896.1721638121302384521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jul 2024 01:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prolan.hu header.s=mail header.b=f9Fg52Iu;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B824FA0545
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 10:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:message-id:mime-version:reply-to:subject:subject:to:to; s=
	mail; bh=DeJPYz4FkN0PmoAInsoTp6Hqv1LbWFmf3gD0uMvIL+Q=; b=f9Fg52I
	uqtBsbkj7cs3CpTVdZW9+B3i7uXL4/ONJzbACe19Oro0vESkLc8g9VfhMXm5Iqx3
	qGYbrHIbjEYXNx6od5BLAH85BbjLoru4iNx5TVYYp5qVSlpa5F716DCYm5VDnblm
	DcvOU3zAN+3a120F9JRxOwtDLL2warB40AX3/25MlWXoQYJsXF6jjz80RMuk+bQ+
	baVuDzEtTCnZo3zkKwG4Wr2i/w8Ax8hCE11mQLDYK9STkttTv88GgSJ0C+7xcVGY
	4p3Gp8lRfIupSRAmcCkidCvHmixZdeQq5ZCOIOWPNK5o3GPy+q6BcamhDjNqhWbM
	3yQ0BDkVyEh+1/aJs8q/KINI4jXtLDQSSIXv7Q/nZW9j0YYvWCJDjWlYLH5v2l7G
	aowUuqCkdxBm50KCgkYwCgrBQ+cRVJw7xqnc6RwrtVk1pSYuLlzKMs9CpzITRYmJ
	vfYPUOO3EJF0RTTH139qnoeUCzQkKHDFVjHCIg3zC6rsl7OH4wZg6y8Vvaf/5DhN
	4g9m7UPB//7REH7/TTVWNFnIq2TM0cZrEeWculr5dT0X0YspX/pdSWsWtXReSIJM
	3vSUmycL62ZvZeNtmabIabSNgW2aZAif+u0pxZPYaDt7oiXOUCA9L5mh+IWPWzey
	ftaOigsHTGTi6M6fvVMoAUOIX2so/+PLd65s=
Message-ID: <72a70cc0-a9b0-4c15-94cb-1bb6f8a7fdcf@prolan.hu>
Date: Mon, 22 Jul 2024 10:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: [meta-oe][kirkstone][backport-request] Fix broken php-fpm systemd
 service
To: <openembedded-devel@lists.openembedded.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854677665
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 08:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111425

Hi!
Commit 4cefe0196f7a ("php-fpm: fix systemd") fixes php-fpm's systemd 
service. Please cherry-pick it to kirkstone.

Related: #822 [on GitHub]

Thanks,
Bence


