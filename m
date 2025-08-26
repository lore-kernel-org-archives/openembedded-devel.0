Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C927CA0FE9
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 10:49:25 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web11.60809.1756201829751568188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 02:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prolan.hu header.s=mail header.b=R6hRfXhT;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5BA53A02A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 11:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:message-id:mime-version:reply-to:subject:subject:to:to; s=
	mail; bh=SXHQ8SYiIxXftUIn+QmVSVmtLA41dsdwl4wpPG5ZQxE=; b=R6hRfXh
	T5X+JtNMWBmR7R8tpjporkoogz7tyz6qNRiS2AG1LEalEeehQDSeJlvZll55Ur4A
	7/0v9PPdFYr61It5QGYE4Vn6RpkvdtIo5eYNwjSdqQgqSVfjUp3gNFtd/yOHy4n0
	CmpdfAL/7fnXVnaQIuD/Wpr6pTDTehNne9sfvnS9+ZPBCLQ3MF0ekkA+DmN8gqD/
	ZYgRJ7gxEbekm7pOTCcuzlq1+ww7JEhiOzhw96M8qleODieq8s9sqe47lQFM6Mzi
	7rqt6xR+GwUjvQ/L4dLYEFDql0I+/M9uJpRK+h7QuunObgV/EvJUZRQRaYhOO8fF
	7L4qqr3DWfMSVnHfhGFNYGXP+//g6cXKFUCEghlT8tp9o6JGodr5Lhjnn8p878uc
	6pw4QEe7lxIZB1IOm0bYlkEQm9NbGL7vCDF4tvqjnlp7M9DHeAByZmbmHV49Q5pn
	Dxy/gFv3pY9Iq232cSMHIGQ1hdqx+IE3WjMS3cOiOzInDhtIdB9Oo4ntwOp3HOBs
	dumtSwMkFFYXUOd9VdaY8Qy9P7FTjnrKdyBgIKBAOb97zq7HbZlxJHHUkr+P2Rop
	PRIv2ABNepTKHe8cIbJ2lzlvciKl6OTI1lTIHClTIlazWRR8HrqgtDEtaTgNoD2p
	vvZ7j+EvtsIuD7L5xr0nPsORWpYOmvWROPMk=
Message-ID: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
Date: Tue, 26 Aug 2025 11:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <openembedded-devel@lists.openembedded.org>
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Cannot start phc2sys on scarthgap
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E607367
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119116

Hi,

There is a bug [1] in the service file of phc2sys that was fixed [2] in 
upstream OpenEmbedded. This fix was however not backported to scarthgap. 
Please backport this fix.

Bence

[1] https://bugs.launchpad.net/ubuntu/+source/linuxptp/+bug/2119028
[2] 
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in?id=31f0b9d3d51a65b1c3d63eb6520e7ab174a8550c


