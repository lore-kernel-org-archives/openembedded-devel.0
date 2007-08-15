Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1ILFZa-0001C8-K3
	for openembedded-devel@openembedded.org; Wed, 15 Aug 2007 11:53:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7F9rWDo023142
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Aug 2007 10:53:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22751-09 for <openembedded-devel@openembedded.org>;
	Wed, 15 Aug 2007 10:53:28 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7F9rRUx023135
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Aug 2007 10:53:27 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <8852460a0708140740r4eca93ddhb9d04b7e506ae010@mail.gmail.com>
References: <8852460a0708140740r4eca93ddhb9d04b7e506ae010@mail.gmail.com>
Date: Wed, 15 Aug 2007 10:53:27 +0100
Message-Id: <1187171607.6609.20.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: BitBake Compilation errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2007 09:53:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2007-08-14 at 14:40 +0000, Vamsi wrote:
>     pd.delDomain("BB_URI_HEADREVS")
>   File "bitbake-1.8/lib/bb/persist_data.py", line 66, in delDomain
> AttributeError: 'pysqlite2.dbapi2.Connection' object has no attribute 'execute'

This looks like an old version of python which has a pysqlite2 module
missing features we use. Which version of python and pysqlite2 is this
and can you upgrade it?

Regards,

Richard



