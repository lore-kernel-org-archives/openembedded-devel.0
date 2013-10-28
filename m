Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 905006D225
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 03:28:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9S3SoRj009920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Oct 2013 20:28:50 -0700 (PDT)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 27 Oct 2013 20:28:49 -0700
Message-ID: <526DDBDD.6040104@windriver.com>
Date: Mon, 28 Oct 2013 11:37:01 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.82
MIME-Version: 1.0
To: Joe MacDonald <joe@deserted.net>
References: <1382608121-6622-1-git-send-email-xufeng.zhang@windriver.com>
	<20131024174404.GA3984@deserted.net>
	<5269CDA0.5030201@windriver.com>
	<20131025133147.GA4566@deserted.net>
In-Reply-To: <20131025133147.GA4566@deserted.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal
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
X-List-Received-Date: Mon, 28 Oct 2013 03:28:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2013 09:31 PM, Joe MacDonald wrote:
> [Re: [oe] [OE] [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal] On 13.10.25 (Fri 09:47) Xufeng Zhang wrote:
>
>    
>> On 10/25/2013 01:44 AM, Joe MacDonald wrote:
>>      
>>> [[oe] [OE] [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal] On 13.10.24 (Thu 17:48) Xufeng Zhang wrote:
>>>
>>>        
>>>> There are two problems for ripd implementation after received
>>>> SIGHUP signal:
>>>> 1). ripd didn't clean up ifp->connected list before reload
>>>>      configuration file which makes the same advertise packet
>>>>      being sent multiple times(depends on how many SIGHUP was recieved).
>>>> 2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
>>>>      during restart which is different from the flag when ripd is
>>>>      firstly started up, leading to unnecessary route to be advertised.
>>>>
>>>> [YOCTO #5266]
>>>>          
>>> Hey Xufeng,
>>>
>>> Normally I wouldn't go this deep into the detail but since you
>>> referenced the Yocto bug and the Quagga discussion in the commit log and
>>> the bug itself, I thought I'd try to understand what's going on here.
>>> The last thing I saw from the Quagga maintainer is this:
>>>
>>>     The ifp->connected list contains connected prefixes of a given
>>>     interface. These exist regardless of particular routing protocols and
>>>     emptying the list during ripd reconfiguration would be plain wrong. I
>>>     allow for a chance there is a bug that is related to ifp->connected
>>>     and SIGHUP handling at once, but not in this specific way.
>>>        
>> What he said is that this ifp->connected list is exist in all
>> routing protocols,
>> and if it needs cleanup, it should be done in a more general way, such as
>> in zebra client which is independent of routing protocol.
>>      
> I'm not sure that's the interpretation I would have taken from the
> quoted text, but if what you indicate is what the maintainer meant, then
> is he not saying that the SIGHUP handling issue also exists for other
> routing daemons in the suite?
quoted the sentence:
"

The ifp->connected list contains connected prefixes of a given interface. These exist regardless of particular routing protocols and emptying the list during ripd reconfiguration would be plain wrong.

"
All the other daemons also refer to the ifp->connected list, and I have 
checked the SIGHUP handler code of all daemons,
except ospfd and ospf6d(they only print a log when SIGHUP is received), 
all the other daemons suffer the same problem as ripd since
they reload the configuration file.

> Are you saying a similar patch would then
> be required for potentially all daemons in quagga?
>    
Not all.

> Don't get me wrong, repairing one is better than repairing none, but on
> my first read of his comments it didn't seem like the maintainer even
> agreed that there was a bug at all and your interpretation suggests that
> the same bug likely impacts all quagga daemons.  Any sense on whether
> that's the case?
>    
"

I allow for a chance there is a bug that is related to ifp->connected and SIGHUP handling at once, but not in this specific way.

"
My understanding is that if there is a bug related to ifp->connected, we 
should not fix in such specific way.
Yes, the maintainer didn't agree that there is really a bug here, but 
this is really a abnormal behavior:
every time when SIGHUP is received, the same address is appended to 
ifp->connected list over and over again,
so if too much SIGHUP are received, there will be a flood for the 
advertised packets.


Thanks,
Xufeng

> -J.
>
>    
>> But I have specified the reasons in the above email that why it's
>> not easy to
>> implement this general way:
>> #########################################
>> More comments:
>> Generally this connected interface address stuff is cleaned up in
>> rip_interface_address_delete()
>> which is triggered by zsend_interface_address(), but just as the
>> annotation said above
>> zsend_interface_address() function in zebra/zserv.c,
>> ZEBRA_INTERFACE_ADDRESS_DELETE
>> message could only happens in two cases:
>> 1). ip address uninstall
>> 2). RTM_NEWADDR on routing/netlink socket
>>
>> It didn't take the SIGHUP signal into consideration, but since the
>> SIGHUP is handled
>> by every daemon independently, this cleanup is not easy to be
>> implemented commonly,
>> so I think this is a proper way to do this.
>> #########################################
>> So it needs to redesign a lot of stuff to implement this.
>>
>>      
>>> and it looks like the patch here is the same as the one that the
>>> maintainer indicated is "plain wrong".
>>>   Can you help me get some
>>> confidence that this isn't going to have negative side-effects if we
>>> integrate it?
>>>        
>> Yes, there should be no side-effects:
>> 1. This modification is only going into ripd daemon and it only
>> takes effect when ripd is restarting.
>> 2. The fix for problem 1). just remove the previously connected
>> addresses of the interface, and these
>>      connected addresses list will be reconstructed when ripd read
>> the configuration during restarting.
>> 3. The fix for problem 2). definitely has not any side-effect
>> because I just restore the horizon flag to
>>      the values when ripd daemon is firstly start up.
>>
>> And the customer has already test the fix for a lot of times, no
>> problem is found.
>>
>>
>> Thanks,
>> Xufeng
>>
>>      
>>> -J.
>>>
>>>        
>>>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>>> ---
>>>>   .../ripd-fix-two-bugs-after-received-SIGHUP.patch  |   49 ++++++++++++++++++++
>>>>   .../recipes-protocols/quagga/quagga.inc            |    3 +-
>>>>   2 files changed, 51 insertions(+), 1 deletions(-)
>>>>   create mode 100644 meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
>>>>
>>>> diff --git a/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
>>>> new file mode 100644
>>>> index 0000000..c081143
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
>>>> @@ -0,0 +1,49 @@
>>>> +ripd: Fix two bugs after received SIGHUP signal
>>>> +
>>>> +There are two problems for ripd implementation after received
>>>> +SIGHUP signal:
>>>> +1). ripd didn't clean up ifp->connected list before reload
>>>> +    configuration file.
>>>> +2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
>>>> +    which lead to the unnecessary route to be advertised.
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>>> +---
>>>> +--- a/ripd/rip_interface.c
>>>> ++++ b/ripd/rip_interface.c
>>>> +@@ -500,6 +500,8 @@
>>>> +   struct listnode *node;
>>>> +   struct interface *ifp;
>>>> +   struct rip_interface *ri;
>>>> ++  struct connected *ifc;
>>>> ++  struct listnode *conn_node, *next;
>>>> +
>>>> +   for (ALL_LIST_ELEMENTS_RO (iflist, node, ifp))
>>>> +     {
>>>> +@@ -514,6 +516,13 @@
>>>> + 	  thread_cancel (ri->t_wakeup);
>>>> + 	  ri->t_wakeup = NULL;
>>>> + 	}
>>>> ++
>>>> ++      for (conn_node = listhead (ifp->connected); conn_node; conn_node = next)
>>>> ++        {
>>>> ++          ifc = listgetdata (conn_node);
>>>> ++          next = conn_node->next;
>>>> ++          listnode_delete (ifp->connected, ifc);
>>>> ++        }
>>>> +     }
>>>> + }
>>>> +
>>>> +@@ -548,8 +557,8 @@
>>>> + 	  ri->key_chain = NULL;
>>>> + 	}
>>>> +
>>>> +-      ri->split_horizon = RIP_NO_SPLIT_HORIZON;
>>>> +-      ri->split_horizon_default = RIP_NO_SPLIT_HORIZON;
>>>> ++      ri->split_horizon = RIP_SPLIT_HORIZON;
>>>> ++      ri->split_horizon_default = RIP_SPLIT_HORIZON;
>>>> +
>>>> +       ri->list[RIP_FILTER_IN] = NULL;
>>>> +       ri->list[RIP_FILTER_OUT] = NULL;
>>>> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> index 89b9f7a..bf37067 100644
>>>> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> @@ -31,7 +31,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
>>>>              file://quagga.default \
>>>>              file://watchquagga.init \
>>>>              file://watchquagga.default \
>>>> -           file://volatiles.03_quagga"
>>>> +           file://volatiles.03_quagga \
>>>> +           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
>>>>
>>>>   PACKAGECONFIG ??= ""
>>>>   PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>          
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>      
>    


