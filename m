Return-Path: <mail@webthatworks.it>
Received: from smtp208.alice.it (smtp208.alice.it [82.57.200.104])
	by mail.openembedded.org (Postfix) with ESMTP id C6BB67712B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 09:17:29 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp208.alice.it
	(8.6.060.28)
	id 55BB68E10CC84D74 for openembedded-devel@lists.openembedded.org;
	Sat, 17 Oct 2015 11:17:26 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 9C72A6FE06A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 11:17:26 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id 37D005E02DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 11:16:26 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1445040614-14820-1-git-send-email-ivan@gloom.home.webthatworks.it>
	<CA+chaQf0EsYXYJUyPn4tQ5+o9GwTMM8-fKQ7Y9OtrAqXkLAKKA@mail.gmail.com>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <562211EA.6080302@webthatworks.it>
Date: Sat, 17 Oct 2015 11:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf0EsYXYJUyPn4tQ5+o9GwTMM8-fKQ7Y9OtrAqXkLAKKA@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH] Make possible to bake meta-toolchain-qt5 without opengl
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
X-List-Received-Date: Sat, 17 Oct 2015 09:17:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2015 10:57 AM, Martin Jansa wrote:
> Are all these restricted to DISTRO_FEATURE opengl?

> I don't think so, you probably need to enable icu in qtbase and a lot of
> these will get available (with or without opengl in DISTRO_FEATURES).

icu is enabled
PACKAGECONFIG_DISTRO_append_pn-qtbase = " linuxfb tslib icu alsa "
is that is what you mean.

I'm actually surprised how many things fail to build if no opengl. I'll 
try to work it out but at least IMHO, better be able to bake the 
toolchain with fewer packages than don't build it at all.
The alternative is -c populate_sdk then ./configure then compile and 
then move packages manually.
Or it could have been some mistake on my part about rebuilding stuff, if 
you've any suggestion to double check it is welcome.

I'll try to investigate about dependencies and make it better, but this 
could be a starting...

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


