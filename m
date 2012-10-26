Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TRh47-0002EI-HU
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 12:22:59 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so1617839lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vfuqFCHYNAbOX1wPuYhx8i718vurEzDXDztkJ+Bj2+Y=;
	b=VJuuKWA55V7qGUREa6GBR2mfxEEd5VJ9NQRlWMPxdzVKiT2GlzXdBVtb46jSS8eRe4
	9x/LzBpywiXbio59JY61ZZMFcOD2l+BGRo1wc8nWpnxtRnPDfAZTrMKC+456oupmy8xc
	gKprAVEWtj3Wy6FuG38pIwKDWAwZh99g7l/O+GVmlvGpEt3JitdcwVcw+IcZeizRy1xm
	kyZkS3XrE34ovuKM8+cbhPc8LC/CMKBFRcnp7xO6XPv7I//erj46NpWkCbO3yiRMT4Aq
	c17fU5QafYB1l6ZzGG0wOfGphakhK2/NlTwAFqEeOqLyluhWmHVKAkeWw4eTjS1rR5OI
	sVEQ==
MIME-Version: 1.0
Received: by 10.152.110.229 with SMTP id id5mr20067524lab.36.1351246169493;
	Fri, 26 Oct 2012 03:09:29 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Fri, 26 Oct 2012 03:09:29 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Fri, 26 Oct 2012 03:09:29 -0700 (PDT)
In-Reply-To: <1351159751-21366-1-git-send-email-Martin.Jansa@gmail.com>
References: <20121025094931.GM3269@jama.jama.net>
	<1351159751-21366-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 26 Oct 2012 15:39:29 +0530
Message-ID: <CAMQ5J2Y1kYwTA+FEEGM01dZ8GUY4O-r8et5x-9gbjD98_+_ZpA@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe]PATCH] samba: update documentation2.patch and waf-as-source.patch to apply
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
X-List-Received-Date: Fri, 26 Oct 2012 10:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-9
Content-Transfer-Encoding: quoted-printable

My mails are rejected by admin. Why this happens? I am stuck
On Oct 25, 2012 3:39 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> * fails here because of non-ASCII characters:
>   ERROR: Command Error: exit status: 1  Output:
>   Applying patch documentation2.patch
>   ...
>   patching file swat/lang/tr/help/welcome.html
>   Hunk #1 FAILED at 40.
>   Hunk #2 succeeded at 66 with fuzz 2.
>   1 out of 2 hunks FAILED -- rejects in file swat/lang/tr/help/welcome.ht=
ml
>   Patch documentation2.patch does not apply (enforce with -f)
>
> * and Applying patch waf-as-source.patch
>   ...
>   File buildtools/bin/waf-svn is not empty after patch; not deleting
>   ...
>   Patch waf-as-source.patch does not apply (enforce with -f)
>   I've dropped this chunk and now it builds
>
> * there is also WARNING about unpackaged but empty base_sbindir
>   WARNING: QA Issue: samba: Files/directories were installed but not
>   shipped
>     /sbin
>   created by do_install in samba.inc but used only when cifs is built,
>   maybe we should remove it from samba.inc now
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../samba/samba-3.6.8/documentation2.patch                     | 10
> +++++-----
>  .../recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch |  4 ----
>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb              |  2 ++
>  3 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git
> a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
> b/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
> index 88e98f1..902e8e2 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
> +++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
> @@ -300,15 +300,15 @@ Index: samba/swat/lang/tr/help/welcome.html
>  @@ -40,7 +40,6 @@
>      <ul>
>       <li><a href=3D"/swat/help/smbstatus.1.html"
> target=3D"docs">smbstatus</a> - Samba g=F6zlemcisi
> -     <li><a href=3D"/swat/help/testparm.1.html" target=3D"docs">testparm=
</a>
> - ayar dosyas?n? kontrol eder
> --    <li><a href=3D"/swat/help/testprns.1.html" target=3D"docs">testprns=
</a>
> - yaz?c? ayarlar?n? kontrol eder
> -     <li><a href=3D"/swat/help/nmblookup.1.html"
> target=3D"docs">nmblookup</a> - NetBIOS isim sorgulama arac?
> +     <li><a href=3D"/swat/help/testparm.1.html" target=3D"docs">testparm=
</a>
> - ayar dosyas=FDn=FD kontrol eder
> +-    <li><a href=3D"/swat/help/testprns.1.html" target=3D"docs">testprns=
</a>
> - yaz=FDc=FD ayarlar=FDn=FD kontrol eder
> +     <li><a href=3D"/swat/help/nmblookup.1.html"
> target=3D"docs">nmblookup</a> - NetBIOS isim sorgulama arac=FD
>      </ul>
>    <li><b>Kitaplar</b>
>  @@ -66,4 +65,4 @@
>
> -  E?er SWAT'?n bu s=FCr=FCm=FC ile ilgili konular? tart??mak istiyorsan?=
z,
> l=FCtfen
> +  E=F0er SWAT'=FDn bu s=FCr=FCm=FC ile ilgili konular=FD tart=FD=FEmak i=
stiyorsan=FDz,
> l=FCtfen
>   <A HREF=3D"http://lists.samba.org/">samba</A> eposta listesine =FCye ol=
un.
>  -
>  \ No newline at end of file
> -+
> ++
> diff --git
> a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
> b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
> index 3ba7d23..985ed5a 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
> +++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
> @@ -44,10 +44,6 @@ index 9ef8a1f..0000000
>  -You can get a svn copy of the upstream source with:
>  -
>  -  svn checkout http://waf.googlecode.com/svn/trunk/ waf-read-only
> -diff --git a/buildtools/bin/waf-svn b/buildtools/bin/waf-svn
> -deleted file mode 100755
> -index 6d54d5f..0000000
> -Binary files a/buildtools/bin/waf-svn and /dev/null differ
>  diff --git a/buildtools/update-waf.sh b/buildtools/update-waf.sh
>  new file mode 100755
>  index 0000000..bb3a4bf
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bbb/meta-oe/r=
ecipes-connectivity/samba/
> samba_3.6.8.bb
> index 61fa4b3..cc09a48 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -3,6 +3,8 @@ require samba-basic.inc
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>
> +PR =3D "r1"
> +
>  SRC_URI +=3D "\
>      file://config-h.patch \
>      file://documentation.patch;patchdir=3D.. \
> --
> 1.7.12.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

