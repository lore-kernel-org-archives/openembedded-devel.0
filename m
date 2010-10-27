Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAzQL-0001bo-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 08:23:51 +0200
Received: by ywo32 with SMTP id 32so146368ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UA4r7iKppsanoQ9/bTdGnu813Ji3MUD6JVWcAJX1Hdw=;
	b=VVNz6/1cmC4rtCIG0l90JLZLxCh4AM2t22gXx+G33DyqqygQxM+9aCrRW0P5H3deaE
	MCjchMyijovfgdNQmAPcOJyj7lFCiOaowvIOL6bs5uOAC3GraA8Pe1ru69FjHNMFjif+
	gMyn96Fz3pWykv3kb2KpBSRStNoRi5f+W1oLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DNZLXRo+mNZZGQUopwcVVv4DVPtgD2lk7LNqZ0dAztKjZNVYn25u3Dq5lRBzE36cDZ
	3fBYUl3Xbh5OmX81UPomHlWqH6RJvHop7494mx1NkuGLpfY7TQUi5yVWQOUOj8ezPh0F
	rTlTyWpW/iy24DiCO6WO6RfHd1gXJCgTeZBhE=
Received: by 10.91.27.32 with SMTP id e32mr418017agj.37.1288160582511; Tue, 26
	Oct 2010 23:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Tue, 26 Oct 2010 23:22:42 -0700 (PDT)
In-Reply-To: <a6650683ce91ecdc66f223e051f1fbd8.squirrel@webmail.crhc.illinois.edu>
References: <a6650683ce91ecdc66f223e051f1fbd8.squirrel@webmail.crhc.illinois.edu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2010 23:22:42 -0700
Message-ID: <AANLkTikdQRJxn2ESExgUrDeiPY0rbVmoW905Xzo77E1t@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Linker problem with libfreetype.so when cross-compiling for armv7a from x86_64
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
X-List-Received-Date: Wed, 27 Oct 2010 06:23:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 12:29 PM,  <johnso87@crhc.illinois.edu> wrote:
> Hi,
> =C2=A0 =C2=A0I tried to build the beagleboard-demo-image recipe from scra=
tch on a
> 64-bit machine running Ubuntu 10.04. =C2=A0I already had 32- and 64-bit
> libfreetype.so installed (in /usr/lib and /usr/lib32) on the host. =C2=A0=
I
> get an error when trying to compile clxclient, a child project of
> JAAA:
>
> NOTE: Running task 5211 of 9419 (ID: 4930,
> /scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclien=
t_3.6.1.bb,
> do_compile)
> NOTE: package clxclient-3.6.1-r1: task do_compile: Started
> ERROR: Function do_compile failed
> NOTE: Task failed: ('function do_compile failed',
> '/scr/johnso87/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-ang=
strom-linux-gnueabi/clxclient-3.6.1-r1/temp/log.do_compile.5368')
> NOTE: oestats: task failed, see
> http://tinderbox.openembedded.net/public/logs/task/9211313.txt
> ERROR: Logfile of failure stored in:
> /scr/johnso87/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angs=
trom-linux-gnueabi/clxclient-3.6.1-r1/temp/log.do_compile.5368
> Log data follows:
> | NOTE: make -j16
> | arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -shared -W=
l,-O1
> -Wl,--hash-style=3Dgnu -L/usr/lib -L/usr/X11R6/lib `freetype-config --lib=
s`
> -Wl,-soname,libclxclient.so.3 -o libclxclient.so.3.6.1 xdisplay.o
> xresman.o xhandler.o xwindow.o xdraw.o button.o textip.o enumip.o
> menuwin.o scale.o slider.o scroll.o mclist.o meter.o -lpthread -lXft -lX1=
1
> | /usr/lib/libfreetype.so: file not recognized: File format not recognize=
d
> | collect2: ld returned 1 exit status
> | make: *** [libclxclient.so.3.6.1] Error 1
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package clxclient-3.6.1-r1: task do_compile: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclien=
t_3.6.1.bb
> do_compile failed
> ERROR: Task 4930
> (/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb,
> do_compile) failed with 256
> ERROR:
> '/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb'
> failed
> NOTE: oestats: build failed, see
> http://tinderbox.openembedded.net/builds/99197/
> ERROR:
> '/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb'
> failed
>
>
> I tried adding /usr/lib32 to the front of my LD_LIBRARY_PATH, and tried
> adding -L/usr/lib32 to the compile arguments by hacking my
> /usr/bin/freetype-config , but neither seemed to do anything. =C2=A0It ke=
eps
> finding the 64-bit version of libfreetype.so and puking.
>
> Any thoughts?

you probably need a libtool macro update for clxclient recipe.


>
> I'm working from the HEAD of the master OE Git branch.
>
> Thanks,
> -Matt
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


