Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7258671D9D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:05:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k6so645191wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SO7yUcZnnkkoaYvWIHEl+QI2YdjaOXjyrhpD+i8TS04=;
	b=cHykmqsnmVPi+/m/ZLLhiU/kRPnj++Y9/33rmgl8KWuV4rRs42N8eiLsRd0yRTzhwE
	aZxQaGa72iYNHc0ZNeHK+OzOK3sZbtwT9lg5qAxpGbMfksTa5H+tS+6skx+bgB6aiTAj
	xJnnufNFOf6Pn8odWvyyGxoJmWsfDDdCvF9XSMQIQ0ZOFO7ti8sT1UrhiJx6tD4/x93k
	lsbhnr4GnRkl8V1PNn+/hD+hEiylFVIJA48y/isEQQqO7+swkY6UhA9d4CPpK9Zd9S/n
	JIxKwQ7Nx+f+diqGfeOREjOJmfgUqJa643ka94HApQe3o0L8DJbeRY8EyLjVFiiufkwz
	/2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SO7yUcZnnkkoaYvWIHEl+QI2YdjaOXjyrhpD+i8TS04=;
	b=OuADcwNfW32qFkQAB+7JwPxh7Ldk+xmHF/v5+/1ODyszdvYKOj5RbKzN4XJVQkK+L8
	LtXph7ubpqODfBcMsBPzNdX1/x9SHpXDgot/tHVTBRmTYxwS/fy+vtWDQ/9wfms3oenG
	WPOZZ0ozt0dmPso6YyZsm9Qoq2R5i6i0a7Bc4G8qeck0IcKnQm5fmvxREIHI2vmlcgK5
	mbBbhVB2FF4/5zBk9g+9PnsA228fyIcUUYijn4jo7ySabb7QGD/qAKwqAUERh6E0Adxa
	Okm6cX2ORLeOqFjTu/fC6UPLp/kMTQwUSqOZJoNUPFwSPkIlxxpmvzgDEc8ZOLvJAWNN
	VCjQ==
X-Gm-Message-State: AFeK/H37zg/O9aHU40sGkX3JVctl5hnuARg/LWGw8tVmjTGWU3XnqcOOfLbLQQJ+epjzLA==
X-Received: by 10.223.141.149 with SMTP id o21mr3412114wrb.69.1490785517817;
	Wed, 29 Mar 2017 04:05:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w17sm8322507wrc.20.2017.03.29.04.05.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Mar 2017 04:05:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Mar 2017 13:05:15 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170329110515.GC3298@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170307071349.16444-4-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 11:05:18 -0000
