Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MGzdv-0000Jb-HX
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 20:13:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5HI31T9017867 for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 19:03:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GfBGFfyA2ghm for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 19:03:00 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5HI2vL8017857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 19:02:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1245258640-1623-1-git-send-email-clarson@mvista.com>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
Date: Wed, 17 Jun 2009 19:01:56 +0100
Message-Id: <1245261716.27027.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image	creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 18:13:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 10:10 -0700, Chris Larson wrote:
> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> tmp/rootfs around after image creation, otherwise it will be removed, as it's
> not a fully functional filesystem, and causes much confusion among users as a
> result.
> 
> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  classes/image.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index f0cc3b3..974e734 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -133,6 +133,7 @@ fakeroot do_rootfs () {
>  	${IMAGE_POSTPROCESS_COMMAND}
>  	
>  	${MACHINE_POSTPROCESS_COMMAND}
> +	${@['rm -rf ${IMAGE_ROOTFS}', ''][bool(d.getVar("IMAGE_KEEPROOTFS", 1))]}
>  }
>  
>  do_deploy_to[nostamp] = "1"

Something I've been thinking about for a while is moving rootfs into
${WORKDIR}/. That way you can have concurrent image generation for a
start and rm_work could be taught to clean it up...

Cheers,

Richard



