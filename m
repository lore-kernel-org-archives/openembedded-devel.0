Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQ0Uz-0006M2-SM
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Oct 2012 20:43:46 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so1499991iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2012 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=R07F5K9dKlWH2gWZplYZtkDvtm3FhT4w9OE5J+0TicA=;
	b=M3pPIWf/Z/w1vF8WajYTHbwzUSpaVSNwFCvAyAJBM+8j//T/HYz+hTrpiWEc07LpbY
	C2N5I1FbNZjWbqdgV7le9OhSwKUkqcI5bd8xzsDfpA1S9x8mhvjHPFoO3K7oU/pWTbIW
	SOPWDZEdkNx4KkfL2OPTwB6CW7q0kwV/8jWDmjvGhXMH6Tse/ByvlQG8n7JsHoITN4Zf
	gh5/Tc4tvlMUkZSPaFybl7+ctglEeh0R2fbNfqoWqGjzxo7JbD+2EAkCYIJM1uUq48z8
	Rx8Quky79iNocVaEH9eAGLY9OB4UEehXD2CiGWcjSlAIhN6n3xf3KtTGDcKG3LCO9kmK
	y4vg==
MIME-Version: 1.0
Received: by 10.50.169.100 with SMTP id ad4mr7099225igc.50.1350844221723; Sun,
	21 Oct 2012 11:30:21 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Sun, 21 Oct 2012 11:30:21 -0700 (PDT)
In-Reply-To: <1348814151-31167-3-git-send-email-schnitzeltony@googlemail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
	<1348814151-31167-3-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 21 Oct 2012 20:30:21 +0200
Message-ID: <CALbNGRT3P+VztghEcccmxVjSNDYjfjFSkNKW3FQiJnE1WRkTSg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, meta-xfce 3/3] lighttpd: move systemd appends since recipe is in oe-core
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
X-List-Received-Date: Sun, 21 Oct 2012 18:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 8:35 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../lighttpd/lighttpd/lighttpd.service             |    0
>  .../lighttpd/lighttpd_1.4.31.bbappend              |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/{meta-oe =3D> oe-core}/recipes-extended/lighttpd/lig=
httpd/lighttpd.service (100%)
>  rename meta-systemd/{meta-oe =3D> oe-core}/recipes-extended/lighttpd/lig=
httpd_1.4.31.bbappend (100%)
>
> diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/ligh=
ttpd.service b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/ligh=
ttpd.service
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/light=
tpd.service
> rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttp=
d.service
> diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.=
31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.3=
1.bbappend
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.3=
1.bbappend
> rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.=
bbappend
> --
> 1.7.4.4
>
ping. This one got lost for patchwork ignoring pure renames. It can be
cherry picked from

git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git branch patc=
hes

Andreas


