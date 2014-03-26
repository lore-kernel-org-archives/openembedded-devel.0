Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id CACC46F8A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:28:45 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id la4so3169985vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ghEtQu4GPhWCb5pDK4qxYzvzjveSHL3+laLhW4oiphU=;
	b=ZDyXQlW2asxVOZoYDdQW0PDPQJ1c+zIBSdcbLBZA1t3d969JkLwDQkkRqX2PkKDXwj
	v+4CXDX/1KYwvRUxayOCjFbZELAC3ZjRO8Leg7s7IwyagFmm6INAGEIYC361wNCV9Z7m
	n/EejM0NQZCCFElVl8zXfmbKEVbYF54rb8r5fzlLPb9dQ29ZYBaf4OEAESEr5lHOFSFc
	Zg3PpXttFsiPg2KGvYMvt9JSgYVgvB1u2aD58QYgutlbaUxAtEDJe2r+ibPEiReg7X+l
	SiNNN5lChdIfUVt1mC4s72SxllI2JYdJv0JJFZJF1jN+38lgpdoYhhwubiR9efG+Atjz
	Gg/w==
MIME-Version: 1.0
X-Received: by 10.52.240.140 with SMTP id wa12mr17834vdc.52.1395869326010;
	Wed, 26 Mar 2014 14:28:46 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 14:28:45 -0700 (PDT)
In-Reply-To: <1395868139.24890.110.camel@ted>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
	<CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
	<CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
	<1395821266.24890.80.camel@ted>
	<CAFeBWL6621Uh34_s8soK39mNM56zRE1-+rKJ0ehRDTDSVdrHfw@mail.gmail.com>
	<1395868139.24890.110.camel@ted>
Date: Wed, 26 Mar 2014 14:28:45 -0700
Message-ID: <CAFeBWL5vmbPFxpFLnOE2mU7fZe5tGJ_oS_CT2=wimGnQKaGMRQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Mar 2014 21:28:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Richard, that worked!

I've submitted a patch for this.

Adam


On Wed, Mar 26, 2014 at 2:08 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2014-03-26 at 14:00 -0700, Adam Lee wrote:
> > Hi Richard, thanks for the explanation. It helped me in understanding
> > about the commit.
> >
> >
> > intltool-native builds fine. This suggests me that I have the
> > dependencies requirement for intltool-native. Also I apt-get installed
> > intltool on my build server just in case. However, I still get
> > exo-native build error. Just letting you know, the recipes involved
> > are all under the OE layer (meta-xfce). I am building for Gumstix
> > Overo, which is not the default build target, but this error is not
> > platform dependent. I still get the same result on qemuarm.
> >
> >
> > At any rate, I now know it's a dependency issue, so that's where I
> > will start digging and report back.
>
> Right, to be more specific, try adding DEPENDS += "intltool-native" to
> the recipe.
>
> Cheers,
>
> Richard
>
>
>
>

