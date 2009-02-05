Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LV5zc-0007hR-C0
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Feb 2009 16:18:17 +0100
Received: by fxm10 with SMTP id 10so424743fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2009 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NI3whnXRJ09AAJfCASXIZ4rHOePHKHRET2Jp60nAW4E=;
	b=L5kt08fHq06VLwS+qW2j6A8Sa/R/+m9nexMV/THUm9fvaqczPboGIwn3iVR/bEnA8q
	x1xDsR6+m90hCDPd6QNKio4XpKcSB/KZDUbipEBwg6jLBrL5amj6K6qmL9kz/fmsf0VU
	/wM/pPKUrDaHKlMk4WAbuelzbEkKjXLg3B0lg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CVFQwk6lHcBmTPUA76Alt0v5jxdbE6zKsFnyTmVHopv5SXnqJ61WK5acfDKnorHb6Q
	D1o2JLbKAlbmofwmIQ+PRotU8akEd5WjHJqRix2Rl6O5qBANegKNpVDwkHTvG23LzYkH
	F5iOyHgbOgolK1fBW675XVTgsZYFVeKtYn2Jk=
MIME-Version: 1.0
Received: by 10.181.221.15 with SMTP id y15mr198718bkq.121.1233847078447; Thu, 
	05 Feb 2009 07:17:58 -0800 (PST)
In-Reply-To: <1233329325.13749.0.camel@EPBYMINW0568>
References: <1233329325.13749.0.camel@EPBYMINW0568>
Date: Thu, 5 Feb 2009 17:17:58 +0200
Message-ID: <fce2a370902050717w16025e2ard91fac99d622fce9@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fixed serial console for stb225 board.
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
X-List-Received-Date: Thu, 05 Feb 2009 15:18:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Any chances we will see the patch committed?

