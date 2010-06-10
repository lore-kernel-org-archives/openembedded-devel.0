Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMlKJ-0000FW-Ax
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 19:14:00 +0200
Received: by gwaa12 with SMTP id a12so126339gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1NW6IQ5k2Qmscb0tISpcZdXizqTqy+6YTkigUUW9dGY=;
	b=D6hz8jtiSBLVKtMdySfU0ENIroPKChEg2o4TZjVVgL/X9+U+8pzgxvXWfLit9m16Tr
	Dyj7UpPlFxLXHaUuNLxjFhJrKE0HuqjlJPlFpRCrzXACmtKf5ha4ZRf6sVgGe+0YrKt9
	QuHBa1RWtdhKXBxWHODLFm8XCqba6Mh+zaDik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tM4bJEtAjCL+a8SsTrfEtq/5VlpMeZ3nrHr3uImcL4iavZ3CmJSn+e2eWl8zWjkSOs
	t5s7q1kC1IUNI1AEIrBZMY0DM9Kzd9QD+sLJmULvCOjqdEf00XCkvvrdHVHjimsgi1BE
	g9CfoN2mpuSMiETJ/r3kSMzL4SmHUpz1uCqkI=
Received: by 10.151.72.5 with SMTP id z5mr1658321ybk.235.1276189284088; Thu, 
	10 Jun 2010 10:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Thu, 10 Jun 2010 10:01:03 -0700 (PDT)
In-Reply-To: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
References: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jun 2010 10:01:03 -0700
Message-ID: <AANLkTinfdN6E8kvYcTFFI2hl1omm_z6s02jP0inuiqve@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib/oe/patch.py: Dont import patches but symlink them instead
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
X-List-Received-Date: Thu, 10 Jun 2010 17:14:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2010 at 5:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * This patch removes the usage of quilt import <patch>
> =A0instead it creasted a symlink to the patch in the patches
> =A0directory and synthesizes the series file which otherwise
> =A0would be done automatically by quilt import.
>
> * This should help a bit in reducing build time as it avoids
> =A0copying of the patch and also other things that quilt import
> =A0would otherwise do.
>
> * Tested by doing minimal-image on qemuarm.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0lib/oe/patch.py | =A0 13 ++++---------
> =A01 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/lib/oe/patch.py b/lib/oe/patch.py
> index 7f6b0fe..607ad44 100644
> --- a/lib/oe/patch.py
> +++ b/lib/oe/patch.py
> @@ -230,15 +230,10 @@ class QuiltTree(PatchSet):
> =A0 =A0 =A0 =A0 if not self.initialized:
> =A0 =A0 =A0 =A0 =A0 =A0 self.InitFromDir()
> =A0 =A0 =A0 =A0 PatchSet.Import(self, patch, force)
> -
> - =A0 =A0 =A0 =A0args =3D ["import", "-p", patch["strippath"]]
> - =A0 =A0 =A0 =A0if force:
> - =A0 =A0 =A0 =A0 =A0 =A0args.append("-f")
> - =A0 =A0 =A0 =A0 =A0 =A0args.append("-dn")
> - =A0 =A0 =A0 =A0args.append(patch["file"])
> -
> - =A0 =A0 =A0 =A0self._runcmd(args)
> -
> + =A0 =A0 =A0 =A0os.symlink(patch["file"], self._quiltpatchpath(patch["fi=
le"]))
> + =A0 =A0 =A0 =A0f =3D open(os.path.join(self.dir, "patches","series"), "=
a");
> + =A0 =A0 =A0 =A0f.write(os.path.basename(patch["file"]) + " -p" + patch[=
"strippath"]+"\n")
> + =A0 =A0 =A0 =A0f.close()
> =A0 =A0 =A0 =A0 patch["quiltfile"] =3D self._quiltpatchpath(patch["file"]=
)
> =A0 =A0 =A0 =A0 patch["quiltfilemd5"] =3D bb.utils.md5_file(patch["quiltf=
ile"])
>
> --
> 1.7.0.4
>
>

a native-sdk-image build fine too and saved me 5mins :)


