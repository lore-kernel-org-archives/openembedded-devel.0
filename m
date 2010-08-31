Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1OqRz0-0000Kj-5X
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 16:38:49 +0200
Received: by vws9 with SMTP id 9so2594800vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=maS07XJ0U5m75OBiKrBLNrZUSCyRdVXeGzFH4FTLF0s=;
	b=nxMjZdueXagPtthElhMowW3eiGNmDZ0G9zkpO0MCpal3ed/Kc43/nHaxZPQL1Knf6D
	98ougZniTbkbDUgsGcKc04FNsoWia6X2lwPjP2DvVLQCSKqIFfMXqYfHHoSkdofZFnZi
	u/f9EC8Ai9jKX52+mCdCoAZz7t0elWpqy7XJI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=hyO+YoohWY1oE9tatTZKZkcDdZ0HcAJL6lMlrXXJzNt9i/oUcKVNk154fkeT92TzUG
	lnMiQ1Ro/4IrZFAc+vZm1WS1TGVrFiWcThC3sIVZfBElZZDCMnc861JJ3pnDd/pxX6X0
	pTwNo3PVWO1ynuFPH9Dn+0eDW/DeIu+vxLh48=
Received: by 10.229.237.130 with SMTP id ko2mr4230373qcb.121.1283265488156;
	Tue, 31 Aug 2010 07:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.46.72 with HTTP; Tue, 31 Aug 2010 07:37:48 -0700 (PDT)
In-Reply-To: <4C7BBA85.8040101@selfish.org>
References: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
	<4C7BBA85.8040101@selfish.org>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 31 Aug 2010 16:37:48 +0200
Message-ID: <AANLkTi=ikw_D=38eMtVAMz08YifDNAf=zkWN39xcbuYa@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
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
X-List-Received-Date: Tue, 31 Aug 2010 14:38:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I tried to update automoc-native and kde4 but it is not better.
I know that Q_WS_WIN is only defined when Qt was build for windows. But how
to fix this?
I am not very skilled, at least not enough to fix this..
I miss some things so more explanation/help will be very well received!
thx
Sylvain


2010/8/30 Holger Freyther <zecke@selfish.org>

> On 08/27/2010 08:39 PM, Sylvain Par=E9 wrote:
>
> > automoc-native itself does not build.
> > (According to OE's log automoc-native is ~ 2 years old.)
>
>
> Well, pick the latest version then, /usr/include/qt4 as include is lookin=
g
> bad, Q_WS_WIN is only defined when Qt was build for windows.
>
> So in summary...
>        - automoc-native probably deserves an update
>        - it should use the "native" version of Qt (like qmake, uic, moc..=
.)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

