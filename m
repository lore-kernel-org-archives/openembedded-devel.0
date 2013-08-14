Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 76D63600A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:33:20 +0000 (UTC)
Received: from [192.168.101.3] (afplatform.bmw-carit.intra [192.168.101.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 443A640016
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 12:32:57 +0200 (CEST)
Message-ID: <520B6AFF.4020708@oss.bmw-carit.de>
Date: Wed, 14 Aug 2013 13:33:19 +0200
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] opencv picks up eigen3 headers from host include
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
X-List-Received-Date: Wed, 14 Aug 2013 11:33:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

Working on the meta-ros layer [1] and more specifically bitbaking 
cv-bridge [2], I stepped into an issue with opencv.

When I execute `bitbake opencv` with versions

meta              = "master:bc6258f88705b0e7989089a8666ac5e5d2355823"
meta-oe           = "master:6b50a7d6621eba239380b11606110caab814eb51"

bitbake emits this warning:

WARNING: QA Issue: opencv: The compile log indicates that host include 
and/or library paths were used.
          Please check the log 
'/home/lukas/oe-core/build/tmp-eglibc/work/x86_64-oe-linux/opencv/2.4.3-r2/temp/log.do_compile' 
for more information.


In log.do_compile, the g++ calls have the parameter "-isystem 
/usr/include/eigen3". I have installed libeigen3-dev 3.0.5-1 on my 
ubuntu host machine and bitbake opencv seems to pick up the eigen3 
headers from the host include. To repair this issue, I see two 
alternatives here:

- either add eigen3 as recipe to meta-oe and add eigen3 as a dependency. 
Kartik Mohta provides recipes for eigen at his repository [3] and I have 
some older copy at our repository [4].
- or ensure that opencv does not use eigen3 at all and hence does not 
pick up the eigen3 headers from the host machine.

What are your thoughts?

Lukas

[1] https://github.com/bmwcarit/meta-ros
[2] 
https://github.com/bulwahn/meta-ros/commit/cc0ce9c4c3c49fc72eb95712a629350bc9c6a21a
[3] 
https://github.com/kartikmohta/meta-km/tree/master/recipes-extended/eigen
[4] https://github.com/bmwcarit/meta-ros/tree/master/recipes-extended/eigen

