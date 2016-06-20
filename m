Return-Path: <openembedded@emagii.com>
Received: from v-smtpout3.han.skanova.net (v-smtpout3.han.skanova.net
	[81.236.60.156])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3157318F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 13:48:23 +0000 (UTC)
Received: from [10.175.196.110] ([155.4.129.69]) by cmsmtp with SMTP
	id EzYpbCnnkbd4bEzYqbC58c; Mon, 20 Jun 2016 15:48:20 +0200
To: openembedded-devel@lists.openembedded.org
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
	<6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
From: Ulf Samuelsson <openembedded@emagii.com>
Message-ID: <01564453-efa0-c067-83bc-67f995a86452@emagii.com>
Date: Mon, 20 Jun 2016 15:48:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
X-CMAE-Envelope: MS4wfN6EoZieB63ja9YilkkXXbRAHaEqMxuCn5+AHTq8p3RXYHN9Mj5E3+9+fXLRWuYjmKKFEedXgui1Rdu1lZhx88wBpW6OA71LxrS1DpcoeUIqL5OC48Nb
	Dfw5MShgjnrtrrycqgxnYFQ1Jzcq5jgbE4vfE2yc4voDo1om/8ZQjZN1sSv9hO/ya6LRk4R68dnWzlfDKqBrMy0xnNI+XkmmeCo=
Subject: Re: Using EXTERNALSRC in practice
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
X-List-Received-Date: Mon, 20 Jun 2016 13:48:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Den 2016-06-20 kl. 14:37, skrev Jérémy Rosen:
>
> On 20/06/2016 14:08, Ulf Samuelsson wrote:
>> We have a meta-layer which builds the kernel.
>>
>> This contains among other things:
>>
>> FILESEXTRAPATHS_prepend_<machine> = "${THIS_DIR}/<machine>"
>>
>> SRC_URI = "git://<server>/<repo.git>;protocol=ssh;branch=<branch>"
>> SRC_URI += "file://defconfig"
>>
>> PV = "...+git${SRCPV}"
>> SRCREV = "<shaid>"
>> ...
>>
>> Would like to have an option to build the kernel with external source.
>> That option should be easy to enable/disable
>>
> [skip the rest]
>
> What you are describing here is very close to how the devtool works. I 
> think it can deal with kernel packages in its latest iteration
>
> did you have a look at that tool ? does it satisfy your need ? if not, 
> what would it need to do what you want...

No, where can I find more information?

The customer does not use the latest version of Yocto right now, so that 
might be a problem,

so It would be good to have an example ".bbappend" to start with.

BR

Ulf



