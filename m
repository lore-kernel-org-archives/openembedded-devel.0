Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D19517780A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 17:13:42 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id q69so5217949lfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 09:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xCPA4aD23fQ1FbOp+G3hceqT+KXoDv7gq5XtZBnM/Zk=;
	b=HYUFeXlPii4p3NCdj1og1eTRyIfCGiXI5Iyu8K68NrSS2r0lOmzSB5Fn/FcU9gqtIH
	cTznvP6QplhF274CIgO/wLZXZjjjGusFdQYS30ycM7Ug7NljBNIewvL1t2wcIMPl23ha
	KG7+L1V3MEhhfrq3E+yBMpOubn3CA8gDBsidq3RSDrK3yGP5vXeIImXOeQwYru7OcliN
	c6P+62dbuA0A036momwAA3fqOuo5InT2GSxa9GezFk1onVyTdWVVNWGAW1WNnpuvr52m
	FtpgS5pVp/tbV3Geheo+zJMDLrj3GqYB9BuAmhk4/E0DtnZD87LZRLjSatLqIZROZYnR
	JIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xCPA4aD23fQ1FbOp+G3hceqT+KXoDv7gq5XtZBnM/Zk=;
	b=AWC07tywk1BwO9DX6IXjeMqEthhFjKReK1/PiteSvmFKeIIwJGvrQ9dJ2rlH2gaEER
	cgZuoEb2qRR4HAvgwQrUWRFNkfyK8iQjYBNVoLbq9BbVfh9Zlb+2A78hKAbXwRmrWQ3g
	k2QZ/6FgZrSaR42nxN2MjriMrLcVRc5+Xkl/ji7xIY5sOBtog9CVtfKWWWIef3zHjt/K
	SZ7AgxXrWFMBHE+rc8VAkAC8lX/PvMnkdxYGdBAF/x+7FqDCf9A3zKsDrJZIqyO115Rk
	RSO7XjThq3PmlqC3a1mGOzud+k0NfxLgCLM9/GDF1j0uacdIw1qM6BoYLM2xjH2Pbbn1
	XHbw==
X-Gm-Message-State: APf1xPArjGkK5xbTvqlgmmJYeSf+Y8tmhgtX2ECaWLc1H+6YC9bPB40T
	zkYPqrNbEqz3BEL/XlvrHePQuMrrF1LWhmmA50s=
X-Google-Smtp-Source: AH8x227D0bW3ZsgUI+BKpnRjGagt7qC8I/2wQq1EnhMlEwsWcbQroO7YTo4n94xEydqyIt9b4qxRBjeRA/T3YgCFSuA=
X-Received: by 10.25.181.8 with SMTP id e8mr225921lff.94.1519146823328; Tue,
	20 Feb 2018 09:13:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 20 Feb 2018 09:13:42 -0800 (PST)
In-Reply-To: <f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 12:13:42 -0500
Message-ID: <CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 17:13:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>> Hi,
>>
>> Is now a good time to talk about splitting up meta-oe?  Some layers are
>> actively developed and maintained (one example: meta-python), others are
>> basically bitrotting and only get touched when something else causes them
>> to break world builds (one example: meta-gnome).  I've long felt that
>> meta-oe should be split up and the high quality layers managed in their own
>> repositories so patches to them don't get held up by breakage in other
>> sub-layers.
> You make it sound like meta-oe is not a high quality layer.  I could
> make the same claim about oe-core master.
>
> I don't see the connection in patches being held up due to breakage in
> other sub layers. This only happens if the dependency fail to build.
>
> You lose control over the quality in current layers that reside in
> meta-openbedded just like you have no control over all the other layers
> residing in the community. It makes maintaining stable versions very
> difficult. Well, unless The Yocto Project takes over them.. I guess that
> would work then.
>
>>
>> Another advantage of splitting out the high quality layers is that we'd
>> like to look at running more community layers through the Yocto
>> autobuilder, and granular layers make that easier to manage.
>  I thought not including layers in bblayers.conf was easy enough.
>>
>> Comments?
>
> What problem do you thing you are trying to solve here?

My unrelated issues are that I can't update one layer, without getting
all of the updates.
.. but that is both a good thing (i.e. they are all tested together,
so you know that the
single SRCREV update is good for all layers), and a bad thing (when
you just want a
new python recipe update from meta-python, but don't want other changes).

It is very likely that splitting the layer would help one issue, but
make the other worse.

So no solution from me, just an observation about potential issue.

Cheers,

Bruce

>
> - armin
>>
>> Ross
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

