Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4E20C7316F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 10:59:01 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l126so15710145wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=wY7eK9mPQjoAldXBwrD17ET3OjJYbGvulLjE0l1tju4=;
	b=UOZwni19cjGjmYUpr6fOaxmHU9vGneR3+J8DTw+PoEqZF/oJUV/PhCAkrz/arrrjXo
	UGnHBtxbgn0e5oqGeSTQUPii90JCqc73kAkSmJuffgoyEUNc3pW9lz57haIb9m5FUnQb
	3qENueykSbPKhB5R62bENzp+MJbsLg0rTjOpaBF5crf0Nl4vlgRuR4OlrzX7kUapGbbt
	M4K29c8kUsYMRTAMb4M/89Lc94FRvnAiadncqDJmxAgYlmVuB55JxNL7ocmbjW0N/U7b
	f0fb+Jtqz9sJUr+qHwhSZFNpUkEh9XtUzUq6p9sWMchsdDvBFsViiMrflNNXw881//gf
	SdLA==
X-Received: by 10.194.188.49 with SMTP id fx17mr61138129wjc.47.1450349942164; 
	Thu, 17 Dec 2015 02:59:02 -0800 (PST)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.27.145.135 with HTTP; Thu, 17 Dec 2015 02:58:22 -0800 (PST)
In-Reply-To: <CAJTo0Lb2powZHsuzJnqeYwKddYJfOaLpOiurW3RmFELu3LoC7A@mail.gmail.com>
References: <1450270689-9022-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0Lb2powZHsuzJnqeYwKddYJfOaLpOiurW3RmFELu3LoC7A@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Thu, 17 Dec 2015 11:58:22 +0100
X-Google-Sender-Auth: G9W5B53B4CyyZ996OgUUEThpbpA
Message-ID: <CAGXeWgn_eAUR-QNVZu2ovQ8S20goDbRsk=PYFP=Hq=aJaauZ9g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [fido][PATCH v2] Fix build issue on openssl 1.0.2d on Fido branch. OpenSSL's URIs of old releases have changed to /source/old/<x.y.z> instead of /source.
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
X-List-Received-Date: Thu, 17 Dec 2015 10:59:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross,

I have changed the URI into the bb files instead the inc, because the path
has only changed for old openssl revision and because this change can
affect people using this their own openssl's recipe or a recipe of latest
openssl revision.

I will submit the patch to openembedded-core mailing list instead this list.

Best regards,
Thomas P.
On Wed, Dec 16, 2015 at 4:29 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 December 2015 at 12:58, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>
> > -SRC_URI += "file://configure-targets.patch \
> > -            file://shared-libs.patch \
> > -            file://oe-ldflags.patch \
> > -            file://engines-install-in-libdir-ssl.patch \
> > -            file://debian1.0.2/block_diginotar.patch \
> > -            file://debian1.0.2/block_digicert_malaysia.patch \
> > -            file://debian/ca.patch \
> > -            file://debian/c_rehash-compat.patch \
> > -            file://debian/debian-targets.patch \
> > -            file://debian/man-dir.patch \
> > -            file://debian/man-section.patch \
> > -            file://debian/no-rpath.patch \
> > -            file://debian/no-symbolic.patch \
> > -            file://debian/pic.patch \
> > -            file://debian/version-script.patch \
> > -            file://openssl_fix_for_x32.patch \
> > -            file://fix-cipher-des-ede3-cfb1.patch \
> > -
> > file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> \
> > -            file://find.pl \
> > -            file://openssl-fix-des.pod-error.patch \
> > -            file://Makefiles-ptest.patch \
> > -            file://ptest-deps.patch \
> > -            file://run-ptest \
> > -            file://crypto_use_bigint_in_x86-64_perl.patch \
> > -           "
> > +SRC_URI = "http://www.openssl.org/source/old/1.0.2/openssl-${PV}.tar.gz
> \
> > +           file://configure-targets.patch \
> > +           file://shared-libs.patch \
> > +           file://oe-ldflags.patch \
> > +           file://engines-install-in-libdir-ssl.patch \
> > +           file://debian1.0.2/block_diginotar.patch \
> > +           file://debian1.0.2/block_digicert_malaysia.patch \
> > +           file://debian/ca.patch \
> > +           file://debian/c_rehash-compat.patch \
> > +           file://debian/debian-targets.patch \
> > +           file://debian/man-dir.patch \
> > +           file://debian/man-section.patch \
> > +           file://debian/no-rpath.patch \
> > +           file://debian/no-symbolic.patch \
> > +           file://debian/pic.patch \
> > +           file://debian/version-script.patch \
> > +           file://openssl_fix_for_x32.patch \
> > +           file://fix-cipher-des-ede3-cfb1.patch \
> > +
> >
> file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
> > +           file://find.pl \
> > +           file://openssl-fix-des.pod-error.patch \
> > +           file://Makefiles-ptest.patch \
> > +           file://ptest-deps.patch \
> > +           file://run-ptest \
> > +           file://crypto_use_bigint_in_x86-64_perl.patch \
> > +          "
> >
>
> This was sent to the wrong mailing list (openembedded-core@, please), the
> commit log is incorrectly formatted (we use standard git style with a
> recipe prefix), and it's probably best just to edit the SRC_URI entry in
> openssl.inc instead of overwriting it from the .bb.
>
> (insert standard moan about pointless bb/inc splits here)
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

