Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UM2gu-0000tY-KI
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 21:47:56 +0100
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id C036920C6A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 21:30:52 +0100 (CET)
Message-ID: <51574B7B.1030204@pseudoterminal.org>
Date: Sat, 30 Mar 2013 21:30:51 +0100
From: dv <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5156FDFD.1030606@pseudoterminal.org>
	<CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
In-Reply-To: <CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
Subject: Re: gst-ffmpeg configure-fix patch and yasm
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
X-List-Received-Date: Sat, 30 Mar 2013 20:47:56 -0000
X-Groupsio-MsgNum: 43816
Content-Type: multipart/mixed; boundary="------------050909080503000509050505"

--------------050909080503000509050505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/13 17:40, Otavio Salvador wrote:
> On Sat, Mar 30, 2013 at 12:00 PM, dv <dv@pseudoterminal.org> wrote:
>> Hello,
>>
>> I noticed this part of the configure-fix.patch file for gst-ffmpeg 0.10.13:
>>
>> +  if test "x$disable_yasm" != "xyes"; then
>> +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
>> +  fi
>>
>> Shouldn't the test be:  if test "x$disable_yasm" = "xyes"  ?
>> To me, it seems as if this code adds --disable-yasm if disable_yasm is not
>> set to "yes", which is the complete opposite of the intended behavior.
>>
>> Or am I missing some detail about shell script code here?
> I think you are right here. Maybe you could provide a fix for it?
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

No problem. Patch for the patch attached :)

--------------050909080503000509050505
Content-Type: text/x-patch;
 name="0001-gst-ffmpeg-configure-fix-patch-used-wrong-test.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-gst-ffmpeg-configure-fix-patch-used-wrong-test.patch"

From 4624e30adb13ad361f886eeda4272a7235bedd61 Mon Sep 17 00:00:00 2001
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Sat, 30 Mar 2013 21:29:22 +0100
Subject: [PATCH] gst-ffmpeg: configure-fix patch used wrong test

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
index 81029ca..2bb124b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
@@ -11,7 +11,7 @@ diff -r f2f8f74c6e30 configure.ac
          --enable-gpl"
    fi
  
-+  if test "x$disable_yasm" != "xyes"; then
++  if test "x$disable_yasm" = "xyes"; then
 +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
 +  fi
 +
-- 
1.8.2


--------------050909080503000509050505--
