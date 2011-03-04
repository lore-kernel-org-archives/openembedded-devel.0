Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PvKsA-0007zp-U4
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 03:36:07 +0100
Received: (qmail 18505 invoked by uid 1003); 4 Mar 2011 02:34:38 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Mar 2011 02:34:38 -0000
Message-ID: <4D704FBB.1020809@balister.org>
Date: Thu, 03 Mar 2011 21:34:35 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299200693-2983-1-git-send-email-myopiate@gmail.com>
In-Reply-To: <1299200693-2983-1-git-send-email-myopiate@gmail.com>
Subject: Re: [PATCH] system-tools-backends: don't use build machine's automake-1.7
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
X-List-Received-Date: Fri, 04 Mar 2011 02:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

I'm not sure this is perfect (I see a strip error in my build), but it 
does let the package build on my Fedora machine now.

Pushing.

Philip

On 03/03/2011 08:04 PM, Roderick Taylor wrote:
> * package patch to pretend that automake is missing.
>
> Signed-off-by: Roderick Taylor<myopiate@gmail.com>
> ---
>   .../dont-automake.patch                            |   21 ++++++++++++++++++++
>   recipes/gnome/system-tools-backends_2.10.1.bb      |    1 +
>   2 files changed, 22 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch
>
> diff --git a/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch b/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch
> new file mode 100644
> index 0000000..a9cea79
> --- /dev/null
> +++ b/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch
> @@ -0,0 +1,21 @@
> +Index: system-tools-backends-2.10.1/missing
> +===================================================================
> +--- system-tools-backends-2.10.1.orig/missing
> ++++ system-tools-backends-2.10.1/missing
> +@@ -140,16 +140,6 @@ WARNING: \`$1' is missing on your system
> +     ;;
> +
> +   automake*)
> +-    if test -z "$run"&&  ($1 --version)>  /dev/null 2>&1; then
> +-       # We have it, but it failed.
> +-       exit 1
> +-    fi
> +-
> +-    echo 1>&2 "\
> +-WARNING: \`$1' is missing on your system.  You should only need it if
> +-         you modified \`Makefile.am', \`acinclude.m4' or \`${configure_ac}'.
> +-         You might want to install the \`Automake' and \`Perl' packages.
> +-         Grab them from any GNU archive site."
> +     find . -type f -name Makefile.am -print |
> + 	   sed 's/\.am$/.in/' |
> + 	   while read f; do touch "$f"; done
> diff --git a/recipes/gnome/system-tools-backends_2.10.1.bb b/recipes/gnome/system-tools-backends_2.10.1.bb
> index 75dfda9..bac0a9c 100644
> --- a/recipes/gnome/system-tools-backends_2.10.1.bb
> +++ b/recipes/gnome/system-tools-backends_2.10.1.bb
> @@ -16,6 +16,7 @@ SRC_URI[archive.sha256sum] = "0c1cfdf5f0550c0ccacbbc4f00ed059ab9ea483d48138132db
>
>   SRC_URI += " \
>               file://system-tools-backends \
> +	    file://dont-automake.patch \
>              "
>
>   SRC_URI_append_angstrom = " \


