Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RlVQ5-0001tX-Ag
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 01:55:01 +0100
Received: by wibhm17 with SMTP id hm17so1816591wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6AbeYtAiMbooGM/vlG3S1/vdYpu9rLsIMXDvnxNSyxU=;
	b=l0w8g1DdkZB3g/Dv6dy5yedUaYkVP6qRejyak/XMa1UyhMguyLcx1G2i4x3LMRxPXh
	HjrcadwDXiM0fcBJDB359Ykq9OBhE0Tp/L/2kDlxmzTrfRpidyakG0igQVyEJBvv/eDi
	dRNRumq1gxu/fkTuHgvrCPpbVCX1j9nR82IhI=
MIME-Version: 1.0
Received: by 10.180.19.97 with SMTP id d1mr144162wie.12.1326415649627; Thu, 12
	Jan 2012 16:47:29 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.155.209 with HTTP; Thu, 12 Jan 2012 16:47:29 -0800 (PST)
In-Reply-To: <CAEsOVNevm9gf7xvXSyQBeuxA-GmSeco1FVTVejyEYLk_dtp76Q@mail.gmail.com>
References: <jemqcg$1q0$1@dough.gmane.org>
	<CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
	<CAEsOVNevm9gf7xvXSyQBeuxA-GmSeco1FVTVejyEYLk_dtp76Q@mail.gmail.com>
Date: Thu, 12 Jan 2012 18:47:29 -0600
X-Google-Sender-Auth: BLahDzGfaTFJRCyLeccFSYBAr14
Message-ID: <CAPOJ94NPC1CQJKSXTyyV93HTyaRrDYNRO7bFjXR+1Wd1oxJaBg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Fri, 13 Jan 2012 00:55:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 6:06 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Thu, Jan 12, 2012 at 5:26 PM, Peter Bigot <bigotp@acm.org> wrote:
>> On Thu, Jan 12, 2012 at 8:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> tl;dr version: get your subject-prefix right
>>>
>>> Hi,
>>>
>>> I've cleaned up patchwork by marking every meta-oe patch as archived, minus
>>> the one Martin just sent.
>>>
>>> This means all the pending patches for meta-oe are listed here:
>>>
>>> http://patches.openembedded.org/project/oe/list/?q=meta-oe
>>>
>>> If your patches are missing, resend them using the method outlined in the
>>> README of the respective meta-openembedded layer.
>>>
>>> I'll include the meta-oe one below, since too many patches still don't comply:
>>>
>>> - ---------------------------------------------------------------------------
>>>
>>> This layer depends on:
>>>
>>> URI: git://git.openembedded.org/openembedded-core
>>> branch: master
>>> revision: HEAD
>>>
>>> Send pull requests to openembedded-devel@lists.openembedded.org with
>>> '[meta-oe]' in the subject'
>>>
>>> When sending single patches, please use something like 'git send-email -1
>>> - --to openembedded-devel@lists.openembedded.org --subject-prefix meta-oe'
>>>
>>> You are encouraged to fork the mirror on github
>>> https://github.com/openembedded/meta-oe/ to share your patches, this is
>>> preferred for patch sets consisting of more than one patch. Other services
>>> like gitorious, repo.or.cz or self hosted setups are of course accepted as
>>> well, 'git fetch <remote>' works the same on all of them. We recommend
>>> github because it is free, easy to use, has been proven to be reliable and
>>> has a really good web GUI.
>>>
>>> Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
>>>
>>> - ---------------------------------------------------------------------------
>>>
>>> The most important thing of that is the subject prefix. I only read emails
>>> with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
>>> http://patches.openembedded.org/project/oe/list/?q=meta- more often than
>>> oe-devel.
>>>
>>> So: Get your subject-prefix right
>>>
>>> And kudos to Andreas, Martin and Otavio for getting their pull requests
>>> right pretty much all the time.
>>
>> While I appreciate that a blanket "throw it out; if they care they'll
>> resend it" approach is an effective way to deal with the backlog
>> resulting from an absence, I don't appreciate that in addition to the
>> time I spent crafting patches to improve oe-core and submitting them
>> (with the right prefix AFAIK), I am now expected to do so again.
>> Further, the archived discussion of one of my patches included a
>> request for clarification on how to address a licensing issue which
>> was never answered, and which now presumably never will be.
>>
>> This sort of practice discourages people (well, me at least) from
>> contributing to this project.
>
> Perhaps you can just mark them correctly in patchworks again instead
> of resubmitting? Somewhat easier, you can even keep a list of patch
> id's and do this automatically via the pwclient.

Maybe; the only one I can see in the archive is the one that has an
unanswered question.  If I request a patchwork account, would I be
able to do this?  (I don't have/use/know anything about pwclient.)

The others don't appear to be there; maybe they got merged in since I
last looked, in which case I apologize for grumbling prematurely.  (My
oe-core effort is unfunded so I only get a chance to poke at it for a
couple days every couple weeks, and only see the emails during the off
times.)

Peter

> -M
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


