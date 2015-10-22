Return-Path: <mail@webthatworks.it>
Received: from smtp207.alice.it (smtp207.alice.it [82.57.200.103])
	by mail.openembedded.org (Postfix) with ESMTP id 6E40B770CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:36:28 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp207.alice.it
	(8.6.060.28)
	id 55BB66530EC18A54 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2015 14:36:23 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 931136FE0059
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:36:26 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id BE7DB5E003D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:35:25 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5628D280.10902@webthatworks.it>
	<20151022122846.GC14232@ad.chargestorm.se>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5628D80D.2030002@webthatworks.it>
Date: Thu, 22 Oct 2015 14:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151022122846.GC14232@ad.chargestorm.se>
Subject: Re: meta-toolchain-qt5, qttools-plugins and -nomake examples
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
X-List-Received-Date: Thu, 22 Oct 2015 12:36:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2015 02:28 PM, Anders Darander wrote:

> Though, you could likely get the same effect by moving qttools-plugins
> from RDEPENDS to RRECOMMENDS. Then it'll be added if it exist, while you
> won't get any errors if it doesn't exist.

Deal.

It seems a very reasonable choice. After all examples are disabled by 
default and someone looking for qtcreator plugins is really looking for 
examples too.

A patch will follow. Speak now or forever hold your peace ;)

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


