Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1ODkS9-00064c-Bu
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 22:28:54 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id D4BECF6737
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 16:24:51 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 16 May 2010 16:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=n75oL6CHyt6Mg5WCsYpdKlrkQXI=;
	b=EqZS+N1Mk9fqgS7WiWg5KcZzByYhZg0ACxILAHQnIKbzoH0MdfO+5b+7Axkffi8lkrjCRVT4I9dwxXFPQifetTgQAHmganPUxK0YgVPRM6T2wAzIB7BRP2Tf0ZCfWUj3ZZCUKoxrLn72dZMpbK8qedu4siQmtDyYr40QhWhReTE=
X-Sasl-enc: QqbCodZvFpgvtQLDPYR1aEzRT6zDlzUcBjnuO2A/vGJo 1274041491
Received: from [192.168.1.34] (hnvr-4d078ae5.pool.mediaWays.net [77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 2DAEA4CBFA7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 16:24:51 -0400 (EDT)
Date: Sun, 16 May 2010 22:26:17 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hs0snm$i4a$1@dough.gmane.org>
Message-ID: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
	<1272723767-16871-1-git-send-email-vjensen@gmx.de>
	<1272723767-16871-2-git-send-email-vjensen@gmx.de>
	<20100507101850.GD18308@excalibur.local>
	<hs0snm$i4a$1@dough.gmane.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] canutils: new recipe
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
X-List-Received-Date: Sun, 16 May 2010 20:28:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 7 May 2010, Koen Kooi wrote:

> On 07-05-10 12:18, Stefan Schmidt wrote:
>> Hello.
>>
>> On Sat, 2010-05-01 at 16:22, Vitus Jensen wrote:
>>> Adds canutils (PTX flavour) 4.0.4 as alternative to socketcan-utils-test.
>>> canutils RCONFLICTS with socketcan-utils-test because of identical
>>> file names.
>>>
>>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>>> ---
>>>  recipes/socketcan/canutils_4.0.4.bb           |   19 +++++++++++++++++++
>>>  recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
>>>  2 files changed, 20 insertions(+), 0 deletions(-)
>>>  create mode 100644 recipes/socketcan/canutils_4.0.4.bb
>>>
>>> diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
>>> new file mode 100644
>>> index 0000000..e769c46
>>> --- /dev/null
>>> +++ b/recipes/socketcan/canutils_4.0.4.bb
>>> @@ -0,0 +1,19 @@
>>> +DESCRIPTION = "canutils (PTX flavour)"
>>> +AUTHOR = "Luotao Fu"
>>> +HOMEPAGE = "http://www.pengutronix.de"
>>> +SECTION = "console/network"
>>> +PRIORITY = "optional"
>>> +LICENSE = "LGPL"
>>> +DEPENDS = "libsocketcan"
>>> +RDEPENDS = "libsocketcan"
>>
>> Why do you need this RDEPENDS on the lib when it is already in DEPENDS?
>
> The better question is "Why doesn't OE shlib code pickup that
> dependency?" :)
...

I thought that both settings worked independly and added RDEPENDS because 
of the shared library.  But the dependency was indeed detected 
automatically.

As for the git access: it's our policy here to fetch if possibly directly 
from a sourcecode repository.  Providing readonly access via git or svn is 
really getting common and I guess those tarballs will go away sometime.

BTW: there is already a new canutils/libsocketcan release which ships with 
a new linux/can/netlink.h header (can_netlink.h).  I will provide recipes 
for both versions and ship can_netlink.h again.  Otherwise it could 
create a race between libsocketcan and linux-libc-headers versions.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


