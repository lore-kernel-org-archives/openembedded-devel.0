Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oy98I-00019X-OK
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:08:07 +0200
Received: by wyb34 with SMTP id 34so4211637wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=5+JZJi7svLSw/vRKJ7JLRhtUzOtb8TZz2y4a98397Hg=;
	b=Ofx4Q0tn8Oayk2BZiH5Ztl5GibiBAXiOhAxJqq4V+afO67F1AdOCQ+gXj9e58iLyQT
	pGwBC02K2O4rPXSpIMEnZBapJBdMdTuHTiBZrhosV2eO+BxH4/YViARM/QH7r6HTNuj3
	FehMnxZdZfdX4MgE555Pk4CqyCUvYHugsEhzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=HDglEBNntixekF/OPW04kYsK6qBnrSNXTmD1fkYAAjxsX3E4on9mv4xDq6tHHDtcFx
	tGceAcAWrBn4yh9uCQfTa1WX/8vKRanQMrQCgMkGuASrUcs8tLVuTltCVQkZ4CV7pra4
	8e8IICvCfQa5qN14Vi7xNG3IKZ8bYSXiNGQsg=
Received: by 10.227.99.79 with SMTP id t15mr3704335wbn.209.1285099682578; Tue,
	21 Sep 2010 13:08:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Tue, 21 Sep 2010 13:07:42 -0700 (PDT)
In-Reply-To: <20100921195156.GF11562@denix.org>
References: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
	<20100921195156.GF11562@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Sep 2010 13:07:42 -0700
X-Google-Sender-Auth: 7EIJNJz8s7N-iy1pqQTb2kr2DBo
Message-ID: <AANLkTinxRAz245hPk4tGx_Q51+kN440pUFpBTYZC53jG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: SRC_URI_arch override. error?
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
X-List-Received-Date: Tue, 21 Sep 2010 20:08:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 21, 2010 at 12:51 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Sep 08, 2010 at 04:52:20PM +0200, Frans Meulenbroeks wrote:
> > Hi,
> >
> > I have an issue with the linux-libc-headers recipe for nios2.
> > Maybe I am trying to do something what is not possible.
> >
> > The recipe contains:
> > SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2
> \
> >         "
> >
> > SRC_URI_nios2 =
> > "
> ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
> > \
> >         "
> >
> > I was under the assumption that when building with TARGET_ARCH set to
> > "nios2" (e.g. for machine neek) I would get the 2nd uri.
> > However actually the system seems to concatenate these two URI's.
> >
> > I have locally modified classes/base.bbclass function base_do_unpack
> > do dump some info:
> > python base_do_unpack() {
> >     from glob import glob
> >
> >     srcurldata = bb.fetch.init(d.getVar("SRC_URI", True).split(), d,
> True)
> >     bb.note("unpacking SRC_URI %s" % d.getVar("SRC_URI", True))
> >     bb.note("unpacking SRC_URI split %s" % d.getVar("SRC_URI",
> True).split())
> >     bb.note("unpacking srcurldata %s" % srcurldata)
>
> Frans,
>
> Are you still facing this issue?
>
> Looks like I'm in the same boat with you on this one - I have an amended
> recipe in a local overlay, which slightly modifies the source tarball name
> in
> SRC_URI. It used to work fine before, but lately it tries to call
> do_unpack()
> on both - the source tarball with the name from amend.inc, as well as the
> source tarball with the name from the original SRC_URI. Since it doesn't do
> do_fetch() for both, only do_unpack(), it fails if the other tarball was
> not
> previously downloaded into DL_DIR...
>
> I was able to trace the problem down to the do_unpack() rewrite commit:
>
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=900cc29b603691eb3a077cb660545ead3715ed54
>
> Before this commit, SRC_URI used to behave properly, even with
> modifications
> and amendments. I'm still trying to debug the new code to see where the
> problem happens.
>
> Maybe, Chris, as the author of that code, can spot the issue sooner.
> Thanks.


This thread has been sitting in my todo list for a while now, haven't had a
chance to dive in.  I'll see if I can take a look tonight.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

