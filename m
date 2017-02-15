Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 195E271ABD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 12:48:09 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.20.1702131159380.3464@uk63952.mitel.com>
	<358e792e-f48d-5880-1842-aecb4b54275d@embed.me.uk>
	<alpine.LFD.2.20.1702141000250.29338@uk63952.mitel.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <15032f82-81ea-3f4a-e39d-26c63629f6ec@embed.me.uk>
Date: Wed, 15 Feb 2017 12:49:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1702141000250.29338@uk63952.mitel.com>
Subject: Re: building netdata: "No package 'zlib' found"
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
X-List-Received-Date: Wed, 15 Feb 2017 12:48:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 15/02/17 12:23, Robert P. J. Day wrote:
>
>   i was going to start a new thread for this, then remembered this
> post i was going to respond to:
>
> On Tue, 14 Feb 2017, Jack Mitchell wrote:
>
>> On 13/02/17 17:01, Robert P. J. Day wrote:
>>>
>>>   i'm building a totally stock core-image-minimal for qemuppc with
>>> latest poky checkout, and when i try to add the existing "netdata"
>>> recipe to the mix, i get:
>>>
>>> | configure: error: Package requirements (zlib) were not met:
>>> |
>>> | No package 'zlib' found
>>> |
>>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>>> | installed software in a non-standard prefix.
>>> |
>>> | Alternatively, you may set the environment variables ZLIB_CFLAGS
>>> | and ZLIB_LIBS to avoid the need to call pkg-config.
>>> | See the pkg-config man page for more details.
>>>
>>>   apart from fixing this, how could this recipe ever have built
>>> before? i realize the current recipe for netdata is almost a year
>>> old, but should it still not build?
>>
>> Recipe specific sysroots. Zlib is so common that it was probably
>> already available in the shared sysroot to be compiled against, now
>> there is no access to the shared sysroot it can't be found and
>> fails. So this was always a dependency bug but one that was probably
>> never triggered.
>
>   a couple questions. a couple days ago, all i did was add the line:
>
>   DEPENDS = "zlib"
>
> to the netdata_git.bb recipe file, and that trivially solved the
> problem. i just updated my poky checkout, built again, and the build
> failed since, as i notice from monday, a bunch of recipes (including
> netdata) have been blacklisted because of (unsurprisingly) failure to
> build:
>
>   $ git show b7f480c
>
> so what should one do here?
>
>   for that recipe, i can submit a patch which adds the DEPENDS line
> and removes the blacklisting. or is there a more wide-sweeping plan to
> fix recipes that are now missing build-time dependencies based on
> recipe-specific sysroots?

Submit the patch which fixes the recipe and removes the blacklist. As 
for a wide sweeping plan, I imagine recipes will get blacklisted until 
someone who is actively using them notices and submits the patch to fix. 
There isn't the time available to fix all the recipes and then run-time 
test them to make sure that the fix has actually worked.

>
>   also, if there's no objection, i can submit a patch that adds a
> recipe for the far more recent netdata-1.5.0.

I'm sure this would be welcomed.

>
>   thoughts?
>
> rday
>