On Fri, Jan 30, 2009 at 5:28 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Use ttyPNX[0-1] with 204:[208-209] device numbers for serial device.
> Changed UART speed to 115200.
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  conf/machine/stb225.conf                           |    5 ++-
>  files/device_table_add-stb225.txt                  |    2 +
>  .../linux/linux-2.6.28/stb225/serial-speed.patch   |   12 ++++
>  packages/linux/linux-2.6.28/stb225/ttyPNX.patch    |   58 ++++++++++++++++++++
>  packages/linux/linux_2.6.28.bb                     |    2 +
>  5 files changed, 78 insertions(+), 1 deletions(-)
>  create mode 100644 files/device_table_add-stb225.txt
>  create mode 100644 packages/linux/linux-2.6.28/stb225/serial-speed.patch
>  create mode 100644 packages/linux/linux-2.6.28/stb225/ttyPNX.patch
>
> diff --git a/conf/machine/stb225.conf b/conf/machine/stb225.conf
> index c57adb0..52d2cea 100644
> --- a/conf/machine/stb225.conf
> +++ b/conf/machine/stb225.conf
> @@ -9,6 +9,9 @@ IMAGE_FSTYPES += "tar.gz"
>  PREFERRED_PROVIDER_virtual/kernel = "linux"
>  KERNEL_IMAGETYPE = "uImage"
>
> -SERIAL_CONSOLE ?= "115200 ttySA0"
> +SERIAL_CONSOLE ?= "115200 ttyPNX0"
>
>  require conf/machine/include/tune-mips32.inc
> +
> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
> +                       files/device_table_add-stb225.txt"
> diff --git a/files/device_table_add-stb225.txt b/files/device_table_add-stb225.txt
> new file mode 100644
> index 0000000..b312883
> --- /dev/null
> +++ b/files/device_table_add-stb225.txt
> @@ -0,0 +1,2 @@
> +# Include nodes for the SCI/SCIF serial ports on SH* boards
> +/dev/ttyPNX    c       640     0       5       204     208     0       1       2
> diff --git a/packages/linux/linux-2.6.28/stb225/serial-speed.patch b/packages/linux/linux-2.6.28/stb225/serial-speed.patch
> new file mode 100644
> index 0000000..763a7b1
> --- /dev/null
> +++ b/packages/linux/linux-2.6.28/stb225/serial-speed.patch
> @@ -0,0 +1,12 @@
> +diff -urN linux-2.6.28.orig/drivers/serial/pnx8xxx_uart.c linux-2.6.28/drivers/serial/pnx8xxx_uart.c
> +--- linux-2.6.28.orig/drivers/serial/pnx8xxx_uart.c    2009-01-30 15:12:47.000000000 +0200
> ++++ linux-2.6.28/drivers/serial/pnx8xxx_uart.c 2009-01-30 15:13:21.000000000 +0200
> +@@ -706,7 +706,7 @@
> + pnx8xxx_console_setup(struct console *co, char *options)
> + {
> +       struct pnx8xxx_port *sport;
> +-      int baud = 38400;
> ++      int baud = 115200;
> +       int bits = 8;
> +       int parity = 'n';
> +       int flow = 'n';
> diff --git a/packages/linux/linux-2.6.28/stb225/ttyPNX.patch b/packages/linux/linux-2.6.28/stb225/ttyPNX.patch
> new file mode 100644
> index 0000000..aa9a6fc
> --- /dev/null
> +++ b/packages/linux/linux-2.6.28/stb225/ttyPNX.patch
> @@ -0,0 +1,58 @@
> +From af80b7f1be5a58769a00ed8dd600951cabf9517e Mon Sep 17 00:00:00 2001
> +From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> +Date: Wed, 14 Jan 2009 16:30:29 +0200
> +Subject: [PATCH] Don't use ttyS* serial device name for PNX8XXX UART
> +
> +Rather create ttyPNX*. Also changed minor number to be
> +different with sa1100 serial driver one.
> +---
> + drivers/serial/pnx8xxx_uart.c |   11 +++++------
> + 1 files changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/drivers/serial/pnx8xxx_uart.c b/drivers/serial/pnx8xxx_uart.c
> +index 22e30d2..96870f1 100644
> +--- a/drivers/serial/pnx8xxx_uart.c
> ++++ b/drivers/serial/pnx8xxx_uart.c
> +@@ -34,9 +34,8 @@
> + #include <asm/io.h>
> + #include <asm/irq.h>
> +
> +-/* We'll be using StrongARM sa1100 serial port major/minor */
> + #define SERIAL_PNX8XXX_MAJOR  204
> +-#define MINOR_START           5
> ++#define MINOR_START           208
> +
> + #define NR_PORTS              2
> +
> +@@ -636,7 +635,7 @@ static struct uart_ops pnx8xxx_pops = {
> + /*
> +  * Setup the PNX8XXX serial ports.
> +  *
> +- * Note also that we support "console=ttySx" where "x" is either 0 or 1.
> ++ * Note also that we support "console=ttyPNXx" where "x" is either 0 or 1.
> +  */
> + static void __init pnx8xxx_init_ports(void)
> + {
> +@@ -728,7 +727,7 @@ pnx8xxx_console_setup(struct console *co, char *options)
> +
> + static struct uart_driver pnx8xxx_reg;
> + static struct console pnx8xxx_console = {
> +-      .name           = "ttyS",
> ++      .name           = "ttyPNX",
> +       .write          = pnx8xxx_console_write,
> +       .device         = uart_console_device,
> +       .setup          = pnx8xxx_console_setup,
> +@@ -752,8 +751,8 @@ console_initcall(pnx8xxx_rs_console_init);
> +
> + static struct uart_driver pnx8xxx_reg = {
> +       .owner                  = THIS_MODULE,
> +-      .driver_name            = "ttyS",
> +-      .dev_name               = "ttyS",
> ++      .driver_name            = "ttyPNX",
> ++      .dev_name               = "ttyPNX",
> +       .major                  = SERIAL_PNX8XXX_MAJOR,
> +       .minor                  = MINOR_START,
> +       .nr                     = NR_PORTS,
> +--
> +1.5.6.3
> +
> diff --git a/packages/linux/linux_2.6.28.bb b/packages/linux/linux_2.6.28.bb
> index ea88f71..8b099ce 100644
> --- a/packages/linux/linux_2.6.28.bb
> +++ b/packages/linux/linux_2.6.28.bb
> @@ -19,4 +19,6 @@ SRC_URI_append_stb225 = " \
>            file://uImage.patch;patch=1 \
>            file://ebase-fix.patch;patch=1 \
>            file://enable-uart.patch;patch=1 \
> +           file://ttyPNX.patch;patch=1 \
> +           file://serial-speed.patch;patch=1 \
>            file://ip3902.patch;patch=1"
> --
> 1.5.6.3
>
>
>


