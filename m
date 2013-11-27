Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59B306B5D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:10:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR2ASlT029786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 18:10:28 -0800 (PST)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 18:10:27 -0800
Message-ID: <52955598.7030406@windriver.com>
Date: Wed, 27 Nov 2013 10:14:48 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.82
MIME-Version: 1.0
To: Joe MacDonald <joe@deserted.net>
References: <1384844550-18276-1-git-send-email-xufeng.zhang@windriver.com>
	<528B0D8A.2090101@windriver.com>
	<20131126145058.GA3939@deserted.net>
In-Reply-To: <20131126145058.GA3939@deserted.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] quagga: Avoid duplicate connected address adding to the list
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
X-List-Received-Date: Wed, 27 Nov 2013 02:10:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2013 10:51 PM, Joe MacDonald wrote:
> [Re: [oe] [OE][PATCH meta-networking] quagga: Avoid duplicate connected address adding to the list] On 13.11.19 (Tue 15:04) Xufeng Zhang wrote:
>
>    
>> Hi Joe,
>>
>> After this fix, we can do nothing to other daemons.
>>      
> Nice.  Thanks for following up on this, Xufeng.  Do you think it is
> reasonable to remove ripd-fix-two-bugs-after-received-SIGHUP.patch, or
> is it still required for ripd?
>    

We should still keep it since 
ripd-fix-two-bugs-after-received-SIGHUP.patch also
fix another bug(RIP_NO_SPLIT_HORIZON flag problem).


Thanks,
Xufeng

> -J.
>
>    
>>
>> Thanks,
>> Xufeng
>>
>> On 11/19/2013 03:02 PM, Xufeng Zhang wrote:
>>      
>>> commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal")
>>> introduces an regression: ifp->connected list is cleaned up when ripd is
>>> restarting, however, for interface addresses which are not specified in
>>> ripd configuration file, they are never to be added into ifp->connected
>>> again, this will lead to some abnormal behavior for route advertising.
>>>
>>> Instead of cleaning up the ifp->connected list to avoid duplicated
>>> connected address being added into this list, we can check this
>>> condition during interface address adding process and return early
>>> when an identical address has already been added.
>>>
>>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>> ---
>>>   .../quagga-Avoid-duplicate-connected-address.patch |   53 ++++++++++++++++++++
>>>   .../recipes-protocols/quagga/quagga.inc            |    3 +-
>>>   2 files changed, 55 insertions(+), 1 deletions(-)
>>>   create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
>>>
>>> diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch b/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
>>> new file mode 100644
>>> index 0000000..585dc29
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
>>> @@ -0,0 +1,53 @@
>>> +quagga: Avoid duplicate connected address adding to the list
>>> +
>>> +commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal")
>>> +introduces an regression: ifp->connected list is cleaned up when ripd is
>>> +restarting, however, for interface addresses which are not specified in
>>> +ripd configuration file, they are never to be added into ifp->connected
>>> +again, this will lead to some abnormal behavior for route advertising.
>>> +
>>> +Instead of cleaning up the ifp->connected list to avoid duplicated
>>> +connected address being added into this list, we can check this
>>> +condition during interface address adding process and return early
>>> +when an identical address has already been added.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Hu Yadi<Yadi.hu@windriver.com>
>>> +Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>> +---
>>> +--- a/lib/if.c
>>> ++++ b/lib/if.c
>>> +@@ -738,6 +738,16 @@
>>> +                          struct prefix *destination)
>>> + {
>>> +   struct connected *ifc;
>>> ++  struct listnode *cnode;
>>> ++  struct connected *c;
>>> ++  int ret = 0;
>>> ++
>>> ++  for (ALL_LIST_ELEMENTS_RO (ifp->connected, cnode, c))
>>> ++    {
>>> ++      ret = connected_same_prefix (p, (c->address));
>>> ++      if(ret == 1)
>>> ++        return NULL;
>>> ++    }
>>> +
>>> +   /* Allocate new connected address. */
>>> +   ifc = connected_new ();
>>> +--- a/ripd/rip_interface.c
>>> ++++ b/ripd/rip_interface.c
>>> +@@ -516,13 +516,6 @@
>>> + 	  thread_cancel (ri->t_wakeup);
>>> + 	  ri->t_wakeup = NULL;
>>> + 	}
>>> +-
>>> +-      for (conn_node = listhead (ifp->connected); conn_node; conn_node = next)
>>> +-	{
>>> +-	  ifc = listgetdata (conn_node);
>>> +-	  next = conn_node->next;
>>> +-	  listnode_delete (ifp->connected, ifc);
>>> +-	}
>>> +     }
>>> + }
>>> +
>>> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
>>> index 2106c9b..21c2028 100644
>>> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
>>> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
>>> @@ -32,7 +32,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
>>>              file://watchquagga.init \
>>>              file://watchquagga.default \
>>>              file://volatiles.03_quagga \
>>> -           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
>>> +           file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
>>> +           file://quagga-Avoid-duplicate-connected-address.patch"
>>>
>>>   PACKAGECONFIG ??= ""
>>>   PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
>>>        
>>      
>    


