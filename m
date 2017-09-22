Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id E7FA37825E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 07:23:05 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8M7N5RU022781
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 22 Sep 2017 09:23:05 +0200
Received: from [139.16.79.28] (MD1FZU9C.ad001.siemens.net [139.16.79.28])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v8M7N1VE009208;
	Fri, 22 Sep 2017 09:23:01 +0200
To: Andre McCurdy <armccurdy@gmail.com>
References: <1505995283-14453-1-git-send-email-pascal.bach@siemens.com>
	<CAJ86T=WM_gReqwOCpznqzSkkGzeFtA7W72OYQzSyEGzWSyVm0Q@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <01a6fe17-15cc-5516-d99b-113c89e4bd3f@siemens.com>
Date: Fri, 22 Sep 2017 09:23:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WM_gReqwOCpznqzSkkGzeFtA7W72OYQzSyEGzWSyVm0Q@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: create developer symlinks
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
X-List-Received-Date: Fri, 22 Sep 2017 07:23:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 21.09.2017 20:32, Andre McCurdy wrote:
> On Thu, Sep 21, 2017 at 5:01 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>> LuaJIT tries to call ldconfig during installation which doesn't work.
> Presumably this stopped working recently (since host tools now need to
> be whitelisted and ldconfig is not included in HOSTTOOLS)? If so,
> maybe mention that in the commit message.
I'm not sure when it stopped working. I just tried it now with Pyro ;-)
However I'm not sure what ldconfig does in the context of cross compilation or if it makes sense at all to call it.
My assumption was not so I decided to just disable it. But I'm happy to correct my assumption if I'm wrong.
>> This causes the .so and .so.2 symlinks to no be created.
>>
>> By setting "LDCONFIG= :" the call will be skipped the same as on Darwin
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>> index d7477ed..1e06e34 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>> @@ -52,6 +52,7 @@ EXTRA_OEMAKE = "\
>>      \
>>      'PREFIX=${prefix}' \
>>      'MULTILIB=${baselib}' \
>> +    'LDCONFIG= :' \
>>  "
>>
>>  do_compile () {
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


