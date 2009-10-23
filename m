Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N1QEn-0002Gj-Tt
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:55:53 +0200
Received: by qyk8 with SMTP id 8so7510181qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zy0W40xVX9OWJ9jG6MSVPE8GnYHryVSSkCOfGCA9FtI=;
	b=r2EmVHgfMIOhl3mLNQnKmE4sRvFfR6az7RTXc7goDatnSjGJS01uAaAqTjWCcMcEAY
	sd2kPzgOd/YCs7VVW/0nGdIfEatSRejRo7gx1br1qjS7ygPacJK9b52imopnVFvw9dz/
	oAtdCA/sAC5k7d0mCvV+crh9md5LjXYZOJhLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jW9I2VbfwzXpVXFu4PWjo4lfLEmpB3lzo0XZq5py8tfGJdqQ5X4lgeKWg4wQaidQVg
	Fj+GTGOj6aofh7PYwvXxnmrgUSa47QZReRc4OgjBFb8HxvL6OkPrTznzK0g2n/wkz8c8
	Pis8GeYYaHdvPEib27/RzBtk3rR6nbaceyqLw=
MIME-Version: 1.0
Received: by 10.229.33.15 with SMTP id f15mr1336183qcd.59.1256327199895; Fri, 
	23 Oct 2009 12:46:39 -0700 (PDT)
In-Reply-To: <1256325202-8516-1-git-send-email-msmith@cbnco.com>
References: <1256325202-8516-1-git-send-email-msmith@cbnco.com>
Date: Fri, 23 Oct 2009 12:46:39 -0700
Message-ID: <19c1b8a90910231246o62a51ea3g21db2c6fd13a5266@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] curl, curl-native: add 7.19.6
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
X-List-Received-Date: Fri, 23 Oct 2009 19:55:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2009 at 12:13 PM, Michael Smith <msmith@cbnco.com> wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>
> format-patch doesn't recognize the copies with 1-line changes, so:
>
> curl-native 7.18.2 and 7.19.6 recipes are identical other than PR.

Looks ok. You could also make it use INC_PR when you are at it.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> curl 7.19.5 and 7.19.6 recipes are identical except .6 no longer needs
> curl-add_all_algorithms.patch.
>
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 =C2=A04 ++++
> =C2=A0recipes/curl/curl-native_7.19.6.bb | =C2=A0 11 +++++++++++
> =C2=A0recipes/curl/curl_7.19.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A04 ++++
> =C2=A03 files changed, 19 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/curl/curl-native_7.19.6.bb
> =C2=A0create mode 100644 recipes/curl/curl_7.19.6.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index f91cd4e..14dfd57 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -4606,6 +4606,10 @@ sha256=3Da0e28b019f022942650ffa4bdf46e4c09bd8ec18e=
6ca5f08ad273668115f51f7
> =C2=A0md5=3D426d161661dce70c8ea9ad8f553363a3
> =C2=A0sha256=3D05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7=
b02cd0
>
> +[http://curl.haxx.se/download/curl-7.19.6.tar.bz2]
> +md5=3D8402c1f654c51ad7287aad57c3aa79be
> +sha256=3Dea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc102=
1
> +
> =C2=A0[http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
> =C2=A0md5=3Db452123f755114cd4461d56c648d9f12
> =C2=A0sha256=3D4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b=
3c6958
> diff --git a/recipes/curl/curl-native_7.19.6.bb b/recipes/curl/curl-nativ=
e_7.19.6.bb
> new file mode 100644
> index 0000000..2f49ad1
> --- /dev/null
> +++ b/recipes/curl/curl-native_7.19.6.bb
> @@ -0,0 +1,11 @@
> +require curl-common.inc
> +inherit native
> +DEPENDS =3D "zlib-native"
> +
> +do_stage () {
> + =C2=A0 =C2=A0 =C2=A0 autotools_stage_all
> +}
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> diff --git a/recipes/curl/curl_7.19.6.bb b/recipes/curl/curl_7.19.6.bb
> new file mode 100644
> index 0000000..d5ca1bb
> --- /dev/null
> +++ b/recipes/curl/curl_7.19.6.bb
> @@ -0,0 +1,4 @@
> +require curl-common.inc
> +require curl-target.inc
> +
> +SRC_URI +=3D "file://off_t_abi_fix.patch;patch=3D1;pnum=3D0"
> --
> 1.6.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


