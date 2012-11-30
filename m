Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeUsa-00027p-VA
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:00:02 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so523132iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JDY5PRWd+nue744PU+zEED4bPK2H46TiRVsAd8mbZi4=;
	b=xiHNUMRSo9Y2dI4hniDpsdKMn5L4/qHN9HJkJAaCoo1Zj7KeJZM5j2Fgfuoi2z9LOs
	ik1wuD9texxBSRjiEZNHTl8obNuiQ2TI4ZV8CE+LYh6CaDwERTPUCXX9HC3Z4fmco2Nn
	armGFNJQ21PRvMXKdYj4EocF1c7Is+UhgYm5NFlgNyGNlL00dV5zlS1k49z0gh4JsAoE
	y663UbrU21t8VXx+kWzHzyjn+rxjm0tDmopq1v/zHLBBB+N3ISmTfjezlCfFIqSMwT6Z
	H7qoaoZk8v2OBF9om5Yqun+s+FHnhO4ZT9E5Lz2s48xYd3oPi46DxSwZftS1l1NtyUfO
	LpJQ==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr1810486igc.45.1354297543126; Fri,
	30 Nov 2012 09:45:43 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 09:45:43 -0800 (PST)
In-Reply-To: <CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
	<CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
Date: Fri, 30 Nov 2012 18:45:43 +0100
Message-ID: <CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 18:00:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 6:17 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>> gettext 0.18.1 is installed both on the build machine, and as a native
>> package used when building under bitbake.  If it's at all relevant, I ha=
ve
>> LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.
>>
>> Did you try a full reversion of 5febf70?  Can you tell why, in your
>> environment, autotools.bbclass replaces the Makefile.in.in for libgphoto=
2?
>> It does not do this for me (otherwise I think Koen's patch that only rev=
erts
>> part of 5febf70 would not work).
>>
>> Peter
>>
> It should copy see autotools.bbclass line 195
>
> Andreas
Peter

One stupid question: Are you working with oe-core master - because

commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Oct 11 08:43:01 2012 +0000

which started my gphoto2 trouble is not found in danny

Andreas


