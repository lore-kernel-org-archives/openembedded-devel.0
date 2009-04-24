Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LxLsJ-0001TM-D8
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 15:55:31 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LxLnj-0004pc-7G
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 13:50:47 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 13:50:47 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 13:50:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Apr 2009 15:50:34 +0200
Message-ID: <gssg3a$rpo$1@ger.gmane.org>
References: <1240560708-14550-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240560708-14550-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] udev 124: fix the absolute soname link in libvolume for SDK
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
X-List-Received-Date: Fri, 24 Apr 2009 13:55:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-04-09 10:11, Denys Dmytriyenko wrote:
>
> Signed-off-by: Denys Dmytriyenko<denis@denix.org>


Looks OK to me:

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/udev/udev-124/libvolume-id-soname.patch |   12 ++++++++++++
>   recipes/udev/udev_124.bb                        |    3 ++-
>   2 files changed, 14 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/udev/udev-124/libvolume-id-soname.patch
>
> diff --git a/recipes/udev/udev-124/libvolume-id-soname.patch b/recipes/udev/udev-124/libvolume-id-soname.patch
> new file mode 100644
> index 0000000..56365a4
> --- /dev/null
> +++ b/recipes/udev/udev-124/libvolume-id-soname.patch
> @@ -0,0 +1,12 @@
> +diff -uNr udev-124-orig/extras/volume_id/lib/Makefile udev-124/extras/volume_id/lib/Makefile
> +--- udev-124-orig/extras/volume_id/lib/Makefile	2008-06-12 01:24:30.000000000 -0400
> ++++ udev-124/extras/volume_id/lib/Makefile	2009-01-14 23:32:42.000000000 -0500
> +@@ -113,7 +113,7 @@
> + ifeq ($(libdir),$(usrlibdir))
> + 	ln -sf $(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> + else
> +-	ln -sf $(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> ++	ln -sf ../..$(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
> + endif
> + 	$(INSTALL) -d $(DESTDIR)$(usrlibdir)/pkgconfig
> + 	$(INSTALL_DATA) libvolume_id.pc $(DESTDIR)$(usrlibdir)/pkgconfig/libvolume_id.pc
> diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
> index 76edb2f..37dc3a7 100644
> --- a/recipes/udev/udev_124.bb
> +++ b/recipes/udev/udev_124.bb
> @@ -2,13 +2,14 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>   /dev/, handles hotplug events and loads drivers at boot time. It replaces \
>   the hotplug package and requires a kernel not older than 2.6.12."
>   RPROVIDES_${PN} = "hotplug"
> -PR = "r14"
> +PR = "r15"
>
>   SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>   	   file://noasmlinkage.patch;patch=1 \
>   	   file://flags.patch;patch=1 \
>   	   file://vol_id_ld.patch;patch=1 \
>   	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
> +	   file://libvolume-id-soname.patch;patch=1 \
>   	   file://mount.blacklist \
>   	   file://run.rules \
>   	   "




