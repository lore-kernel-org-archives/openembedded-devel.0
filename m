Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OLPWF-00011S-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 01:44:50 +0200
Received: by iwn6 with SMTP id 6so773557iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 16:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=RXqA3ObKHiK6SO8kf66Cja7OE1pI9B+Z1qWQDl+tvpE=;
	b=COyyVN4eps/nSPIPXvVMX72xYaTD0ZnWjzloE9AJECUM/ich2Y7W9eOhwizSzSvsvN
	y76Up22ezF3GIkv9EW+8ihEPk4JHpLgTma6+rUIDtL2hSIpZosiUfjXunxQHtxQ93rr5
	55A5Gwy85JkTDl0A0/Zh9vKXFZlEC8dNQt9Is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NlcH/0FRJ2BWdjNcyCUqvliyBR3icPYXvuvIsmCGsaZd9ditAa9kYmvduzCbtpBPcG
	6hrabGT7S7Ql2uaHW8YlSsPyWdiU4LQ75tfZlglgjJ5NCfz12oBoKswxgYS0We1eXYVh
	G6HIw5n/OfARmBhieDu9fUNq8duoRi1uUTz4c=
MIME-Version: 1.0
Received: by 10.231.150.16 with SMTP id w16mr16462216ibv.42.1275867620509; 
	Sun, 06 Jun 2010 16:40:20 -0700 (PDT)
Received: by 10.231.152.204 with HTTP; Sun, 6 Jun 2010 16:40:20 -0700 (PDT)
In-Reply-To: <96D51530-A1A0-4898-AD8F-4E01EFB496D1@mac.com>
References: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com>
	<AANLkTimdoOiHxXo3XU-3tLC2v9o90k8V0omWcjX_8n5w@mail.gmail.com>
	<CC3AC527-3026-4188-8BF1-F6AEC47A7A6C@mac.com>
	<AANLkTin1Wa5buxLDTg3w1ZAu609NRR_vCXf3DydPfF8j@mail.gmail.com>
	<96D51530-A1A0-4898-AD8F-4E01EFB496D1@mac.com>
Date: Mon, 7 Jun 2010 09:10:20 +0930
Message-ID: <AANLkTilcmOQiK-PZqC9n53DEkPgsj7O1HqH3yz6IiEf4@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autologin recipe for gumstix Overo
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
X-List-Received-Date: Sun, 06 Jun 2010 23:44:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 June 2010 15:52, Elvis Dowson <elvis.dowson@mac.com> wrote:
> Hi Ash,
>
> On Jun 6, 2010, at 9:31 AM, Ash Charles wrote:
>
>> Does the image do the autologin the second time you boot it?
>
> Yes, it does, no problems there.
>
> The post init stuff is supposed to modify the inittab file, but it didn't.
>
> I manually edited the /etc/inittab file after I discovered that the bitbake rootfs process for omap3-console-image with the autologin recipe added, did not modify the inittab file.
>
> Best regards,
>
> Elvis Dowson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

The preinst/postinst/prerm/postrm scripts belonging to a package will
be skipped by opkg during image creation as this step uses an offline
root (the -o flag to opkg). These scripts will be run if the package
is installed/removed directly on the target system. Perhaps in this
case, you also need to use ROOTFS_POSTPROCESS_COMMAND?

-Graham


