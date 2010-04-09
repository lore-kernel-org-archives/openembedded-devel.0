Received: from mail-qy0-f201.google.com ([209.85.221.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O0GVd-0008LR-6s
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 17:52:42 +0200
Received: by qyk39 with SMTP id 39so2427673qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=ZgDv85KgVjeUoDejhHEzXWWABR2f1Y10oqTk5OGZc4E=;
	b=KMsyAayes4k2k8C+x48ueh10Klr+nyv09UsNHlYd2j+5TfezG1PPBgwSCjreDFKMGg
	he/8eYp4bnx2RMSOsE3PH0whD2g9i0VO4rJiuPg4A02DMDRldRrgF2Opgp68vsogwina
	7dlmwS7qahkVdGmAiRTKI3TNoIvkbyq9u3Hdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ffScH+t0zW+Il4b0Y3GtDiwyX4xdcpCylKSDsC4c87vaAbEi7QIAX/ZKA4Q38UxHlH
	7NsTtw9E4fT+a8wLSQMcweEnhyGCeXYS4mv+lBsolDGmTPJnBpgOu/wqz+/ii+69b3vJ
	m7yRKr5D1khC1tmtTCOGDFAJQSRjMy66lApqk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.131 with HTTP; Fri, 9 Apr 2010 08:48:54 -0700 (PDT)
In-Reply-To: <1270811993-14861-1-git-send-email-khimov@altell.ru>
References: <201004091439.53806.khimov@altell.ru>
	<1270811993-14861-1-git-send-email-khimov@altell.ru>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 9 Apr 2010 08:48:54 -0700
X-Google-Sender-Auth: ee5fce29cd61cea9
Received: by 10.229.224.149 with SMTP id io21mr218448qcb.64.1270828154394; 
	Fri, 09 Apr 2010 08:49:14 -0700 (PDT)
Message-ID: <j2ob6ebd0a51004090848sf34555b6z522581312c6c4290@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.201
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] rootfs_ipk.bbclass: run preinst/postinst scripts with "-e"
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
X-List-Received-Date: Fri, 09 Apr 2010 15:52:42 -0000
Content-Type: text/plain; charset=UTF-8

Looks good to me.  The script could always set +e to disable it anyway if it
really wanted to :)

Acked-by: Chris Larson <clarson@kergoth.com>

On Fri, Apr 9, 2010 at 4:19 AM, Roman I Khimov <khimov@altell.ru> wrote:

> There are scripts that can and should work when being ran on build
> host (for example, simple update-rc.d), but there are also many which
> can't and won't ever (for example, anything adding users/groups).
> The second group sometimes doesn't get "unpacked" flag because
> scripts throw errors in the middle and return something nice from
> the last command.
>
> It can be considered as a bug in pre/postinst script (as it should
> either explicitly check for "${D}" or just do "set -e" at start),
> but it is common enough.
>
> There is also another aspect to this as in general we can't be sure
> that everything is OK wrt preinst/postinst if script commands throw
> errors.
>
> Running preinst/postinst scripts on host with "-e" should solve
> that.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  classes/rootfs_ipk.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index 3a73ed8..5483c7e 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -70,12 +70,12 @@ fakeroot rootfs_ipk_do_rootfs () {
>        fi
>
>        for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
> -               if [ -f $i ] && ! sh $i; then
> +               if [ -f $i ] && ! sh -e $i; then
>                        opkg-cl ${IPKG_ARGS} flag unpacked `basename $i
> .preinst`
>                fi
>        done
>        for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
> -               if [ -f $i ] && ! sh $i configure; then
> +               if [ -f $i ] && ! sh -e $i configure; then
>                        opkg-cl ${IPKG_ARGS} flag unpacked `basename $i
> .postinst`
>                fi
>        done
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

