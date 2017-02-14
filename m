Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A024960777
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 18:08:58 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v186so24496027wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wh326A+uBAd6Pa/vrYiks4s//hQb384WFjNL4ckQMzs=;
	b=dTZqjZOLP+iiC6fqkk+n5SlcQhDiX4YwrGDebjsf3HHy5/UsP6T+zqQ8PsoXLo8NDR
	e1Mp5zUfIbBBnup9qatxgx/HOQbp3I6vBvPyzvSmkCzKrR2Gsx3Guon1o+XSMaIK2ZCw
	S+fzVVbIo/YZj3T4spQ6+3zKGyg7riT/TC/GYaVSczBUxY0lcyGogItkbFs0D/ORmqHe
	KTX3KEAS2SRK9bWJfJB8Z7GNgqdaPyasQbFkc0mQL5WitDZzfb9Y9q51vYkFTfUhF4hX
	sclzP8LYsxFEPuutDibgyqVzsE203wh063NtNAY+5DsoGMOQqgkBF9ilcjoS5dDSFw7f
	J7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wh326A+uBAd6Pa/vrYiks4s//hQb384WFjNL4ckQMzs=;
	b=pU5lAlvdL7vcNKia0EjeX18Wdr2FX/aGDB46XWeA61BGw4NzhN9wWAi8+ymQe6NfIy
	XvFP0AUU2duZodZImdKGVBWiCCdOQyLeTBbFPDKmlFA5Pf4XKfjNTbfH4bVLP1EpKcFO
	Zy5SQWREjrScgl+7shHL4hYIxqEHpiS63LKD41swBgj56js5/Pd8E4H3CKNzFg+hFto4
	Ao5csE+pxiJqdl7slvgOLe4/8x4pL9KvX/nhiEtpFukwPADp+q5dSPlv6PrJI/s520J1
	Kp1v/6MwxNHPDXpD9IDGibV+0jXOugLEB/ObWJoFdSjb1cAXVxNvv76DYnLfXQYb1B95
	aOOg==
X-Gm-Message-State: AMke39ndQURZEnYwdDMoCK0RySvQb/xJ3BqWMBpiYO/zwquK78HpFZw9pw6tmRyb3mQcYEjaX2TlKdzliO5H8A==
X-Received: by 10.28.91.19 with SMTP id p19mr4170174wmb.49.1487095738133; Tue,
	14 Feb 2017 10:08:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Tue, 14 Feb 2017 10:08:57 -0800 (PST)
In-Reply-To: <1487093290.13854.355.camel@intel.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
	<1487093290.13854.355.camel@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 19:08:57 +0100
Message-ID: <CA+chaQc+pT3pj-MJFHY=AJBdqgdrhqNmqM+k1KDm8-Nfir02Sw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: multipath-tools on arm (was: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 18:08:59 -0000
Content-Type: text/plain; charset=UTF-8

Have you tried to reproduce it in qemuarm build after enabling thumb in
poky?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213

On Tue, Feb 14, 2017 at 6:28 PM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> [dropping OE-core mailing list]
>
> On Tue, 2017-02-14 at 16:35 +0100, Patrick Ohly wrote:
> > On Fri, 2017-02-10 at 09:28 +0100, Martin Jansa wrote:
> > >     *
> > > meta-openembedded/meta-oe/recipes-support/multipath-
> tools/multipath-tools_git.bb:do_compile
> >
> > This is http://errors.yoctoproject.org/Errors/Details/130529/ and now
> > blacklisted with the comment "Fails to build with RSS
> > http://errors.yoctoproject.org/Errors/Details/130529/"
> >
> > However, the error isn't about RSS. It looks like an inline-assembler or
> > compiler bug:
> >
> > {standard input}: Assembler messages:
> > {standard input}:80: Error: shifts in CMP/MOV instructions are only
> supported in unified syntax -- `mov r12,r12,ror#3'
> > {standard input}:80: Error: shifts in CMP/MOV instructions are only
> supported in unified syntax -- `mov r12,r12,ror#13'
> > ...
> > ../Makefile.inc:66: recipe for target 'debug.o' failed
> > make[1]: *** [debug.o] Error 1
> >
> > Does anyone know what this could be? I'll also fire up a build in the
> > meantime.
>
> I've not been able to reproduce that error based on current Poky
> (OE-Core d1109378d73, bitbake 95deecab, meta-openembedded 044e518954),
> neither with DISTRO = "poky" nor without it :-/
>
> Martin, can we try reverting this in meta-openembedded to see whether
> the problem comes back?
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>

