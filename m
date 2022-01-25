Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2715C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:41:14 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.183.1643132473611215969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id CBE4D11D41
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 18:41:07 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCPoZ-0RfL5F0; Tue, 25 Jan 2022 18:41:07 +0100
Message-ID: <e60579ea-3442-c494-0b06-ecda7998072b@t-online.de>
Date: Tue, 25 Jan 2022 18:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] folks: disable tests; fix dependencies
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220125062503.19073-1-f_l_k@t-online.de>
 <04bbefe7-9181-e639-2fda-f5ef3075b770@gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <04bbefe7-9181-e639-2fda-f5ef3075b770@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643132467-00001C4D-342DEB1F/0/0 CLEAN NORMAL
X-TOI-MSGID: 5b831ff3-4bb5-4d01-8141-efeb84af0640
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95080

but wouldn't it still fail if DISTRO_FEATURE ptest is available until 
python3-dbusmock-native could be built?

Am 25.01.22 um 18:21 schrieb Khem Raj:
> this could also be a packageconfig, which is enabled when ptest is in 
> DISTRO_FEATURE 

