Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LovG3-0007QS-Rm
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 09:53:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LovDk-00027C-PH
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 07:50:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 07:50:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 07:50:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Apr 2009 09:50:38 +0200
Message-ID: <gqv6ce$k19$1@ger.gmane.org>
References: <gqqq0q$or5$1@ger.gmane.org>
	<05187d8f9a873df8504511279c44af7c02b4facf.1238542568.git.andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <05187d8f9a873df8504511279c44af7c02b4facf.1238542568.git.andrea.adami@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] angstrom-2008.1.conf: add PREFERRED_VERSION_psplash
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
X-List-Received-Date: Wed, 01 Apr 2009 07:53:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 01:45, Andrea Adami wrote:
>
>   -second try
> ---
>   conf/distro/angstrom-2008.1.conf |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index 57048d6..6c2c1bd 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -76,6 +76,15 @@ PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
>   PREFERRED_VERSION_uclibc        	?= "0.9.30"
>   PREFERRED_VERSION_uclibc-initial	?= "0.9.30"
>
> +# Preferred version for psplash
> +# This enforces a specific brand to be used, in our case the angstrom
> +# one. In case you want to change the logo or something like that we
> +# suggest you to create another recipe (e.g: psplash-<brand>) for that
> +# and add that into your image.
> +# You can also opt to change or override this line, but that isn't
> +# needed because psplash is using update-alternatives.
> +PREFERRED_VERSION_psplash               ?= "psplash-angstrom"
> +
>   PREFERRED_PROVIDER_avahi = "avahi"
>
>   #Small machines prefer kdrive, but we might ship full Xorg in other images
> @@ -144,7 +153,7 @@ PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
>   # Others:
>   PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
>   PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
> -PREFERRED_PROVIDER_esound 		?= "pulseaudio"
> +PREFERRED_PROVIDER_esound               ?= "pulseaudio"
>   PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
>   PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
>   PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"

What does pulseaudio have to do with psplash? Looks OK otherwise

regards,

Koen




