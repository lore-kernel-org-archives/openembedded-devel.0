Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6166F6607F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 10:31:22 +0000 (UTC)
Message-ID: <53B68266.4020503@communistcode.co.uk>
Date: Fri, 04 Jul 2014 11:31:02 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <53B676FE.50809@communistcode.co.uk>
	<53B67E8D.6060702@windriver.com>
In-Reply-To: <53B67E8D.6060702@windriver.com>
Subject: Re: tcpdump: bitbake throws autoconf errors, error message confusing
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
X-List-Received-Date: Fri, 04 Jul 2014 10:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Robert,

After further investigation that is also what I found, and why it's so
confusing. The different tcpdump is because I uprevved to the latest
version locally to see if it fixed the issue ;)

I'll see if I can figure out why the class if flagging it as bad when it
shouldn't.

On 04/07/14 11:14, Robert Yang wrote:
> 
> The error message comes from meta/classes/insane.bbclass:
> 
> grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation'
> 
> The log you showed didn't contain the words, so that it should not error,
> maybe you have to debug in meta/classes/insane.bbclass.
> 
> Btw., the meta-oe's tcpdump is 4.3.0, yours is 4.5.1, maybe there are
> other differences, for example you have used another insane.bbclass ?
> (Just a guess)
> 
> // Robert
> 
> On 07/04/2014 05:42 PM, Jack Mitchell wrote:
>> So tcpdump is failing to build in my latest uprev to all things HEAD.
>> The error message is a touch cryptic:
>>
>> ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>> Rerun configure task after fixing this. The path was
>> '/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/core2-32-oe-linux/tcpdump/4.5.1-r0/build'
>>
>> ERROR: Function failed: do_qa_configure
>>
>> log: http://ix.io/dg9
>>
>> Looking at the log I can't see where that specific path is used... can
>> anyone shed any light?
>>
>> Cheers,
>>


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

