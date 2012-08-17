Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2U6V-0000sT-6M
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 23:29:15 +0200
Received: by ggmq1 with SMTP id q1so4804673ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Z4XMocKzZoeKe6xTvBGc8+h1bkkzV5PT1qkkJMrV0A8=;
	b=FYos4t4UZ2xo7Vzf6UBqU/ahNR7RXBkytumh5/9yvW/EbAQwhQIQGgZcjE2sGT/Wk5
	tsOXw8khuwzOioGBetw6RPFi8LlcYPjh0o/sHIrNZCpnBHPt69L3onFvxfrjwXH/hvHI
	s8AFkZRWlpaQMYvUbhD9xroPUf5OwyShDafOQRG3j/1XXcp9NJztce2b+y4F0X55T2te
	nrAEhEIWakxy5Udu8plkuh1pWG/lejVk8EppnXvUwW7vJeW9FYiqR5fIWRoxwR2K0AjU
	vQXDLasvRQupwkMJhxyYF3Ov3EU2elqSWEyUtZPukslvKJ3KTkiuvlqbillA14KkHJtV
	vilQ==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr3255499igc.50.1345238235558; Fri,
	17 Aug 2012 14:17:15 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Fri, 17 Aug 2012 14:17:15 -0700 (PDT)
In-Reply-To: <20120817170922.097651032F@opal>
References: <20120817170922.097651032F@opal>
Date: Fri, 17 Aug 2012 23:17:15 +0200
Message-ID: <CALbNGRRGxF518Vo933R8tLFU8yTbw8XBfFZQox93kr0m2ACJ_A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : prelink: Update to latest upstream prelink
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
X-List-Received-Date: Fri, 17 Aug 2012 21:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 7:09 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 7759c9a2c5dfdc1cae5540a5985632c78abbac89
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D7759c9a2c5dfdc1cae5540a5985632c78abbac89
>
> Author: Mark Hatle <mark.hatle@windriver.com>
> Date:   Mon Aug 13 14:49:57 2012 -0500
>
> prelink: Update to latest upstream prelink
>
> The latest fixes an obscure problem with prelinking on PowerPC, as well
> as general updated.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> ---
>
>  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-=
devtools/prelink/prelink_git.bb
> index c94bdf5..610302e 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be=
 resolved at \
>  runtime and thus programs come up faster."
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
> -SRCREV =3D "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
> +SRCREV =3D "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
>  PV =3D "1.0+git${SRCPV}"
> -PR =3D "r9"
> +PR =3D "r10"
>
>  #
>  # The cron script attempts to re-prelink the system daily -- on
>
I think reloading is caused by this change. Since latest update I get

WARNING: Failed to fetch URL
git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit, attempting
MIRRORS if available
ERROR: Fetcher failure: Fetch command export HOME=3D"/home/Superandy";
export SSH_AUTH_SOCK=3D"/tmp/keyring-IAYDEC/ssh"; export
GIT_CONFIG=3D"/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/etc/=
gitconfig";
export PATH=3D"/home/Superandy/data/oe-core/sources/openembedded-core/scrip=
ts/native-intercept:/home/Superandy/data/oe-core/sources/openembedded-core/=
scripts:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/ar=
mv7a-vfp-neon-linux:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linu=
x/usr/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/sbin=
:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin:/home/Sup=
erandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/sbin:/home/Superandy/tmp/oe=
-core-eglibc/sysroots/x86_64-linux//bin:/home/Superandy/oe-core/sources/ope=
nembedded-core/scripts:/home/Superandy/oe-core/sources/bitbake/bin:/usr/lib=
64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbi=
n:/usr/sbin:/sbin:./:/home/Superandy/bin:/sbin:/usr/sbin";
git remote add --mirror=3Dfetch origin
git://git.yoctoproject.org/prelink-cross.git failed with exit code
129, output:
STDOUT:
STDERR: error: option `mirror' takes no value
usage: git remote add [<options>] <name> <url>

    -f, --fetch           fetch the remote branches
    --tags                import all tags and associated objects when fetch=
ing
                          or do not fetch any tag at all (--no-tags)
    -t, --track <branch>  branch(es) to track
    -m, --master <branch>
                          master branch
    --mirror              no separate remotes


ERROR: Function failed: Fetcher failure for URL:
'git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit'. Unable to
fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/Superandy/tmp/oe-core-eglibc/work/x86_64-linux/prelink-native-1.0+git=
1+a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d-r10/temp/log.do_fetch.25940
ERROR: Task 103
(virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/meta=
/recipes-devtools/prelink/prelink_git.bb,
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 307 tasks of which 262 didn't need to
be rerun and 1 failed.

Any thoughts?

Andreas


