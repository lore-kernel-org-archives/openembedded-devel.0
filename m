Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PJMcv-0008Pq-QL
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 09:47:26 +0100
Received: by wyb34 with SMTP id 34so4384941wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 00:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xOcK6bC+32iB0FCQD0j5dim07tCKRRXmC/6rZiDbnqI=;
	b=CNcNZEP0SNOzbuLPwOCTm1g+xPez2FaHziI2lLhRVeokN1oBCYZFuoOoYeqFuLJK1D
	zMQtctyxuoLTU5W6xZvdrA0yvaFWjjXI9HvM3wzylyX8ZgpptR2kVkzsuJ3QAzAyjdaZ
	M81Tb0Mrlfaq6Xp2DLDuWTBewgwlfE1xv5OY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AdNogc5B+0rVFWITBTt8IHLNBwDBtYXsmiZY2UVNd1LzSrQxN2bIivtuH4Na5egyeq
	hqHTm3LYHWbh6u2WEU6yelcXWVDEQ1ZiVIH/OJ5E0xRhcb5Q0jVFPmsvlvDj0bod6lYY
	urFefzcwu7Us2CAv59ML4JjxTAus01bhYqUmk=
MIME-Version: 1.0
Received: by 10.216.199.81 with SMTP id w59mr635160wen.100.1290156372693; Fri,
	19 Nov 2010 00:46:12 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Fri, 19 Nov 2010 00:46:12 -0800 (PST)
In-Reply-To: <E1PJA5d-0001qe-R1@melo.openembedded.org>
References: <E1PJA5d-0001qe-R1@melo.openembedded.org>
Date: Fri, 19 Nov 2010 09:46:12 +0100
Message-ID: <AANLkTinfS==Wq=xreD6uJA8g7sNKwDw8roPGXRAsihkw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Andreas Oberritter : pkgconfig.bbclass: don't blindly install every . pc file
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
X-List-Received-Date: Fri, 19 Nov 2010 08:47:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello, I suspect this commit broke two packages of x11-gpe-image
(do_configure fails, libcontactsdb and libtododb).

http://tinderbox.openembedded.net/packages/994709/
http://tinderbox.openembedded.net/packages/994704/


For the rest, console-image, opie-image and x11-image built just fine.
I'll investigate later today.

Regards

Andrea


On Thu, Nov 18, 2010 at 8:24 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Dc2c8fe4c5629add94bd0b922f5b3446624a9f4d8
>
> Author: Andreas Oberritter <obi@opendreambox.org>
> Date: =A0 Mon Oct 25 04:20:59 2010 +0000
>
> pkgconfig.bbclass: don't blindly install every .pc file
>
> * Instead of installing the file, print a log message. Later,
> =A0this function could be removed.
> * .pc files must be installed explicitly to avoid causing
> =A0build problems. E.g. libsoup-2.4-gnome.pc must not be
> =A0installed if libsoup-2.4 is built without gnome support,
> =A0because gstreamer would try to link against libsoup-2.4-gnome.
> * Fixes for lua5.1 and libid3tag, which install their own .pc
> =A0files from OE, have been submitted.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> ---
>
> =A0classes/pkgconfig.bbclass | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
> index 23ab453..d96b708 100644
> --- a/classes/pkgconfig.bbclass
> +++ b/classes/pkgconfig.bbclass
> @@ -16,6 +16,8 @@ pkgconfig_sysroot_preprocess () {
> =A0 =A0 =A0 =A0install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
> =A0 =A0 =A0 =A0for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-u=
ninstalled.pc$'`; do
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pcname=3D`basename $pc`
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat $pc > ${SYSROOT_DESTDIR}${PKG_CONFIG_DI=
R}/$pcname
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DI=
R}/$pcname ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oenote "$pcname was not ins=
talled."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0done
> =A0}
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


