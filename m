Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3253274D51
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 00:58:28 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x4-v6so949910vkx.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 17:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=soambs/xE9bKuJnwgqKL4hSbf82s1C2C02QPDhtZLjE=;
	b=uTJIELGPpb9qUO6YfJeNzA+Zrp+flF6TwYF/MfbNZwC2GPktw9CNmDG6nrbMwj4bOv
	aARDETt3cWrdqtCZ/0CLOgekmX4+hkht5iqFGfDuYx9B50YmvllovqGFtG2rkceLnh0C
	r1Ld7xaOniSqnLqRwW84LrgF/6JybSHszPLYl/dZE1bvoqjWswRnhZWCe0NWSEv0UCjK
	N3mXTDlC9gOiHc9lplo26NPTO6bVSj5KFTyV7ilw44lEFagaEO3PGQArHg1XVJvrOthr
	Xk2y07jD7zH+qwIyRNscEE34m5t5dobYoXL1+x1Moo7bjMpdTho6NJdUzKsFiiiaLjNH
	kSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=soambs/xE9bKuJnwgqKL4hSbf82s1C2C02QPDhtZLjE=;
	b=saiivzemYteEdhJXg0VyLgL05FGs58Bb9Xh9EnPSHe84aNbOBZWK7fHJaT4QmPRerz
	bThtL0mEqY3mjo1Y4vykcz7meUJJ+xAP427rFPUMsARPJgNHaZAPP/bLxChW+dncph/g
	Abxmhy/ilxv2cg2nn8DzpWYu6kemCVKK7svk7YmyPAj4D3bXcvvz2Ch6GuUUt+XjW9rI
	1NACddkvwrIoWIumTsmehDrQp8Hex8gbqwlxQgamUGQxHVGFzE4pFJB3lTD8drWRBMZN
	tR6SVODg5UzfLmjnZSUHXbnr6YlWFLWikDNSFelLX/4Wg4fQxRivqCoLh/b88Azl78Jr
	iXSQ==
X-Gm-Message-State: APt69E1b6xe6LvcnDMQOg27bCdTnGzCusZFGue/RMyPAtS2nluO62Mq0
	+J7YdQHSr6oivYzIgerkwaDSCPt5WP6o7SOUplA=
X-Google-Smtp-Source: ADUXVKKt8EQl6/KDCSYJH0HV5RBa4rf08QMcMdd5ZypwHZ4153I+/AWeriZUO5EFP8a62jTopJM/hPRdnf0jYQdqWpA=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr10182298vkd.174.1529456309928; 
	Tue, 19 Jun 2018 17:58:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 19 Jun 2018 17:58:29 -0700 (PDT)
In-Reply-To: <1529451724-37869-1-git-send-email-denis@denix.org>
References: <1529451724-37869-1-git-send-email-denis@denix.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Jun 2018 17:58:29 -0700
Message-ID: <CAJ86T=V=DamJN9Z_3bD+hBShoDwGkmA1c-HBR8XaHscmyzLA6Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] devmem2: ensure word is 32-bit, add support for 64-bit double
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
X-List-Received-Date: Wed, 20 Jun 2018 00:58:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 4:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Since sizeof(unsigned long) can be 8-byte on 64-bit architectures, use
> uint32_t instead for "word" access to always be 4-byte/32-bit long.
>
> Also introduce proper "double" 8-byte/64-bit access by using uint64_t.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb         |  4 +-
>  ...sure-word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> index c86eb2e..9bd1eb7 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
>  PR = "r7"
>
>  SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> -           file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
> +           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> +           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
> +
>  S = "${WORKDIR}"
>
>  CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
> diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> new file mode 100644
> index 0000000..ad8ae67
> --- /dev/null
> +++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> @@ -0,0 +1,70 @@
> +From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Tue, 29 May 2018 16:55:42 -0400
> +Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
> + double
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + devmem2.c | 23 +++++++++++++++++------
> + 1 file changed, 17 insertions(+), 6 deletions(-)
> +
> +diff --git a/devmem2.c b/devmem2.c
> +index 5845381..68131b2 100644
> +--- a/devmem2.c
> ++++ b/devmem2.c
> +@@ -39,6 +39,7 @@
> +
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> + #include <unistd.h>
> + #include <string.h>
> + #include <errno.h>
> +@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
> +       if(argc < 2) {
> +               fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
> +                       "\taddress : memory address to act upon\n"
> +-                      "\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
> ++                      "\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [d]ouble\n"

The busybox version of devmem (which seems to be the "upstream" for
devmem development activity, such as it is) has already picked "l" as
the command line option for 64bit values.

> +                       "\tdata    : data to be written\n\n",
> +                       argv[0]);
> +               exit(1);
> +@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
> +                       read_result = *((unsigned short *) virt_addr);
> +                       break;
> +               case 'w':
> +-                      data_size = sizeof(unsigned long);
> ++                      data_size = sizeof(uint32_t);
> +                       virt_addr = fixup_addr(virt_addr, data_size);
> +-                      read_result = *((unsigned long *) virt_addr);
> ++                      read_result = *((uint32_t *) virt_addr);
> ++                      break;
> ++              case 'd':
> ++                      data_size = sizeof(uint64_t);
> ++                      virt_addr = fixup_addr(virt_addr, data_size);
> ++                      read_result = *((uint64_t *) virt_addr);
> +                       break;
> +               default:
> +                       fprintf(stderr, "Illegal data type '%c'.\n", access_type);
> +@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
> +                               read_result = *((unsigned short *) virt_addr);
> +                               break;
> +                       case 'w':
> +-                              virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
> +-                              *((unsigned long *) virt_addr) = write_val;
> +-                              read_result = *((unsigned long *) virt_addr);
> ++                              virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
> ++                              *((uint32_t *) virt_addr) = write_val;
> ++                              read_result = *((uint32_t *) virt_addr);
> ++                              break;
> ++                      case 'd':
> ++                              virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
> ++                              *((uint64_t *) virt_addr) = write_val;
> ++                              read_result = *((uint64_t *) virt_addr);
> +                               break;
> +               }
> +               sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

