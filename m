Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoZNP-0008JW-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 12:08:08 +0200
Received: by ewy7 with SMTP id 7so1122847ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9wvLNvpR+V36Pq/VpLlU7SBX6s5ylD6qQRfflCB0ym0=;
	b=mqvJSikWeNqO0EKdVHo1HBf8sOIumANSmqxO+1yGvJiL89CAzq85PJZNPn0nCZoS0S
	kSJK6OPyFnyUQ+K+ou1biQkLGg2lrSm8Rlzx2XkITOMYs+90MH0HnYbQehTlOnMEc+Cr
	Oq7F4YUDhfAiB2MH0VaGLTIT04QQf84T5cmrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sxHjAb5bUn+stSalSwrG1JGEHCMtwhzi0Vewk7Vp1UZk9yR1Fpv5K/IhysS6b/ThSo
	DgK+gw0U4wiqPVN8zzvJY/jKtS5SzErFsyLRQADa1YRwv9vDTat5A8SumNGIOR24adUD
	jbYIPK4gau5Gjb2hTdb3Z1wH6+NGdHKggR0UM=
MIME-Version: 1.0
Received: by 10.213.33.137 with SMTP id h9mr6873841ebd.88.1282817259247; Thu,
	26 Aug 2010 03:07:39 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Thu, 26 Aug 2010 03:07:39 -0700 (PDT)
In-Reply-To: <1282812356.3726.33.camel@mattotaupa>
References: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
	<1282775656.3711.22.camel@mattotaupa>
	<AANLkTi=gHjEM7eFzNEsZOq9b3y9X06NRq4amF9h0_yhG@mail.gmail.com>
	<1282812356.3726.33.camel@mattotaupa>
Date: Thu, 26 Aug 2010 16:07:39 +0600
Message-ID: <AANLkTinxVh9JCQnQpSxV_rr74truVwBeQ3e+=nc1Yf=s@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] upstart: fix sysvinit compat
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
X-List-Received-Date: Thu, 26 Aug 2010 10:08:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 14:45, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:
>
>
> I mean, did you write the those rc, rcS and rcS-default scripts
> yourself? (Probably not judging from the copyright in the header.) So
> where did you those from? From another distribution? Are they included
> somewhere?
>
> I'm get it from sysvinit recipe


> If it is possible, yes!
>
> Okey


> Just to be clear that a meant the following line.
>
> > +EXTRA_OEMAKE +=3D "'bindir=3D${base_bindir}' \
> > +              'sbindir=3D${base_sbindir}' \
> > +              'usrbindir=3D${bindir}' \
> > +              'usrsbindir=3D${sbindir}' \
> > +              'includedir=3D${includedir}' \
> > +              'mandir=3D${mandir}'"
>
> > Automatically  upstart installed in /usr but for simple and right
> > switching with update-alternatives
> > it's move to root.
>
> Sorry, I do not understand. What is =C2=BBroot=C2=AB? If it is =C2=BB/=C2=
=AB I do not see in
> which line it is used.
>
> yes to /


> > I'm got this additional parameters from sysvinit.
>
> Are you referring to those two?
>
> > +USE_VT ?=3D "1"
> > +SYSVINIT_ENABLED_GETTYS ?=3D "1"
>
> But why don=E2=80=99t you add them to `recipes/upstart/upstart_0.3.8.bb`.=
 You
> could add them to the inc file then.
>
> I'm forgot about this. But now i'm try build upstart_0.3.8.bb and this no=
t
buildable.

