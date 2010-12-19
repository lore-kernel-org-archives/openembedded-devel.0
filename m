Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PURav-00065Y-Gz
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Dec 2010 23:19:09 +0100
Received: by fxm11 with SMTP id 11so2170001fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=kaGr5SGnF8On9RUHLnLyLpbeSfsoEAELgZTDK4CYk3M=;
	b=q4flOLpOGdgU8QvPmfwAtmLDYZDdgr+HRaT81gCh4gfT+DT9xhsu5nmVjGnsOot37y
	l57uyrM+yzmXsHC3eJJP3uR/nannti+/nYi6kgXTBnF632Jc3pc58KEHJpUN8bNMW9l7
	LKC6tcydKjQIo4x4E6WKZBI0wtJBKwXP7RYp8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=I5D8DHMnmr17hB26dHc8LhCoChaVwl1cpHEzL5xIvb5aNRWYw4QGc1WRVaGrW5T64Z
	OQ0DEEeOWZxhPOKKoADIz3a9Fg1RoM+T1Sj/CXBggt3Yw7o7ft8aH3NpsQLh0y59pGdo
	kMFan20iw9krJHkD93qrHrMSdeWDf/pseiMlU=
Received: by 10.223.72.6 with SMTP id k6mr3857386faj.46.1292797144073; Sun, 19
	Dec 2010 14:19:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Sun, 19 Dec 2010 14:18:43 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 19 Dec 2010 15:18:43 -0700
Message-ID: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: python-inotify broken
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
X-List-Received-Date: Sun, 19 Dec 2010 22:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

python-inotify, (bearing no relation to pyinotify or python-inotifyx, btw)
is broken.
it compiles, but it doesn't work.

Can someone else confirm?
test case:
https://github.com/coolaj86/python-examples/tree/master/inotify

After a few events it just freezes.

I've also informed the author.

Generally speaking, is there much point in leaving a library in OE that
gives false
hope and then shatters dreams and crushes aspirations?

AJ ONeal

