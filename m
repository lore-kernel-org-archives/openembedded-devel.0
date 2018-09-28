Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0FDC7993B;
	Fri, 28 Sep 2018 00:02:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8S01DFO006277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2018 17:01:23 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Sep 2018 17:01:02 -0700
To: Paul Eggleton <paul.eggleton@intel.com>
References: <1721109.tuLG3TFsTU@localhost.localdomain>
	<CAP71WjzUkYnazb3VHzEHgEDHoRqKdOT89Waw_hAy6pRyh8=BNA@mail.gmail.com>
	<156dc277-4255-aaf3-cb9f-f25a4481189f@windriver.com>
	<1907640.U4zZL0Bqpb@localhost.localdomain>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ca07c8cc-7ff0-eba4-e235-0707c6c8ada1@windriver.com>
Date: Thu, 27 Sep 2018 20:01:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1907640.U4zZL0Bqpb@localhost.localdomain>
X-Originating-IP: [172.25.44.4]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: yocto@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] layers.openembedded.org upgraded
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
X-List-Received-Date: Fri, 28 Sep 2018 00:02:17 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2018 07:33 PM, Paul Eggleton wrote:
> Hi Randy
>
> On Friday, 28 September 2018 11:22:29 AM NZST Randy MacLeod wrote:
>> On 09/27/2018 05:28 PM, Nicolas Dechesne wrote:
>>> On Thu, Sep 27, 2018 at 10:43 PM Paul Eggleton <paul.eggleton@intel.com> wrote:
>>>> I'm very happy to announce that we've finally been able to upgrade the layer
>>>> index at http://layers.openembedded.org to the latest revision on master,
>>>> incorporating quite a bit of work that's been going on for the past few
>>>> months. Improvements now visible:
>> Nice new features, thanks!
>>
>> The "Branch:" and "Filter layers" selection menus don't work
>> for me when using Firefox 62.0 (64-bit) on Ubuntu-18.04.
>>
>> Google Chrome Version 69.0.3497.100 (Official Build) (64-bit)
>> works fine.
> Hmm, I do my development with Firefox and I just checked - with Firefox
> 62.0 (64-bit) here on Fedora 28 both work. Do you perhaps have an add-on
> enabled that might prevent these from working? I believe they both rely on
> javascript (the filter dropdown definitely does).

Does anyone else see this problem?
I've also asked on IRC.

I did have Firefox Lightbeam (disabled) and Quiick Java but I removed 
them both,
re-stared FF and still no joy/menus.


Looking at:
Menu->Web Developer -> Browser Console ( Control+Shift+J )
I see:

Error: Syntax error, unrecognized expression: # jquery-3.3.1.js:1541:8 
<https://layers.openembedded.org/static/js/jquery-3.3.1.js>
Sizzle</Sizzle.error 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:1541:8 
Sizzle</Sizzle.tokenize 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:2193:4 
Sizzle</Sizzle.select 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:2620:20 Sizzle 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:845:9 find 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:2873:4 
jQuery.fn.init 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:2983:14 jQuery 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:139:10 
getParent https://layers.openembedded.org/static/js/bootstrap.js:754:27 
clearMenus/< 
https://layers.openembedded.org/static/js/bootstrap.js:741:7 each 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:354:10 each 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:189:10 
clearMenus https://layers.openembedded.org/static/js/bootstrap.js:740:5 
dispatch 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:5182:16 
add/elemData.handle 
https://layers.openembedded.org/static/js/jquery-3.3.1.js:4991:6

Does that help at all?

../Randy



>
> Cheers,
> Paul
>

-- 
# Randy MacLeod
# Wind River Linux


