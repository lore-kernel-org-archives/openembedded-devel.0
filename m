Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OtixL-0005Ic-TN
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 17:22:33 +0200
Received: by gwb1 with SMTP id 1so692408gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=sBKCJNOOwOknQt68xMsklkS95DpS9s/qMCO1QPstjyc=;
	b=suJqWGs+jX4vnyOiyNqaisUM3sGkvlx6OklEhMtZMCve4U8GUAOotsc/wEIHbXjSWi
	tFrH7U9xmUYlPMy3wzKpwtfRwjaryCF0wg2S07vctqGJogYfVONSxU371FnoVCkp3q5r
	ToHzs9xVVFgv5qVl9L8WHKP45Nwk8wT1VYGSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PW+HXAck+sCp2sz9OIsxNxKVySq3FWIz9AXBpf8hHjP4FWWISqH2kCtx0TtRzNGVas
	p8+VWYJndXr3aQBjy8W6Y+MvBymJd4lkNuvLl4U7UjKHibxLVY2+QuMLkQCCQX7yz0Db
	91hVStLtofREFc22/XBYyu+nywjgRhtEC424E=
Received: by 10.151.62.37 with SMTP id p37mr230288ybk.275.1284045708673;
	Thu, 09 Sep 2010 08:21:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w24sm7694491ybk.13.2010.09.09.08.21.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Sep 2010 08:21:47 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Sep 2010 10:11:40 -0500
Message-Id: <1284045100-27485-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] psplash-ti: update configurability patch
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
X-List-Received-Date: Thu, 09 Sep 2010 15:22:33 -0000

* Update the configurability patch to work with revision 422 of
  the psplash sources.  This patch causes the psplash background
  to be black which is the color we want to use.
* Bump the PR

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../0001-configurability-for-rev-422.patch         |  251 ++++++++++++++++++++
 recipes/psplash/psplash-ti_svn.bb                  |    1 +
 recipes/psplash/psplash.inc                        |    2 +-
 3 files changed, 253 insertions(+), 1 deletions(-)
 create mode 100644 recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch

