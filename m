Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTxnb-0000ti-NV for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 15:58:02 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTxj3-0002VY-VT for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 15:53:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 15:53:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 15:53:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Jun 2010 15:53:09 +0200
Message-ID: <i0fi85$g27$1@dough.gmane.org>
References: <201006291747.12761.schnitzeltony@gmx.de>	<i0dgf8$5bd$2@dough.gmane.org>
	<201006301446.13623.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <201006301446.13623.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems bumping clutter recipes
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
X-List-Received-Date: Wed, 30 Jun 2010 13:58:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-06-10 14:46, Andreas Mueller wrote:
> On Tuesday 29 June 2010 09:10:32 pm Koen Kooi wrote:
>>> 2. In clutter-box2d.inc I removed PACKAGE_ARCH = "${MACHINE_ARCH}" because I had the feeling that this caused OE build an
>>
>> You need the PACKAGE_ARCH = "${MACHINE_ARCH}" since configure uses a
>> different gl setting per machine.

Let me repeat:

Configure uses a different gl setting per machine

So the output is machine specific. And hence PACKAGE_ARCH = MACHINE_ARCH


>>
>> regards,
>>
>> Koen
> 
> For better understanding of what's going on, I did clean & build clutter-box2d twice:
> - with PACKAGE_ARCH = "${MACHINE_ARCH}"
> - without PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> and diffed the Makefiles created. The (shortened) result is:
> 
> -ACLOCAL = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> aclocal-1.11
> -AMTAR = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> tar
> +ACLOCAL = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> aclocal-1.11
> +AMTAR = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> tar
> ...
> -AUTOCONF = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run autoconf
> -AUTOHEADER = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run autoheader
> -AUTOMAKE = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> automake-1.11
> +AUTOCONF = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run autoconf
> +AUTOHEADER = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run autoheader
> +AUTOMAKE = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> automake-1.11
> ...
> -MAKEINFO = 
> ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run makeinfo
> +MAKEINFO = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/missing --run 
> makeinfo
> ...
> -abs_builddir = /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> -abs_srcdir = /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> -abs_top_builddir = /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> -abs_top_srcdir = /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> +abs_builddir = /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> +abs_srcdir = /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> +abs_top_builddir = /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> +abs_top_srcdir = /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git
> ...
> -install_sh = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/install-sh
> +install_sh = ${SHELL} /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-r0+gitdae84a82efe22b284cba8ca1985ce14bb4e86c99/git/install-sh
> 
> As far as I can see, only the pathes have changed. Together with the assumption that Makefile is the only configure output used for building, I think it is no difference to have PACKAGE_ARCH 
> = "${MACHINE_ARCH} or not. Sorry for insisting but I am not sure to miss some issue on this.
> 
> 
> 
> Coming to the second issue:
> 
> On Tue, Jun 29, 2010 at 8:47 AM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
>> ..I had success so far but now I am in trouble with clutter-gst.
> 
> On Tuesday 29 June 2010 08:57:07 pm Khem Raj wrote:
>> what it seems to me is that you need
>> to bump some of dependency versions too
> 
> I found some dependency information coming with clutter-gst in the file clutter-gst.pc.in
>> Requires: clutter-@CLUTTER_API_VERSION@ gstreamer-0.10 gstreamer-base-0.10 gstreamer-plugins-base-0.10
> 
> All gstreamer stuff is 0.10.29 - I think this should be OK.
> 
> 
> On Tue, Jun 29, 2010 at 8:47 AM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
>> | ./clutter-gst-video-sink.c:138: error: expected ')' before 'GLUNIFORM1IPROC'
>> | ./clutter-gst-video-sink.c:140: error: expected ')' before 'GLGENPROGRAMSPROC'
>> | ./clutter-gst-video-sink.c:141: error: expected ')' before 'GLBINDPROGRAMPROC'
>> | ./clutter-gst-video-sink.c:142: error: expected ')' before 'GLPROGRAMSTRINGPROC'
>> | ./clutter-gst-video-sink.c:147: error: expected specifier-qualifier-list before 'GLGENPROGRAMSPROC'
>> ...
>> I seems that APIENTRYP is not defined. APIENTRYP is found in <OEDir>/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/gl.h the mesa OpenGL header which is not to be included
>> here. 
> 
> To get further information, I manually added in clutter-gst-video-sink.c:
> 
> #include <GL/gl.h>
> 
> And - surprisingly - get
> 
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h: At top level:
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h:35: error: conflicting types for 'GLintptr'
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/glext.h:4325: error: previous declaration of 'GLintptr' was here
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h:36: error: conflicting types for 'GLsizeiptr'
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/glext.h:4326: error: previous declaration of 'GLsizeiptr' was here
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h:576: error: conflicting types for 'glTexImage2D'
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/gl.h:1326: error: previous declaration of 'glTexImage2D' was here
> 
> but the previous complains related to APIENTRYP are gone!
> 
> Long talk - two questions:
> 
> 	1. Is it possible that clutter-gst is not really prepared for gles it and will only build against gl?
> 	2. What is the role of mesa in systems supporting gles? I think I have read something that mesa gets a 'gl-wrapper' for this. Is that true?
> 
> If you read up to here: Thanks for your patience...

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFMK0xFMkyGM64RGpERAsMvAJ94V+gBSux6N1Y+XEHc7GQiZcmQiACTBTM8
OK96zhzIVu19YKNYzYfLWA==
=0ibl
-----END PGP SIGNATURE-----



