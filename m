Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F91665CF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 10:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6AAC03156FA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:17:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id i7T7G_5V_ach
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:17:49 +0200 (CEST)
Received: from [172.22.22.61] (55d452b7.access.ecotel.net [85.212.82.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B1C483156F95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:17:49 +0200 (CEST)
Message-ID: <55911B4D.7090303@opendreambox.org>
Date: Mon, 29 Jun 2015 12:17:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH v2 0/9] add openlmi and it's depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jun 2015 10:17:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Lei,

On 29.06.2015 11:57, Lei Maohui wrote:
> OpenLMI  = Open Linux Management Infrastructure.
> OpenLMI is open-source project aiming to improve management of Linux systems using WBEM standards.
> 
> Lei Maohui (9):
>   openlmi: add new recipe openlmi
>   cim-schema-exper: add new recipe for openlmi
>   cmpi-bindings: add new recipe for openlmi
>   konkretcmpi:add new recipe for openlmi
>   sblim-sfcb: add new recipe for openlmi
>   sblim-sfcCommon: add new recipe
>   sblim-cmpi-devel: add new recipe
>   cim-schema_2.40.0.bb: delete
>   pywbem: add new recipe

you should order your patches in a way that doesn't break git bisect,
i.e. dependencies should come first.

Regards,
Andreas

