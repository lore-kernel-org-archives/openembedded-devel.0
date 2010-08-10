Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OijgU-0005jG-Sp
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 09:55:55 +0200
Received: by fxm6 with SMTP id 6so507939fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vHR2/LdJTPXvs//w0e36GxkosYj0TED2Zf2xlDdH+4A=;
	b=Hk5wFrmW4ydposMUXpRoZoECNelZHNukcgtQ1wBtVzV1214DBN0np3GjNidVmccsuJ
	dNLC+2qAwXpasi10vcPlPV0/Pcjeuzfmd+VhytEYWtHCA3z1vnLIRZOaGhSiIsZPB6df
	ByUsteAxxHebeCOu51zx00kgthfi4O059d9Mg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JH+BueGEMKyWpr6JtMYdoXEm2y5TjSjQxEq27eR8jE9mQ1S1Kgk69dvpLqUD7phwwS
	6DwEuDwwQU2VP10mCwHBKjidnYVO9mLXIdXwBNAQtqAdCFzbTHzK8YaA9TrvxrsGXWpt
	gfD1lgZcfU7rvor2uGWoqqobgFlD0XOr8X9OI=
MIME-Version: 1.0
Received: by 10.223.123.79 with SMTP id o15mr17675153far.12.1281426927105; 
	Tue, 10 Aug 2010 00:55:27 -0700 (PDT)
Received: by 10.223.164.79 with HTTP; Tue, 10 Aug 2010 00:55:27 -0700 (PDT)
In-Reply-To: <AANLkTi=Umaro-+_MQCjro6S6HrFfp_rek1aXmimYx0=y@mail.gmail.com>
References: <1280492963-30578-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTi=Umaro-+_MQCjro6S6HrFfp_rek1aXmimYx0=y@mail.gmail.com>
Date: Tue, 10 Aug 2010 09:55:27 +0200
Message-ID: <AANLkTinU7yQUdEJa0PrWr-TkZsLAbnWKBvkeurs+JDYL@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses: added 5.7 recipe
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
X-List-Received-Date: Tue, 10 Aug 2010 07:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 7:49 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Fri, Jul 30, 2010 at 2:29 PM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>> It uses ideas from the old 5.4 recipe but brings a lot of new features
>> like widec libs, pkgconfig files or splitted library packages.
>>
>> As lot of packages depend on ncurses, whole distribution must be
>> probably rebuild when updating to this new version.
>>
>> Due to this and the complex recipe, it has a negative DEFAULT_PREFERENCE
>> for now.
>
> Hi,
>
> Only breakage I noticed sofar is in pidgin when pidgin-2.6.6 checks
> for wide char support:
> configure:16212: checking if
> /OE/tmpdir-dev-shr/sysroots/armv4t-oe-linux-gnueabi/usr/include/ncurses.h
> supports wide characters
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 #ifndef get_wch
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 # error get_wch not found!
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 #endif
>
> and then it decides not to build finch (and later do_package fails).
>
> is it about ENABLE_WIDEC, or something else?
>
> Thanks!

The problem seems to be in ncurses's do_install where you first install
widec if enabled and then always narrowc, which overwrittes curses.h.

With this change I was able to build pidgin with finch without
problem, but no idea if it's right way to fix it.


diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.b=
b
index 3562685..725cf7b 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -90,12 +90,12 @@ _install_opts =3D "\
 "

 do_install() {
-        ! ${ENABLE_WIDEC} || \
-            oe_runmake -C widec ${_install_opts}
-
         oe_runmake -C narrowc ${_install_opts} \
                install.data install.progs

+        ! ${ENABLE_WIDEC} || \
+            oe_runmake -C widec ${_install_opts}
+

         cd narrowc

Regards,


