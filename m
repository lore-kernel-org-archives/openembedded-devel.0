Return-Path: <pab@pabigot.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Jan 2015 12:59:43 UTC
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 67C7672858
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 12:59:43 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id gcsY1p0080BVjqb01csYw2; Fri, 16 Jan 2015 05:52:33 -0700
Message-ID: <54B90991.7090807@pabigot.com>
Date: Fri, 16 Jan 2015 06:52:33 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>	<2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>	<72334B6CF8FF6542A565D43122925D601A0E7C@G01JPEXMBYT21>
	<1564018.h6sptGTLbK@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1564018.h6sptGTLbK@peggleto-mobl5.ger.corp.intel.com>
Subject: Re: Question about ntp build option
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
X-List-Received-Date: Fri, 16 Jan 2015 12:59:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/16/2015 05:54 AM, Paul Eggleton wrote:
> On Friday 16 January 2015 02:05:27 Fan, Xin wrote:
>>> There will always be differences in how people expect software to be
>>> configured for whatever target and application they are building for,
>>> hence why we make it fairly easy to adjust the configuration.
>> Actually, I had the same opinion with you at the beginning.
>>
>> But in last December, the ntp published 4 serious
>> vulnerabilities(CVE-2014-9293, CVE-2014-9294,CVE-2014-9295,CVE-2014-9296).
>> So I think even the display a clock function, it should　also be protected
>> by openssl for the safety connection.
> I'm not sure this follows. Correct me if I'm wrong, but SSL doesn't actually
> prevent me as an unauthorised user from making a connection - it just ensures
> that when I connect to a server that firstly the data sent over the connection
> is encrypted, and furthermore that the connection is directly to the server I
> think it is and not someone else masquerading as that server.

Though this is the common mode of operation, ssl also permits client 
authentication through certificates, so the server knows that the client 
is who it says it is.  I generally run public-facing restricted access 
web servers this way, in addition to using HTTP authentication.  I don't 
know but would assume ntp would support the same capability through 
configuration files if ssl is enabled in the build.

I doubt the number of people in the world that would configure ntp that 
way is very large, though. As long as it's available through 
PACKAGECONFIG (and it is) I'm not convinced changing the default is 
critical, but it's probably not a big deal either unless the added 
dependencies are a burden for somebody's small-footprint installation. 
(In which case they could override PACKAGECONFIG. That's what I love 
about Yocto.)

Peter

>   This would mean
> that for example any buffer overflows such as the ones in the vulnerabilities
> you point to would still be accessible and potentially exploitable even if the
> connection were only available as encrypted using SSL, at least as far as I
> can tell.
>
>> And I find more packages in Yocto　which also use the openssl as the
>> default option, so I think ntp also should set the openssl option as default
>> setting.
> In a lot of other cases SSL is on by default because it really makes sense;
> for example it's common to want to fetch files from https servers so in the
> general case you would want curl to be built with SSL support by default. I'm
> not sure the same can be said of ntp. Again, I'm happy to be corrected though.
>
> Cheers,
> Paul
>


