Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M67Fh-0006Mj-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 20:07:53 +0200
Received: from [0.0.0.0] (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id EF1821B3EC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2009 11:00:30 -0700 (PDT)
Message-ID: <4A11A22B.7000206@mvista.com>
Date: Mon, 18 May 2009 11:00:11 -0700
From: Christopher Larson <clarson@mvista.com>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>	<20090513212546.GF32320@denix.org>
	<20090518154833.GC19357@denix.org>
In-Reply-To: <20090518154833.GC19357@denix.org>
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown	implementation and use it by default.
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
X-List-Received-Date: Mon, 18 May 2009 18:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Wed, May 13, 2009 at 05:25:46PM -0400, Denys Dmytriyenko wrote:
>   
>> On Wed, May 13, 2009 at 01:53:18PM -0700, Chris Larson wrote:
>>     
>>> For each recipe which completes a task successfully, this emits the current
>>> version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
>>> ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
>>> in that order, in subsequent builds, to provide more deterinistic builds by
>>> default, and to let the user make the lockdown persist via a simple cp
>>> command.
>>>
>>> Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
>>> preferred over 5.3 by default given any distro version preferences, if they
>>> exist, the following are examples of its behavior:
>>>
>>> $ rm -rf tmp
>>> $ bitbake ncurses-5.3
>>> $ bitbake -c clean ncurses
>>> $ bitbake ncurses # builds ncurses 5.3
>>>
>>> $ cp tmp/versions.conf conf/
>>> $ rm -rf tmp
>>> $ bitbake ncurses # builds ncurses 5.3
>>>       
>> Very nice! Let me try it here...
>>
>>     
>>> Signed-off-by: Chris Larson <clarson@mvista.com>
>>>       
>
> Chris,
>
> Will you be sending an updated version of the patch, which handles TMPDIR 
> overwritten in local.conf, as we discussed last week? Thanks.
Yep, I'm going to make the thing opt-in rather than default, since 
apparently not everyone wants it as default behavior, and change it to 
use ?= assignments, and leave it at that.

-Chris


