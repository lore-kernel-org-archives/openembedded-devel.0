Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97F9760616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:19:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8R6JQ4e010223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Sep 2016 23:19:27 -0700
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 26 Sep 2016 23:19:25 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
	<CABcZANn79dEop66L+-zU7EOyv++T-AcH4Qsg=Z_vkQzShbo4LQ@mail.gmail.com>
	<CAP9ODKp2+qfMO2Qx0nP=8ysOjWhUCeAmSPhjCNez1ddGjaNXkA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <6bfab77a-0d6d-8000-ade0-172e28fadba7@windriver.com>
Date: Tue, 27 Sep 2016 14:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp2+qfMO2Qx0nP=8ysOjWhUCeAmSPhjCNez1ddGjaNXkA@mail.gmail.com>
X-Originating-IP: [128.224.162.234]
Cc: Christopher Larson <clarson@kergoth.com>, otavio.salvador@ossystems.com.br
Subject: Re: [meta-oe] [PATCH] bash2dash conversion
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
X-List-Received-Date: Tue, 27 Sep 2016 06:19:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Thank you for your careful review and Otavio's test. I'll send v2 soon.

Zhe


On 09/19/2016 07:01 PM, Otavio Salvador wrote:
> On Sun, Sep 18, 2016 at 12:36 AM, Christopher Larson
> <clarson@kergoth.com> wrote:
>> The purpose of ‘command’ is to *run* a command, not check if it’s
>> available, and ‘type’ is mandated in SuSv3/SuSv4/POSIX. If dash doesn’t
>> provide it, it’s broken.
> It provides it and works:
>
> % dash
> $ if type dash; then echo "dash is found and working"; else echo "Error"; fi
> dash is /bin/dash
> dash is found and working
> $
>


