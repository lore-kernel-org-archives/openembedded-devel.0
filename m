Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M3R1p-0008CD-6u
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 10:38:29 +0200
Received: by fxm20 with SMTP id 20so2491559fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ZcTsq0EDBrtnyaI7VONSHpWcna2Iig7ixUu/lHzeAkc=;
	b=MHVJ4Gv6WPQ5sBcIXAgMDNsi7FvunFOqrj6WKk0FjdvO4T0IP1IbbaOlcsp67jUuig
	ZAF04sTC+n33BN0QW0KJNsMdyXx9B7RM1BJU4ex8lANVcSKS/GB4SIfadb3USBGV9pak
	pGE+yF03AjEmhfIU+MRrlmlPp0wmLd0kKNvUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BONlwOcaY2LzfO2j+0Jw28sTHL2r7D0msDOOO/5p1Y/7y65fw+bsMme2eqUXehZleF
	qL6TDyppwe9hF77KsSrreiSJKBYadvr+aul8jhH02i4FB1kxIKDEqL6PpFjHojcu+DIR
	vbzYMiojBMy51nF9tzMOV+vOaSoLFWk7WUKys=
MIME-Version: 1.0
Received: by 10.223.105.75 with SMTP id s11mr3293214fao.4.1242030716918; Mon, 
	11 May 2009 01:31:56 -0700 (PDT)
Date: Mon, 11 May 2009 10:31:56 +0200
Message-ID: <d1b08f940905110131h13a6b314q64e74a2bd9919433@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: x11-gpe-java-image: gdk-pixbuf
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
X-List-Received-Date: Mon, 11 May 2009 08:38:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I was testing the general buildability when I stumbled in a strange
issue: the gtk+/gdk .pc files are overwritten with an older version ,
ending up with target=linux-fb. Wrong...

FWIW the default gtk+ is:

./distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_VERSION_gtk+
= "2.16.0"

I think to have identified the culprit: maemo/hildon/libosso,
requiring somehow the old gdk-pixbuf_2.10.14.
I suspect this conflicts with the loaders installed by gtk+_2.1.6.

Regards

Andrea


