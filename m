Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5535F61DDF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2013 09:55:40 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 69ECFD22DE; Sun,  2 Jun 2013 11:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BAA0CD224E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2013 11:55:18 +0200 (CEST)
Message-ID: <51AB1684.1080500@juszkiewicz.com.pl>
Date: Sun, 02 Jun 2013 11:55:16 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
In-Reply-To: <1370165592-15697-1-git-send-email-net147@gmail.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
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
X-List-Received-Date: Sun, 02 Jun 2013 09:55:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 02.06.2013 11:33, Jonathan Liu pisze:
> +def get_llvm_arch(d):
> +    import bb;
> +
> +    arch = bb.data.getVar('TARGET_ARCH', d, 1)
> +
> +    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
> +        arch = "x86"
> +    elif arch == "x86_64":
> +        arch = "x86_64"
> +    elif arch == "arm":
> +        arch = "arm"
> +    elif arch == "mipsel" or arch == "mips":
> +        arch = "mips"
> +    elif arch == "powerpc" or arch == "powerpc64":
> +        arch = "powerpc"
> +    else:
> +        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
> +
> +    return arch

Can we get rid of such blocks? They are worthless and only generate
extra support questions when OE newbies use OE with 'not supported'
architectures.

