Received: from [209.85.221.200] (helo=mail-qy0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MjytR-0001zE-8f
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 19:17:41 +0200
Received: by qyk38 with SMTP id 38so606447qyk.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+9sTxyg6kKH6bzvI3WHBpwk2ODKLDpt0Azik4AErcNM=;
	b=CRqVDyIcLOuZHfnr8WVAZmzme9odKl9XRWy+R23SRekl1xY9Xh5t5OwUspJtp4Cph8
	6MxIznXJXtGXt08POSd/bW4bivHQ5lh+9926p7uSiWyeTKWYUYNyHq8Qso7a2IT858el
	xP9tJik6Gk/nk/7vTbeu4DXCGuPltXWp0s5bM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AAPCdg/C9kyYEV2mntqAYKKHHyBvZ1qMU88u/g47Mkq9Qnfn6z4G3bNKNXZ2d/sz4+
	jUXAA2omR1K41oVE7x6wDwdURUG42BH1cTnurBl4WbSimQolh3PST/UQGIu2O0nsJstS
	aKmLJANkTEwNQ6mb0kNIg09LQhy8Xv2B6nHKU=
MIME-Version: 1.0
Received: by 10.229.93.4 with SMTP id t4mr3503898qcm.93.1252169914303; Sat, 05 
	Sep 2009 09:58:34 -0700 (PDT)
In-Reply-To: <5f2b60909030552q10d3c75eq4430bf504a8578c9@mail.gmail.com>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
	<5f2b60909030316q43cc1b60ic8350e68bcdb2a5c@mail.gmail.com>
	<h7o6gu$fii$1@ger.gmane.org>
	<5f2b60909030552q10d3c75eq4430bf504a8578c9@mail.gmail.com>
Date: Sat, 5 Sep 2009 18:58:32 +0200
Message-ID: <5f2b60909050958s6a7ce069l748516267e5f3059@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Sat, 05 Sep 2009 17:17:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I updated to the latest and greatest dev branch and still gstreamer-ti
fails to build for machine dm6446-evm. It cannot find esd.h:

$ time bitbake gstreamer-ti
...snip...
| Making all in ext
| Making all in annodex
| Making all in esd
|   CC    esdsink.o
| esdsink.c:51:17: error: esd.h: No such file or directory
| esdsink.c: In function 'gst_esdsink_open':
| esdsink.c:200: error: 'esd_server_info_t' undeclared (first use in
this function)
| esdsink.c:200: error: (Each undeclared identifier is reported only once
| esdsink.c:200: error: for each function it appears in.)
| esdsink.c:200: error: 'server_info' undeclared (first use in this functio=
n)
| esdsink.c:201: warning: ISO C90 forbids mixed declarations and code
| esdsink.c:215: warning: implicit declaration of function 'esd_open_sound'
| esdsink.c:229: warning: implicit declaration of function 'esd_get_server_=
info'
...snip...
NOTE: Task failed:
/media/raid/bjornfor/documents/dev/os/linux/oe-stuff/build/tmp/work/armv5te=
-angstrom-linux-gnueabi/gst-plugins-good-0.10.15-r3/temp/log.do_compile.127=
87
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/media/raid/bjornfor/documents/dev/os/linux/oe-stuff/openembedded/recipes/g=
streamer/gst-plugins-good_0.10.15.bb
do_compile failed
ERROR: Task 271
(/media/raid/bjornfor/documents/dev/os/linux/oe-stuff/openembedded/recipes/=
gstreamer/gst-plugins-good_0.10.15.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1341 tasks of which 1341 didn't need to
be rerun and 1 failed.
ERROR: '/media/raid/bjornfor/documents/dev/os/linux/oe-stuff/openembedded/r=
ecipes/gstreamer/gst-plugins-good_0.10.15.bb'
failed

Any suggestions?

Best regards,
Bj=C3=B8rn Forsman


