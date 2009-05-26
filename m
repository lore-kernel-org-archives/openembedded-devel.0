Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8xRi-0000TN-V0
	for openembedded-devel@openembedded.org; Tue, 26 May 2009 16:16:03 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8xJp-0004fZ-RF
	for openembedded-devel@openembedded.org; Tue, 26 May 2009 14:07:53 +0000
Received: from pool-96-240-183-164.ronkva.east.verizon.net ([96.240.183.164])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 26 May 2009 14:07:53 +0000
Received: from philip by pool-96-240-183-164.ronkva.east.verizon.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 26 May 2009 14:07:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Philip Balister <philip@balister.org>
Date: Tue, 26 May 2009 10:07:42 -0400
Message-ID: <gvgt3e$nh2$1@ger.gmane.org>
References: <20090514101502.133dd3e0@christian.taskit.de>	<4A0BE509.8010406@gmx.net>	<20090515101109.10cde089@christian.taskit.de>
	<20090526100556.4c203e99@christian.taskit.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: pool-96-240-183-164.ronkva.east.verizon.net
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
In-Reply-To: <20090526100556.4c203e99@christian.taskit.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] [STABLE] cacao: add missing patch
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
X-List-Received-Date: Tue, 26 May 2009 14:16:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Christian Glindkamp wrote:
> On Fri, 15 May 2009 10:11:09 +0200
> Christian Glindkamp <christian.glindkamp@taskit.de> wrote:
> 
>> I think this should also go to the stable branch.
> 
> ping 

The patch has been applied to .dev. Adding [STABLE] in the subject line 
so the stable guys notice :)

I don't build cacao, but based on this cacao does not build in stable at 
the moment?

Philip


> 
> 
>>>> In revision af5fcda66139e002d098c0df952b43c455806aba the patch
>>>> cacao-disable-stackbase-check.patch was added to SRC_URI of all
>>>> cacao recipes without committing the patch itself. This patch
>>>> adds it to make cacao buildable again. The patch comes from the
>>>> jalimo overlay.
>>>>
>>>> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
>>>> ---
>>>>  .../files/cacao-disable-stackbase-check.patch      |   12 ++++++++++++
>>>>  1 files changed, 12 insertions(+), 0 deletions(-)
>>>>  create mode 100644 recipes/cacao/files/cacao-disable-stackbase-check.patch
>>>>
>>>> diff --git a/recipes/cacao/files/cacao-disable-stackbase-check.patch b/recipes/cacao/files/cacao-disable-stackbase-check.patch
>>>> new file mode 100644
>>>> index 0000000..8eb2089
>>>> --- /dev/null
>>>> +++ b/recipes/cacao/files/cacao-disable-stackbase-check.patch
>>>> @@ -0,0 +1,12 @@
>>>> +Index: cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c
>>>> +===================================================================
>>>> +--- cacao-0.99.3+hg20090109.orig/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:15.000000000 +0100
>>>> ++++ cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:24.000000000 +0100
>>>> +@@ -1077,7 +1077,6 @@
>>>> +       c = stat_buf[buf_offset++];
>>>> +     }
>>>> +     close(f);
>>>> +-    if (result < 0x10000000) ABORT("Absurd stack bottom value");
>>>> +     return (ptr_t)result;
>>>> +   }
>>>> + 



