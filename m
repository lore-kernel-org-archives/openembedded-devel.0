Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oq9RQ-0005zk-0d
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:50:50 +0200
Received: by pxi11 with SMTP id 11so2300125pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=xOPeh12vtwJx561xohAm/+bPu4TDFUFelZ4g6njFjo0=;
	b=K2okOZ/JO9ri4Kux9bLGm09R1o/3BdjMfpWuvchkC1oWlgv6mQGPI1ZIdn5p2S09oe
	/56ZMHigthEaBomupEl6I/suacIQgGUhuVzuIkwCv0ycBey+Brkwn8w3MzjkgZMgPrqf
	tSTGNpR81xn1V9J5CvbbsCR7iMBWID6e8GsAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=wtm+oYd8a6zwbNrebEq+UCBS3SWOxhomFAzruoN6Z9RhOTNjoYPrKBqi8LU7lvwt0U
	M26Emjur4JPj1M2iR6dp7HwYUUvhWYbh//GTRLOEsa4T21AFJwAW9B3Z6vggvSPZkBd7
	bq0ckD9y3WTIpHSUai0cALBbmE5M010ZBhA+U=
Received: by 10.142.111.5 with SMTP id j5mr4962967wfc.189.1283194215175; Mon,
	30 Aug 2010 11:50:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.116.9 with HTTP; Mon, 30 Aug 2010 11:49:54 -0700 (PDT)
In-Reply-To: <AANLkTikZDtaCN_VMKLTS=SD=JNGr2omwxTdg4LTmqh=t@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
	<AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
	<AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
	<AANLkTin+3XSMcnYqk4HNC4C2Mur4zsQw5Oc9nV2hbGOS@mail.gmail.com>
	<AANLkTikZDtaCN_VMKLTS=SD=JNGr2omwxTdg4LTmqh=t@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 30 Aug 2010 11:49:54 -0700
X-Google-Sender-Auth: 44kfpK0_pj1D0qp6KovkbQ9Yx2I
Message-ID: <AANLkTinJqDYX1UGCF0yiX6FP+tORvA5wcHEOZDX=thLF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Mon, 30 Aug 2010 18:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 30, 2010 at 11:38 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/30 Chris Larson <clarson@kergoth.com>:
> >
> >
> > The logic already exists.  SPECIAL_PKGSUFFIX has to have current
> information
> > about the suffixes in order for BPN to be correct.  It seems pretty silly
> to
> > duplicate it, but whatever works.
>
> I thought there was no suffix for target. It would be nice to have
> that. For _native, _sdk etc it exists, but I cannot say
> DEPENDS_target = ...
> which could be handy in recipes using BBCLASSEXTEND = "native"


There is no suffix for target, which is why the previously mentioned snippet
compares PN to BPN (BPN is PN with the SPECIAL_PKGSUFFIX'es removed).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

