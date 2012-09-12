Received: from gnukia.org ([85.214.67.64] helo=cbs.gnukia.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tilman@baumann.name>) id 1TBpYY-0000wd-Eb
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 18:12:50 +0200
Received: from cbs.gnukia.org (cbs.gnukia.org [127.0.0.1])
	by localhost (Postfix) with ESMTP id 12050EC4003
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 17:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on cbs.gnukia.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=8.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.0.21] (mail.grandeye.com [82.16.22.188])
	by cbs.gnukia.org (Postfix) with ESMTPSA id D76E8EC4002
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 17:54:04 +0200 (CEST)
Date: Wed, 12 Sep 2012 17:00:16 +0100
From: Tilman Baumann <tilman@baumann.name>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504E1F94.9000606@baumann.name>
	<20120911044922.GD2980@sakrah.homelinux.org>
	<504EFEE1.3040000@baumann.name>
	<CAC+thW1XEngvZiUssM2s4L93ebc1pxy1ibA5zuZmDQL-3aoHTQ@mail.gmail.com>
In-Reply-To: <CAC+thW1XEngvZiUssM2s4L93ebc1pxy1ibA5zuZmDQL-3aoHTQ@mail.gmail.com>
X-Filtered: By ProxSMTP
Message-ID: <5050B190.2080409@baumann.name>
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.42/RELEASE,
	bases: 20111108 #5646748, check: 20120912 clean
Subject: Re: minimal template layer for new machine support
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
X-List-Received-Date: Wed, 12 Sep 2012 16:12:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/12 14:48, Andrea Galbusera wrote:
> Hi Tilman,
>
> On Tue, Sep 11, 2012 at 11:05 AM, Tilman Baumann <tilman@baumann.name> wrote:
>> On 11/09/12 05:49, Khem Raj wrote:
>>> On (10/09/12 18:12), Tilman Baumann wrote:
>>>> Hi,
>>>>
>>>> I'm working on a TI DM812x support overlay.
>>>> I guess what it comes down to is a new kernel recipe (based on TI's
>>>> sources) and this funny two stage u-boot.
>>>> I think I can write the recipes. But what I don't quite see is how I
>>>> would add a new supported machine in the first place?
>>>> I was trying to orient myself on a few existing machine support
>>>> layers. But I think I'm still missing the point.
>>>> What are the minimal basics to implement? Where should I start?
>>> check meta-ti
>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
>>>
>>> may be there is a BSP already or something similar you can start off.
>>>
>>>
>> Oh, great. I think I can work with that.
>> I only knew the Arago project, but that is not based on oe-core.
> As far as I know, there also exists an effort by the meta-ti people to
> port the original Arago distro to the new layered architecture over
> oe-core: this is called meta-arago
> (http://arago-project.org/git/?p=meta-arago.git;a=summary).
> You'd better ask on the meta-ti list what the state of the art is for
> this project, but I think it is supposed to work with meta-ti and
> provide an alternative distro layer to Angstrom.
>
It seems to be lacking the board support for dm813x-evm.
I will ask the arago guys about it.

But really, since I still have to do kernel and u-boot from scratch, I 
don't think I gain much. (I can't use the original TI stuff.)
I guess if I would grokk how a basic hardware enablement layer is done, 
I would be better off.

Thanks
  TIlman


