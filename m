Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oshjb-00028i-QD
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 21:52:17 +0200
Received: by wye20 with SMTP id 20so5064542wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=TlTUmES9sIdWkuj7IZFvXYLQTWvFHHi3jeoLD2jRorE=;
	b=oSi0ii+dQqTXGoWh8iSWNCmJJTQ42dKvMhDuaAwQaYQEJkVGU4WCdISsBT52+/mf+n
	J5HzvMWzwL3eGMfIFONrT9yVVAYftGsBjTAnHEONnR5tI5MHRyn5o99Qk9z78THDCwTQ
	XwPh1C5vxW4n2kmPVzePRN61yDqkSWLE/E9YY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=b9Ht0rDo0vTOIg6Ll+LlIDlloflFaJ59ww2mqxVad5ZAWWDwCUfWu1d72jE+0bD/OJ
	yn7h4HL8S7uTtMwZElem5WfFctEff7hd7bDtJUKQSzU4IHDtKMYoY1DXMNlC1ctXCzse
	aLKCRD25BQGv36gnXNrCAbP3B1ylSJLDR58rk=
Received: by 10.216.67.6 with SMTP id i6mr940881wed.44.1283802687538; Mon, 06
	Sep 2010 12:51:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Mon, 6 Sep 2010 12:50:59 -0700 (PDT)
In-Reply-To: <1283798935-4819-1-git-send-email-eric@eukrea.com>
References: <1283798935-4819-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 6 Sep 2010 12:50:59 -0700
X-Google-Sender-Auth: qlpkYcj_WAKdEvZLZckG_ofy5aE
Message-ID: <AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] lib/oe/unpack.py: fix uncompressing .gz .bz2 or .xz
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
X-List-Received-Date: Mon, 06 Sep 2010 19:52:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 11:48 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> * Actually, the destination file has the full path (ie it's uncompressed
> in the download directory) as only the extension is removed.
> * By also removing the path, this patch should fix this problem.
> * An other fix could be to no uncompress to stdout but let gunzip|bunzip2=
|
> xz uncompress directly to the file.
>

Thanks for looking into this.  I appreciate your putting together a fix.
See code comments below.

Please improve the wording of the commit message here.  "has the full path"
is unclear.  I'd suggest referring to the fact that it's currently writing
into the *source* path rather than the *destination* path, to clarify a bit=
.

    elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z')=
:
>         base, ext =3D os.path.splitext(file)
> +        ext, base =3D os.path.split(base)
>

This variable naming is wrong and misleading.  The leading portion of the
split is not an extension, so 'ext' is not correct.  Also, you just throw
away the leading portion anyway, so there's no need to use os.path.split at
all.  Instead, I'd suggest changing this:

    base, ext =3D os.path.splitext(file)
    cmd =3D 'bzip2 -dc %s > %s' % (file, base)

to this:

    root, ext =3D os.path.splitext(file)
    cmd =3D 'bzip2 -dc %s > %s' % (file, os.path.basename(root))

Thanks again,
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

