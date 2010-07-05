Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OVpIH-0000b3-4w
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 19:17:22 +0200
Received: by gwj18 with SMTP id 18so2780820gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=VivoZu71PR86FxnQ4B6AWISnckRn/NkoS4r9rZgUmiw=;
	b=PWdR2kCjqtfn1xoDJYIONY99hWdanOCKlqE6zpGje14sr6fDQqUZT6wJVdfhxPZs/l
	qjfBVkQjmkHrvrwU6LDVpOaHZ0okFFNtAPcLPRmJnO/dIT3nxdW+8/ePkCwUH36mNPFp
	8KxxfxOG6mcVPPothV1LL1I6x5DvOTIpw8CE8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Is2l2Vg9QqAtCyI+hP/mp0JRJIiFmGthjoJ32zVRoCcICq9tFbAycUQ20nv5eNUknJ
	dLoevPdvv2G53oH+iSuCkTA7mH5VYq+ZmbUPropVmqfxryDJg5R7RM1YRU37fy3JuL9T
	nG5xQdjjXZlAloucMSjdko38wIP5UPB8Ed6Oc=
Received: by 10.229.189.143 with SMTP id de15mr1751371qcb.270.1278349951337; 
	Mon, 05 Jul 2010 10:12:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.233.4 with HTTP; Mon, 5 Jul 2010 10:12:11 -0700 (PDT)
In-Reply-To: <201007051828.09715.khimov@altell.ru>
References: <1278264840-24635-1-git-send-email-raj.khem@gmail.com> 
	<201007051828.09715.khimov@altell.ru>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 5 Jul 2010 10:12:11 -0700
X-Google-Sender-Auth: UG0PC0m1r3g_HV4Dr0yxHWpGREs
Message-ID: <AANLkTinlTkrxUB1WY53SJk9MIbk47wCoffJbM6C88_AM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][v2] base.bbclass: Fix oe_unpack_file to unpack files to match new bitbake bb.decodeurl()
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
X-List-Received-Date: Mon, 05 Jul 2010 17:17:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2010 at 7:28 AM, Roman I Khimov <khimov@altell.ru> wrote:

> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 04 =
=D0=B8=D1=8E=D0=BB=D1=8F 2010 21:34:00 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem =
Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > * This patch now uses the path which essentially is the path and
> >   filename relative to recipe dir. It will create the directories
> >   as expected. Suppose if the is says file://pam.d/login in the
> >   SRC_URI then it will be copied to $WORKDIR/pam.d/login as it
> >   was happening before the fix to decodeurl in bitbake.
> >
> > * Do not copy the .patch and .diff files into $WORKDIR
> >   they are already symlinked in patches/ dir which will
> >   be used by quilt.
> >
> >
> > I have done native-sdk-image build from scratch for arm/x86 using bitba=
ke
> >  master and this patch on OE without any problem.
> >
> > OK for .dev ?
> >
> > Thanks
> >
> > -Khem
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  classes/base.bbclass |   20 +++++++++-----------
> >  1 files changed, 9 insertions(+), 11 deletions(-)
> >
>
> Acked-by: Roman I Khimov <khimov@altell.ru>
>

Seems reasonable.

Acked-by: Chris Larson <clarson@kergoth.com>
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

