Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OrF9G-0000Pm-Aq
	for Openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 21:08:36 +0200
Received: by iwn2 with SMTP id 2so724976iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1x/oVfYQg1XwJCYyr7hJABiizGW6xRRTct4x6K9/BHo=;
	b=J5Cz4QwzkJPUs8+AsUp/XyS7Rs5Gx9Siur43W2H3n+QvSTwZQjL86D96N1fMJKYGiw
	91eBPblClSqiHAULXpskDjwUGl3museAHaUuqiiOA8TKiSh//4NN/BVtQkhTnwPpURxx
	4lA7KlI0MF/fFdVCkjZMesL/rz0L2CwSBl2EU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gvNitKv3xQlBGWUPUsmzzo5enROAZxyasJhCxyIkZm8dXKT4bIDUTPwJbEvzS8WYEN
	zoJpcLhRRMYi9+SwlIhczu1EPVckEzrfahczx72Z3OJBfQo+E6xKi11u6YEV2Kdgv0rF
	6R/x2DR1cj4S5iJx4J3n4IzXhA5Qy4QIFkifI=
Received: by 10.231.152.78 with SMTP id f14mr11537226ibw.60.1283454149313;
	Thu, 02 Sep 2010 12:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 2 Sep 2010 12:02:09 -0700 (PDT)
In-Reply-To: <AANLkTik8+=mYOhnbv=R=-LJN81eHhTJd5Nh-dOdoEy0K@mail.gmail.com>
References: <AANLkTik8+=mYOhnbv=R=-LJN81eHhTJd5Nh-dOdoEy0K@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Sep 2010 12:02:09 -0700
Message-ID: <AANLkTimU=mBgj01ydp+gfRELsZyPftqJm_o8Vv4Vu8Vh@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: build errors bitbaking gnumail_1.1.2.bb
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
X-List-Received-Date: Thu, 02 Sep 2010 19:08:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2010 at 11:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> When I bitbake above recipe for qemuarm/minimal it ends up with this erro=
r
>
> | checking for a BSD-compatible install...
> /scratch/oe/sysroots/x86_64-linux/usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-oe-linux-gnueabi-strip... arm-oe-linux-gnueabi-strip
> | checking for a thread-safe mkdir -p...
> /scratch/oe/sysroots/x86_64-linux/usr/bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking if /scratch/oe/sysroots/x86_64-linux/usr/bin/javac works... ye=
s
> | checking for fastjar... fastjar
> | checking for /scratch/oe/sysroots/java/activation.jar... yes
> | checking for /scratch/oe/sysroots/java/inetlib.jar... configure:
> error: can't find inetlib.jar in specified path
>
>

something like below fixes it

diff --git a/recipes/classpathx/gnumail_1.1.2.bb
b/recipes/classpathx/gnumail_1.1.2.bb
index 3eab0f6..f4a8f87 100644
--- a/recipes/classpathx/gnumail_1.1.2.bb
+++ b/recipes/classpathx/gnumail_1.1.2.bb
@@ -23,7 +23,7 @@ export JAVA =3D "${STAGING_BINDIR_NATIVE}/java"
 export JAVADOC =3D "true"

 EXTRA_OECONF =3D "\
-  --with-inetlib-jar=3D${STAGING_DATADIR_JAVA} \
+  --with-inetlib-jar=3D${STAGING_DIR_TARGET}${datadir_java} \
   --with-activation-jar=3D${STAGING_DATADIR_JAVA} \
   "

> This jar file is actually staged in
>
> ./x86_64-linux/usr/share/java/inetlib.jar
> ./armv5te-oe-linux-gnueabi/usr/share/java/inetlib.jar
>
>
> for native and target in my sysroot but then I looked into
> /scratch/oe/sysroots/java/
> and indeed it has some .jar there but not the one its looking for and
> recipe specifically
> asks to look into this location via
>
> =A0EXTRA_OECONF =3D "\
> =A0--with-inetlib-jar=3D${STAGING_DATADIR_JAVA} \
> =A0--with-activation-jar=3D${STAGING_DATADIR_JAVA} \
> =A0"
>
>
> As Andy also found out that
>
> we have
>
> native.bbclass:
> STAGING_DIR_JAVA =3D "${STAGING_DATADIR_JAVA_NATIVE}"
>
> java.bbclass:
> STAGING_DATADIR_JAVA ?=3D ${STAGING_DIR_JAVA}
> STAGING_DATADIR_JAVA_NATIVE ?=3D ${STAGING_DATADIR_NATIVE}/java
>
> Who sets what here ?
>
> Thanks for your help
>
> -Khem
>


