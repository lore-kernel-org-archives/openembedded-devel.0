Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LrDTk-0005Tz-3r
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 17:44:58 +0200
Received: by fxm20 with SMTP id 20so2313314fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Z9gSBVfn5Tn9NIAqNNBe0ogLXBlqkHeYTWb68F1vvn4=;
	b=EhT219GJ9L3ALwhTCgCg2ggFkYX59yKrQIdB9O8HrWpr/+1mTlHzjuwmV29XeiyV4z
	toT/bE80LD9vPaw3BdPIj0uORZKNNgRChkCoNTMRdY5Dqct39vTi/kVgriX5/F4auE+F
	lqjmAqwtnHKw2BoiqgVoWmbiZOrUiGezs2xOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KMfNmoOqc7rEiEt0uAd2hYppNJ2pvFEk3p5B9QKDsB1ggMf3ykyCMcAQc3f4pGSKC5
	qJ7Xcu2pxTDcRBW9elQkvsuoWhd/xyvhQKRmmGB6uVZGQ1regubfMv8YWpXar1+CGPeD
	Nxl8nvpN+hh1Y35+KTWcQ+CWkQSoexCPNA7uA=
MIME-Version: 1.0
Received: by 10.223.126.145 with SMTP id c17mr151405fas.16.1239118908974; Tue, 
	07 Apr 2009 08:41:48 -0700 (PDT)
In-Reply-To: <1239096233.16991.525.camel@mill.internal.reciva.com>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
	<1239096233.16991.525.camel@mill.internal.reciva.com>
Date: Tue, 7 Apr 2009 17:41:48 +0200
Message-ID: <d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.172
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Tue, 07 Apr 2009 15:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

But before making QA fatal, please let fix these (Ignoring for the
moment the QA 'the desktop file is not valid'):

irda-utils:
LDFLAGS ignored, irda-utils,
/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.16-r8/install/irda-utils/usr/sbin/dongle_attach
LDFLAGS ignored, irda-utils,
/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.16-r8/install/irda-utils/usr/sbin/irdaping
LDFLAGS ignored, irda-utils,
/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.16-r8/install/irda-utils/usr/sbin/irattach

hostap-utils:
LDFLAGS ignored, hostap-utils,
/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r5/install/hostap-utils/usr/sbin/hostap_rid
LDFLAGS ignored, hostap-utils,
/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r5/install/hostap-utils/usr/sbin/hostap_io_debug
LDFLAGS ignored, hostap-utils,
/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r5/install/hostap-utils/usr/sbin/hostap_diag

ppp:
LDFLAGS ignored, ppp,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp/usr/sbin/chat
LDFLAGS ignored, ppp-oa,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oa/usr/lib/pppd/2.4.3/pppoatm.so
LDFLAGS ignored, ppp-oe,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oe/usr/sbin/pppoe-discovery
LDFLAGS ignored, ppp-oe,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-oe/usr/lib/pppd/2.4.3/rp-pppoe.so
LDFLAGS ignored, ppp-radius,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radattr.so
LDFLAGS ignored, ppp-radius,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radrealms.so
LDFLAGS ignored, ppp-radius,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-radius/usr/lib/pppd/2.4.3/radius.so
LDFLAGS ignored, ppp-winbind,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-winbind/usr/lib/pppd/2.4.3/winbind.so
LDFLAGS ignored, ppp-minconn,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-minconn/usr/lib/pppd/2.4.3/minconn.so
LDFLAGS ignored, ppp-password,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-password/usr/lib/pppd/2.4.3/passwordfd.so
LDFLAGS ignored, ppp-password,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-password/usr/lib/pppd/2.4.3/passprompt.so
LDFLAGS ignored, ppp-tools,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-tools/usr/sbin/pppdump
LDFLAGS ignored, ppp-tools,
/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r4/install/ppp-tools/usr/sbin/pppstats

obexpush:
LDFLAGS ignored, obexpush,
/work/armv5te-angstrom-linux-gnueabi/obexpush-1.0.0-r4/install/obexpush/usr/bin/obextool
LDFLAGS ignored, obexpush,
/work/armv5te-angstrom-linux-gnueabi/obexpush-1.0.0-r4/install/obexpush/usr/bin/ussp-push


While you're there, why don't try to fix these:

klibc:
non dev contains .so, klibc,
/work/c7x0-angstrom-linux-gnueabi/klibc-1.5-r9/install/klibc/lib/klibc.so

libopieobex0:
non dev contains .so, libopieobex0,
/work/armv5te-angstrom-linux-gnueabi/libopieobex0-1.2.4-r0/install/libopieobex0/usr/lib/opie/plugins/obex/libopieobex.so

libgtkstylus:
non dev contains .so, libgtkstylus,
/work/armv5te-angstrom-linux-gnueabi/libgtkstylus-0.3-r5/install/libgtkstylus/usr/lib/gtk-2.0/2.10.0/modules/libgtkstylus.so

Regards

Andrea


