Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id C65FE77D42
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:57:35 +0000 (UTC)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 165C4280489;
	Thu,  1 Jun 2017 12:57:03 +0000 (UTC)
To: Samuli Piippo <samuli.piippo@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
	<a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
Date: Thu, 1 Jun 2017 14:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
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
X-List-Received-Date: Thu, 01 Jun 2017 12:57:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06/01/2017 02:35 PM, Samuli Piippo wrote:
> Parts of the chromium is built for the host and requires gcc-multilib to 
> be installed when building on a x64 host. I should have noted that in 
> commit message.
> 
> My /usr/bin/cc is a symlink to gcc

Hmm, same here, but that's not the case when when bitbake is executing
it, as it modifies the PATH.

Does this work for you? What platform are you building on, for what target?

In any case, 5.8.0 worked for me, so this is a new effect.



Thanks,
Daniel

