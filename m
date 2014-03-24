Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 26F076EFCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 21:29:14 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so6315294veb.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Cb7ZxtqvcM+UTprQaIuOsn6zdTfaxt06aU1p8S9xcwA=;
	b=Dq+tLw2rB1Ql+ifpOpnPrJDdSEcvRjE4g8tFmM51Eml1LWaS6PmAPKyekfu86zoYpt
	+RH2RuNx7zeO42+KsS76To0p59NLrVO/8G8+VZSY9CX+FCv/T0qvyVdjl0AsITPPLCpm
	MxtZ8c/o0ZBr8jEpirJiXjz4kYhB0hMfK8VPWfYqiuC8G4iJLuqF3nWzCvOCyFRC1W2x
	eRspOqvMpCXeMm+7S6MOkKdRteDba+3oToEHAtRBJPhjtI5B8jCQrcSk5SQvDtHa0Oj4
	wSkDFxibk8Wnd239paAsWVnk45FQJk2gDL5v6PBgfYb63NOD8kc6ixjTRLJ28wUmPOQ7
	EE+Q==
MIME-Version: 1.0
X-Received: by 10.52.166.103 with SMTP id zf7mr2622853vdb.30.1395696555811;
	Mon, 24 Mar 2014 14:29:15 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Mon, 24 Mar 2014 14:29:15 -0700 (PDT)
In-Reply-To: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
Date: Mon, 24 Mar 2014 14:29:15 -0700
Message-ID: <CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: exo build fail on master and master-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2014 21:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

The error is occurring on master-next (and master I presume) when building
xfce4-taskmanager (as part of XFCE4 Extended package group). I confirmed it
on both qemuarm and on Gumstix Overo as build targets. This tells me it's a
bug, but there still might be something unique about my setup.

Can anyone verify if xfce4-taskmanager can be built successfully?

Thank you,

Adam


On Fri, Mar 21, 2014 at 2:08 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Good day everyone,
> On both master and master-next, I get build fail on exo like below:
>
> configure.ac:112: error: possibly undefined macro: AC_PROG_INTLTOOL
>
>       If this token and others are legitimate, please use m4_pattern_allow.
>
>       See the Autoconf documentation.
>
> autoreconf: /media/Build/master-next/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf failed with exit status: 1
>
> Full log is here <http://paste.ubuntu.com/7132707/>
>
> Thank you for your help,
>
> Adam
>

