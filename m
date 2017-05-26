Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id E0A13781E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 05:46:43 +0000 (UTC)
Received: from [192.168.178.170] (p5DDC50F8.dip0.t-ipconnect.de
	[93.220.80.248])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 13DDE28048C;
	Fri, 26 May 2017 05:46:16 +0000 (UTC)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
	<CAP9ODKpZ+45VOfj-OwhHsCxi+ku5ZfQrGJSsAtgMP41UZi_waQ@mail.gmail.com>
	<a91bb6aa-e8ae-0164-725d-b1a4d1a14224@zonque.org>
	<CAP9ODKpq9x0dzikkp5K9dmL7nj-uTfpNhuGgMpySOGpn+2UjtA@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <ae24ce37-b35a-adbd-addc-fd96450366a3@zonque.org>
Date: Fri, 26 May 2017 07:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpq9x0dzikkp5K9dmL7nj-uTfpNhuGgMpySOGpn+2UjtA@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Support for v4l cameras in QtWebEngine
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
X-List-Received-Date: Fri, 26 May 2017 05:46:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/26/2017 02:28 AM, Otavio Salvador wrote:
> Em 23 de mai de 2017 1:51 AM, "Daniel Mack" <daniel@zonque.org
> <mailto:daniel@zonque.org>> escreveu:
> 
>     On 05/23/2017 03:30 AM, Otavio Salvador wrote:
>     > On Mon, May 22, 2017 at 2:00 PM, Daniel Mack <daniel@zonque.org
>     <mailto:daniel@zonque.org>> wrote:
>     >> Is anyone aware of any specific requirements or PACKAGECONFIG
>     settings
>     >> needed to add V4L support to web applications running inside a
>     >> QtWebEngine widget?
>     >
>     > The webrtc support is disabled for embedded-linux profile. I did not
>     > look further on it yet.
> 
>     I see, thanks for the pointer! What would be the best way to enable it?
>     Could we override GYP_CONFIG setting through new PACKAGECONFIG
>     directives in qtwebengine_git.bb <http://qtwebengine_git.bb>? I'd
>     also like to enable plugins, for
>     instance.
> 
>     Then again, where is this embedded_linux.pri profile actually selected
>     in the Yocto builds?
> 
> 
> We didn't finish the changes, but we were patching the source to enable it.

Okay, just to make sure I understand correctly: you have some sort of
sed-like logic somewhere in your recipes that patches 'enable_webrtc=1'
into embedded_linux.pri before building?


Thanks,
Daniel

