Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UKnjC-0004yS-29
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 11:37:10 +0100
Received: by mail-ve0-f172.google.com with SMTP id oz10so1609838veb.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dkYGhs0iKXRdyzBnaO0SJ0P3oRGhOqJIKb2Ld8p0RbA=;
	b=emo1Ag7XrAODiFWU9MT0BQrdA28I0nbzG92wPi6h9eqcE1n1AkouQ7cGr/27dcSnDB
	d7x/0swIvHgbwBvzbNFZaQZMmkzki8hcDgPKxPS5/tHwTG2eUVYO4BTVgL9eVQP6fU+v
	nU2U4pfflRdSBBPYF5C5+wYCZnIkpeW/D692A1KfCWDyYG8v+MwNHX0cn4OZmaKw6u6B
	loVMZY4lJv5+AwtzOg6Syl14Wgi5Q1DxNOSBycEzRNFPkD4jv1SwWVtQmBOyKU72AKWZ
	BBP3Kh0UP+JDTBuVgF3BZENu3jZPtghN6TkQ9PBNsNH1NMPdflrlDLIksfjMI52KT5JT
	/gNw==
MIME-Version: 1.0
X-Received: by 10.220.151.203 with SMTP id d11mr22876740vcw.9.1364379608863;
	Wed, 27 Mar 2013 03:20:08 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 27 Mar 2013 03:20:08 -0700 (PDT)
In-Reply-To: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
References: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 27 Mar 2013 11:20:08 +0100
Message-ID: <CALbNGRQ1+_k1rSudZ6fjEB3WjtLiVEpamgy4ARo6pc2Ftu-yZg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] multipath-tools: add recipe for git version
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
X-List-Received-Date: Wed, 27 Mar 2013 10:37:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 27, 2013 at 11:07 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Multipath-tools hasn't seen a release in 3 years, so grab latest git.
>
> 'kpartx' is subpackaged since that's the tool most people want.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../multipath-tools/multipath-tools_git.bb         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 recipes-support/multipath-tools/multipath-tools_git.bb
>
> diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb b/recipes-support/multipath-tools/multipath-tools_git.bb
> new file mode 100644
> index 0000000..1b83f49
> --- /dev/null
> +++ b/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "The upstream project used to drive the Device Mapper multipathing driver."
> +
> +DEPENDS = "lvm2 libaio"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
> +
> +
> +SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
> +SRCREV = "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
> +
> +S = "${WORKDIR}/git"
> +
> +PV = "0.4.9+git"
> +
> +EXTRA_OEMAKE = "MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} libdir=${base_libdir}/multipath"
> +
> +do_compile() {
> +       oe_runmake
> +}
> +
> +do_install() {
> +       oe_runmake install
> +}
> +
Is overwriting do_compile & do_install required?

Andreas


