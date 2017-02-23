Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id B1E0573086
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 18:21:22 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A7vVSHBKTo08lAVt8odmcpTZWNBhigK39O0sv0rFi?=
	=?us-ascii?q?tYgXKvz/rarrMEGX3/hxlliBBdydsKMZzbOG+Pm4CCQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5Yb5+Ngi6oAbeusULnYdvLrs6xwfUrHdPZ+?=
	=?us-ascii?q?lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2465MvwtRne?=
	=?us-ascii?q?VgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVzmu87tnRRn1gy?=
	=?us-ascii?q?ocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSWZEWMtaSi5PDZ6m?=
	=?us-ascii?q?b4YXEuQPI+hYoYn+qVUAoxSxCgujC//gxDJTmn/73rc33/g9HQzI3gEtGc8Fvn?=
	=?us-ascii?q?TOrNXyMacfSeS7w7PUwjXEdPxW3i/y5ZTSch87rvGMQLRwftfPxkY3DQ3ClE+Q?=
	=?us-ascii?q?ppLkPjiI0ekNsXKU7/B6WuKglm4nrRx+rSa0y8cthYnGnIYVylHe+ilj3Ik1It?=
	=?us-ascii?q?i4RVd9bNW5HpVQsCSaOJF3QsMkW2xooTo6xqcHuZ68ZCQLyJMnyALDa/yAa4iI?=
	=?us-ascii?q?+BXjVOSPLjhkmHJpYrW/hwy98UWm1+byVdG03U5OoyZYiNXAq20B2h7J5sWDTv?=
	=?us-ascii?q?Zx5Fqt1DaP2g3V9+pKO1o7lbDBJJ4k2rMwk50TvlndESLug0X2ibOWdl0j+ui1?=
	=?us-ascii?q?9+TrerXmqYGYN49zkgz+PL4hmsq+AOQ5NAgBQXKX+eWz1LL5+U35Qa9Fgucqna?=
	=?us-ascii?q?netZDWPcUbpqinDA9Jyosu7wuzAy273NgFn3QLNlZIdRadg4T0O1zDIOj0DfKl?=
	=?us-ascii?q?jFStlDdryerGPrrkApjVLHjMiq3hcqxy605Bzgo80M5Q6olVCrEOOv3zXk7xu8?=
	=?us-ascii?q?bCAhAlNAy0xv7rCM9h2YMGRWKPHqiZPbvVsV+Q+O0vJfeDZIoOtznjNvcq+uDh?=
	=?us-ascii?q?gmIglVAAY6apw4UYaHSjE/RiIkWZembsgswbHWcNpgoxUurqh0OHUTFIeXm9Qr?=
	=?us-ascii?q?8z6S8mB468CofDXI+tiqSb3CinBp1WenxGCleUHHfva4WLQekMaCOVIsN7iTwL?=
	=?us-ascii?q?T7yhS5E72h6zsw/60aFqLu3P+i0DtZPjz8R16PPWlREp7zB7E8Od02SXQ25vhG?=
	=?us-ascii?q?NbDwMxiYdjqFJ8zR+42KxmivBfD5QH4O9ATAY9c4XVy/JzB9focgXaZcaSVFuj?=
	=?us-ascii?q?WZOtBjR3RMhnkPEUZEMoOdypiRrE6AOwCrAIkbCGM6S16K/OlyzzLtx0xGvA2K?=
	=?us-ascii?q?QJjlYvRspGc2ahg/gspEDoG4fVnhDBxO6RfqMG0XuIrT/bwA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GJDgD3Jq9Y/5tjdVtdHAEFAQsBGAYMg?=
	=?us-ascii?q?ydhgQmDW4p6kEofkGGCRII3GYFMKoJCgzYCgyNDFAEBAQEBAQEBAQEBAl8ogjM?=
	=?us-ascii?q?iAQw9EAEBAQEBAQEBASMBAQEBAQEjAg1eAQUjDwFGEAsYAgImAgJXBg0GAgEBi?=
	=?us-ascii?q?XUBCa5MgiaLQQEBAQEBBQEBAQEkgQuFQYIFCIJih1qCXwWcFIZ0izCCTo5DSJJ?=
	=?us-ascii?q?gNiKBAFSFVIFJPzWLRgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GJDgD3Jq9Y/5tjdVtdHAEFAQsBGAYMgydhgQmDW4p6kEo?=
	=?us-ascii?q?fkGGCRII3GYFMKoJCgzYCgyNDFAEBAQEBAQEBAQEBAl8ogjMiAQw9EAEBAQEBA?=
	=?us-ascii?q?QEBASMBAQEBAQEjAg1eAQUjDwFGEAsYAgImAgJXBg0GAgEBiXUBCa5MgiaLQQE?=
	=?us-ascii?q?BAQEBBQEBAQEkgQuFQYIFCIJih1qCXwWcFIZ0izCCTo5DSJJgNiKBAFSFVIFJP?=
	=?us-ascii?q?zWLRgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.35,198,1484002800"; 
   d="scan'208";a="7735455"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Feb 2017 19:21:22 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cgy14-0007aS-Cf; Thu, 23 Feb 2017 19:21:22 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cgy11-0001PV-TM; Thu, 23 Feb 2017 19:21:19 +0100
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1487768029-5984-1-git-send-email-jaragunde@igalia.com>
	<CAP9ODKpFmTT5ied29nSXQLYB7x5D+4W2y3wG3E8ac+qQACrcpw@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <05393a98-5c41-b94c-3179-40d5d9ed0f2a@igalia.com>
Date: Thu, 23 Feb 2017 19:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpFmTT5ied29nSXQLYB7x5D+4W2y3wG3E8ac+qQACrcpw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: disable generate_character_data for qemux86
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
X-List-Received-Date: Thu, 23 Feb 2017 18:21:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 23/02/17 01:41, Otavio Salvador wrote:
> On Wed, Feb 22, 2017 at 9:53 AM, Jacobo Aragunde Pérez
> <jaragunde@igalia.com> wrote:
>> Chromium-wayland fails with:
>>   http://errors.yoctoproject.org/Errors/Build/32356/
>>
>> Root cause seems to be ICU mixing host and target architectures,
>> same as in: https://bugreports.qt.io/browse/QTBUG-57705
>> ...
> Any x86 will need this.
> 

You are totally right, I've reproduced build issues in third_party/icu
with qemux86 and intel-core2-32 machines.

I'm sending an amended patch that covers both cases. Thanks for the review.

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

