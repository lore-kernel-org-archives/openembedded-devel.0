Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03D1C72F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:57:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3O5vZI3028888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:57:35 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 23 Apr 2017 22:57:33 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1491975746-68414-1-git-send-email-dengke.du@windriver.com>
	<20170418122031.pizafzlv7zjy5p22@ad.chargestorm.se>
	<8d85f0bf-bc54-6d78-f96b-22300fabe40b@windriver.com>
	<20170421105319.iqgbqeydq23r4fan@ad.chargestorm.se>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <1ad1fa3a-d93b-edd0-e782-7ad2b37f79a8@windriver.com>
Date: Mon, 24 Apr 2017 13:57:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170421105319.iqgbqeydq23r4fan@ad.chargestorm.se>
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
X-List-Received-Date: Mon, 24 Apr 2017 05:57:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年04月21日 18:53, Anders Darander wrote:
> Hi,
>
> * Dengke Du <dengke.du@windriver.com> [170421 12:18]:
>
>> On 2017年04月18日 20:20, Anders Darander wrote:
>>> * Dengke Du <dengke.du@windriver.com> [170412 07:42]:
>>>> 2. Add the "id" to HOSTTOOLS in meta-oe/layer.conf
>>> Why do you need to add `id` to HOSTTOOLS?
>> It's not me decide to add "id" to HOSTTOOLS, it's the crash source code
>> decides:
>> In ./Makefile line 563:
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> release: make_configure
>>          @if [ "`id --user`" != "0" ]; then \
>>                  echo "make release: must be super-user"; exit 1; fi
> How is this going to work? We're not running make as root, thus the
> build will fail!?! Or what am I missing?
Yes, in recipe crash_7.1.8.bb, the do_compile function run as non-root.
>
> I'd say, can you try to remove those two lines instead, and see if it
> builds correctly?
I have check the source codes, I think remove those two lines is OK.
>
> Besides, are we really running `make release`? I can't find anything
> obvious in either the Makefile or the recipe, that calls `make release`.
It's not runing on surface, but you can run "bitbake crash" without the id
in HOSTTOOLS, the do_compile will fail.
>
>>> We're normally trying to _increase_ determinism in builds, not reduce
>>> it...
> I've got really hard time to see why something needs to run `id` in
> order to build properly...
>
> Cheers,
> Anders
>


