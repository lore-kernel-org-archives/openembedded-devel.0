Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id A01036059F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 14:10:13 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id y50so915943uay.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZmtqZ3XjQiR1jHrgeuCP1JKeC1k+20w2BZ6dJzX+Xg=;
	b=aEniofYV+/+W+bwgV2aDnlNX566X9LXCWu2w0sxhSHB54ZeY+tr0ooEIGoeQN8Op40
	i764ZQbMMosH4Qm1O5BriIARUEQKEctCALnXDq8xnTFRGWAn2YjjRzL+Bs+14Jr3gdEj
	hZrX2cFCi9HuXe4deoxQiYFmbMKfMrsZvzb+Dr+UFfF4jF4AMANvnzlvviZL51P0d0vl
	9jy6gJTHi/58TmIli5W+fSb0Viy+br/gjYh8fUpLd9WOAG77kGVNYzDBZoeWWFga+Myq
	qgh/izDYNVVeawRuXr8TYDfuHG4Za6u6w416wPTRydlkKZE0Nw2F8xAAkpbG08ypXcVF
	m1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZmtqZ3XjQiR1jHrgeuCP1JKeC1k+20w2BZ6dJzX+Xg=;
	b=TP4cb1XkYgIjzyKkYg1iWwHOgoY+DvOe1kTIY/+Ifz5+5QcBIehL4nl60P5Zbr3CKK
	571k0bWOAVAhrMlXESdBIsqQl6xv4D/UOjiIBYhVRgiXLGX/uoywaScC0a01iHwZQjMD
	0/jtALk+Z4qTO7Ssj9WUlamJzU40sBHxEfipAGHl7n6oL9pODkNvIZNVm7j/3IwE1OGS
	W6esn7F1NRst8V/Vj8Lpw3CozM+oEsIp21fBqCkj8iqb/8Xob9KtathEr6iz7kOrwQJ8
	7MrS4JMeW4/bidZyZpOMEc5FDeR03toyj2Jw/zbhRAgt+TrEKCAVVgV+r6W8qLkQ0tHM
	1CQA==
X-Gm-Message-State: AHPjjUj14M5Fcc9ROLZASlBpLA05BZ5CoNkYMUvy8wrvpIev4Uo2O6MB
	pPRhnjUTVEoW1NZqonQPzlF+GFr2fA==
X-Google-Smtp-Source: ADKCNb4sHejzuQvHq72PKS2szO0TqPFel+SSkxmCMn/wFvMMAm54vgsaiQRjhX89Mdfa2ZeG+00rJ+DmF+6ueVn8GoA=
X-Received: by 10.176.77.76 with SMTP id k12mr1063577uag.137.1504275014168;
	Fri, 01 Sep 2017 07:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.93.42 with HTTP; Fri, 1 Sep 2017 07:10:13 -0700 (PDT)
In-Reply-To: <1878611.57GleFT2nc@peggleto-mobl.ger.corp.intel.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
	<C8465E87-50F5-4857-8835-3B8D7D25D6C8@linux.intel.com>
	<CAC+thW1YCXd-RGakNnfx-j8z3W0Cq9wwTORWNzv9bt=7VKSC2w@mail.gmail.com>
	<1878611.57GleFT2nc@peggleto-mobl.ger.corp.intel.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 1 Sep 2017 16:10:13 +0200
Message-ID: <CAC+thW1bDC6+=MaY0U8OVcQPG=pmhn4=2xQq5HciymJtJ+D8Dg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/2] Add a couple of MQTT support recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 14:10:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 1, 2017 at 1:08 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Friday, 1 September 2017 6:03:52 PM NZST Andrea Galbusera wrote:
> > On Fri, Sep 1, 2017 at 6:44 AM, Tim Orling <
> timothy.t.orling@linux.intel.com
> > > wrote:
> > > > On Aug 31, 2017, at 9:02 PM, Paul Eggleton <
> > > paul.eggleton@linux.intel.com> wrote:
> > > >
> > > > Add a couple of recipes from meta-intel-iot-middleware to support
> MQTT.
> > > > Since the meta-intel-iot-middleware layer isn't being actively
> > > > maintained and these aren't in any way Intel-specific I figured they
> > > > ought to be brought up-to-date and moved somewhere that people can
> more
> > > > easily reuse them.
> > > >
> > >
> > > Thank you for this. It has been a concern of mine and this is a welcome
> > > solution.
> >
> >
> > Good news for me also! FWIW months ago there used to be a more recent
> > version of meta-intel-iot-middleware hosted on github as part of Ostro.
> > Since this was confusing to me I asked [1] on the list to clarify
> > maintenance status and relationships between the two things, but only
> got a
> > reply [2] from a former maintainer of the repo on yoctoproject.org.
> Anyway
> > I agree that having MQTT recipes in meta-oe will help! Thanks Paul for
> > that!
> >
> > [1]
> > https://lists.yoctoproject.org/pipermail/meta-intel/2016-December/
> 004462.html
> > [2]
> > https://lists.yoctoproject.org/pipermail/meta-intel/2017-
> January/004488.html
>
> No worries. I see you were after these two recipes and hiredis (and the
> latter
> is in meta-oe now as you probably know).
>

Yes! I'm currently using hiredis from meta-oe in a couple of projects now
and I'm more than happy to have it there! ;-)


>
> The recipes that aren't either obsolete or available elsewhere are as
> follows:
>
> hid-api
> libstrophe
> libwyliodrin
> mdns
> python-pyfirmata
> sshpass
> tempered
> wyliodrin-server
>
> Only python-pyfirmata looks particularly interesting to me, but if there
> are
> others that anyone would like preserved/updated please let me know.
>

None of them are of particular interest to me a.t.m, but thanks again for
in-depth auditing that layer.

