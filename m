Return-Path: <dylan.bartlett@metixmedical.co.uk>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7989F600BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 17:10:47 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id p124-v6so7182891iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=metixmedical-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=AO9LcKQot/s09tbrH89SQQX3aoWWDlu25ZazaveWO9Y=;
	b=y4bPKAfPlzhJstkFYuC2D+DinSNmvl2HmjAe5/lQcX2p3M4SJv0a4wlRV4lFTLh/UV
	jo3SVxfifeU44HHJnEV2VLcVV2xDbON4XKYTa2VCS/AZ3+Oamo0qFsUGcwWp2qD6NIIx
	4kkn6eIK9CJaKwB4IlM78v0/ZnBriKnwLCfQBrw8guPK81qd4cHdMiSq0MTxfALT0Ug6
	z0SbXCuWO4DMiclIlT+SUtW2YpToq19i+H3LwcSQzhL3Dxr/L5BCG5Q2rc34zYw18xH3
	b+yhZah3m+nbp3QahIosGE0VjDIIGVEVVt8wLN22LGD1PVaj9ARvdV8DWlsbbTn38gL7
	c5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=AO9LcKQot/s09tbrH89SQQX3aoWWDlu25ZazaveWO9Y=;
	b=Zg6l20JuAelJqmhKIBl5/IZE0Q0GewejFOAw1ohN89i/uIG7YytgwJbsBPTxjLHgli
	iHM2rc26SVotC9rbs7BhPhmJo4BfQ+6Vs4+tHqU5EHy3yhME3T7lG2JO4U4BUuBEj+RD
	aL4e2DatE+6yaTJyiIx658ObqCQ2ZqdubP0v0ZPJgqyULiTKGmF/Hrd6bsa5rxk0OxOX
	QPiXvOWo/4Y2v2ML9XgeEcSSFQdMaLPRU4sOBxiaU+zMRXlRL+PPzVWFJlcgpIlwxNDf
	xn07coGY9SxHnN408QS6UZMnxXi9IcU81sjAnE3/7qqWcnTCi8FGWVGzsyhZnH/wXGs8
	pXGg==
X-Gm-Message-State: ALKqPwd021S8/oNkD5ukfwdb9c6S0QsT1Tuo2GzqiTeFGpmr05r73tOc
	MntgU+w45qVzuJ18e8b9itnKjuHjLfgugVetiS/XAJLC
X-Google-Smtp-Source: ADUXVKJ/SLFlVgbFOBwXRR+LlZKrdcx35mdYaI2w/g+qzYy+cyPPcQC2SMFWC8gKefoCceX6c4wadxQFqjcnZ8NxMZc=
X-Received: by 2002:a6b:9f4c:: with SMTP id
	i73-v6mr2731024ioe.258.1527268247942; 
	Fri, 25 May 2018 10:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuZ8QBXvZ57MKzbwEkQ40mnYXMGLi4PaTM1TR=SKqJarQwuVQ@mail.gmail.com>
In-Reply-To: <CAFuZ8QBXvZ57MKzbwEkQ40mnYXMGLi4PaTM1TR=SKqJarQwuVQ@mail.gmail.com>
From: Dylan Bartlett <dylan.bartlett@metixmedical.co.uk>
Date: Fri, 25 May 2018 18:10:38 +0100
Message-ID: <CAFuZ8QDVwomMXPuMq7AA_DRKkhovS0a2q9wS9B0Nj50CqDRxSQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Do_install_append() with qmake
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
X-List-Received-Date: Fri, 25 May 2018 17:10:47 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry all, ignore this. Do_install_append works, from what I can only call
a formatting issue in my recipe seems to have stopped the _append from
running.

Fixing some of the formatting in my _append function seems to have started
things working.

My next issue seems to be that my application is building in a debug
configuration and the linker is producing a pretty large binary (~150MB).
But I haven't exhausted myself on that issue yet.

Thanks for taking the time to reply even though this is my own fault,
Dylan
On Fri, 25 May 2018 at 10:31 Dylan Bartlett <
dylan.bartlett@metixmedical.co.uk> wrote:

> Hello all,
>
> I hope you'll be able to help clear some things up for me.
>
> I have created a recipe to build and install a Qt Application I've been
> developing, so far everything has been working great and the program gets
> compiled, installed and packaged.
>
> However there is one additional install step I need to complete, which is
> creating a symbolic link to my binary in /opt to /usr/bin/b2qt. I want to
> do this so that the Boot2Qt appcontroller starts my application on boot.
>
> There are two ways I thought I could do this.
> 1. Use do_install_append() in the recipe to create the symbolic link.
> However qmake5.bbclass does not export the do_install function. Modifying
> the .bbclass with EXPORT_FUNCTIONS do_install breaks everything so I think
> that this is the wrong way to go about it.
>
> 2. Use target.extra in the qmake .pro file to add the extra commands.
> This one I had a bit more success with, I added my commands to
> target.extra and built the recipe.
> In this case do_install appeared to run properly. I could see my symbolic
> link in the image directory however the binary that was complied no longer
> appears in the image directory. So I've fixed one thing and broke another.
>
> At this point I've reached the end of what I think I can try, I'm sure I'm
> missing something simple since extra install steps are a common task. Can
> someone tell me what the canonically correct way that I should be doing
> this is?
>
> I've attached my recipe and a segment of my .pro if that helps.
>
> Best Regards,
> Dylan Bartlett
>

