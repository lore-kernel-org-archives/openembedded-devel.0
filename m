Return-Path: <mail@webthatworks.it>
Received: from smtp209.alice.it (smtp209.alice.it [82.57.200.105])
	by mail.openembedded.org (Postfix) with ESMTP id CBC2A75F3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:12:48 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp209.alice.it
	(8.6.060.28)
	id 55BB67B20C4E9748 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2015 14:12:46 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id A35EF6FE0059
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:12:45 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id CB8325E003D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:11:44 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5628D280.10902@webthatworks.it>
Date: Thu, 22 Oct 2015 14:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
Subject: meta-toolchain-qt5, qttools-plugins and -nomake examples
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
X-List-Received-Date: Thu, 22 Oct 2015 12:12:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I think I've been able to find all and only the packages that should be 
conditionally added to RDEPENDS in packagegroup-qt5-toolchain-target.bb 
from opengl.

I finally discovered why there was a problem with meta-toolchain-qt5 and 
qttools-plugins... qttools-plugins doesn't get build when

-nomake examples

Now I don't understand:
- why nobody noticed this problem that doesn't seem related to opengl or 
x11. Was it hidden by something else that I should take care when trying 
to fix it? No one is actually baking meta-toolchain-qt5?...

- what should be considered a correct solution:
* simply remove the package that doesn't really seem that useful in a 
toolchain (they should be example plugins for qtcreator)
* conditionally add it just if qt get build with examples [1]
* still adding qttools-plugins in local.conf will trigger the problem. 
Is there a way to automatically enable a "package feature" if a package 
get included?
One of the way to "fix" this could be to
PACKAGECONFIG_DISTRO_append_pn-qtbase = " examples..."

What is the consensus so I could adapt my patch to
packagegroup-qt5-toolchain-target.bb
and get a chance to see it merged?

thanks

[1] How? I know how to check if a DISTRO_FEATURES has been enabled but 
how can I check if a package option has been enabled?
-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


