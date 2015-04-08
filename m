Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 13F6360089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 21:39:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 85685F811E2; Wed,  8 Apr 2015 15:39:38 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 18B08F811E0;
	Wed,  8 Apr 2015 15:39:38 -0600 (MDT)
Message-ID: <5525A029.2000804@mlbassoc.com>
Date: Wed, 08 Apr 2015 15:39:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: vlc runtime issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2015 21:39:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Now that I've finally built vlc for my embedded target (i.MX6),
I've run into some issues.

First are missing codecs:
[0xb5c25e78] main decoder error: no suitable decoder module for fourcc `h264'. VLC probably does not support this sound or video format.
[0xb5c25e78] main decoder error: no suitable decoder module for fourcc `mp4a'. VLC probably does not support this sound or video format.

Are these something that can be enabled via PACKAGECONFIG?

I'm not sure these are important:
[0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/fmc.luac: /usr/lib/vlc/lua/sd/fmc.luac: incompatible precompiled chunk
[0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/icecast.luac: /usr/lib/vlc/lua/sd/icecast.luac: incompatible precompiled chunk
[0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/jamendo.luac: /usr/lib/vlc/lua/sd/jamendo.luac: incompatible precompiled chunk
[0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/metachannels.luac: /usr/lib/vlc/lua/sd/metachannels.luac: incompatible precompiled chunk

These probably happen because of cross compiling from x86_64 -> ARM/Cortex-A9

Any ideas?  I'm mostly keen on getting the codecs I need.  I already
have them working using mplayer, but I'd like vlc as well.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

