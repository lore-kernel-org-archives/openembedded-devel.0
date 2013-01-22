Received: from p3plsmtpa07-01.prod.phx3.secureserver.net ([173.201.192.230])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1Txfe5-0001Xi-JI
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:20:31 +0100
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id r32D1k0031mTNtu0132DYj; Tue, 22 Jan 2013 08:02:14 -0700
Message-ID: <50FEA9F4.4080508@pabigot.com>
Date: Tue, 22 Jan 2013 09:02:12 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Holger Freyther <holger+oe@freyther.de>
References: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
In-Reply-To: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
Cc: openembedded-devel@lists.openembedded.org,
	Holger Hans Peter Freyther <zecke@selfish.org>
Subject: Re: meta-systemd: Introduce a create-volatile to create tmp directories
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
X-List-Received-Date: Tue, 22 Jan 2013 15:21:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2012 11:59 AM, Holger Freyther wrote:
> From: Holger Hans Peter Freyther <zecke@selfish.org>
>
> The base-files create symlinks from /var/{log,tmp,lock,cache,run} to
> the /var/volatile. The directories are created by sysv initscripts.
> Use the systemd-tmpfiles to create the directories. One needs to be
> careful with the naming of the file as systemd first collects all
> *.conf files, sorts them by name and is parsing them then. Make sure
> the new file is parsed before the systemd.conf.

(This is http://patches.openembedded.org/patch/36551/ which has been 
archived, but AFAIK I can't reply to the full context because I was 
unsubscribed when the discussion occurred:)

Apologies if my recursive grep skills have failed, but it appears this 
is still not globally resolved for images that use systemd as the init 
manager.

meta-gumstix has this patch and it caused problems with attempts to use 
systemd_v189 in denzil since it's hidden inside a bbappend to 
systemd_git.  So I'm hoping to identify a more forward-looking 
solution.  Is there a plan to fix this issue globally?  Koen preferred 
using base_files+fs_perms as in Angstrom, but Holger was concerned this 
would prevent sharing base_files between sysvinit and systemd builds.

Peter

>
> ---
> .../systemd/systemd/create-volatile.conf           |   11 +++++++++++
>   meta-systemd/recipes-core/systemd/systemd_git.bb   |    4 +++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
>   create mode 100644 meta-systemd/recipes-core/systemd/systemd/create-volatile.conf
>
> diff --git a/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf b/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf
> new file mode 100644
> index 0000000..afcf8c3
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf
> @@ -0,0 +1,11 @@
> +# This goes hand-in-hand with the base-files of OE-Core. The file must
> +# be sorted before 'systemd.conf' becuase this attempts to create a file
> +# inside /var/log.
> +
> +
> +d   /var/volatile/cache -   -   -   -
> +d   /var/volatile/log   -   -   -   -
> +d   /var/volatile/lock  -   -   -   -
> +d   /var/volatile/run   -   -   -   -
> +d   /var/volatile/tmp   -   -   -   -
> +
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
> index 09bc635..2b245c0 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -19,7 +19,7 @@ inherit gitpkgv
>   PKGV = "v${GITPKGVTAG}"
>   
>   PV = "git"
> -PR = "r6"
> +PR = "r7"
>   
>   inherit useradd pkgconfig autotools perlnative
>   
> @@ -31,6 +31,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
>              file://touchscreen.rules \
>              file://modprobe.rules \
>              file://var-run.conf \
> +           file://create-volatile.conf \
>              ${UCLIBCPATCHES} \
>             "
>   UCLIBCPATCHES = ""
> @@ -97,6 +98,7 @@ do_install() {
>   	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>   
>   	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
> +	install -m 0644 ${WORKDIR}/create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
>   }
>   
>   python populate_packages_prepend (){



