Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 May 2019 21:06:32 UTC
Received: from smtp97.ord1c.emailsrvr.com (smtp97.ord1c.emailsrvr.com
	[108.166.43.97])
	by mail.openembedded.org (Postfix) with ESMTP id B51687CA4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 21:06:32 +0000 (UTC)
X-Auth-ID: scott@jumpnowtek.com
Received: by smtp13.relay.ord1c.emailsrvr.com (Authenticated sender:
	scott-AT-jumpnowtek.com) with ESMTPSA id 0836AA027D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 16:59:53 -0400 (EDT)
X-Sender-Id: scott@jumpnowtek.com
Received: from [192.168.10.4] (c-73-234-253-132.hsd1.me.comcast.net
	[73.234.253.132]) (using TLSv1.2 with cipher AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Thu, 30 May 2019 16:59:54 -0400
To: openembedded-devel@lists.openembedded.org
References: <1559207054-32056-1-git-send-email-scott@jumpnowtek.com>
	<d9e8c97c-892a-473b-c48d-eccffce6f071@gmail.com>
From: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <e5067fbe-0d2d-b2c3-8bb4-29024740cf65@jumpnowtek.com>
Date: Thu, 30 May 2019 16:59:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d9e8c97c-892a-473b-c48d-eccffce6f071@gmail.com>
Subject: Re: [meta-networking][warrior][PATCH] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Thu, 30 May 2019 21:06:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199619.html

On 5/30/2019 9:16 AM, akuster808 wrote:
> 
> 
> On 5/30/19 2:04 AM, Scott Ellis wrote:
>> Fixes issues with kernels 5.1 and greater.
>>
>> Backport from master fc1b5310b28f70900a8a432048e08ee06ae309d7
> 
> What is in this update?
> 
> - armin
>>
>> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
>> ---
>>  ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
>>  ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
>>  meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
>>  3 files changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
>>  rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)
>>
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
>> similarity index 100%
>> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
>> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
>> similarity index 100%
>> rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
>> rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> index 8314e79..5cf745e 100644
>> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  
>>  SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
>> -SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
>> +SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
>> +SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
>>  
>>  S = "${WORKDIR}/WireGuard-${PV}/src/"
> 

