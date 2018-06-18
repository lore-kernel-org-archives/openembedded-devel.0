Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5FE7533A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:42:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5ILgX7V008127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Jun 2018 22:42:35 +0100
Message-ID: <1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Asselstine <mark.asselstine@windriver.com>, Andreas
	=?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 22:42:32 +0100
In-Reply-To: <1883916.pZAjriCjz1@yow-masselst-lx1>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 21:42:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-06-18 at 13:07 -0400, Mark Asselstine wrote:
> On Monday, June 18, 2018 12:51:47 PM EDT Andreas Müller wrote:
> > On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
> > My builds have remove-libtool enabled so I did not see this QA
> > warning/error.
> > 
> > Isn't remove-libtool enabled by default since pyro/2.3 - so that
> > this
> > patch is obsolete (and all the other same kind coming later)?
> 
> The documentation still indicates:
> ---
> <note>
>             The <filename>remove-libtool</filename> class is not
> enabled by
>             default.
> </note>
> ---
> 
> So as far as I know this still needs to be handled recipe to recipe
> by inheriting the remove-libtool class in the affected recipes. I
> have done  builds without manipulating the generated local.conf which
> seem to confirm  this but I could be wrong. Add RP who might have
> some guidance.

Removing the libtool files became the project default a while ago (Jan
2017):

meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"

so I suspect you're in the minority not using that now.

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro/defaultsetup.conf?id=3e2a47fdfceccd5f8832235b7a2df83076e84a98

Cheers,

Richard




