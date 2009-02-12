Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LXWYo-00009Q-79
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 09:04:38 +0100
Received: by fk-out-0910.google.com with SMTP id f40so269005fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 00:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Lz8+2XMekKDkfvw/caxLHX/56pCZrW2PoutBJbxWTgg=;
	b=Oe+wpnxnIOl1qIJb3BXM0KExHVzUbEloJD4AMqH7MFsqF/NjRwr/WiZgLY44qcnlLm
	l/zrvrKkU0dVYNZyhPWmtj3d2ri3jkxo6emONhAHT8qrKXQ8N/TSQtB7lN//YwTYrTEd
	iGmDZ2A43eLcmfQ0+j8a+spl08aaW0I/IFoio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=UORL8RocFmu8aqy28pl1KeAF8QdEEIx1wCtrLA2OIro+2aWM8JbpvvUZZnoqzMcw+A
	796sIkVEZg5V4mZK9vEnr90pAYsfFl2guDrExUQbn9FdiF6ytGzl9dN9sH9J1LGSKJCf
	1sx6i6hJ+/IQB//NCKTbCPaZaVYin7zVypOOg=
MIME-Version: 1.0
Received: by 10.223.113.3 with SMTP id y3mr508558fap.71.1234425803851; Thu, 12 
	Feb 2009 00:03:23 -0800 (PST)
Date: Thu, 12 Feb 2009 09:03:23 +0100
Message-ID: <ac9c93b10902120003sbbd2520rcaa70d7d4d9f02e8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: zope issue
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
X-List-Received-Date: Thu, 12 Feb 2009 08:04:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Yesterday I discovered that zope had its own outdated copy of twisted
(2.1.0), which got installed in /usr/lib/python2.6/twisted and
/usr/lib/python2.6/zope/app/twisted.
However this conflicted with the twisted pacakges (which are at 8.2.0)
and which got installed in /usr/lib/python2.6/site-packages/twisted.

Unfortunately the zope twisted was preferred by python, while a
pacakge like python-coherence needed a more recent version of twisted.
In order to fix it, I changed the zope recipe to remove the twisted
dirs upon install (based upon advice of Koen).

However, as I am not a python expert, I'd like to bring up the issue
here, in case there is a better solution.

FM.


