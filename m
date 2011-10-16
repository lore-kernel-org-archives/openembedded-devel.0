Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFZUr-0006Zw-DW
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 00:47:57 +0200
Received: by gyc15 with SMTP id 15so2346966gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 15:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=cyRsuDlrBXJ8Qh5mbIp4LxTlp0TcQ6LIf/GsNWOklQ4=;
	b=WcxLkLk2vJEswWBhm8qQp0wf2pMOX1rvONS+A+PLYePx4QikprAh/b9+qZiXNaTItP
	8aqieFWb2d0wqrksPoz8AmOMNUvxiBUFDz/U8fX/HPQAY39ACvWAgZOI/lvRFjKeWtWl
	PJgR9H3tE18/Inn5h+fhcu7Srgu5wW2m+Rw70=
MIME-Version: 1.0
Received: by 10.236.76.38 with SMTP id a26mr23295223yhe.53.1318804928979; Sun,
	16 Oct 2011 15:42:08 -0700 (PDT)
Received: by 10.147.124.18 with HTTP; Sun, 16 Oct 2011 15:42:08 -0700 (PDT)
Date: Mon, 17 Oct 2011 00:42:08 +0200
Message-ID: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: xserver-common and x11-common conflicting
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
X-List-Received-Date: Sun, 16 Oct 2011 22:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

using oe-core and meta-oe my xserver settings are "touched" by two packages:

xserver-common: seems more complete, provides some xmodmaps (should be in
BSP layers). Though it invocates fbset which is not in path.
x11-common: needs maybe care but is using the formfactor settings from BSP
so obviously is more modular

I suppose once the merge is finished we'll have sane default settings.
(atm the xserver-common is providing some extra cruft)

Keep on the great unification work!

Regards

Andrea

PS, I've noticed many modules are missing and have to be installed (extmod,
dve, dri, ...)

