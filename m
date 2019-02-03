Return-Path: <prvs=930cd0c7e=Richard.Leitner@skidata.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 03 Feb 2019 16:13:11 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 6F02A7C2AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 16:13:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,556,1539640800"; 
   d="scan'208";a="1957068"
To: Ben Swanson <benswanson1@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <6B41539F-A409-41E5-8562-D6607B44F769@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <3200c5d0-d285-029e-91fa-06adf834fa00@skidata.com>
Date: Sun, 3 Feb 2019 17:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <6B41539F-A409-41E5-8562-D6607B44F769@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java] icedtea build failure
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
X-List-Received-Date: Sun, 03 Feb 2019 16:13:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi Ben,
on which Distro are you building on?

It may be possible that your host compiler is too new for the sumo branch.

Have you tried building the latest master of meta-java?

regards;Richard.L

On 2/1/19 11:24 AM, Ben Swanson wrote:
> Hi,
> 
> I’m getting a compile issue on meta-java, poky. a6f135f7ac7
> 
> https://pastebin.com/fuK8WCkM <https://pastebin.com/fuK8WCkM>
> 
> openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:577:6: error: ‘%*d’ directive output between 1 and 2147483647 bytes may cause result to exceed ‘INT_MAX’ [-Werror=format-overflow=]
>    void ArchDesc::build_pipe_classes(FILE *fp_cpp) {
>         ^~~~~~~~
> 
> I tried increasing the icedtea version with no success.
> 
> Thanks,
> 
> Ben
> 
> 

