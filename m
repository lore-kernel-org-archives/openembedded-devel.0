Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBFPL-0006TC-MQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 23:23:22 +0100
Received: (qmail 3350 invoked by uid 1003); 19 Nov 2009 22:21:53 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 19 Nov 2009 22:21:53 -0000
Message-ID: <4B05C4FE.1080609@balister.org>
Date: Thu, 19 Nov 2009 17:21:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911191336390.7307@localhost>
In-Reply-To: <alpine.LFD.2.00.0911191336390.7307@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] guile-native: Add patch to inhibit generation of linemarkers from cpp.
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
X-List-Received-Date: Thu, 19 Nov 2009 22:23:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've applied this. It did not break my build on F11. If this causes 
build errors, revert if necessary. Hopefully, this is not needed.

Thanks,

Philip

On 11/19/2009 01:41 PM, Robert P. J. Day wrote:
>
> Add the "-P" option to inhibit generation of linemarkers in the output
> from the preprocessor.
>
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
>    i've tested this and it seems to work.  after this gets applied,
> i'll submit a patch to add guile 1.8.7 to the mix.  did i get the
> patch format right?  two edited files, one new one.
>
>
> diff --git a/recipes/guile/files/cpp-linemarkers.patch b/recipes/guile/files/cpp-linemarkers.patch
> new file mode 100644
> index 0000000..54f58eb
> --- /dev/null
> +++ b/recipes/guile/files/cpp-linemarkers.patch
> @@ -0,0 +1,8 @@
> +--- guile.orig/libguile/guile-snarf-docs.in	2009-07-03 18:19:00.000000000 -0400
> ++++ guile/libguile/guile-snarf-docs.in	2009-11-19 12:55:32.487266268 -0500
> +@@ -23,4 +23,4 @@
> + ## Let the user override the preprocessor autoconf found.
> + test -n "${CPP+set}" || CPP="@CPP@"
> +
> +-${CPP} -DSCM_MAGIC_SNARF_DOCS "$@"
> ++${CPP} -P -DSCM_MAGIC_SNARF_DOCS "$@"
> diff --git a/recipes/guile/guile-native_1.8.5.bb b/recipes/guile/guile-native_1.8.5.bb
> index 9c2eb13..5c999db 100644
> --- a/recipes/guile/guile-native_1.8.5.bb
> +++ b/recipes/guile/guile-native_1.8.5.bb
> @@ -4,6 +4,7 @@ DEPENDS = "libtool (<  2)"
>
>   SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
>              file://configure-fix.patch;patch=1 \
> +           file://cpp-linemarkers.patch;patch=1 \
>             "
>
>   PR = "r1"
> diff --git a/recipes/guile/guile-native_1.8.6.bb b/recipes/guile/guile-native_1.8.6.bb
> index d511807..2f87c48 100644
> --- a/recipes/guile/guile-native_1.8.6.bb
> +++ b/recipes/guile/guile-native_1.8.6.bb
> @@ -1,4 +1,5 @@
>   require guile-native.inc
>   SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
>              file://configure-fix.patch;patch=1 \
> +           file://cpp-linemarkers.patch;patch=1 \
>             "
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


