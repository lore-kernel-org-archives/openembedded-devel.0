Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4E4469693
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:35:16 +0000 (UTC)
Message-ID: <51DA79C3.7030907@communistcode.co.uk>
Date: Mon, 08 Jul 2013 09:35:15 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1373270549-7784-1-git-send-email-net147@gmail.com>
In-Reply-To: <1373270549-7784-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-webserver][PATCH] hiawatha: remove empty /var/run directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 08:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/13 09:02, Jonathan Liu wrote:
> The /var/run directory is already created by base-files.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> index 2c9fe80..94bcbc6 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> @@ -53,6 +53,8 @@ do_install_append() {
>           install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
>       fi
>
> +    rmdir "${D}${localstatedir}/run"
> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>   }
>
>   CONFFILES_${PN} = " \
>

Ack from me, I've been meaning to get round to this for a while.

Thanks Jonathan!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

