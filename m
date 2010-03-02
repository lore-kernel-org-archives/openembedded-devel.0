Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NmYx8-0008I6-3U
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 21:44:31 +0100
Received: by fxm20 with SMTP id 20so705308fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=GGnDg2x9s40JIHNGzSDS5oHjN8cBwVHN94oUR4E0ahk=;
	b=jMm6CNk2YsyNEuQ47V+RBYgB7cmoua719ewtLHA3f7EqwQbpbtnCbVsucaEPl+5wen
	DHJp4HEY0abak3RWxhxM4sYeOS5uTGMKy1PewPOfYcs9OnzU9SFLP2hy1FCywYZytMEN
	pkaLsc0UXi1cZRK+v7fEV0xc95i2GKSA0E9FY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WBHseHejWR3n8JDmNLXaECK+tsGVEAkHNMJBQa3z1YQYzR4btqA/dvJbg5CViu2lRS
	fzcnj6AQ8xhPXj4I2rv5OLMQFOzfGnyMGVIrCTixivk4KAVsf80Il7yOAwBnShL3haaN
	HSmj5KewYu49RFjOe1ClZRs3h19EWg0FKdNHk=
MIME-Version: 1.0
Received: by 10.223.5.211 with SMTP id 19mr7285327faw.63.1267562495271; Tue, 
	02 Mar 2010 12:41:35 -0800 (PST)
In-Reply-To: <20100302182926.GA28081@excalibur.local>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
	<19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
	<20100302105623.GA28921@excalibur.local>
	<hmivaf$h8j$1@dough.gmane.org>
	<20100302182926.GA28081@excalibur.local>
Date: Tue, 2 Mar 2010 14:41:34 -0600
Message-ID: <d1ded4381003021241n25c2aefdybc182003bbb88cb6@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: PACKAGE_ARCH in PACKAGE_ARCHS needed? (bitbake.conf) was: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Tue, 02 Mar 2010 20:44:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ok, I was looking in this issue, but this helps a lot :)
I'm going to rework the patches since I have more changes in machine config
file
that solves some problems when I was trying to boot on the target as soon I
get them right
I will send them.

Regards
Adrian Alonso

On Tue, Mar 2, 2010 at 12:29 PM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Tue, 2010-03-02 at 13:11, Koen Kooi wrote:
> > On 02-03-10 11:56, Stefan Schmidt wrote:
> > >
> > > On Fri, 2010-02-19 at 10:26, Khem Raj wrote:
> > >> On Tue, Feb 16, 2010 at 8:32 AM, Adrian Alonso <aalonso00@gmail.com>
> wrote:
> > >>> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > >>> ---
> > >>>  conf/machine/include/tune-ppc440.inc |    2 +-
> > >>>  1 files changed, 1 insertions(+), 1 deletions(-)
> > >>>
> > >>> diff --git a/conf/machine/include/tune-ppc440.inc
> b/conf/machine/include/tune-ppc440.inc
> > >>> index feca186..0c41db4 100644
> > >>> --- a/conf/machine/include/tune-ppc440.inc
> > >>> +++ b/conf/machine/include/tune-ppc440.inc
> > >>> @@ -1,4 +1,4 @@
> > >>>  TARGET_CC_ARCH = "-mcpu=440"
> > >>>  BASE_PACKAGE_ARCH = "ppc440"
> > >>>  FEED_ARCH = "ppc440"
> > >>> -PACKAGE_EXTRA_ARCHS += "ppc440e"
> > >>> +PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
> > >>
> > >>
> > >> I wonder why this would be needed, I would think that PACKAGE_ARCHS
> > >> consists of PACKAGE_EXTRA_ARCHS and PACKAGE_ARCH (which is default
> > >> arch constructed from  BASE_PACKAGE_ARCH)
> > >> if that was the case then ppc440 would be added to supported archs
> > >> list already but it seems there is a disconnect between PACKAGE_ARCH
> > >> and  PACKAGE_ARCHS I am not sure if it
> > >> is deliberate or an oversight. If it is an oversight then it should be
> > >> fixed in bitbake.conf and that would avoid this patch.
> > >
> > > Can somebody with more insight in bitbake.conf give us some insight
> here?
> > >
> > > Right now bitbake.conf does not include PACKAGE_ARCH in PACKAGE_ARCHS.
> > >
> > > PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}
> ${MACHINE}"
> > >
> > > If it should stay this way, would Adrian's patch be ok? I would rather
> get his
> > > contributions in then having them sit to long around. Need to keep
> people
> > > motivated. :)
> >
> > The patch is OK, but for clarity we should change existing contructs
> like:
> >
> > FEED_ARCH = "armv7a"
> > PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
> > BASE_PACKAGE_ARCH = "armv7a"
> >
> > to
> >
> > BASE_PACKAGE_ARCH = "armv7a"
> > FEED_ARCH = "${BASE_PACKAGE_ARCH}"
> > PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7
> > ${BASE_PACKAGE_ARCH}"
> >
> > So the patch in question would become:
> >
> > - -PACKAGE_EXTRA_ARCHS += "ppc440e"
> > +PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"
>
> Sounds good to me. Adrian, can you please rework your patch, test it and
> submit
> this onw again?
>
> I'll pick it up with the other patches and push it into the tree.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