diff --git a/recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch b/recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch
new file mode 100644
index 0000000..7f62197
--- /dev/null
+++ b/recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch
@@ -0,0 +1,251 @@
+From 1c962c46c8060ae3f2c78c238199a915d261ea31 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <chase.maupin@ti.com>
+Date: Thu, 9 Sep 2010 07:34:29 -0500
+Subject: [PATCH] configurability for rev 422
+
+* Update the configurability.patch file to work with revision
+  422 of the psplash sources.
+
+Signed-off-by: Chase Maupin <chase.maupin@ti.com>
+---
+ psplash.c |   90 ++++++++++++++++++++++++++++++------------------------------
+ psplash.h |   15 ++++++++++
+ 2 files changed, 60 insertions(+), 45 deletions(-)
+
+diff --git a/psplash.c b/psplash.c
+index 7a52e05..da6005d 100644
+--- a/psplash.c
++++ b/psplash.c
+@@ -44,17 +44,17 @@ psplash_draw_msg (PSplashFB *fb, const char *msg)
+ 
+   /* Clear */
+ 
+-  psplash_fb_draw_rect (fb, 
+-			0, 
+-			fb->height - (fb->height/6) - h, 
++  psplash_fb_draw_rect (fb,
++			0,
++			fb->height - (fb->height/PSPLASH_TEXT_DIVIDER) - h,
+ 			fb->width,
+ 			h,
+-			0xec, 0xec, 0xe1);
++			PSPLASH_BACKGROUND_COLOR_R, PSPLASH_BACKGROUND_COLOR_G, PSPLASH_BACKGROUND_COLOR_B);
+ 
+   psplash_fb_draw_text (fb,
+-			(fb->width-w)/2, 
+-			fb->height - (fb->height/6) - h,
+-			0x6d, 0x6d, 0x70,
++			(fb->width-w)/2,
++			fb->height - (fb->height/PSPLASH_TEXT_DIVIDER) - h,
++			PSPLASH_TEXT_COLOR_R, PSPLASH_TEXT_COLOR_G, PSPLASH_TEXT_COLOR_B,
+ 			&radeon_font,
+ 			msg);
+ }
+@@ -66,36 +66,36 @@ psplash_draw_progress (PSplashFB *fb, int value)
+ 
+   /* 4 pix border */
+   x      = ((fb->width  - BAR_IMG_WIDTH)/2) + 4 ;
+-  y      = fb->height - (fb->height/6) + 4;
+-  width  = BAR_IMG_WIDTH - 8; 
++  y      = fb->height - (fb->height/PSPLASH_PROGRESS_DIVIDER) + 4;
++  width  = BAR_IMG_WIDTH - 8;
+   height = BAR_IMG_HEIGHT - 8;
+ 
+   if (value > 0)
+     {
+       barwidth = (CLAMP(value,0,100) * width) / 100;
+-      psplash_fb_draw_rect (fb, x + barwidth, y, 
++      psplash_fb_draw_rect (fb, x + barwidth, y,
+     			width - barwidth, height,
+-			0xec, 0xec, 0xe1);
++			PSPLASH_BACKGROUND_COLOR_R, PSPLASH_BACKGROUND_COLOR_G, PSPLASH_BACKGROUND_COLOR_B);
+       psplash_fb_draw_rect (fb, x, y, barwidth,
+-			    height, 0x6d, 0x6d, 0x70);
++			    height, PSPLASH_PROGRESS_COLOR_R, PSPLASH_PROGRESS_COLOR_G, PSPLASH_PROGRESS_COLOR_B);
+     }
+   else
+     {
+       barwidth = (CLAMP(-value,0,100) * width) / 100;
+-      psplash_fb_draw_rect (fb, x, y, 
++      psplash_fb_draw_rect (fb, x, y,
+     			width - barwidth, height,
+-			0xec, 0xec, 0xe1);
++			PSPLASH_BACKGROUND_COLOR_R, PSPLASH_BACKGROUND_COLOR_G, PSPLASH_BACKGROUND_COLOR_B);
+       psplash_fb_draw_rect (fb, x + width - barwidth,
+ 			    y, barwidth, height,
+-			    0x6d, 0x6d, 0x70);
++			    PSPLASH_PROGRESS_COLOR_R, PSPLASH_PROGRESS_COLOR_G, PSPLASH_PROGRESS_COLOR_B);
+     }
+ 
+-  DBG("value: %i, width: %i, barwidth :%i\n", value, 
++  DBG("value: %i, width: %i, barwidth :%i\n", value,
+ 		width, barwidth);
+ }
+ 
+-static int 
+-parse_command (PSplashFB *fb, char *string, int length) 
++static int
++parse_command (PSplashFB *fb, char *string, int length)
+ {
+   char *command;
+   int   parsed=0;
+@@ -103,21 +103,21 @@ parse_command (PSplashFB *fb, char *string, int length)
+   parsed = strlen(string)+1;
+ 
+   DBG("got cmd %s", string);
+-	
++
+   if (strcmp(string,"QUIT") == 0)
+     return 1;
+ 
+   command = strtok(string," ");
+ 
+-  if (!strcmp(command,"PROGRESS")) 
++  if (!strcmp(command,"PROGRESS"))
+     {
+       psplash_draw_progress (fb, atoi(strtok(NULL,"\0")));
+-    } 
+-  else if (!strcmp(command,"MSG")) 
++    }
++  else if (!strcmp(command,"MSG"))
+     {
+       psplash_draw_msg (fb, strtok(NULL,"\0"));
+-    } 
+-  else if (!strcmp(command,"QUIT")) 
++    }
++  else if (!strcmp(command,"QUIT"))
+     {
+       return 1;
+     }
+@@ -125,8 +125,8 @@ parse_command (PSplashFB *fb, char *string, int length)
+   return 0;
+ }
+ 
+-void 
+-psplash_main (PSplashFB *fb, int pipe_fd, int timeout) 
++void
++psplash_main (PSplashFB *fb, int pipe_fd, int timeout)
+ {
+   int            err;
+   ssize_t        length = 0;
+@@ -143,14 +143,14 @@ psplash_main (PSplashFB *fb, int pipe_fd, int timeout)
+ 
+   end = command;
+ 
+-  while (1) 
++  while (1)
+     {
+-      if (timeout != 0) 
++      if (timeout != 0)
+ 	err = select(pipe_fd+1, &descriptors, NULL, NULL, &tv);
+       else
+ 	err = select(pipe_fd+1, &descriptors, NULL, NULL, NULL);
+-      
+-      if (err <= 0) 
++
++      if (err <= 0)
+ 	{
+ 	  /*
+ 	  if (errno == EINTR)
+@@ -223,10 +223,10 @@ main (int argc, char** argv)
+ 	  angle = atoi(argv[i]);
+ 	  continue;
+ 	}
+-      
++
+     fail:
+-      fprintf(stderr, 
+-	      "Usage: %s [-n|--no-console-switch][-a|--angle <0|90|180|270>]\n", 
++      fprintf(stderr,
++	      "Usage: %s [-n|--no-console-switch][-a|--angle <0|90|180|270>]\n",
+ 	      argv[0]);
+       exit(-1);
+     }
+@@ -240,7 +240,7 @@ main (int argc, char** argv)
+ 
+   if (mkfifo(PSPLASH_FIFO, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP))
+     {
+-      if (errno!=EEXIST) 
++      if (errno!=EEXIST)
+ 	{
+ 	  perror("mkfifo");
+ 	  exit(-1);
+@@ -248,8 +248,8 @@ main (int argc, char** argv)
+     }
+ 
+   pipe_fd = open (PSPLASH_FIFO,O_RDONLY|O_NONBLOCK);
+-  
+-  if (pipe_fd==-1) 
++
++  if (pipe_fd==-1)
+     {
+       perror("pipe open");
+       exit(-2);
+@@ -264,29 +264,29 @@ main (int argc, char** argv)
+   }
+ 
+   /* Clear the background with #ecece1 */
+-  psplash_fb_draw_rect (fb, 0, 0, fb->width, fb->height, 0xec, 0xec, 0xe1);
++  psplash_fb_draw_rect (fb, 0, 0, fb->width, fb->height, PSPLASH_BACKGROUND_COLOR_R, PSPLASH_BACKGROUND_COLOR_G, PSPLASH_BACKGROUND_COLOR_B);
+ 
+   /* Draw the OH logo  */
+-  psplash_fb_draw_image (fb, 
+-			 (fb->width  - POKY_IMG_WIDTH)/2, 
+-			 ((fb->height * 5) / 6 - POKY_IMG_HEIGHT)/2, 
++  psplash_fb_draw_image (fb,
++                         (fb->width  - POKY_IMG_WIDTH)/2,
++                         (fb->height - POKY_IMG_HEIGHT)/2,
+ 			 POKY_IMG_WIDTH,
+ 			 POKY_IMG_HEIGHT,
+ 			 POKY_IMG_BYTES_PER_PIXEL,
+ 			 POKY_IMG_RLE_PIXEL_DATA);
+ 
+   /* Draw progress bar border */
+-  psplash_fb_draw_image (fb, 
+-			 (fb->width  - BAR_IMG_WIDTH)/2, 
+-			 fb->height - (fb->height/6), 
++  psplash_fb_draw_image (fb,
++                         (fb->width  - BAR_IMG_WIDTH)/2,
++                         fb->height - (fb->height/PSPLASH_PROGRESS_DIVIDER),
+ 			 BAR_IMG_WIDTH,
+ 			 BAR_IMG_HEIGHT,
+ 			 BAR_IMG_BYTES_PER_PIXEL,
+ 			 BAR_IMG_RLE_PIXEL_DATA);
+ 
+-  psplash_draw_progress (fb, 0);
++  psplash_draw_progress (fb, 0); /* draw initial progress */
+ 
+-  psplash_draw_msg (fb, MSG);
++  if (strlen(MSG)) psplash_draw_msg (fb, MSG);
+ 
+   psplash_main (fb, pipe_fd, 0);
+ 
+diff --git a/psplash.h b/psplash.h
+index 22d73a3..1b015b6 100644
+--- a/psplash.h
++++ b/psplash.h
+@@ -55,6 +55,21 @@ typedef int            bool;
+ #define TRUE 1
+ #endif
+ 
++#define PSPLASH_BACKGROUND_COLOR_R    0x00
++#define PSPLASH_BACKGROUND_COLOR_G    0x00
++#define PSPLASH_BACKGROUND_COLOR_B    0x00
++
++#define PSPLASH_PROGRESS_COLOR_R    0xe3
++#define PSPLASH_PROGRESS_COLOR_G    0x71
++#define PSPLASH_PROGRESS_COLOR_B    0x00
++
++#define PSPLASH_TEXT_COLOR_R    0xff
++#define PSPLASH_TEXT_COLOR_G    0xff
++#define PSPLASH_TEXT_COLOR_B    0xff
++
++#define PSPLASH_PROGRESS_DIVIDER    3
++#define PSPLASH_TEXT_DIVIDER    3
++
+ #define PSPLASH_FIFO "psplash_fifo"
+ 
+ #define CLAMP(x, low, high) \
+-- 
+1.7.0.4
+
diff --git a/recipes/psplash/psplash-ti_svn.bb b/recipes/psplash/psplash-ti_svn.bb
index 2667cc4..b754d09 100644
--- a/recipes/psplash/psplash-ti_svn.bb
+++ b/recipes/psplash/psplash-ti_svn.bb
@@ -12,6 +12,7 @@ ALTERNATIVE_PRIORITY = "20"
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://psplash-18bpp.patch \
           file://logo-math.patch \
+          file://0001-configurability-for-rev-422.patch \
           file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index d3d9920..efd6a0c 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -9,7 +9,7 @@ RCONFLICTS_${PN} = "exquisite"
 
 SRCREV = "422"
 PV = "0.0+svnr${SRCPV}"
-PR = "r32"
+PR = "r33"
 
 # You can create your own pslash-poky-img.h by doing
 # ./make-image-header.sh <file>.png POKY
-- 
1.7.0.4



