Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08FED7E98D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 18:27:12 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id m29so3619187qtu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SrT4sYqHm5SNKxquqgm4DM87voTNTNozwVdzfaad3NY=;
	b=aTuHZ6fJK8FmpyowlKyotB8C+Rm9Cf8U6ne6x2O/zYY02SaTRpL/aCwhctAPU+a10H
	BE2gTDJ3GiC/kHs5youT2Eu27cymTzjrXuRRpyObPaxnDJ9idnif/IBmOAU/kfLuNRfz
	dNWHjgQYrHiY7CyJpJwjwihf8uVD4ocm9JpGY9hdXSL3s9mrcExk194WEwwbRsnB3yL0
	nq4qij3I4SUTznspMbd1UQoR3D2tDG7aFAT/U7VopG4W3CdNWEZNTwzUYd8qLnBJQQyh
	ww7ifzIBZQyRKrp8oiipy+ONVILgfAiasnb7ezFQgXuT6+7WcJm2Wa5k1rE9u9/wzkUS
	3TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SrT4sYqHm5SNKxquqgm4DM87voTNTNozwVdzfaad3NY=;
	b=hEU7cN4zHannWljg6pdgIM7yH/Ds3Hv24rTQjruqCmJfDO0PZZDYVtnDq14HpwmQOF
	X/v7MhqJNynHmwEU6gTwWjOMByJu2x+6DIS65lCQP3J6G0UDOXTHsnZmIoEqE0qYROcF
	wX4iGuFp5l6bgvss7aU/PZLwS0huxeFBrezLyuYA02evTsaVjmtzp4/NCyo7D1r3M6hd
	UNuHxhPkXfyW0PjgnWRo8IQHGG3QVo1SH8QJuIXPxTu9ji60gzS/Q+pz02vRO0xj5tmP
	/TDa//ONmaoo1RgviXyi35roViSaPQKR1HsV9IEDs3BVMWJcjcgdjNCYflwb3dv9g7OL
	G34Q==
X-Gm-Message-State: APjAAAW0EWfT4tEM/EGAYPRx+AL3JMQn9GWihq7YeRa5saVBnXsv05+3
	puF4FLPWG9vC1NZRMf5gM5PqYu/1Cdaks3qe5G8=
X-Google-Smtp-Source: APXvYqwx//0h8VoNnt/SsX4Pv43ylkTP/nu+rFWIDEw2A75bxkSdXSyskTtQ9fp8AgQT1xfyAs9keG+Luwt8pEOnceA=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr80675963qtx.194.1560536833670; 
	Fri, 14 Jun 2019 11:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190605183523.32391-1-vernon.mauery@linux.intel.com>
	<CAMKF1srZ7F-D1RDBkZ+_4ewiFP-XTYT6YBSkfXBd-w2Do61Lmw@mail.gmail.com>
In-Reply-To: <CAMKF1srZ7F-D1RDBkZ+_4ewiFP-XTYT6YBSkfXBd-w2Do61Lmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 11:26:47 -0700
Message-ID: <CAMKF1spHQK--=aUwKw8zw_ptpJVqMuzu6aJOKq3Rtk+DBcEcNA@mail.gmail.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Update ipmitool to use new active source
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
X-List-Received-Date: Fri, 14 Jun 2019 18:27:13 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/248468/

