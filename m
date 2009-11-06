Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6Viq-0002Co-9p
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 21:47:55 +0100
Received: by yxe5 with SMTP id 5so1289729yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 12:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=qHxTJEJhMyqhR5D5/qY5X2O2ecc2+v25ZFW6C9ZUm9M=;
	b=NY/N7qo8tQVKuDFTIMKSaHScHrJodMIFnv1fxHhtIvdQrPR/Jv6gjnSKlPWB7t6Muo
	a/G0wvbl8P4qoN/Gd1oOrUCWY6U3473IHLmbLwcr+zVRZspR8I2swfYONJahTu/m7NtT
	rXtUQbz85itTfJaVX1GdNNOyy4Y8TV036lhzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EjpQ+KXFcYxKcyN9K5qBuNm0QFfz0D9HH9uazevOj9xLg1kOCYDdhSmFVFr0UduOfv
	sKRD5IQ/QWW+6ALtDgwrrP5W4O18czZQ+XalgFVFBf5I6S8gGRq/iREjxVUdGINvOSvz
	DGh5S3qWVfMQfFK2CiJfkCFdTixfW2T2aWauE=
MIME-Version: 1.0
Received: by 10.100.237.13 with SMTP id k13mr5182642anh.131.1257539920569; 
	Fri, 06 Nov 2009 12:38:40 -0800 (PST)
Date: Fri, 6 Nov 2009 21:38:40 +0100
Message-ID: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: what to do with wrong checksum
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
X-List-Received-Date: Fri, 06 Nov 2009 20:47:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

While trying to build xmltv I got this:

NOTE: The MD5Sums did not match. Wanted:
'495fd8c320f67a0c8e0b90ccb060f0ea' and Got:
'68d9a93d507bbf917e1f3ad294fd5727'
NOTE: Task failed: Checksum of
'http://xmltwig.com/xmltwig/XML-Twig-3.33.tar.gz' failed

How should I handle this. Of course I can change the checksum, but i
don't think that is the intention :-)
Is there a version somewhere cached that has the old checksum (so I
can compare).
Or how else should I handle this?

Frans


