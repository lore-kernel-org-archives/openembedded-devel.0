Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NtFGj-0000Rc-IL
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 08:08:21 +0100
Received: by gxk24 with SMTP id 24so721196gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ccEIeJMOIVH4O7IK20mcf7+MscJfhh0eEhtFmmE2JqM=;
	b=GicdOhXm9hzmmbaTk0llvzTZElxjmkLiJGkcaLG9pHOo4yQszMhKfWrD5G+lfnildZ
	WUNYvllE6OGUzwHRFJEbpfmWvPM4z2W68gCSSCKeG2XbVzp4oU8TyTk2IJ4+kGeQJC/C
	kt/EqwuVSp+Msq8Pn9S7sPZhnJgnTn/bR1Pjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m6ovYo0O2WIoANYmnjVw+8e8q+IanYh/sMwiPgbYIq6NataW5b+k06XBzr9uv8u/Mg
	6uSfr2teKpuYYb6E2hmF9duH3pyUPxvtw+WViADRZvM7gODa/nyXKFCaUkEatjCM7Anf
	mN6PWm+G2+NBDk1gBn84thZ5eqOZN6cKGg2ZQ=
MIME-Version: 1.0
Received: by 10.101.121.19 with SMTP id y19mr4708770anm.103.1269155107743; 
	Sun, 21 Mar 2010 00:05:07 -0700 (PDT)
In-Reply-To: <1268769038-30979-1-git-send-email-khimov@altell.ru>
References: <1239889359-13953-1-git-send-email-khimov@altell.ru>
	<1268769038-30979-1-git-send-email-khimov@altell.ru>
Date: Sun, 21 Mar 2010 00:05:07 -0700
Message-ID: <19c1b8a91003210005s6f723122x8a4199ded40f4749@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Sun, 21 Mar 2010 07:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2010 at 12:50 PM, Roman I Khimov <khimov@altell.ru> wrote:
> By default cmake guesses whether install shared libaries with exec
> permissions or not based on host distribution, so this behaviour
> changes from host to host. OpenEmbedded assumes shared libraries to
> be with exec permissions (reverse way brakes stripping, for example),
> so let's force this in cmake configure invocation.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0classes/cmake.bbclass | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
> index f21c4d6..706bdda 100644
> --- a/classes/cmake.bbclass
> +++ b/classes/cmake.bbclass
> @@ -21,6 +21,7 @@ cmake_do_configure() {
> =A0 cmake ${OECMAKE_SOURCEPATH} \
> =A0 =A0 -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
> =A0 =A0 -DCMAKE_FIND_ROOT_PATH:PATH=3D${STAGING_DIR_HOST} \
> + =A0 =A0-DCMAKE_INSTALL_SO_NO_EXE=3D0 \
> =A0 =A0 ${EXTRA_OECMAKE} \
> =A0 =A0 -Wno-dev
> =A0}
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


