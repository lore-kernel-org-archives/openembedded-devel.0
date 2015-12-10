Return-Path: <mail@webthatworks.it>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Dec 2015 18:07:55 UTC
Received: from smtp207.alice.it (smtp207.alice.it [82.57.200.103])
	by mail.openembedded.org (Postfix) with ESMTP id A54A160767
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:07:55 +0000 (UTC)
Received: from caronte.home.webthatworks.it (79.54.114.136) by
	smtp207.alice.it (8.6.060.28)
	id 562CAA69092A4D9B for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2015 19:02:26 +0100
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 008946FE0275
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 19:02:29 +0100 (CET)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id E9A355E25EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 19:01:41 +0100 (CET)
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5669BE05.7030904@webthatworks.it>
Date: Thu, 10 Dec 2015 19:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
Subject: [meta-qt5] [meta-ruby] jethro: dependencies on xfce-layer and xfconf probably make qt5 unbuildable without X
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
X-List-Received-Date: Thu, 10 Dec 2015 18:08:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I was trying to see if I could build
core-image-minimal | meta-toolchain-qt5
and I stumbled into

ERROR: Layer 'ruby-layer' depends on layer 'xfce-layer', but this layer 
is not enabled in your configuration

that probably is due to

http://patchwork.openembedded.org/patch/107727/

I'm willing to try to make it "optimal" and I'm trying to figure out 
what it is all about.

Any help would be apreciated.

Most probably whatever imsettings is should be optional rather than a 
required.

Of course problem occurs just with jethro, there is no imsettings in 
fido and I've been able to bake and run images for my board without X.

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


