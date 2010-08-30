Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1Oq0pq-0006N1-N2
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 11:39:27 +0200
Received: by qyk4 with SMTP id 4so5325833qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=wUdQPzpxt4rYDq7JBN0HsO7JKByLQ+urJST+Q9hwtGY=;
	b=Oa+DIwpvkEimCKLSoZp0mXFdL5a9RAhr5V07l/GUG/yY6dok4QAwQJIB1ycHyz1st4
	kYfCk0lHsCDMAP5bHpHutXfJ2D88jeqnLSokAy1g6eDRx+PWcZ3CYZZtk+vOWCH/3EO7
	6r+lAHceXWZzy08yBmD2q8j2HIB/Vd9pmSmsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=G1i0+rpxn8Fp0ypX90ZpPS1q4BlpT3qKGZ/5skvbdeE+/EaOliJ+7EedB8vEvPS/vP
	g3ZXzdfQ8HXgSZ/46Oj1YWW/9n3mjV1nxV6T8S70O4PbJNQxQkf18a5EJXx+9UmoGq/U
	0X0ZRU6cGQv4+i3qGhChQmHjl7VbxBoFB15XE=
Received: by 10.229.229.210 with SMTP id jj18mr2880820qcb.82.1283161134365;
	Mon, 30 Aug 2010 02:38:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.46.72 with HTTP; Mon, 30 Aug 2010 02:38:34 -0700 (PDT)
In-Reply-To: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
References: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 30 Aug 2010 11:38:34 +0200
Message-ID: <AANLkTi=1WJOQWXDjFVe2=ADgo8WjGQaAb-V9tx-V50Ox@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, shr-devel@lists.shr-project.org,
	List for Openmoko community discussion <community@lists.openmoko.org>
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: a recipe for qt4-plugin-phonon-backend-vlc
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
X-List-Received-Date: Mon, 30 Aug 2010 09:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Up.
Nobody is interestied or wants to give me a hint ?

2010/8/27 Sylvain Par=E9 <sylvain.pare@gmail.com>

> Hi,
>
> If someone is interested I am trying to build the vlc backend for phonon
> (in replacement of the gstreamer one).
> It needs at least libvlc 1.1 that you can found attached
> (David I tested it and it works!. well not very smoothly at all but I thi=
nk
> it can be largely optimized. don't have the skill to do it plus here it i=
s
> for playing sound which interests me, not video :) )
> I did a recipe (attached) but it needs automoc4 which is provided by
> automoc-native to build.
> And this is where I gets stuck :
> automoc-native itself does not build.
> (According to OE's log automoc-native is ~ 2 years old.)
> Attached  my CMakeError.log =3D> 'Q_WS_WIN' undeclared (first use in this
> function)
> which was defined in QtCore/glogal.h but not anymore now and I don't know
> where it is supposed to be.
> I don't know how to fix this properly.
> If someone can help me.
> thx by advance!
>
> Sylvain (aka GarthPS)
>
>

