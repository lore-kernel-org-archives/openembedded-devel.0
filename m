Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bart.staal@gmail.com>) id 1LvBqP-00041d-Pn
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 16:48:37 +0200
Received: by bwz19 with SMTP id 19so1257240bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2009 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=1j+Vd9fjv7MBAfQEowIBkj6EdqeDXtDyZUUGx1q10M0=;
	b=EoLq7SMCU0Lb/+WIaZoOIyw/UjRxjIfUrQKdv+/8ki8+o1v06Jw/yRxmhxCKUc6qd1
	LeaIbBbL1YiY7YtoeKu7jPQb8IYfTh4O9lBdg1QKEKkT5LVoyFKrIuv52KdnyXpQkzBN
	tc/b1FZR3wqbih4C1jhtkvwzawIYowqwHRUQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EJBIj5XMvDm06/+lSPK3XrOudzq3rszeWZXo+DcGR85k55xP2WU7cAIzo2KTmQHts5
	wcmq3tzeqM/yaWwc5AbZQMddRwPjLu31ODaijnIb8xL8zM/Tu3Vv9bHuzQPCvuzonQBf
	6qLZg1ncw/5ewZnLG7iMuuMo8wLO1Kn0CGFG8=
MIME-Version: 1.0
Received: by 10.204.61.137 with SMTP id t9mr3417240bkh.204.1240065869308; Sat, 
	18 Apr 2009 07:44:29 -0700 (PDT)
Date: Sat, 18 Apr 2009 16:44:29 +0200
Message-ID: <c15f914f0904180744m137b82c5r552a3b8431954165@mail.gmail.com>
From: Bart Staal <bart.staal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Building python without downloading dependencies for all modules
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
X-List-Received-Date: Sat, 18 Apr 2009 14:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello

I'm a relative new guy to the OE world, but I fairly managed to find
my way through it and build images for my NAS (ch3snas).

I want to equip my NAS with the python interpreter. If I 'bitbake
python' a big nasty list of dependencies is pulled from the net, eg
x11 headers, sqlite, openssl, tcltk, etc, etc. Calling 'bitbake
python-core' doesn't work, but I now I understand that this package is
created if the python recipe is built.

I'd like to have a way to only download/build the core python stuff,
with only a few modules which I really need. Is there a way to achieve
this with the existing python recipes in the OE repository or should I
create my own python recipes?

Thanks in advance,
Bart

(PS: Not sure whether I'm posting in the right list, but
openembedded-users seems to going to be abandoned:
http://lists.linuxtogo.org/pipermail/openembedded-users/2009-March/000978.html)


