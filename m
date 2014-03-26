Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4B26B25F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 00:46:19 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so1471599veb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/x4rZolh9N3fyS6w+Kgd48/vVizggtwyiV6K9tUZezs=;
	b=idDgKxw3CDpqdkSUuPJ6DMsf4p3dA4Ot9qc4FH1GaWKpUVJ4wxRlRQCELaTmV12Zuc
	yGWKXSRUHBjF4dq8YqHWQK0+JB6nazyx51MTokKOuq/+0CofiwPu0bBtbRBtzC7vHdFC
	gOnjhxdJ/4/ngD23AbzTKW6wtOpfx0O7GOmOqoBGZuv5by7QzlIeumVi8MSouDm/POaG
	tT7TWYq4oNYuClkgAwxsphx59awylHBYvX0yb4pg8nZdxq6yj4yB0quTnji1E/LdFo4t
	nwwQ5YU2K35Urd4TgPiXit/vsdWwFSxZXcwRW9yuiU3C97jaRMntFyolrS+6oaINf1CE
	m6UA==
MIME-Version: 1.0
X-Received: by 10.220.161.8 with SMTP id p8mr57795280vcx.4.1395794780678; Tue,
	25 Mar 2014 17:46:20 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Tue, 25 Mar 2014 17:46:20 -0700 (PDT)
In-Reply-To: <CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
	<CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
Date: Tue, 25 Mar 2014 17:46:20 -0700
Message-ID: <CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: richard.purdie@linuxfoundation.org
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
X-List-Received-Date: Wed, 26 Mar 2014 00:46:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

exo-native (one of xfce4-taskmanager deps) was the point of failure. More
specifically, exo-native was failing during configuration time. I
discovered that, on master-next, exo-native build finishes by reverting
this commit in autoconf.bbclass<https://github.com/openembedded/oe-core/commit/79ea036de331bde65a88fb777647dc099ef05acf>.
This commit was new this year in Yocto Project 1.6. I have no idea how this
commit breaks exo-native build. So I can't discern if the commit has
errors. This still could very be a configuration issue in my build machine.

Can anyone take a look at the commit one more time?

Thank you,

Adam




On Mon, Mar 24, 2014 at 2:29 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> The error is occurring on master-next (and master I presume) when building
> xfce4-taskmanager (as part of XFCE4 Extended package group). I confirmed it
> on both qemuarm and on Gumstix Overo as build targets. This tells me it's a
> bug, but there still might be something unique about my setup.
>
> Can anyone verify if xfce4-taskmanager can be built successfully?
>
> Thank you,
>
> Adam
>
>
> On Fri, Mar 21, 2014 at 2:08 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> Good day everyone,
>> On both master and master-next, I get build fail on exo like below:
>>
>> configure.ac:112: error: possibly undefined macro: AC_PROG_INTLTOOL
>>
>>       If this token and others are legitimate, please use m4_pattern_allow.
>>
>>       See the Autoconf documentation.
>>
>> autoreconf: /media/Build/master-next/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf failed with exit status: 1
>>
>> Full log is here <http://paste.ubuntu.com/7132707/>
>>
>> Thank you for your help,
>>
>> Adam
>>
>
>

