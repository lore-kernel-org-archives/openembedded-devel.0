Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lc3VS-0006Ec-Lz
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 21:03:54 +0100
Received: by fxm11 with SMTP id 11so2919832fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 12:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=UzXMwNgCqk13JQBdkJlEPu97ahydeimDlS9mkB8j8T0=;
	b=iCe1MaYuEtcWJG4UsbywRPumjOhCy5hnW2uder5FnD0bIwnB+FyTYzxvBE73C2WdZl
	wdjE2pEp8pmz/2bOaIfffliB9+dyLJt5YBK7krpXhr251obRZdzb9WjjDvLI8BS3vn/q
	9V/OBwp0/IJJD4pIWpWFlg4VlRH25Ov51156k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=R95vIAr7FNbZNys/imkOdIMVhmuO40kv7SqeGYQWvPm9nCv6Osg0GNejfPFE8VcRbG
	dD+KI/lG+zNgamqeRRT/YEKcn5sWQGDDfXYa4AEqzOgH1W3dB42YQkBx1nTaQh3HT1eD
	La0WAPHPQzlMjrUbjkCQM2zS+FiCl3vjlWC30=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr41288far.74.1235505649085; Tue, 
	24 Feb 2009 12:00:49 -0800 (PST)
Date: Tue, 24 Feb 2009 21:00:49 +0100
Message-ID: <ac9c93b10902241200k3aa643a7w7f9a3cb8a2cf538c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 20:03:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Personally I feel the check that the src has not changed under our
fingers valuable, but I admit that adding the checksums is cumbersome.

Can't we automate this one way or another. E.g. if a .bb file is
checked in it is processed and the checksum is automatically added.
This could be done at server side or client side.
Or maybe harvest new checksums at regular intervals (e.g. from tinderbox).
Of course something should also be done in case a SRCREV changes.

FM.


