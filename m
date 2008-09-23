Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Ki3m0-0004gk-4R
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 11:01:32 +0200
Received: by fg-out-1718.google.com with SMTP id l26so1777380fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=4LeqbfPddgNd0z+00Rt1eAWMvbxeuis4zc4OydhQz90=;
	b=EYqMzbGgP8XEfJzufoWThI26WYlTifSug6ZQPQ72Ww2+DzksQY1FZaYpGt0f/jVHHh
	kZjFQxZhsG6LNz/WkAA2Oqs8nWx9OgoV5k6iwScNdQ++UTCd1uNONDeCXRhALK9a9NDZ
	GVV4XjoSV80UJ1IjvnIrXCN/gCKyNrAL66xL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=MznzzfekBsjJzLcTGwvWqgK3+Sx6Fut1QuRm89r4KD1dU9djH4ZSTUtmr0ln43q+Nq
	BEjwDRKsf1G8xs4YFX+zizqJcwWSpJ2OjFPlVQt42I97GaRIY7CML2YR2MHXz6MD7Ypg
	FavPYzcUEhmb3XhVm0u3xX8A37lf2515y+0+U=
Received: by 10.187.210.10 with SMTP id m10mr679963faq.19.1222160280076;
	Tue, 23 Sep 2008 01:58:00 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Tue, 23 Sep 2008 01:58:00 -0700 (PDT)
Message-ID: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
Date: Tue, 23 Sep 2008 10:58:00 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 09:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

yesterday oestats was expanded and now the QA errors are logged.

Here a first bunch of QA:

These two are the most common:

evil hides inside the .pc, staging,
/staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/pycairo.pc

evil hides inside the .pc, staging,
/staging/armeb-angstrom-linux-gnueabi/usr/lib/pkgconfig/ORBit-2.0.pc

########

non dev contains .so, gcc,
/work/armv5teb-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc/usr/lib/gcc/armeb-angstrom-linux-gnueabi/4.2.4/libgcc_s.so

non dev contains .so, lirc,
/work/akita-angstrom-linux-gnueabi/lirc-0.8.1+cvs20070307-r1/install/lirc/usr/lib/liblirc_client.so

non dev contains .so, klibc,
/work/c7x0-angstrom-linux-gnueabi/klibc-1.5-r9/install/klibc/lib/klibc.so

non dev contains .so, libpython2,
/work/armv5teb-angstrom-linux-gnueabi/python-2.5.2-ml10/install/libpython2/usr/lib/libpython2.5.so

non dev contains .so, db,
/work/avr32-angstrom-linux-uclibc/db-4.3.29-r10/install/db/usr/lib/libdb-4.so

non dev contains .so, smpeg,
/work/armv5te-angstrom-linux-gnueabi/smpeg-0.4.5+rsvn370-r0/install/smpeg/usr/lib/libsmpeg.so

non dev contains .so, librfid,
/work/i586-angstrom-linux/librfid-0.2.0+svnr2094-r0/install/librfid/usr/lib/librfid.so


non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas_software_x11.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/x11.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas_buffer.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas_fb.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas_xrender_x11.so
non dev contains .so, ewl-engines,
/work/armv5te-angstrom-linux-gnueabi/ewl-2_0.5.2.042+svnr35984-r3/install/ewl-engines/usr/lib/ewl/engines/evas_software_16_x11.so


Andrea


