Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NmOut-00005D-FG
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 11:01:33 +0100
Received: by fxm20 with SMTP id 20so60003fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wZs3XB4TbCsS+CSMsPxCCkjiyhhgbSP1V1KKHP5Hd1k=;
	b=cr3Mj4APBaKcCtSY3xrlPOfzUlZUYcnkWXXF1NW8ZPu/2dskFhRBrrNmfg53ZQhDaM
	QgVl8rDPM6VMMNDIHizjIXSk7fHR1WYFgVVk81wxNJXIuucdec57xR+fRy0KxyOrc09P
	pMvML1KsxMzdF45oysK9d76LGJlRIX5Jz4KBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NQsxRbxyOxPcyDFBLGIoF/9Bbv1CN81w+p+/NU4rL24ZRl7ikt7cr/z83j19avQW67
	YBT6DxyK5+8G5XXvQH7/LzK+Pe7rO0jGvYv0Z2o9On/G6tyhFv6wHDa4YX5+x2ZheK0F
	zXo32CPvWrf3tEiTJl72PtJaaOaFznrCoiEgY=
MIME-Version: 1.0
Received: by 10.223.57.133 with SMTP id c5mr6466277fah.11.1267523916886; Tue, 
	02 Mar 2010 01:58:36 -0800 (PST)
In-Reply-To: <141020e31002090250k2b14f4a4w35b2322952665a46@mail.gmail.com>
References: <E1Ne4Jc-0005sN-7y@melo.openembedded.org>
	<141020e31002090250k2b14f4a4w35b2322952665a46@mail.gmail.com>
Date: Tue, 2 Mar 2010 10:58:36 +0100
Message-ID: <141020e31003020158v13adec5erae7d6cd6f9ee7fa5@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : efl: bump SRCREV for comp fixes
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
X-List-Received-Date: Tue, 02 Mar 2010 10:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 9, 2010 at 11:50 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> With this revision epsilon started to fail (python-epsilon was failing
> before too).
> http://tinderbox.openembedded.net/packages/epsilon/
> http://tinderbox.openembedded.net/packages/python-epsilon/
>
> I asked upstream devs on #edevel for simple fix and they said, that
> epsilon is so unsupported that they would rather move it from OLD/ to
> BROKEN/.

Hi,

This was included in the end
http://trac.enlightenment.org/e/changeset/46111

But now there is another deprecation and by default Ecore_data si gone:
http://trac.enlightenment.org/e/changeset/46543

So what would be OE way to handle?
1) enable Ecore_data to build etk/epsilon ok (for a while before
something else broke it again)
2) move etk/epsilon + depending apps to obsolete dir (list of apps
from previous e-mail + check if they really still depends on it or
it's just DEPENDS relict).

I prefer 2) and if there is somebody who really needs etk/epsilon then
he probably wants also older EFL_SRCREV for his obsolete app.

Regards,

> What's right way to handle that in OE?
> Is it worth maintaining epsilon alive in oe.dev and asking upstream to
> include patches for epsilon or can we move epsilon + apps depending on
> it to obsoleted?
>
> We cannot bump ecore, because of epsilon which is pity. If we move
> epsilon to recipes/obsoleted then there is few apps still using that:
> e17/exhibit_svn.bb:DEPENDS =3D "evas ecore epsilon edje eet etk efreet"
> efl1/epdf/fix-plugin-path-check.patch: =A0 =A0requirements=3D"$requiremen=
ts
> epsilon imlib2"
> efl1/epsilon_svn.bb:FILES_${PN}-thumbd =3D "${bindir}/epsilon
> ${bindir}/epsilon_thumbd"
> efl1/esmart_svn.bb:DEPENDS =3D "evas ecore edje imlib2 epsilon libtool"
> efl1/ewl_svn.bb:DEPENDS =3D "evas ecore edje emotion efreet epsilon"
> omview/omview_svn.bb:DEPENDS +=3D " evas ewl epsilon"
> python/python-epsilon_svn.bb:DEPENDS +=3D "epsilon python-ecore"
> tasks/task-efl.bb: =A0epsilon \
> tasks/task-openmoko-feed.bb: =A0eet evas ecore embryo epsilon edje
> efreet emotion epdf \
> tasks/task-python-efl-examples.bb: =A0python-epsilon-examples \
> tasks/task-python-efl.bb: =A0python-epsilon \


