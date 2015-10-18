Return-Path: <mail@webthatworks.it>
Received: from smtp207.alice.it (smtp207.alice.it [82.57.200.103])
	by mail.openembedded.org (Postfix) with ESMTP id F382377041
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Oct 2015 23:57:18 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp207.alice.it
	(8.6.060.28)
	id 55BB66530E2A39A2 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2015 01:57:15 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id B05656FE06A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 01:57:16 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id 1C9D15E0195
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 01:56:16 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1445040614-14820-1-git-send-email-ivan@gloom.home.webthatworks.it>
	<CA+chaQf0EsYXYJUyPn4tQ5+o9GwTMM8-fKQ7Y9OtrAqXkLAKKA@mail.gmail.com>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5624319F.6060709@webthatworks.it>
Date: Mon, 19 Oct 2015 01:56:15 +0200
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
X-List-Received-Date: Sun, 18 Oct 2015 23:57:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2015 10:57 AM, Martin Jansa wrote:
> Are all these restricted to DISTRO_FEATURE opengl?
>
> I don't think so, you probably need to enable icu in qtbase and a lot of
> these will get available (with or without opengl in DISTRO_FEATURES).

OK you were right.
Cleaning the cache I've been able to add back some packages without any 
error.

Do you have any suggestion to avoid rebuilding the whole image without 
getting tricked by errors possibly triggered by a previous build?

I'll resubmit once I'm really sure nothing else can be added back.
Sorry for the previous patch.

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


