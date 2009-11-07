Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6s5S-00029C-6Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 21:40:45 +0100
Received: by bwz9 with SMTP id 9so2154405bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 12:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4iDhIQHP+o7OowOgBGv72/TUXlSnfH3te4/jya66lS8=;
	b=irgTBScLpkXO+bY8/TF3UcZkfUjWe+cdks9R0YhQZ6dqugL81F7lbmUULdAUnI5hFr
	wYM4GZ1uuRA0bEvfyAJnNgknOVdJxwQIaGC/cLGcZwxifD55iuZvmRgwwx/7jkuQkPy7
	udbrG7jQa2YQBczVu2BjR8UVyNEnwTkX4UEFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=pYeI3FodnghFiOnbCtmBfQqSVedq53fAbLTJJ+eWWg24ZhGeuqVe9AUwl8eziS+63W
	b+6k2qoPwvxZM1BaP99Zrhz1P9Mjz/gIZaC5s22Or0gEaJO4LO9bTjwGx2IQpt5CROOU
	kiN6dABBnqtgl2E2kkTfOyxr+0FCuO+2J0Kwg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.163.205 with SMTP id q13mr618074hbd.132.1257625999519; 
	Sat, 07 Nov 2009 12:33:19 -0800 (PST)
Date: Sat, 7 Nov 2009 18:33:19 -0200
X-Google-Sender-Auth: 4f823dcd5f4c659f
Message-ID: <be7a9f3d0911071233k6241f40jcee37bb9f2fca680@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Please review and pull, if possible, our current changes to bitbake
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
X-List-Received-Date: Sat, 07 Nov 2009 20:40:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

The following changes since commit 0bbcb946213f0a8940d9941ad50d6505bd1befcf:
  Chris Conroy (1):
        providers.py: Fix package sorting order to reflect priorities

are available in the git repository at:

  git://projetos.ossystems.com.br/git/uses/otavio/bitbake.git 1.10

Otavio Salvador (4):
      [fetch]: Refactor code to be easier to get supported SCMs (from
O.S. Systems)
      [fetch/git]: Refactor to allow checking if a revision is already
taken (from O.S. Systems)
      [fetch]: Extend the interface to allow SCMs to describe a
revision (from O.S. Systems)
      [fetch/git]: Add support to describe a revision

 lib/bb/fetch/__init__.py |   47 +++++++++++++++++++++++++++++++++------------
 lib/bb/fetch/git.py      |   41 ++++++++++++++++++++++++++++++++-------
 2 files changed, 67 insertions(+), 21 deletions(-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


