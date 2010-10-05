Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <finikk@gmail.com>) id 1P319C-0004pv-M8
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 08:37:11 +0200
Received: by bwz2 with SMTP id 2so4324235bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=z/Rhvf1KX+MxWn0cXy0ZxUDf0iIp5sFV1gctAfdVjTY=;
	b=EBk9fKK5SzYYYTiikdxp/ngBGivs5XbDIjZS9zp6MifVdUfbjcyVbRWBlF/hn41jGU
	r+M5+0V990saOLnTiLPIll2W6QiQ+hWkVlMrMerxPRKzNw4tQp82e13WvZPlVYtdHp+l
	dVttX2C+10FES4vaMc/Z5C2WAP4tIdDyPMo+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=rIxyGvI+4KmpROq+tvyoYLkBDbfY/fxYaQuWcIblozCme1ew1QjsuIfWbzWL/b6l73
	em6hAecLH4GW+n2qm/t3Ta6TuQ+16qZDmfaHYCp8AkvxenDOFeWsZ3l4puTfeiIFsfXX
	NkmV0sxasG02QiG/hhhBdpXTmQx/rTYNHFLno=
MIME-Version: 1.0
Received: by 10.204.73.211 with SMTP id r19mr8035094bkj.131.1286260602304;
	Mon, 04 Oct 2010 23:36:42 -0700 (PDT)
Sender: finikk@gmail.com
Received: by 10.204.54.5 with HTTP; Mon, 4 Oct 2010 23:36:42 -0700 (PDT)
Date: Mon, 4 Oct 2010 23:36:42 -0700
X-Google-Sender-Auth: aTkLPNuO6uoDnqs4NlykLfwKZhM
Message-ID: <AANLkTi=RrOCP9UgOD+J_E8Sr3RTiNQBnwnBK9HiSLLe6@mail.gmail.com>
From: Dmitry Fink <openembedded@finik.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: finikk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Question about kernel.bbclass and staging kernel headers
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
X-List-Received-Date: Tue, 05 Oct 2010 06:37:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I've noticed that kernel.bbclass has a bunch of logic for manually copying
kernel headers into the staging area
(with a lot of logic for handling symlinks and different locations of asm
and arch folders in different kernel version),
I was wondering if there is a special reason for doing that instead of just
runninig "oe_runmake headers_install" like
linux-libc-headers recipes do. Speaking of which, I don't understand what
linux-libc-headers recipes are for then,
why are there two different mechanisms for installing headers? I must be
missing something, appreciate your help.

Thanks!
Dmitry Fink

