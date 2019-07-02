Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDE4B7E66A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:36:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x621ZDvU024260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:35:35 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:35:05 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
	<20190628100721.GB18526@localhost>
	<0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
	<20190701125529.GB7483@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <401b8da4-675a-4149-421b-43877c993499@windriver.com>
Date: Tue, 2 Jul 2019 09:35:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701125529.GB7483@localhost>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Tue, 02 Jul 2019 01:36:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/19 8:55 PM, Adrian Bunk wrote:
>> PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
> That is actually fine and doesn't need a fix - the library is only built
> if explicitely requested --with-libnm-glib.
>
I don't think so, it we want to explicitly expected --with-libnm-glib,

we should add it to EXTRA_OECONF, since 1.18.0, it is disable

by default if glib not in PACKAGECONFIG

//Hongxu


