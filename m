Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LmlGr-0006Ut-RB
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 09:49:05 +0100
Received: by bwz19 with SMTP id 19so401736bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2009 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C6hNEy4joR52bcA7TIPdsKbchmUlJ1zxEyR+sJ6Yog0=;
	b=sWKku3KFgpBvhXUo2uvjFnyF6HkSc674YXnz0/sFTtFMlWzdnP2ZYsHv+i6ykF/LLj
	6Gyw9Tp/oXUGastOFHWWW3y2g/8i1YZQrIZxdO83RoED4QjR3TL7lbRe3De95GH+9vHW
	ll0GgdKCKlAEReYYGf6H0Sw2bTW6Ks78mPw4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qUyJUAACiEyPt/r5CBZKewb6+HMhKFvtDViKwHqFyhV6Zt0kbC4tQ9BFUrI6txqZs0
	bovuRmtMxTctxMV/jhxpjNOM6T4/2KA/DSghX09DGuSGx7WnThkE+q/JY/V+DBMhlrFp
	V9Vjw2Q9qnMB/NCPOIzO1jAAXTQsgWjG7WOVc=
MIME-Version: 1.0
Received: by 10.223.105.136 with SMTP id t8mr422058fao.41.1238057244099; Thu, 
	26 Mar 2009 01:47:24 -0700 (PDT)
In-Reply-To: <20090323000542.GL14278@smtp.west.cox.net>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
	<d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
	<20090323000542.GL14278@smtp.west.cox.net>
Date: Thu, 26 Mar 2009 09:47:24 +0100
Message-ID: <d1b08f940903260147n5fa49a1bxda7506b14bab20b7@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Thu, 26 Mar 2009 08:49:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

was: DEPLOY_DIR out of TMPDIR

>Sounds like Angstrom needs:
>USER_DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"
>DEPLOY_DIR = "${USER_DEPLOY_DIR}" if users are going to further override
>what the distro thinks is best.

As pointed out by Denix and me, we need changes to base.bbclass too:

 package_stagefile_shell()
 ...
-destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
+destfile=`echo $srcfile | sed s#${DEPLOY_DIR}#${PSTAGE_TMPDIR_STAGE}#`
...

I tested both patches building from scratch and using packaged staging.

Issues: the 5-6 recipes using package_stagefile_shell() are possibly
broken...DEPLOY_DIR get sed out and the files are not found.
I don't have a list here offhand, just grep...two of them are
zaurus-updater and git.

I fixed locally zaurus-updater just avoiding to call the a.m. function

-        package_stagefile_shell ${DEPLOY_DIR_IMAGE}/updater.sh.${MACHINE}
+       cp -dp updater.sh ${DEPLOY_DIR_IMAGE}/updater.sh.${MACHINE}

-        package_stagefile_shell ${DEPLOY_DIR_IMAGE}/gnu-tar
+       cp -dp gnu-tar ${DEPLOY_DIR_IMAGE}/gnu-tar

Can I proceed and send the set of patches to the mailing list? Better ideas?


Regards

Andrea


