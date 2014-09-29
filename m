Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43C1565F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:01:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8T71mNf007918
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 00:01:48 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 29 Sep 2014 00:01:48 -0700
Message-ID: <542903D9.8020104@windriver.com>
Date: Mon, 29 Sep 2014 15:01:45 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1411953593-13713-1-git-send-email-Chong.Lu@windriver.com>
	<1678777.vfoZ90ZxEi@sencha>
In-Reply-To: <1678777.vfoZ90ZxEi@sencha>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-networking][PATCH 1/2] quagga: add subpkgs to RDEPENDS
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
X-List-Received-Date: Mon, 29 Sep 2014 07:01:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09/29/2014 01:51 PM, Roman Khimov wrote:
> В письме от 29 сентября 2014 09:19:52 пользователь Chong Lu написал:
>> +RDEPENDS_${PN} += "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d
>> ${PN}-ospfd ${PN}-ripd ${PN}-ripngd" +
> IMO the whole point of split daemon packaging was to be able to choose which
> protocols you want and which you don't. So forcing an RDEPENDS is wrong if you
> want to stay with per-daemon packages. I think RRECOMMENDS is better here.

OK. Thanks. I will resend a V2.

Best Regards
Chong

>
>


