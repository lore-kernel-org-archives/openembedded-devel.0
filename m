Received: from qmta14.emeryville.ca.mail.comcast.net ([76.96.27.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1PQlU6-0003M5-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 19:44:55 +0100
Received: from omta11.emeryville.ca.mail.comcast.net ([76.96.30.36])
	by qmta14.emeryville.ca.mail.comcast.net with comcast
	id h6Qp1f0010mlR8UAE6jNLf; Thu, 09 Dec 2010 18:43:22 +0000
Received: from [192.168.1.101] ([71.202.66.210])
	by omta11.emeryville.ca.mail.comcast.net with comcast
	id h6jD1f0074YBSof8X6jFaX; Thu, 09 Dec 2010 18:43:17 +0000
Message-ID: <4D01233C.70408@comcast.net>
Date: Thu, 09 Dec 2010 10:43:08 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D00F942.6040103@comcast.net>
	<4D00FA94.4000101@eukrea.com>	<4D01008A.7080404@comcast.net>
	<4D01096E.6010105@eukrea.com>
In-Reply-To: <4D01096E.6010105@eukrea.com>
X-SA-Exim-Connect-IP: 76.96.27.212
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 09 Dec 2010 18:44:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/9/2010 8:53 AM, Eric Bénard wrote:
> On 09/12/2010 17:15, Ed Nelson wrote:
>> On 12/9/2010 7:49 AM, Eric Bénard wrote:
>>> Hi,
>>>
>>> On 09/12/2010 16:44, Ed Nelson wrote:
>>>> I am using the latest release-2010.12 and doing a completely new 
>>>> build for the
>>>> AT91SAM9g20 development board(no tmp directory and source directory 
>>>> empty).
>>>> I am trying to build a base image that includes python.
>>>> My build machine is running Ubuntu 10.04LTS.
>>>>
>>> are you runing Ubuntu as the native OS on the machine or in a virtual
>>> machine (VirtualBox for example) ?
>>>
>>> Eric
>>>
>> I am using on Native machine
>>
> ok I have the same problem on virtual machines running Ubuntu 10.04 & 
> 10.10.
> I have to test a VirtualBox with an other distribution to see if the 
> problem comes from the virtualmachine or Ubuntu 10.04 & 10.10.
>
> Setting PREFERRED_VERSION_qemu-native = "0.12.5" "solved" the problem 
> here.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

This also solved the problem for me.  I added to local.conf

Thanks
Ed


