Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UG25n-0003Cn-E5
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 07:57:24 +0100
Received: by mail-we0-f182.google.com with SMTP id t57so1809591wey.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=6syAZUetIamE25ZHPMuuPHaAWgyfHc4HzPHjvRdCxho=;
	b=J5wFnQZK9gW5yUjhhCL5Iv+TE3TJEcshWby289f7cj30M3kyhViWgB4KZnwujAmfgI
	k3AvPeTl8lCYJE4JAWUIBDiSG1WEYCRRUaFDfGCS9BYcl4fZNTv8tgZ0lby4X7+dy5gG
	+Yeo17MQY/MmC8uJNvNsUOswEUMM1O7sJGyLgh4ULRp9S+s8hW0KB0SqQqzBS2kH9cRi
	h6NQS4mZlci0N4sQgLonF4v9mo4WOfv9LmctiKmfjtvkmWPkBvm61uEpVr1EKkGT7Tuj
	xeSVs8ROGhltq7hdHohkN/avcIJPSmrU2Nz5A2glvq1MfAd0G0NMIraCymb3CqphTllS
	2vkw==
MIME-Version: 1.0
X-Received: by 10.194.157.42 with SMTP id wj10mr1768727wjb.12.1363243205437;
	Wed, 13 Mar 2013 23:40:05 -0700 (PDT)
Received: by 10.194.89.106 with HTTP; Wed, 13 Mar 2013 23:40:05 -0700 (PDT)
In-Reply-To: <AF604684617F454390621992F367F169012C4AD0@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
	<20130313162013.GM3260@jama>
	<AF604684617F454390621992F367F169012C4AD0@039-SN2MPN1-022.039d.mgd.msft.net>
Date: Thu, 14 Mar 2013 07:40:05 +0100
Message-ID: <CA+chaQeC26Any2ZHPuct90Ta8PxgYsijGT7gMDjCL0UhOK2qBA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Thu, 14 Mar 2013 06:57:30 -0000
Content-Type: text/plain; charset=UTF-8

If it generates doc/html on your host, then it's probably autodetecting
some doc generating tool from host which isn't on my. It would be better to
disable docs completely (I'll let you know if it builds and doc is empty).


On Thu, Mar 14, 2013 at 3:38 AM, Liu Ting-B28495 <B28495@freescale.com>wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Thursday, March 14, 2013 12:20 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
> >
> > On Wed, Mar 13, 2013 at 11:50:43AM +0800, b28495@freescale.com wrote:
> > > From: Ting Liu <b28495@freescale.com>
> > >
> > > TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> > > flexible library that provides a simple interface for defining and
> > > accessing command line arguments. Templatized C++ Command Line Parser
> > > Library.
> > >
> > > Use the commit of tag tclap-1-2-1-release-final.
> > >
> >
> > fails in do_install:
> >
> > | /bin/mkdir -p
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> > | -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > | cp -R
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> > | -linux-gnueabi/tclap/1.2.1-r0/git/docs/html
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> > | -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > |  /bin/mkdir -p '/home/jenkins/oe/shr-core-branches/shr-core/tmp-
> > eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > r0/image/usr/share/doc/tclap'
> > | cp: cannot stat
> > | `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o
> > | e-linux-gnueabi/tclap/1.2.1-r0/git/docs/html': No such file or
> > | directory
> > | make[2]: *** [install-data-local] Error 1
> > | make[2]: *** Waiting for unfinished jobs....
> > |  /usr/bin/install -c -m 644 index.html manual.html style.css
> > '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-
> > linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap'
> > | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-
> > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs'
> > | make[1]: *** [install-am] Error 2
> > | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-
> > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs'
> > | make: *** [install-recursive] Error 1
> > | ERROR: oe_runmake failed
> > | ERROR: Function failed: do_install (see
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> > | -linux-gnueabi/tclap/1.2.1-r0/temp/log.do_install.29945 for further
> > | information)
> > NOTE: recipe tclap-1.2.1-r0: task do_install: Failed
> >
> > Whole log in:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-
> > branches/log.world.20130313_114357.log/
> >
>
> I did tests before sending the patch :-(
> Patch v3 has been sent. Please review. Thanks.
>
> -Ting
>
> > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > ---
> > >  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++++
> > >  1 files changed, 13 insertions(+), 0 deletions(-)  create mode 100644
> > > meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > >
> > > diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > new file mode 100644
> > > index 0000000..c2b03a4
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > @@ -0,0 +1,13 @@
> > > +DESCRIPTION = "Templatized C++ Command Line Parser"
> > > +HOMEPAGE = "http://tclap.sourceforge.net/"
> > > +SECTION = "tclap"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
> > > +
> > > +SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> > > +SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +inherit autotools
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > --
> > > 1.7.3.4
> > >
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

