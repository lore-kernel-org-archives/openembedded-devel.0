Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E92F660290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 02:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6M2qGWK017701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:52:16 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 21 Jul 2016 19:52:15 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1469096700-11775-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sqvsGYWddJTUUe7FkZSqTCK23nPjboDcn4zz_my8EpgTw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <579189D6.9030105@windriver.com>
Date: Fri, 22 Jul 2016 10:49:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqvsGYWddJTUUe7FkZSqTCK23nPjboDcn4zz_my8EpgTw@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-oe][PATCH] makedumpfile: add makedumpfile 1.6.0
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
X-List-Received-Date: Fri, 22 Jul 2016 02:52:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年07月21日 21:34, Khem Raj wrote:
> On Thu, Jul 21, 2016 at 3:25 AM,  <mingli.yu@windriver.com> wrote:
>> ++CFLAGS_COMMON = $(CFLAGS_ARCH) \
>> ++              -DVERSION='"$(VERSION)"' \
>> ++              -DRELEASE_DATE='"$(DATE)"'
>> ++
>
> how is DATE calculated ? such things can hamper reproducability if
> they use the system date at build time.
The DATE is hardcode in the Makefile as "DATE=9 Jun 2016".

Thanks,
Grace
>

