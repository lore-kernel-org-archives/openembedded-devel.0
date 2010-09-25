Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oze2U-0008BT-R0
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:20:19 +0200
Received: by wyb35 with SMTP id 35so958922wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=iczGF4hFbU2+ibPeQNbIC+wSotHO1qKktfAll1iY4tk=;
	b=FME54XHmS9HFRmtIuJVmkzktM1FgFXB13soj2v9ld5hz0EQ9wX5vHOnOS8cABpFxaE
	R+33n1tNyINyro+yhWXP9saOZMlvhF2ZRJrKSYfu3XkADAydKNKxfhGF8TJWoyi1NBu9
	HcQZBo/Wd2DMcedC7KM3O0jaRbheAofDrrQTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=RVy1TF2esTIEgjTTivuNoyMz/bqzPIqWU3QJJ5F5dR2Qu0pujkpORCQuioqCXGzLEu
	SD3giC3uTCGWMpDIweGPBt5CMoCGONdMz6NSgM/ebDOyeyp7UjZwuyVEjmmdrIGLHy3E
	iNRHNxmwcz6aHCjCgr6/hqgsvl4J/XnPzSftc=
Received: by 10.216.22.70 with SMTP id s48mr298949wes.27.1285456809868; Sat,
	25 Sep 2010 16:20:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Sat, 25 Sep 2010 16:19:48 -0700 (PDT)
In-Reply-To: <1285456353-27457-2-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-2-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 25 Sep 2010 16:19:48 -0700
X-Google-Sender-Auth: fpAmSOv3nkxHdHpqlXwxIz9RCkQ
Message-ID: <AANLkTiksyBfGpv2NKVRenXM=A771zq+LRk4z7uNZY8NB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 01/12] native.bbclass, package.bbclass, bitbake.conf: Make provisions for system libdir to be something else than '/lib'
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
X-List-Received-Date: Sat, 25 Sep 2010 23:20:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 25, 2010 at 4:12 PM, Khem Raj <raj.khem@gmail.com> wrote:

> * Add base_libdir_native as target libdir could be different e.g. lib32
>  lib64
>
> * Dont assume lib to be system libdir during packaging.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

