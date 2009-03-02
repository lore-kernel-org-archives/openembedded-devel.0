Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LeEBU-0000hI-SD
	for openembedded-devel@openembedded.org; Mon, 02 Mar 2009 20:52:55 +0100
Received: by fk-out-0910.google.com with SMTP id f40so958214fka.12
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Mar 2009 11:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=TNul1wto8niYa9X4dHDHglYrl23bufDVwrXO52j4Ehk=;
	b=Y2gWgdN0PgeBwTA0wrg8Ef/Lk5jYTOqD0sBre/7QDH3aXt5MZ4bAriQhupeD8al5+Z
	dpBX9yauzmBedkosqi/OREWD/LOAkwAvnhuZ/svp1sqvUBzdCE0Z2SOvc822YV0u5x4z
	ueKgljFcgzn1QXzyZWM9jIrtcriWmmBRV7cK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=K//1As98uH90539vBoh/ugrQyllZs1pYJbkibBcpQgh0TTioO0YNyGFMkGHqRcpRzC
	paLpjG5d9OPBlyDOSfr6mTi37rH60MSv3DurZ48GzuEYFzxw115DoYvPK+GzgGlh5N3M
	8+Xxjd3oMeo2nVILat6cm3Fw8sXHNUWz5kLLY=
MIME-Version: 1.0
Received: by 10.223.116.205 with SMTP id n13mr6269450faq.103.1236023301062; 
	Mon, 02 Mar 2009 11:48:21 -0800 (PST)
Date: Mon, 2 Mar 2009 20:48:21 +0100
Message-ID: <ac9c93b10903021148v423481c1v4c9a39ba762a984a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@openembedded.org
Subject: improved/extended bitbake -c clean ?
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
X-List-Received-Date: Mon, 02 Mar 2009 19:53:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Not sure if others have the same problem, but sometimes I have the
need to edit in the work dir of a package. Especially if a package
does not function as expected or does not build this can be handy.
Typically what I then do is remove all stamps from compile onwards.

However, it would be convenient if there is a way to tell to bitbake
to remove e.g. the stamp for a step and all later stamps.
E.g. something like bitbake -c clean:compile

What do others feel about this?

Frans.

PS: I cannot implement this myself as I do not speak pythonese, so if
someone wants to give this a stab (assuming we want this) that would
be nice.


