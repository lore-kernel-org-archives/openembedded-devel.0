Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1RNG2R-0008PG-R4
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 04:38:23 +0100
Received: by eyd9 with SMTP id 9so3018373eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2011 19:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tYyjNNTiaOgbIaJukiL14ePH+1p7f/712MUxzCZmx1M=;
	b=UJlr6z5gz7Q/jjJYbJD+54ntMOM6vjGMZEZF/7hAUe0w77n8GNcvuH7DbwhyaMJ6SG
	5W0ieuujt3QNAKrrdumYMniX6KQ2npZz0ylm3MTIwaG3562nrSksgJ1jXG8ECPSEBwFe
	d0tr+d87Cor8sJ23qcTDMIik59WBx5insWnOo=
MIME-Version: 1.0
Received: by 10.14.3.168 with SMTP id 40mr2050332eeh.130.1320636731088; Sun,
	06 Nov 2011 19:32:11 -0800 (PST)
Received: by 10.14.37.3 with HTTP; Sun, 6 Nov 2011 19:32:11 -0800 (PST)
Date: Mon, 7 Nov 2011 16:32:11 +1300
Message-ID: <CAE21AQr7mWqM=RQZBk8k2FUkQW8=jXb6vPBL3k6SnXF5sqRSPg@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Understanding recipes vs packages
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
X-List-Received-Date: Mon, 07 Nov 2011 03:38:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello

Something very weird is going on with some changes I have made
recently to a custom image I am building.

For some reason I was getting libpng12 built and now that no longer happens.

In debugging this I've been doing things that now stump me.

From my understanding, a recipe can build multiple different packages.
For example libpng.inc has the following in it:

PACKAGES =+ "${PN}12-dbg ${PN}12 ${PN}12-dev"

FILES_${PN}12-dbg += "${libdir}/libpng12*.dbg"
FILES_${PN}12 = "${libdir}/libpng12.so.*"
FILES_${PN}12-dev = "${libdir}/libpng12.* ${includedir}/libpng12
${libdir}/pkgconfig/libpng12.pc"
FILES_${PN} = "${libdir}/lib*.so.*"
FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
		${libdir}/*.a ${libdir}/pkgconfig \
		${datadir}/aclocal ${bindir} ${sbindir}"


Does that mean I should be able to build  libgpng12 as follows:

bitbake libpng12

Thanks

Charles