X-Groupsio-MsgNum: 65962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 11:13:39PM -0800, Khem Raj wrote:
> Additional patches are upstream to fix build with gcc6 and clang
> Add systemd unit file
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gpm/gpm-1.99.7/eglibc-2.17.patch               |  12 -
>  .../gpm/gpm-1.99.7/remove_nested_functions.patch   | 326 ---------------=
------
>  meta-oe/recipes-support/gpm/gpm/gpm.service.in     |   9 +
>  .../recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init   |   0
>  .../gpm/{gpm-1.99.7 =3D> gpm}/no-docs.patch          |   2 +-
>  .../gpm/{gpm-1.99.7 =3D> gpm}/processcreds.patch     |   0
>  meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |  52 ++--
>  7 files changed, 31 insertions(+), 370 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.pa=
tch
>  delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_=
functions.patch
>  create mode 100644 meta-oe/recipes-support/gpm/gpm/gpm.service.in
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init (100%)
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/no-docs.patch (=
93%)
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/processcreds.pa=
tch (100%)
>=20
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch b/m=
eta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
> deleted file mode 100644
> index e43bdcb22..000000000
> --- a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Upstream-Status: pending
> -
> ---- gpm-1.99.7.orig/src/daemon/open_console.c	2008-07-24 12:33:05.000000=
000 +0200
> -+++ gpm-1.99.7/src/daemon/open_console.c	2013-01-10 12:39:47.975461947 +=
0100
> -@@ -23,6 +23,7 @@
> - #include <fcntl.h>              /* open and co.  */
> - #include <sys/stat.h>           /* stat() */
> - #include <sys/ioctl.h>          /* ioctl() */
> -+#include <sys/types.h>          /* major() */
> -=20
> - /* Linux specific (to be outsourced in gpm2 */
> - #include <linux/serial.h>       /* for serial console check */
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functio=
ns.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.p=
atch
> deleted file mode 100644
> index d2d6cb8a8..000000000
> --- a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch
> +++ /dev/null
> @@ -1,326 +0,0 @@
> -Remove nested functions, they are not available in all compilers
> -e.g. clang will not support them.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gpm-1.99.7/src/drivers/summa/i.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gpm-1.99.7.orig/src/drivers/summa/i.c
> -+++ gpm-1.99.7/src/drivers/summa/i.c
> -@@ -36,6 +36,28 @@ extern int summamaxy;
> -=20
> - extern signed char summaid;
> -=20
> -+static void resetsumma(int fd)
> -+{
> -+   write(fd, 0, 1);          /* Reset */
> -+   usleep(400000);           /* wait */
> -+}
> -+
> -+static int waitsumma(int fd)
> -+{
> -+   struct timeval timeout;
> -+
> -+   fd_set readfds;
> -+
> -+   int err;
> -+
> -+   FD_ZERO(&readfds);
> -+   FD_SET(fd, &readfds);
> -+   timeout.tv_sec =3D 0;
> -+   timeout.tv_usec =3D 200000;
> -+   err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> -+   return (err);
> -+}
> -+
> - Gpm_Type *I_summa(int fd, unsigned short flags, struct Gpm_Type *type, =
int argc,
> -                   char **argv)
> - {
> -@@ -43,24 +65,6 @@ Gpm_Type *I_summa(int fd, unsigned short
> -    flags =3D argc =3D 0;            /* FIXME: 1.99.13 */
> -    argv =3D NULL;
> -=20
> --   void resetsumma() {
> --      write(fd, 0, 1);          /* Reset */
> --      usleep(400000);           /* wait */
> --   }
> --   int waitsumma() {
> --      struct timeval timeout;
> --
> --      fd_set readfds;
> --
> --      int err;
> --
> --      FD_ZERO(&readfds);
> --      FD_SET(fd, &readfds);
> --      timeout.tv_sec =3D 0;
> --      timeout.tv_usec =3D 200000;
> --      err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> --      return (err);
> --   }
> -    int err;
> -=20
> -    char buffer[255];
> -@@ -91,7 +95,7 @@ Gpm_Type *I_summa(int fd, unsigned short
> -     */
> -    setspeed(fd, 1200, 9600, 1,
> -             B9600 | CS8 | CREAD | CLOCAL | HUPCL | PARENB | PARODD);
> --   resetsumma();
> -+   resetsumma(fd);
> -=20
> -    write(fd, SS_PROMPT_MODE, strlen(SS_PROMPT_MODE));
> -=20
> -@@ -103,7 +107,7 @@ Gpm_Type *I_summa(int fd, unsigned short
> -        * read the Summa Firm-ID=20
> -        */
> -       write(fd, SS_FIRMID, strlen(SS_FIRMID));
> --      err =3D waitsumma();
> -+      err =3D waitsumma(fd);
> -       if(!((err =3D=3D -1) || (!err))) {
> -          summaid =3D 10;          /* Original Summagraphics */
> -          read(fd, buffer, 255); /* Read Firm-ID */
> -@@ -111,14 +115,14 @@ Gpm_Type *I_summa(int fd, unsigned short
> -    }
> -=20
> -    if(summaid < 0) {            /* Genius-test */
> --      resetsumma();
> -+      resetsumma(fd);
> -       write(fd, GEN_MMSERIES, 1);
> -       write(fd, &GEN_MODELL, 1);        /* Read modell */
> --      err =3D waitsumma();
> -+      err =3D waitsumma(fd);
> -       if(!((err =3D=3D -1) || (!err))) {    /* read Genius-ID */
> --         err =3D waitsumma();
> -+         err =3D waitsumma(fd);
> -          if(!((err =3D=3D -1) || (!err))) {
> --            err =3D waitsumma();
> -+            err =3D waitsumma(fd);
> -             if(!((err =3D=3D -1) || (!err))) {
> -                read(fd, &config, 1);
> -                summaid =3D (config[0] & 224) >> 5;        /* genius tab=
let-id
> -@@ -135,14 +139,14 @@ Gpm_Type *I_summa(int fd, unsigned short
> -     * unknown tablet ?
> -     */
> -    if((summaid < 0) || (summaid =3D=3D 11)) {
> --      resetsumma();
> -+      resetsumma(fd);
> -       write(fd, SS_BINARY_FMT SS_PROMPT_MODE, 3);
> -    }
> -=20
> -    /*
> -     * read tablet size=20
> -     */
> --   err =3D waitsumma();
> -+   err =3D waitsumma(fd);
> -    if(!((err =3D=3D -1) || (!err)))
> -       read(fd, buffer, sizeof(buffer));
> -    write(fd, SS_READCONFIG, 1);
> -Index: gpm-1.99.7/src/drivers/wacom/i.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gpm-1.99.7.orig/src/drivers/wacom/i.c
> -+++ gpm-1.99.7/src/drivers/wacom/i.c
> -@@ -30,10 +30,6 @@
> - #include "message.h"            /* gpm_report */
> - #include "wacom.h"              /* wacom */
> -=20
> --Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type *type, =
int argc,
> --                  char **argv)
> --{
> --
> - /* wacom graphire tablet */
> - #define UD_RESETBAUD     "\r$"  /* reset baud rate to default (wacom V)=
 */
> -    /*
> -@@ -45,83 +41,91 @@ Gpm_Type *I_wacom(int fd, unsigned short
> - #define UD_COORD         "~C\r" /* Request max coordinates */
> - #define UD_STOP          "\nSP\r"       /* stop sending coordinates */
> -=20
> --   flags =3D 0;                   /* FIXME: 1.99.13 */
> -=20
> --   void reset_wacom() {
> --      /*
> --       * Init Wacom communication; this is modified from xf86Wacom.so m=
odule=20
> --       */
> --      /*
> --       * Set speed to 19200=20
> --       */
> --      setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL | HUPC=
L);
> --      /*
> --       * Send Reset Baudrate Command=20
> --       */
> --      write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
> --      usleep(250000);
> --      /*
> --       * Send Reset Command=20
> --       */
> --      write(fd, UD_RESET, strlen(UD_RESET));
> --      usleep(75000);
> --      /*
> --       * Set speed to 9600bps=20
> --       */
> --      setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL | HUPCL);
> --      /*
> --       * Send Reset Command=20
> --       */
> --      write(fd, UD_RESET, strlen(UD_RESET));
> --      usleep(250000);
> --      write(fd, UD_STOP, strlen(UD_STOP));
> --      usleep(100000);
> --   }
> -+static void reset_wacom(int fd)
> -+{
> -+   /*
> -+    * Init Wacom communication; this is modified from xf86Wacom.so modu=
le=20
> -+    */
> -+   /*
> -+    * Set speed to 19200=20
> -+    */
> -+   setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL | HUPCL);
> -+   /*
> -+    * Send Reset Baudrate Command=20
> -+    */
> -+   write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
> -+   usleep(250000);
> -+   /*
> -+    * Send Reset Command=20
> -+    */
> -+   write(fd, UD_RESET, strlen(UD_RESET));
> -+   usleep(75000);
> -+   /*
> -+    * Set speed to 9600bps=20
> -+    */
> -+   setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL | HUPCL);
> -+   /*
> -+    * Send Reset Command=20
> -+    */
> -+   write(fd, UD_RESET, strlen(UD_RESET));
> -+   usleep(250000);
> -+   write(fd, UD_STOP, strlen(UD_STOP));
> -+   usleep(100000);
> -+}
> -=20
> --   int wait_wacom() {
> --      /*
> --       *  Wait up to 200 ms for Data from Tablet.
> --       *  Do not read that data.
> --       *  Give back 0 on timeout condition, -1 on error and 1 for DataP=
resent
> --       */
> --      struct timeval timeout;
> --
> --      fd_set readfds;
> --
> --      int err;
> --
> --      FD_ZERO(&readfds);
> --      FD_SET(fd, &readfds);
> --      timeout.tv_sec =3D 0;
> --      timeout.tv_usec =3D 200000;
> --      err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> --      return ((err > 0) ? 1 : err);
> --   }
> -+static int wait_wacom(int fd)
> -+{
> -+   /*
> -+    *  Wait up to 200 ms for Data from Tablet.
> -+    *  Do not read that data.
> -+    *  Give back 0 on timeout condition, -1 on error and 1 for DataPres=
ent
> -+    */
> -+   struct timeval timeout;
> -=20
> --   char buffer[50], *p;
> -+   fd_set readfds;
> -=20
> --   int RequestData(char *cmd) {
> --      int err;
> -+   int err;
> -=20
> --      /*
> --       * Send cmd if not null, and get back answer from tablet.
> --       * Get Data to buffer until full or timeout.
> --       * Give back 0 for timeout and !0 for buffer full
> --       */
> --      if(cmd)
> --         write(fd, cmd, strlen(cmd));
> --      memset(buffer, 0, sizeof(buffer));
> --      p =3D buffer;
> --      err =3D wait_wacom();
> --      while(err !=3D -1 && err && (p - buffer) < (int) (sizeof(buffer) =
- 1)) {
> --         p +=3D read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
> --         err =3D wait_wacom();
> --      }
> --      /*
> --       * return 1 for buffer full=20
> --       */
> --      return ((strlen(buffer) >=3D (sizeof(buffer) - 1)) ? !0 : 0);
> -+   FD_ZERO(&readfds);
> -+   FD_SET(fd, &readfds);
> -+   timeout.tv_sec =3D 0;
> -+   timeout.tv_usec =3D 200000;
> -+   err =3D select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
> -+   return ((err > 0) ? 1 : err);
> -+}
> -+
> -+static int RequestData(int fd, char *cmd, char *buffer)
> -+{
> -+   int err;
> -+   char *p;
> -+   /*
> -+    * Send cmd if not null, and get back answer from tablet.
> -+    * Get Data to buffer until full or timeout.
> -+    * Give back 0 for timeout and !0 for buffer full
> -+    */
> -+   if(cmd)
> -+      write(fd, cmd, strlen(cmd));
> -+   memset(buffer, 0, sizeof(buffer));
> -+   p =3D buffer;
> -+   err =3D wait_wacom(fd);
> -+   while(err !=3D -1 && err && (p - buffer) < (int) (sizeof(buffer) - 1=
)) {
> -+      p +=3D read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
> -+      err =3D wait_wacom(fd);
> -    }
> -+   /*
> -+    * return 1 for buffer full=20
> -+    */
> -+   return ((strlen(buffer) >=3D (sizeof(buffer) - 1)) ? !0 : 0);
> -+}
> -+
> -+Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type *type, =
int argc,
> -+                  char **argv)
> -+{
> -+
> -+   flags =3D 0;                   /* FIXME: 1.99.13 */
> -+
> -+   char buffer[50];
> -=20
> -    /*
> -     * We do both modes, relative and absolute, with the same function.
> -@@ -143,17 +147,17 @@ Gpm_Type *I_wacom(int fd, unsigned short
> -    };
> -    parse_argv(optioninfo, argc, argv);
> -    type->absolute =3D WacomAbsoluteWanted;
> --   reset_wacom();
> -+   reset_wacom(fd);
> -=20
> -    /*
> -     * "Flush" input queque=20
> -     */
> --   while(RequestData(NULL)) ;
> -+   while(RequestData(fd, NULL, buffer)) ;
> -=20
> -    /*
> -     * read WACOM-ID=20
> -     */
> --   RequestData(UD_FIRMID);
> -+   RequestData(fd, UD_FIRMID, buffer);
> -=20
> -    /*
> -     * Search for matching modell=20
> -@@ -180,7 +184,7 @@ Gpm_Type *I_wacom(int fd, unsigned short
> -     * read Wacom max size=20
> -     */
> -    if(WacomModell !=3D (-1) && (!wcmodell[WacomModell].maxX)) {
> --      RequestData(UD_COORD);
> -+      RequestData(fd, UD_COORD, buffer);
> -       sscanf(buffer + 2, "%d,%d", &wmaxx, &wmaxy);
> -       wmaxx =3D (wmaxx - wcmodell[WacomModell].border);
> -       wmaxy =3D (wmaxy - wcmodell[WacomModell].border);
> diff --git a/meta-oe/recipes-support/gpm/gpm/gpm.service.in b/meta-oe/rec=
ipes-support/gpm/gpm/gpm.service.in
> new file mode 100644
> index 000000000..ee6c040fa
> --- /dev/null
> +++ b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DVirtual console mouse server
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@bindir@/gpm -m /dev/input/mice -t imps2
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/init b/meta-oe/recipe=
s-support/gpm/gpm/init
> similarity index 100%
> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/init
> rename to meta-oe/recipes-support/gpm/gpm/init
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch b/meta-=
oe/recipes-support/gpm/gpm/no-docs.patch
> similarity index 93%
> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
> rename to meta-oe/recipes-support/gpm/gpm/no-docs.patch
> index f10217a94..3faef84ee 100644
> --- a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
> +++ b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
> @@ -11,7 +11,7 @@ Index: gpm-1.99.7/Makefile.in
>   # user-overridable flags, but it's also all the implicit rule looks at.
>   # missing ?
>  =20
> --SUBDIRS =3D src doc contrib gpm2
> +-SUBDIRS =3D src doc contrib
>  +SUBDIRS =3D src
>  =20
>  =20
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch b/=
meta-oe/recipes-support/gpm/gpm/processcreds.patch
> similarity index 100%
> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
> rename to meta-oe/recipes-support/gpm/gpm/processcreds.patch
> diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-=
support/gpm/gpm_1.99.7.bb
> index bbb8c28ac..7697772ca 100644
> --- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> @@ -5,49 +5,39 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://gpm2/core/main.c;endline=3D19;md5=3D66d3c20=
5c4e7ee5704b2ee351dfed72f"
> =20
> +PV .=3D"+git${SRCREV}"
>  PR =3D "r2"
> =20
>  DEPENDS =3D "ncurses"
> =20
> -SRC_URI =3D "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
> +SRC_URI =3D "git://github.com/telmich/gpm;protocol=3Dgit;branch=3Dmaster=
 \
>             file://no-docs.patch \
>             file://processcreds.patch \
> -           file://eglibc-2.17.patch \
> -           file://remove_nested_functions.patch \
>             file://init"
> =20
> -inherit autotools-brokensep update-rc.d
> +SRCREV =3D "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools-brokensep update-rc.d systemd
> =20
>  INITSCRIPT_NAME =3D "gpm"
>  INITSCRIPT_PARAMS =3D "defaults"
> =20
> -#export LIBS =3D "-lm"
> -
> -# all fields are /* FIXME: gpm 1.99.13 */
> -# gpm-1.99.7/src/lib/libhigh.c:171:43: error: parameter 'clientdata' set=
 but not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/lib/report-lib.c:28:21: error: parameter 'line' set but=
 not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/lib/report-lib.c:28:33: error: parameter 'file' set but=
 not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/empty/i.c:26:23: error: parameter 'fd' set but =
not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/empty/i.c:26:42: error: parameter 'flags' set b=
ut not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/etouch/i.c:34:43: error: parameter 'flags' set =
but not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/msc/r.c:32:12: error: variable 'dy' set but not=
 used [-Werror=3Dunused-but-set-variable]
> -# gpm-1.99.7/src/drivers/msc/r.c:32:8: error: variable 'dx' set but not =
used [-Werror=3Dunused-but-set-variable]
> -# cc1: all warnings being treated as errors
> -CFLAGS +=3D "-Wno-extra -Wno-error=3Dunused-but-set-parameter -Wno-error=
=3Dunused-but-set-variable"
> -
> -# twiddler is WIP in 1.99.7 and probably not worth fixing (a lot of chan=
ges in gpm-2-dev after 1.99.7
> -# gpm-1.99.7/src/drivers/twid/twiddler.c:503:14: error: cast to pointer =
=66rom integer of different size [-Werror=3Dint-to-pointer-cast]
> -# /gpm-1.99.7/src/mice.c:221:5: error: (near initialization for 'mice[32=
].init') [-Werror]
> -CFLAGS +=3D "-Wno-error=3Dint-to-pointer-cast -Wno-error"
> -
> -do_install () {
> -    oe_runmake 'DESTDIR=3D${D}' install
> -    install -m 0644 src/headers/gpm.h ${D}${includedir}
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> -    cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
> +do_configure_prepend() {
> +    (cd ${S};./autogen.sh;cd -)
> +}
> +
> +do_install_append () {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}${s=
ystemd_system_unitdir}/gpm.service

Did you forgot to add gpm.service.in in SRC_URI?

> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
> +        install -D -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> +    fi
> +    install -D -m 0644 ${S}/src/headers/gpm.h ${D}${includedir}/gpm.h
>  }
> -SRC_URI[md5sum] =3D "9fdddf5f53cb11d40bb2bb671d3ac544"
> -SRC_URI[sha256sum] =3D "6071378b24494e36ca3ef6377606e7e565040413c8670475=
3a162d2180af32ee"
> +
> +SYSTEMD_SERVICE_${PN} =3D "gpm.service"
> =20
>  FILES_${PN} +=3D "${datadir}/emacs"
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNuU6wAKCRA3VSO3ZXaA
HEK+AJ4/JzjZyqK5XpDd9Tn2rcZpxN1CrgCfVaUwzRj7B9Y0zIDllFIjJP0U9tU=
=4Shi
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
