Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NsGhI-0003h9-Oe
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 15:28:27 +0100
Received: by fxm20 with SMTP id 20so302616fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=R9pXcXPEP58t4QHdzuC80Uwg7CLnXb+tjSH04wXh+KI=;
	b=DVOIVQoSzAOTl9brLBJGeC3J9rIzjze3ss3Lu85m92kcMMmWFD0zSG4S0q80xA4o4Y
	72v8STNd+pAYmdrvZfyfq3d7zrSEXacBxsmt+bvW3a24pTbNzFvzQjDhr4crJIzagoRb
	482IS2tHKjUpo1qHUgWTADVbi/o4uVrUPrbcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fxQtDROk3eITuADxGg4Bl5AsSDpPo8HFAnbLgEg1UYlsU5h7P6s1O97+Yt/BYvzYPE
	SY+E9RWjLfY2VYHAcjq8Hb5fyHTjyM07ygMyDJ1fCKhQp58I7F7QX57OsqBVoXTVhQge
	GV6/atZPC4yebifkDo9ZCVQYDfNoI34TPLjps=
MIME-Version: 1.0
Received: by 10.223.15.147 with SMTP id k19mr9108321faa.87.1268921957699; Thu, 
	18 Mar 2010 07:19:17 -0700 (PDT)
Date: Thu, 18 Mar 2010 15:19:17 +0100
Message-ID: <141020e31003180719n7c4b1bd0ve58e26c7b6b661ee@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gst-plugins-base_0.10.28 fails with thumb Was: [oe-commits] Koen Kooi : gstreamer: updates
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
X-List-Received-Date: Thu, 18 Mar 2010 14:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2010 at 9:34 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e04b826e9b24dbe3b9332da8da9b9310f5125dc4
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3De04b826e9b24dbe3b9332da8da9b9310f5125dc4
>
> Author: Koen Kooi <koen@openembedded.org>
> Date: =A0 Wed Mar 17 20:46:31 2010 +0100
>
> gstreamer: updates
>
> * switch to new-style staging
> * add support for new-style checksums
> * move plugins to newer versions, so plugins moved (e.g. ivorbis)
> * fixup gstconfig header parsing
>
> ---
>
> =A0recipes/gstreamer/gst-common.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A05=
 ----
> =A0recipes/gstreamer/gst-plugins-bad_0.10.18.bb =A0| =A0 =A09 ++++++++
> =A0recipes/gstreamer/gst-plugins-base_0.10.28.bb | =A0 26 +++++++++++++++=
++++++++++
> =A0recipes/gstreamer/gst-plugins-good_0.10.21.bb | =A0 16 +++++++++++++++
> =A0recipes/gstreamer/gst-plugins-ugly_0.10.14.bb | =A0 21 +++++++++++++++=
+++++
> =A0recipes/gstreamer/gst-plugins.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 13 +++=
++++++++-
> =A0recipes/gstreamer/gst-rtsp_0.10.4.bb =A0 =A0 =A0 =A0 =A0| =A0 =A03 +-
> =A0recipes/gstreamer/gstreamer.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04=
 +-
> =A0recipes/gstreamer/gstreamer_0.10.28.bb =A0 =A0 =A0 =A0| =A0 11 +++++++=
+++
> =A09 files changed, 98 insertions(+), 10 deletions(-)

Hi Koen,

thanks for update, I have small issue with thumb mode enabled while
building recipes/gstreamer/gst-plugins-base_0.10.28.bb, with
ARM_INSTRUCTION_SET =3D "ARM"
in recipe it compiles fine
without it fails like this:

| Making all in vorbis
|   CC    gstvorbisdeclib.o
| /tmp/ccWB7NmH.s: Assembler messages:
| /tmp/ccWB7NmH.s:65: Error: instruction not supported in Thumb16 mode
-- `subs ip,r5,#32768'
| /tmp/ccWB7NmH.s:66: Error: Thumb does not support conditional execution
| /tmp/ccWB7NmH.s:67: Error: Thumb does not support conditional execution
| /tmp/ccWB7NmH.s:68: Error: instruction not supported in Thumb16 mode
-- `adds ip,r5,#32768'
| /tmp/ccWB7NmH.s:69: Error: Thumb does not support conditional execution
| /tmp/ccWB7NmH.s:124: Error: instruction not supported in Thumb16
mode -- `subs ip,r5,#32768'
| /tmp/ccWB7NmH.s:125: Error: Thumb does not support conditional execution
| /tmp/ccWB7NmH.s:126: Error: Thumb does not support conditional execution
| /tmp/ccWB7NmH.s:127: Error: instruction not supported in Thumb16
mode -- `adds ip,r5,#32768'
| /tmp/ccWB7NmH.s:128: Error: Thumb does not support conditional execution
| make[3]: *** [libgstivorbisdec_la-gstvorbisdeclib.lo] Error 1
| make[2]: *** [all-recursive] Error 1
| make[1]: *** [all-recursive] Error 1
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gst-plugins-base-0.10.28-r7.0: task do_compile: Failed


I'm not sure how big impact would be to disable thumb or how difficult
it would be to modify that code to be thumb compatible.

Regards,


