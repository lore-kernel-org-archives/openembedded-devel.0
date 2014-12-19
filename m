Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 00A6C72A9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 19:48:41 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Y24TS-0007q2-Ok
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2014 21:48:34 +0100
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Y23XO-0002WN-4S
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2014 20:48:39 +0100
Message-ID: <5494810F.2050400@pr.hu>
Date: Fri, 19 Dec 2014 20:48:31 +0100
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Score: 0.8 (/)
X-Scan-Signature: 325f7eb36b407d36a457b6b1c0640019
X-Spam-Tracer: backend.mail.pr.hu 0.8 20141219194839Z
Subject: do_install_append() in Mesa prevents GLAMOR to be enabled in xorg-
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 19:48:45 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

there is this code in openembedded-core/meta/recipes-graphics/mesa/mesa_9.2.5.bb:

=============================================
#because we cannot rely on the fact that all apps will use pkgconfig,
#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
do_install_append() {
    if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
    fi
}
=============================================

I have used this recipe as a template for Mesa 10.x but didn't pay attention to this part yet.
I also use Xorg 1.16.2. Now, I had to enable GLAMOR in the X-server so support
the radeonsi driver properly in xf86-video-ati but glamor_priv.h in the X-server code
uses #define MESA_EGL_NO_X11_HEADERS to select the behaviour in eglplatform.h.
It doesn't want Xlib.h included.

I think it's mistaken reasoning to select a fixed behaviour based upon the 'x11'
distro feature, since there can be a valid excuse for apps that indeed use
pkgconfig. xserver-xorg is a pretty fundamental piece to break.

Best regards,
Zoltán Böszörményi


