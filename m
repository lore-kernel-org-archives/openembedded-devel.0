Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8w3x-0003vu-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 16:24:15 +0200
Received: by ewy2 with SMTP id 2so102805ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=IrV+h36w6+zPQiC4mmo3xqx0RHv8e1RW+O05ZKGQt8I=;
	b=lGHJgPtF91Qn27pz/o9qFYEKqNW/BQGRDNwWc+8F+RSgLG0T9pFM+fuPAi82H4tbEq
	n22uGQFbYtM6yJQF5YKvo3HssGhWYfatTaqMt1PkXAQLJkcw/5sNmfbTz3jyfqY4UdDH
	wyh+PxAlDErJHpj+BEKdu6My2Vl4FxlNIw6YI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=c90FSIub51rixeWpOKaxhy5SrtMfgzB4EI4DBpdydwIXFsTS8xJAVL1jxYVRrH0lAK
	/4Ucfjm/1jG3AeCimMUIVb/wrOEq86i+KGEuElTFBKZZFC9GR7vwI/XmUqtN5cbP8pNE
	3zi/4Yzh9QhkMyHQ5E/JQnPICK4Cz0Sj2sRMM=
Received: by 10.216.23.129 with SMTP id v1mr9719670wev.49.1287671012530; Thu,
	21 Oct 2010 07:23:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 21 Oct 2010 07:23:12 -0700 (PDT)
In-Reply-To: <AANLkTikjqoyX4kJ+RMARq+mv8TrV37C4fMqbCuev8r38@mail.gmail.com>
References: <i9p1gp$7q4$2@dough.gmane.org>
	<AANLkTikjqoyX4kJ+RMARq+mv8TrV37C4fMqbCuev8r38@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Oct 2010 07:23:12 -0700
X-Google-Sender-Auth: zD04zuTRirkF7MLdFpgN3DAVAkE
Message-ID: <AANLkTi=NrwC2cQ9r6ACP8LCYae2tKyjaYGc23S2-pjAm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] splitting the metadata into multiple bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 14:24:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 21, 2010 at 3:31 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> > Please discuss splitting the metadata here and not in the conf/machine
> > thread :)
> >
> > Have a look at http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/ to
> > see how RP has done it.
> >
> > regards,
> >
> > Koen
>
> Looks good to me.
> We might need some other and additional categories (e.g. recipes-opie).
> I can also imagine images and tasks becoming a separate group.
>
> What would be nice is if there is a mechanism or description what
> subtrees require what, so it becomes easier to set up a BBPATH that
> e.g. leaves out the qt recipes if you are not interested in those.
> Guess ideally the relations between the subtrees should be a directed
> graph (without cycles). Not fully sure if this is feasible though.


The only thing I dislike about doing this is that it's not entirely clear
glancing at the tree which of those subtrees have a given recipe you're
looking for, but that's a fairly minor thing given the benefits.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

