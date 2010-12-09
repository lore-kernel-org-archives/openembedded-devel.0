Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PQjlI-0007nt-KF
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:54:33 +0100
Received: (qmail 31393 invoked by uid 503); 9 Dec 2010 17:08:10 -0000
Received: from b6.ovh.net (HELO mail645.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 9 Dec 2010 17:08:10 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Dec 2010 18:57:07 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Dec 2010 18:57:05 +0200
Message-ID: <4D01096E.6010105@eukrea.com>
Date: Thu, 09 Dec 2010 17:53:02 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D00F942.6040103@comcast.net> <4D00FA94.4000101@eukrea.com>
	<4D01008A.7080404@comcast.net>
In-Reply-To: <4D01008A.7080404@comcast.net>
X-Ovh-Tracer-Id: 747879013488241993
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Release-2010.12 build failure - eglibc do_package Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Dec 2010 16:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2010 17:15, Ed Nelson wrote:
> On 12/9/2010 7:49 AM, Eric Bénard wrote:
>> Hi,
>>
>> On 09/12/2010 16:44, Ed Nelson wrote:
>>> I am using the latest release-2010.12 and doing a completely new build for the
>>> AT91SAM9g20 development board(no tmp directory and source directory empty).
>>> I am trying to build a base image that includes python.
>>> My build machine is running Ubuntu 10.04LTS.
>>>
>> are you runing Ubuntu as the native OS on the machine or in a virtual
>> machine (VirtualBox for example) ?
>>
>> Eric
>>
> I am using on Native machine
>
ok I have the same problem on virtual machines running Ubuntu 10.04 & 10.10.
I have to test a VirtualBox with an other distribution to see if the problem 
comes from the virtualmachine or Ubuntu 10.04 & 10.10.

Setting PREFERRED_VERSION_qemu-native = "0.12.5" "solved" the problem here.

Eric


