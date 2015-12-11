Return-Path: <mail@webthatworks.it>
Received: from smtp207.alice.it (smtp207.alice.it [82.57.200.103])
	by mail.openembedded.org (Postfix) with ESMTP id 7176F6FFF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 22:30:34 +0000 (UTC)
Received: from caronte.home.webthatworks.it (79.54.114.136) by
	smtp207.alice.it (8.6.060.28)
	id 562CAA69097F5BCE for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2015 23:30:34 +0100
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 5F4F86FE0275
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 23:30:34 +0100 (CET)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id 9091F5E00FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 23:29:44 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <5669BE05.7030904@webthatworks.it> <20151210183026.GN2246@jama>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <566B4E58.3060709@webthatworks.it>
Date: Fri, 11 Dec 2015 23:29:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151210183026.GN2246@jama>
Subject: Re: [meta-qt5] [meta-ruby] jethro: dependencies on xfce-layer and xfconf probably make qt5 unbuildable without X
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
X-List-Received-Date: Fri, 11 Dec 2015 22:30:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2015 07:30 PM, Martin Jansa wrote:
> On Thu, Dec 10, 2015 at 07:01:41PM +0100, Ivan Sergio Borgonovo wrote:
>> I was trying to see if I could build
>> core-image-minimal | meta-toolchain-qt5
>> and I stumbled into
>>
>> ERROR: Layer 'ruby-layer' depends on layer 'xfce-layer', but this layer
>> is not enabled in your configuration
>
> Why do you use ruby-layer?
>
> meta-qt5 no longer requires ruby-layer, because ruby-native was moved to
> oe-core.
>
> Similarly imsettings now doesn't need to be in meta-ruby, because it was
> moved there just because of ruby dependency, so now it can be moved
> back.

After solving a couple of other problems (freescale specific stuff) and 
delaying to solve some others (sdl/qemu) I succeeded to build an image.

Maybe later I'll get back to the list if I need help with the sdl/qemu 
problem.

Thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


