Received: from mail-ia0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stanhu@gmail.com>) id 1TmADk-0002wF-SS
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 22:33:39 +0100
Received: by mail-ia0-f178.google.com with SMTP id k25so4315861iah.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HOkScqh/LAPlp2apjP2o2cwlAdgr9i2+oYXzLoVK+P0=;
	b=IFcKEXNu/arFAjAcFZXtYO1kcS0ZO+ddaA9fSAfFDEhW1d2LomnOx5qM9mGsU8mE/I
	sL+f52/aq0J4DBELv4xM9BE5VjWUetrhNVdtlTtX8c9bsdLBBFi2NQ0gfmM9WSy9uQBg
	yq4v5dBVPSUaXqx0MY8zRldIdGsUDa/qE3xWzGuWOTYlZgj2PDyxhBn+cgbjL0BzoxpA
	mVIa0bBMs+6WFcBwljzylWG/ZN1HPtMTTzVVMEfsPNEERDmnTIBBX9aP/xtAxR1723kX
	Rtx8IWbwy4IyZUbgAJ2KG8VI+VYrlu5xAHXcADmfHXr2lfrfGAgNxo1fNCl/w+GN/7MJ
	tHpw==
Received: by 10.50.158.170 with SMTP id wv10mr9961768igb.75.1356124726132;
	Fri, 21 Dec 2012 13:18:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.153.229 with HTTP; Fri, 21 Dec 2012 13:18:26 -0800 (PST)
In-Reply-To: <CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
From: Stan Hu <stanhu@gmail.com>
Date: Fri, 21 Dec 2012 13:18:26 -0800
Message-ID: <CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Fri, 21 Dec 2012 21:33:39 -0000
Content-Type: text/plain; charset=UTF-8

Thanks.  Oops, I meant the denzil branch.  It was updated today and has
this bug you reference.

On Fri, Dec 21, 2012 at 1:11 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Dec 21, 2012 at 9:58 PM, Stan Hu <stanhu@gmail.com> wrote:
> >> My automated build system updated to the latest master of
> >> meta-openembedded, and now I'm getting theis error message:
>
> I'm sure this isn't latest master.
>
> http://git.openembedded.org/meta-openembedded/commit/?id=f95109e3e04ee167fd0ceb80e62f7cfec81802de
>
> and see bug referenced in
>
> http://git.openembedded.org/meta-openembedded/commit/?id=2b4ec7cd91de4620abe5694d5aac6407bb143835
>
> >> ERROR: Multiple .bb files are due to be built which each provide udev
> >>
> (/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/
> >>
> udev_182.bb/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/
> >> systemd_git.bb).
> >>
> >> I think I have recipes that depend upon libudev, so BitBake pulls in
> both
> >> these recipes.  I'm not quite sure why I didn't get these warnings
> before I
> >> updated.  What's the best way to resolve this?
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

