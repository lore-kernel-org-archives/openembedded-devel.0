Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Onu16-0008WN-Q3
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 15:58:27 +0200
Received: by eyb7 with SMTP id 7so3224642eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8tll409pqLHGSlfEqfW8TiOGbgJXJAqxOkMscIFpc0k=;
	b=C9KD0GcW8oqFVyPnVdc5BcIuZ5vXVDpNyOs6KEMF2T6OVLfJrxWj4TiFuww3mBSa7B
	YTMP5Oa/APuXeBpEQ2CVyy19OdG9qk/DWVG1O4DIK42D4ua2b5A8pwp5n8CaNTMg2fbR
	EvzMCSfrDu2vV5CIl8uU28yOias67SLOdmZ2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iGZYVhEEkrBsom6B+DeUNkrEf8VBUtjKuQVdFIgOiSB3HiIFfu7E/i7RPftE0TyOJJ
	2cHl4i1uqlTY0/bOH6s4V7PO2Zqzr7dPwFkTfvZvFovp61WB6OydN3HRt/2siZvby01P
	bgs7tBOyfXpzaPZMJbHsGCTyKjztySxXYIYYQ=
Received: by 10.216.37.193 with SMTP id y43mr5978792wea.59.1282658275293; Tue,
	24 Aug 2010 06:57:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 24 Aug 2010 06:57:35 -0700 (PDT)
In-Reply-To: <AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Aug 2010 06:57:35 -0700
X-Google-Sender-Auth: U4mU9rmQLG7vDGc-FHJyYOag7Ho
Message-ID: <AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Tue, 24 Aug 2010 13:58:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 23, 2010 at 11:32 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/23 Khem Raj <raj.khem@gmail.com>:
> > On Mon, Aug 23, 2010 at 1:19 PM, Frans Meulenbroeks
>
> >
> > Sometimes I run into a issue and then I look into the existing patches
> > and apply it or port it forward/backward
> > that solves it. This will be not easily possible once these patches
> > are removed. but thats not such a big issue I do
> > not have a strong opinion on this either way.
> >
>
> I've been thinking about that as well. Onthe other hand some of these
> files seem to be relics of the past that apply to older versions and
> are not relevant at all.
> Anyway, if there is a maintainer who feels some files are useful, we
> can just keep them afaik. Just want to get rid of the orphaned stuff.
>
> BTW; there is one change needed for the script. Right after turning
> off my computer last evening I realised that some patches use ${PV}.
> Just did a quick check: there are 78 or so of them (and most are
> expanded only once). The script fails for these.
>
> Solution is to add the following line before the find:
> grep -q "file://.*\\$" *.bb *.inc && echo "cannot handle recipes with
> metavariables in the name" && exit
>
> Actually it would probably be nicer to have a parser that could parse
> the recipes and based upon SRC_URI could decide on what is needed and
> not.
> (and maybe also reorder things, detect for things that are syntaxwise
> ok, but that are an indication of an error (e.g. a double assignment
> of a variable).
> It could also tell about unused variables etc.
>
> Currently the parser is in bitbake, I have no idea on how to hook
> those kind of checks in the parser, or how to craft a python parser
> that would be able to do the above.
> It would be nice if someone with more python knowledge could give that a
> stab.
> BTW: I have been thinking about crafting a parser with lex/yacc, but
> especially the override mechanism does not allow to make a simple .y
> file for it (e.g. SRC_URI cannot be made a token because we also can
> have SRC_URI_xyz etc)


SRC_URI shouldn't be a token.  It's not special to the file format, it's
just a variable :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