On Fri, Jun 14, 2019 at 11:20 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build on qemux86-64/musl
>
> https://errors.yoctoproject.org/Errors/Details/248477/
>
> On Wed, Jun 5, 2019 at 11:43 AM Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
> >
> > The ipmitool project has moved from sourceforge to github and is under
> > new management. This updates the source so that it pulls directly from
> > git rather than a tarball. Eventually, once the next release is tagged,
> > the new SRCREV can be updated to that. But for now, the project is under
> > active development and could probably benefit from periodic updates
> > anyway.
> >
> > The SRCREV and SRC_URI links point to code that already has been patched
> > to work with the new openssl 1.1 APIs, so the patch is no longer needed.
> >
> > Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > ---
> >  .../0001-Migrate-to-openssl-1.1.patch         | 152 ------------------
> >  .../{ipmitool_1.8.18.bb => ipmitool_git.bb}   |  12 +-
> >  2 files changed, 6 insertions(+), 158 deletions(-)
> >  delete mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> >  rename meta-oe/recipes-kernel/ipmitool/{ipmitool_1.8.18.bb => ipmitool_git.bb} (80%)
> >
> > diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> > deleted file mode 100644
> > index 394aa16ad..000000000
> > --- a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> > +++ /dev/null
> > @@ -1,152 +0,0 @@
> > -From c9dcb6afef9c343d070aaff208d11a997a45a105 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Wed, 5 Sep 2018 22:19:38 -0700
> > -Subject: [PATCH] Migrate to openssl 1.1
> > -
> > -Upstream-Status: Backport [https://sourceforge.net/p/ipmitool/source/ci/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1/]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/plugins/lanplus/lanplus_crypt_impl.c | 50 ++++++++++++++----------
> > - 1 file changed, 29 insertions(+), 21 deletions(-)
> > -
> > -diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
> > -index d5fac37..9652a5e 100644
> > ---- a/src/plugins/lanplus/lanplus_crypt_impl.c
> > -+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
> > -@@ -164,11 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> > -                                                       uint8_t       * output,
> > -                                                       uint32_t        * bytes_written)
> > - {
> > --      EVP_CIPHER_CTX ctx;
> > --      EVP_CIPHER_CTX_init(&ctx);
> > --      EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
> > --      EVP_CIPHER_CTX_set_padding(&ctx, 0);
> > --
> > -+      EVP_CIPHER_CTX *ctx = NULL;
> > -
> > -       *bytes_written = 0;
> > -
> > -@@ -182,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> > -               printbuf(input, input_length, "encrypting this data");
> > -       }
> > -
> > -+      ctx = EVP_CIPHER_CTX_new();
> > -+      if (ctx == NULL) {
> > -+              lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
> > -+              return;
> > -+      }
> > -+      EVP_CIPHER_CTX_init(ctx);
> > -+      EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
> > -+      EVP_CIPHER_CTX_set_padding(ctx, 0);
> > -
> > -       /*
> > -        * The default implementation adds a whole block of padding if the input
> > -@@ -191,28 +195,28 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> > -       assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
> > -
> > -
> > --      if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
> > -+      if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
> > -       {
> > -               /* Error */
> > -               *bytes_written = 0;
> > --              return;
> > -       }
> > -       else
> > -       {
> > -               uint32_t tmplen;
> > -
> > --              if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
> > -+              if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
> > -               {
> > -+                      /* Error */
> > -                       *bytes_written = 0;
> > --                      return; /* Error */
> > -               }
> > -               else
> > -               {
> > -                       /* Success */
> > -                       *bytes_written += tmplen;
> > --                      EVP_CIPHER_CTX_cleanup(&ctx);
> > -               }
> > -       }
> > -+      /* performs cleanup and free */
> > -+      EVP_CIPHER_CTX_free(ctx);
> > - }
> > -
> > -
> > -@@ -239,11 +243,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> > -                                                       uint8_t       * output,
> > -                                                       uint32_t        * bytes_written)
> > - {
> > --      EVP_CIPHER_CTX ctx;
> > --      EVP_CIPHER_CTX_init(&ctx);
> > --      EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
> > --      EVP_CIPHER_CTX_set_padding(&ctx, 0);
> > --
> > -+      EVP_CIPHER_CTX *ctx = NULL;
> > -
> > -       if (verbose >= 5)
> > -       {
> > -@@ -252,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> > -               printbuf(input, input_length, "decrypting this data");
> > -       }
> > -
> > --
> > -       *bytes_written = 0;
> > -
> > -       if (input_length == 0)
> > -               return;
> > -
> > -+      ctx = EVP_CIPHER_CTX_new();
> > -+      if (ctx == NULL) {
> > -+              lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
> > -+              return;
> > -+      }
> > -+      EVP_CIPHER_CTX_init(ctx);
> > -+      EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
> > -+      EVP_CIPHER_CTX_set_padding(ctx, 0);
> > -+
> > -       /*
> > -        * The default implementation adds a whole block of padding if the input
> > -        * data is perfectly aligned.  We would like to keep that from happening.
> > -@@ -266,33 +274,33 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> > -       assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
> > -
> > -
> > --      if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
> > -+      if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
> > -       {
> > -               /* Error */
> > -               lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
> > -               *bytes_written = 0;
> > --              return;
> > -       }
> > -       else
> > -       {
> > -               uint32_t tmplen;
> > -
> > --              if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
> > -+              if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
> > -               {
> > -+                      /* Error */
> > -                       char buffer[1000];
> > -                       ERR_error_string(ERR_get_error(), buffer);
> > -                       lprintf(LOG_DEBUG, "the ERR error %s", buffer);
> > -                       lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
> > -                       *bytes_written = 0;
> > --                      return; /* Error */
> > -               }
> > -               else
> > -               {
> > -                       /* Success */
> > -                       *bytes_written += tmplen;
> > --                      EVP_CIPHER_CTX_cleanup(&ctx);
> > -               }
> > -       }
> > -+      /* performs cleanup and free */
> > -+      EVP_CIPHER_CTX_free(ctx);
> > -
> > -       if (verbose >= 5)
> > -       {
> > diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> > similarity index 80%
> > rename from meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
> > rename to meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> > index b7f1aa914..6d3ead14f 100644
> > --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
> > +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> > @@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) information, reading and \
> >  setting LAN configuration, and chassis power control. \
> >  "
> >
> > -HOMEPAGE = "http://ipmitool.sourceforge.net/"
> > +HOMEPAGE = "https://github.com/ipmitool/ipmitool"
> >  SECTION = "kernel/userland"
> >
> >  LICENSE = "BSD-3-Clause"
> > @@ -22,11 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
> >
> >  DEPENDS = "openssl readline ncurses"
> >
> > -SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
> > -           file://0001-Migrate-to-openssl-1.1.patch \
> > -           "
> > -SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
> > -SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
> > +SRC_URI = "git://github.com/ipmitool/ipmitool.git;protocol=https"
> > +SRCREV = "619a02cf5dc5b85a62730d82277fa8e78be396f5"
> > +
> > +# latest current tag from the project
> > +PV = "1.8.18+git${SRCPV}"
> >
> >  inherit autotools
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

