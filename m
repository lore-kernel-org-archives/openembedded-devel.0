Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwMzB-0005JH-Sp
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:54:33 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwMuo-0001hF-Oj
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:35:49 +0200
Message-ID: <gslan5$mfs$5@ger.gmane.org>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1238399997-6016-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Tue, 21 Apr 2009 20:54:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-03-09 09:59, Roman I Khimov wrote:
> Places do_rootfs function before do_install in image creation process.

Acked-by: Koen Kooi <koen@openembedded.org>


>
> This change allows multiimage builds, when one image depends on another (before
> that second image creation raced with do_rootfs for the first one) and uses
> it for some purpose.
>
> Multiimage builds are useful in situations like creating an installer image
> with initramfs (built in OE) and an image of the target FS (also built in OE)
> or for building virtualized system images to be placed on target FS.
> ---
>   classes/image.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index fd0df4d..3a0bc32 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -106,6 +106,7 @@ do_rootfs[nostamp] = "1"
>   do_rootfs[dirs] = "${TOPDIR}"
>   do_rootfs[lockfiles] = "${IMAGE_ROOTFS}.lock"
>   do_build[nostamp] = "1"
> +do_install[nostamp] = "1"
>
>   # Must call real_do_rootfs() from inside here, rather than as a separate
>   # task, so that we have a single fakeroot context for the whole process.
> @@ -234,5 +235,5 @@ rootfs_update_timestamp () {
>   # export the zap_root_password, create_etc_timestamp and remote_init_link
>   EXPORT_FUNCTIONS zap_root_password create_etc_timestamp remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp
>
> -addtask rootfs before do_build after do_install
> +addtask rootfs after do_compile before do_install
>   addtask deploy_to after do_rootfs




