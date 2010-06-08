Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLzVk-0006pL-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:10:44 +0200
Received: by yxf34 with SMTP id 34so51023yxf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=chSGt7GvUwv+pioWOAvUztsJV6YPmHZ6UdlhP9YVGlo=;
	b=kzUAeBzmxvW7aRXaFoG1w3BckNhxgjbpDW5OeVW+5iZ+G3nn+jzHqJe/FHsPReo/it
	k/B+WwhaW69JgPiJn/i+xF9lIpg2Y++6YHHbiPYa82hTrAb7c3MR2GmOCruR4j3p2hcx
	VzrkY9vX5kWkhUS8oEg9gciPW06TOnDWJt3oQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=K7uuigi/g044qJxs8HpVxNr4JQPqk04P0nw9g+v6hQzV4aidb0wpsJJ4jIiU3V2HSj
	FajK/YfjQrwELEZPBuQpBGV2mYIYf051I0gE9ReDtqfGy3LePh+UUdDQd1U1WN0Eh9y+
	mQ2iqn03qRj9M90lhXKqGKcAkJfQxQSD4ObAc=
Received: by 10.101.172.6 with SMTP id z6mr17094199ano.252.1276005974303; Tue, 
	08 Jun 2010 07:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 07:05:54 -0700 (PDT)
In-Reply-To: <1275980325-23187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1275980325-23187-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 07:05:54 -0700
Message-ID: <AANLkTimU9nYPUYhdhaN_14YnXoADHQsnHnRfMwMVnn9P@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] debian.bbclass: call objdump from binutils-cross
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
X-List-Received-Date: Tue, 08 Jun 2010 14:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 7, 2010 at 11:58 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * host objdump can support multiple targets and instead of output it show=
s list of targets to choose from
> =A0see http://thread.gmane.org/gmane.comp.handhelds.openembedded/33294/fo=
cus=3D33357
> * for some reason cross/bin doesn't seem to be in PATH, that's why there
> =A0is full path
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0classes/debian.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/debian.bbclass b/classes/debian.bbclass
> index 8f6e7d8..d41c922 100644
> --- a/classes/debian.bbclass
> +++ b/classes/debian.bbclass
> @@ -54,7 +54,7 @@ python debian_package_name_hook () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for f in f=
iles:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if so_re.match(f):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0fp =3D os.path.join(root, f)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 cmd =3D (bb.data.getVar('BUILD_PREFIX', d, 1) or "") +=
 "objdump -p " + fp + " 2>/dev/null"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 cmd =3D bb.data.getVar('CROSS_DIR', d, 1) + "/" + bb.d=
ata.getVar('bindir_cross', d, 1) + "/" + bb.data.getVar('TARGET_PREFIX', d,=
 1) + "objdump -p " + fp + " 2>/dev/null"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0fd =3D os.popen(cmd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0lines =3D fd.readlines()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0fd.close()
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


