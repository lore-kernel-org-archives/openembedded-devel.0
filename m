Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PUUTs-0001Dr-JX
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 02:24:04 +0100
Received: by fxm11 with SMTP id 11so2235667fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 17:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=6spEIwW0zqtcLntVuEITRyGyHspO+7kDIxuW5sjWCkw=;
	b=Y7J8iLTIGamOUJoMZIJyjKWv3QBTWMOZ6XFqqR7gM2CQE7u/wt1405F8SoVtZ+qVSi
	8KXqzCvGBHqVXxABNjXatxAVsIl3rz45bWlsMnJa0FqY6rvccziHySQTwtHohbgtUZUy
	JfkJWdYc3R5rWaKXoYfahMGnGGkOOlwaFnlj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=c+h/wkF2lTDYjeiWWU26Yxo0HTJN4CH/XX0PjGscIFWtbcr6d+CHiWTKtserwNXnrV
	WGWoJP2N4JgO0AyQVw5TaDHQa0uh9TdmyZh0U3qE3flfdfiq2ECAVkiGJ0qi6dRQUotb
	2U4O/qIYlaljg9PEzEbdP1qHaWPNWJQXoU0tY=
Received: by 10.223.72.197 with SMTP id n5mr3902246faj.8.1292808240048; Sun,
	19 Dec 2010 17:24:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Sun, 19 Dec 2010 17:18:20 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 19 Dec 2010 18:18:20 -0700
Message-ID: <AANLkTikotnoR4+_vA7_O1xAyRj5FBosconGFkWjSfzr4@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Building Image with all dbg packages?
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
X-List-Received-Date: Mon, 20 Dec 2010 01:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

How do I get all -dbg packages to be installed by default?

I have
DISTRO_TYPE = "debug"
in build/conf/local.conf

but when I gdb stuff I still get a bunch of
?? 0x2345() ??

What else should I do?

AJ ONeal

