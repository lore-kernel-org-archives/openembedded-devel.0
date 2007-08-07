Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IIQqH-0002iv-BF
	for openembedded-devel@openembedded.org; Tue, 07 Aug 2007 17:19:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l77FGwRj016868
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 16:16:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16481-07-2 for <openembedded-devel@openembedded.org>;
	Tue,  7 Aug 2007 16:16:50 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l77FGeYk016831
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 16:16:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1IIPXa-0005bT-C3@linuxtogo.org>
References: <E1IIPXa-0005bT-C3@linuxtogo.org>
Date: Tue, 07 Aug 2007 16:16:40 +0100
Message-Id: <1186499800.5653.62.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use bzImage	kernels
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2007 15:19:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-08-07 at 15:56 +0200, hrw commit wrote:
> packages/linux/linux.inc	86d436757b3b9cb61a1a381d76950ef21596b40c
> +++ packages/linux/linux.inc	a948d889b8d420c7a04eb140caaa353601fa7722
> @@ -11,6 +11,7 @@ inherit kernel
>  
>  inherit kernel
>  
> +KERNEL_IMAGETYPE_alix = "bzImage"
>  KERNEL_IMAGETYPE_progear = "bzImage"
>  KERNEL_IMAGETYPE_simpad = "zImage"
>  KERNEL_IMAGETYPE_kb9202 = "uImage"

Should these not really go into the machine.conf files?

Cheers,

Richard



