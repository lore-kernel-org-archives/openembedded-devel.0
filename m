Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id F0E8F71974
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 14:53:31 +0000 (UTC)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 91356280489;
	Thu,  1 Jun 2017 14:52:57 +0000 (UTC)
To: Samuli Piippo <samuli.piippo@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
	<a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
	<5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
	<79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <cc693863-b637-a445-b5a9-950dc0a5a026@zonque.org>
Date: Thu, 1 Jun 2017 16:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 01 Jun 2017 14:53:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06/01/2017 03:16 PM, Samuli Piippo wrote:
> On 01.06.2017 15:57, Daniel Mack wrote:
>> On 06/01/2017 02:35 PM, Samuli Piippo wrote:
>>> Parts of the chromium is built for the host and requires gcc-multilib to
>>> be installed when building on a x64 host. I should have noted that in
>>> commit message.
>>>
>>> My /usr/bin/cc is a symlink to gcc
>>
>> Hmm, same here, but that's not the case when when bitbake is executing
>> it, as it modifies the PATH.
>>
> 
> OK found it. I didn't have new enough poky, so the HOSTTOOL filtering 
> was not used.
> 
> We need to find proper place to add HOSTTOOLS += "cc c++" to whitelist 
> the needed tools for webengine.

I think I found a different solution. The PATH bitbake provides during
compilation contains the hosttools directory which does not contain cc
but gcc.

> +--- a/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> ++++ b/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> +@@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
> +     ld = os.environ.get('LD', 'link.exe')
> +     ar = os.environ.get('AR', 'lib.exe')
> +   else:
> +-    cc = os.environ.get('CC', 'cc')
> +-    cxx = os.environ.get('CXX', 'c++')
> ++    cc = os.environ.get('CC_host', 'cc')
> ++    cxx = os.environ.get('CXX_host', 'c++')

Setting this to 'gcc' and 'g++' seems to work for me. The build is still
running, but it's past the point where it failed previously (compiling gn).


Thanks for your patch :)
Daniel

