Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBE9665CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 10:18:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3LAISOZ004251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Apr 2017 03:18:29 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 21 Apr 2017 03:18:28 -0700
To: <openembedded-devel@lists.openembedded.org>, <anders@chargestorm.se>
References: <1491975746-68414-1-git-send-email-dengke.du@windriver.com>
	<20170418122031.pizafzlv7zjy5p22@ad.chargestorm.se>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <8d85f0bf-bc54-6d78-f96b-22300fabe40b@windriver.com>
Date: Fri, 21 Apr 2017 18:18:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170418122031.pizafzlv7zjy5p22@ad.chargestorm.se>
X-Originating-IP: [128.224.162.189]
Subject: Re: [PATCH V2] crash: 7.1.5 -> 7.1.8
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
X-List-Received-Date: Fri, 21 Apr 2017 10:18:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anders


On 2017年04月18日 20:20, Anders Darander wrote:
> * Dengke Du <dengke.du@windriver.com> [170412 07:42]:
>
>> 2. Add the "id" to HOSTTOOLS in meta-oe/layer.conf
> Why do you need to add `id` to HOSTTOOLS?
It's not me decide to add "id" to HOSTTOOLS, it's the crash source code 
decides:

In ./Makefile line 563:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
release: make_configure
         @if [ "`id --user`" != "0" ]; then \
                 echo "make release: must be super-user"; exit 1; fi
         @./configure -P "RPMPKG=${RPMPKG}" -u -g
         @make --no-print-directory release_configure
         @echo
         @echo "cvs tag this release if necessary"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> We're normally trying to _increase_ determinism in builds, not reduce
> it...
>
> Cheers,
> Anders
>


