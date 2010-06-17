Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OPMYB-00056Z-VB
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 23:23:04 +0200
Received: by fxm18 with SMTP id 18so285555fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=7/amIquFB9TuFCGBYBXBn16ooT9yQ10gMUbWGx0RKiU=;
	b=tyJ9cgagLCDJVk+30cBeiUuQnLAp3t7wsRH/3uoRGpolTYh7ZGHnHTjnLdKkUBeRG6
	Uee0kZ4ZSZKC/hHKTKlc6KTDzwsnlQm+bRnkx9XImVGzkyfOqJ1QxG6BvnGkBsPoEq6V
	nGMVGJVL/HmQNU+X0fpu1JzP3TwiJ2Mu8ihoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=P7B2kQmtd9zP3DLImhzDS8OSnz2EgLyIVHv3zc0cwQxNjb3bT6TZ3+Yze+EXrCtjKO
	jh0qG797IALxDiMqnzgC7SjouLW+o1w96p6uD4GVnEn1ok8KNH6EV2npcacizBgzQOQG
	j6rzsxtNIjjbuEm94bEmGeyQetJu9dJxDvZ3w=
Received: by 10.223.23.83 with SMTP id q19mr115908fab.12.1276809513495;
	Thu, 17 Jun 2010 14:18:33 -0700 (PDT)
Received: from [192.168.178.115] (85-127-149-22.dynamic.xdsl-line.inode.at
	[85.127.149.22])
	by mx.google.com with ESMTPS id n6sm12186644fam.31.2010.06.17.14.18.32
	(version=SSLv3 cipher=RC4-MD5); Thu, 17 Jun 2010 14:18:32 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
References: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
Date: Thu, 17 Jun 2010 23:19:27 +0200
Message-ID: <1276809567.24867.5.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: New user would like some help
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
X-List-Received-Date: Thu, 17 Jun 2010 21:23:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 17.06.2010, 20:24 +0100 schrieb Chris Tapp:
> I now want to add some other libraries to the image so that they will  
> be available by default. I've tried to do this by adding IMAGE_INSTALL  
> lines in to minimal-image.bb (I'll do this properly by making a copy  
> soon!). e.g.
> 
> IMAGE_INSTALL = "task-boot \
> 		libsdl-native \
> <rest of file>
> 
> This appears to do something at build time, but libsdl is not in the  
> image that's produced.
> 

1) libsdl instead of -native (-native packages are used for
crosscompiling. OE installs some of them itself, while others are
distro-requirements)

2) To create your own image using the minimal-image:
Create a new file openembedded/recipes/images/<your-image>.bb:

require minimal-image.bb

IMAGE_INSTALL += "libsdl \
                  some-other-lib \
"

export IMAGE_BASENAME = "<your-image>"

And build `bitbake your-image`

Regards,
Michael



