Received: from portal.beam.ltd.uk ([62.49.82.227] helo=mailgate.beam.ltd.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <terry@beam.ltd.uk>) id 1Q0ENl-0007Xu-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:40:58 +0100
Received: from beam.beamnet (beam.beamnet [127.0.0.1])
	by mailgate.beam.ltd.uk (8.14.4/8.14.4) with ESMTP id p2HEWLC4000889;
	Thu, 17 Mar 2011 14:32:21 GMT
Message-ID: <4D821B75.6090206@beam.ltd.uk>
Date: Thu, 17 Mar 2011 14:32:21 +0000
From: Terry Barnaby <terry@beam.ltd.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D80653A.7010804@beam.ltd.uk>	<4D80772A.8080207@atmel.com>	<4D80C329.9020309@beam.ltd.uk>	<4D80EE70.8000309@mentor.com>
	<4D81161E.5090202@mentor.com>
In-Reply-To: <4D81161E.5090202@mentor.com>
X-Enigmail-Version: 1.1.1
Subject: Re: [Openembedded-users] Problem with patch version 2.6.1-7 and	after
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
X-List-Received-Date: Thu, 17 Mar 2011 14:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/16/2011 07:57 PM, Tom Rini wrote:
> On 03/16/2011 10:08 AM, Tom Rini wrote:
>> On 03/16/2011 07:03 AM, Terry Barnaby wrote:
>>
>> [snip]
>>> Hi,
>>>
>>> ### Forwarded to openembedded-devel ###
>>>
>>> We are using Fedora14. That is using patch 2.6.1-8.
>>>
>>> The -8 release includes the following patches to patch.
>>> Patch1: patch-2.5.4-sigsegv.patch
>>> Patch2: patch-get-arg.patch
>>> Patch3: patch-CVE-2010-4651.patch
>>> Patch100: patch-selinux.patch
>>>
>>> I think one of those fixes a security issue in patch where ".." in
>>> path names were allowed. With this version of patch (which I assume
>>> will become standard ?) the OpenEmbedded fails.
>>> Any ideas on a way to get around this (ideally without using a
>>> different patch version :) )
>>
>> So, there's a lot of recipes with patches with .. in the path:
>> openembedded$ git grep -lE "^---.*[^.]\.\.\/" recipes/ | wc -l
>> 80
>>
>> Some of these will be easy fixups (first one I peeked at we can just
>> change the patch and not have to modify the recipe) but others like the
>> tcl one will require a little thought.
> 
> Everything should be happy now.
> 
Indeed it is :)
Thanks very much, I wasn't expecting changes that quick !

Cheers


Terry


