Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 714B160DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 00:44:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s830i12H020331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 17:44:03 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 17:44:00 -0700
Message-ID: <5406645B.7040107@windriver.com>
Date: Wed, 3 Sep 2014 08:44:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406686961-21142-1-git-send-email-rongqing.li@windriver.com>
	<20140730072555.GF16445@jama> <54052F3C.6090006@windriver.com>
	<20140902121944.GE7949@mentor.com>
In-Reply-To: <20140902121944.GE7949@mentor.com>
Subject: Re: [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump
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
X-List-Received-Date: Wed, 03 Sep 2014 00:44:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 08:19 PM, Joe MacDonald wrote:
> [Re: [oe] [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump] On 14.09.02 (Tue 10:45) Rongqing Li wrote:
>
>>
>>
>> On 07/30/2014 03:25 PM, Martin Jansa wrote:
>>> On Wed, Jul 30, 2014 at 10:22:41AM +0800,rongqing.li@windriver.com  wrote:
>>>>> From: Roy Li<rongqing.li@windriver.com>
>>>>>
>>>>> tcpslice is a tool for extracting parts of a tcpdump packet trace,
>>>>> so put it under tcpdump dir
>>>>>
>>>>> Signed-off-by: Roy Li<rongqing.li@windriver.com>
>>>>> ---
>>
>>
>> Hi Martin:
>>
>> I see this recipes has been merged into master-next for a long time,
>> Could you cherry-pick it to master?
>
> I had asked for some kind of clarification on the license for tcpslice.
> I didn't notice a follow-up on it yet, did you get a chance to check
> into it?
>
> I don't think anyone has any concern about the stability of the package
> itself, though, if we'd had some kind of response on the license
> question I had I would've merged it long ago.
>


Sorry, I just updated the License in recipes file, and forgot to reply
your email.

Currently, the license is same as the below:
http://www.rpmfind.net//linux/RPM/mandriva/2010.1/i586/media/contrib/release/tcpslice-1.2a3-3.20061130.5mdv2010.0.i586.html

I check again in source code, the license is most same as BSD-4-Clause,
and has some typos, but the content is same as BSD-4-Clause,
Could you update to BSD-4-Clause in recipes file when you merge it
to master




1. Copyright in tcpslice.c or other source files.
tcpslice-1.2a3$ head -n20 tcpslice.c
/*
  * Copyright (c) 1991, 1992, 1993, 1995, 1996, 1997, 1999, 2000
  *	The Regents of the University of California.  All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that: (1) source code distributions
  * retain the above copyright notice and this paragraph in its 
entirety, (2)
  * distributions including binary code include the above copyright 
notice and
  * this paragraph in its entirety in the documentation or other materials
  * provided with the distribution, and (3) all advertising materials 
mentioning
  * features or use of this software display the following acknowledgement:
  * ``This product includes software developed by the University of 
California,
  * Lawrence Berkeley Laboratory and its contributors.'' Neither the name of
  * the University nor the names of its contributors may be used to endorse
  * or promote products derived from this software without specific prior
  * written permission.
  * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
  * WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
  * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
  */

2. BSD-4-Clause license file.

cat .oe-core$ cat ./meta/files/common-licenses/BSD-4-Clause

Copyright (c) <year>, <copyright holder>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
    must display the following acknowledgement:
    This product includes software developed by the <organization>.
4. Neither the name of the <organization> nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY <COPYRIGHT HOLDER> ``AS IS`` AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF 
THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-Roy

> -J.
>
>>
>>
>> -Roy
>>
>>
>> --
>> Best Reagrds,
>> Roy | RongQing Li
>>
>>

-- 
Best Reagrds,
Roy | RongQing Li

