Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RlcHY-0001uH-Ru
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 09:14:41 +0100
Received: by vbbfc26 with SMTP id fc26so15695vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 00:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eUs0WRmBNBEdAOzEk+O3FltIbhzNJGDh03cqPacu/98=;
	b=jpxjByv0pW/L7m2amy4PbEh3f4A9+ssQKukFVOLfGMmeVpntmqcnFwagkFtOVXjD+S
	xUqJL/9SbV/ibUsOmDiKM51SiNBPvi2szo7J9OEUQJAfGVILrkTiQzyVwX82fvZVxCvJ
	En8b6jLjiKrXlqGsO5oZIWIJ3/WhNODod1WiU=
MIME-Version: 1.0
Received: by 10.52.155.176 with SMTP id vx16mr524881vdb.3.1326442027423; Fri,
	13 Jan 2012 00:07:07 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Fri, 13 Jan 2012 00:07:07 -0800 (PST)
In-Reply-To: <20120113070559.GA3483@jama.jama.net>
References: <jemqcg$1q0$1@dough.gmane.org>
	<CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
	<CAEsOVNevm9gf7xvXSyQBeuxA-GmSeco1FVTVejyEYLk_dtp76Q@mail.gmail.com>
	<CAPOJ94NPC1CQJKSXTyyV93HTyaRrDYNRO7bFjXR+1Wd1oxJaBg@mail.gmail.com>
	<20120113070559.GA3483@jama.jama.net>
Date: Fri, 13 Jan 2012 09:07:07 +0100
Message-ID: <CACW_hTbuifnP_DbcY4=BzmSWfiaqNWrtZa+Ur+GUQQ6oNsWshQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Fri, 13 Jan 2012 08:14:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/1/13 <martin.jansa@gmail.com>

> On Thu, Jan 12, 2012 at 06:47:29PM -0600, Peter Bigot wrote:
> > On Thu, Jan 12, 2012 at 6:06 PM, McClintock Matthew-B29882
> > <B29882@freescale.com> wrote:
> > > On Thu, Jan 12, 2012 at 5:26 PM, Peter Bigot <bigotp@acm.org> wrote:
> > >> On Thu, Jan 12, 2012 at 8:23 AM, Koen Kooi <
> koen@dominion.thruhere.net> wrote:
> > >>> -----BEGIN PGP SIGNED MESSAGE-----
> > >>> Hash: SHA1
> > >>>
> > >>> tl;dr version: get your subject-prefix right
> > >>>
> > >>> Hi,
> > >>>
> > >>> I've cleaned up patchwork by marking every meta-oe patch as
> archived, minus
> > >>> the one Martin just sent.
> > >>>
> > >>> This means all the pending patches for meta-oe are listed here:
> > >>>
> > >>> http://patches.openembedded.org/project/oe/list/?q=meta-oe
> > >>>
> > >>> If your patches are missing, resend them using the method outlined
> in the
> > >>> README of the respective meta-openembedded layer.
> > >>>
> > >>> I'll include the meta-oe one below, since too many patches still
> don't comply:
> > >>>
> > >>> -
> ---------------------------------------------------------------------------
> > >>>
> > >>> This layer depends on:
> > >>>
> > >>> URI: git://git.openembedded.org/openembedded-core
> > >>> branch: master
> > >>> revision: HEAD
> > >>>
> > >>> Send pull requests to openembedded-devel@lists.openembedded.org with
> > >>> '[meta-oe]' in the subject'
> > >>>
> > >>> When sending single patches, please use something like 'git
> send-email -1
> > >>> - --to openembedded-devel@lists.openembedded.org --subject-prefix
> meta-oe'
> > >>>
> > >>> You are encouraged to fork the mirror on github
> > >>> https://github.com/openembedded/meta-oe/ to share your patches,
> this is
> > >>> preferred for patch sets consisting of more than one patch. Other
> services
> > >>> like gitorious, repo.or.cz or self hosted setups are of course
> accepted as
> > >>> well, 'git fetch <remote>' works the same on all of them. We
> recommend
> > >>> github because it is free, easy to use, has been proven to be
> reliable and
> > >>> has a really good web GUI.
> > >>>
> > >>> Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> > >>>
> > >>> -
> ---------------------------------------------------------------------------
> > >>>
> > >>> The most important thing of that is the subject prefix. I only read
> emails
> > >>> with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
> > >>> http://patches.openembedded.org/project/oe/list/?q=meta- more often
> than
> > >>> oe-devel.
> > >>>
> > >>> So: Get your subject-prefix right
> > >>>
> > >>> And kudos to Andreas, Martin and Otavio for getting their pull
> requests
> > >>> right pretty much all the time.
> > >>
> > >> While I appreciate that a blanket "throw it out; if they care they'll
> > >> resend it" approach is an effective way to deal with the backlog
> > >> resulting from an absence, I don't appreciate that in addition to the
> > >> time I spent crafting patches to improve oe-core and submitting them
> > >> (with the right prefix AFAIK), I am now expected to do so again.
> > >> Further, the archived discussion of one of my patches included a
> > >> request for clarification on how to address a licensing issue which
> > >> was never answered, and which now presumably never will be.
> > >>
> > >> This sort of practice discourages people (well, me at least) from
> > >> contributing to this project.
> > >
> > > Perhaps you can just mark them correctly in patchworks again instead
> > > of resubmitting? Somewhat easier, you can even keep a list of patch
> > > id's and do this automatically via the pwclient.
> >
> > Maybe; the only one I can see in the archive is the one that has an
> > unanswered question.  If I request a patchwork account, would I be
> > able to do this?  (I don't have/use/know anything about pwclient.)
>
> If it still works the same, then create patchwork account yourself with
> same e-mail address you're using when sending patches and you should be
> able to update your patches.
>
> > The others don't appear to be there; maybe they got merged in since I
> > last looked, in which case I apologize for grumbling prematurely.  (My
> > oe-core effort is unfunded so I only get a chance to poke at it for a
> > couple days every couple weeks, and only see the emails during the off
> > times.)
>

I could find 3 patches:
http://patches.openembedded.org/project/oe/list/?submitter=1693&state=*&archive=both


>
> Be aware that oe-core patches are not really tracked on patchwork,
> patchwork is used mostly for meta-* patches.
>
>
> oe-core patches are tracked on a different project:
http://patches.openembedded.org/project/oe-core/list/


Best regards, Frans

