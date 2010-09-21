Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oxtx7-0007ud-8P
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 05:55:35 +0200
Received: by iwn2 with SMTP id 2so4915649iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 20:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=tMzmd5KHZ/LLahfN7+QUxFsZ5re48o48QxJ2RLmkQRs=;
	b=Q3BvqIQQmLPiWZRy52SlFsP0I/4xcqYyX7ViwEsVL6/CTwmjmyYaGec5fCJ+4W6J7r
	ew2gOFzR8VkYBs7cFQqPXwXR19uBdFh4JbMgC1WljRABJaLa8f+gwq4wwRew7k9ZGE+0
	UIBxBgYiY6+hOCzl9MNLmQvhMuM1bE9VZkcfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=aDavBFA+LXxHrw60GhMO924zKF6xPL5Q/q8BG1CJ37efUXEe9m1CGwGoQKMoNNS3tL
	RdcjZ//2/MDZZI2D48eqHJl/8zAVwEMVNMMU6qohe9lX1h7bs6yN9Oqc6S4Gnsjvu0Hz
	ZL41tSScF5DUosPxIgnGuZHPjGV4BkmgNQyFU=
Received: by 10.231.183.81 with SMTP id cf17mr11234317ibb.32.1285041329146;
	Mon, 20 Sep 2010 20:55:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Mon, 20 Sep 2010 20:55:09 -0700 (PDT)
In-Reply-To: <1285023488-32159-1-git-send-email-eric@eukrea.com>
References: <1285023488-32159-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 20:55:09 -0700
Message-ID: <AANLkTi=n74DctD=3vbfYY3-xz6MWQA62oKNXOA3Zjoar@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] utils.bbclass: fix is_machine_specific
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
X-List-Received-Date: Tue, 21 Sep 2010 03:55:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 3:58 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> * base.bbclass can set a package's PACKAGE_ARCH to MACHINE_ARCH if
> it finds file:// in the SRC_URI and the corresponding file is machine
> specific (recipes/foo/foo-1.0/<some machine>/)
> * but is_machine_specific actually fails to detect these files as
> urldata.path is used instead of urldata.localpath thus preventing the
> comparison of the file's path with machinepaths
> * tested with bitbake HEAD & 1.8.18, with OE's tree alone and OE's tree
> plus an overlay.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/utils.bbclass | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
> index 0a7a045..1c636be 100644
> --- a/classes/utils.bbclass
> +++ b/classes/utils.bbclass
> @@ -54,7 +54,7 @@ def is_machine_specific(d):
> =C2=A0 =C2=A0 urldatadict =3D bb.fetch.init(d.getVar("SRC_URI", True).spl=
it(), d, True)
> =C2=A0 =C2=A0 for urldata in (urldata for urldata in urldatadict.itervalu=
es()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
urldata.type =3D=3D "file"):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if any(urldata.path.startswith(mp + "/") for=
 mp in machinepaths):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if any(urldata.localpath.startswith(mp + "/"=
) for mp in machinepaths):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True
>
> =C2=A0def subprocess_setup():
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


