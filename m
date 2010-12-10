Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PRCAw-0000wL-7Y for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 00:14:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PRC9R-0001cp-OE for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 00:13:21 +0100
Received: from adsl-76-205-222-173.dsl.snlo01.sbcglobal.net ([76.205.222.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 00:13:21 +0100
Received: from harvey.tim by adsl-76-205-222-173.dsl.snlo01.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 00:13:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Tim Harvey <harvey.tim@gmail.com>
Date: Fri, 10 Dec 2010 15:12:57 -0800
Message-ID: <4D02B3F9.7010600@gmail.com>
References: <4D00F942.6040103@comcast.net>
	<4D00FA94.4000101@eukrea.com>	<4D01008A.7080404@comcast.net>
	<4D01096E.6010105@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-76-205-222-173.dsl.snlo01.sbcglobal.net
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
In-Reply-To: <4D01096E.6010105@eukrea.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
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
X-List-Received-Date: Fri, 10 Dec 2010 23:14:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/09/2010 08:53 AM, Eric Bénard wrote:
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
> Setting PREFERRED_VERSION_qemu-native = "0.12.5" "solved" the problem here.
>
> Eric

solved my glibc failure as well



