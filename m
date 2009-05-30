Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAX3s-0003QA-4z
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:29:56 +0200
Received: by an-out-0708.google.com with SMTP id b6so3725455ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 15:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=XTemil46APcivfYYcrfD4VQlp2ZI7r/0H2c8HzQ0+S8=;
	b=FcIl+0nBwbEgCeA/354DIbK+kmazATKV7sD46nyaATi0C7vOQJrZQVSchYJSDl6N9h
	7WMJwVqTmWFCmp92cx+v35pzwVOEu5Q3m38ga/EBq+sI8WUR7SgCHAvpSypk78DxxBwt
	d7PVweruUddcL3KMFx6zaZHaDJas3ifXg8zvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=RE3ajP4a/JplbYvX0S6mcYR8sNPWe7zo4UIiyEXQxDmchbdS+GNZ5GuL1LakB3SEQ/
	mEEEWgM1X/jTnAURWsgbop9bvaAxrqg8pk1wdfcxe7pQK6oSZ3dwYjFK1U4kB12317Y2
	sauL6MjNy+5UaMjI6CmLgYLOlaxqDcxzZFTAY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.125.14 with SMTP id x14mr5372018anc.136.1243722081814; 
	Sat, 30 May 2009 15:21:21 -0700 (PDT)
In-Reply-To: <gvs7m5$3ha$4@ger.gmane.org>
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
	<20090528193604.GB2625@denix.org> <4A1EF22E.2040500@balister.org>
	<4A1EF581.30503@cbnco.com> <loom.20090530T193103-897@post.gmane.org>
	<gvs7m5$3ha$4@ger.gmane.org>
Date: Sat, 30 May 2009 19:21:21 -0300
X-Google-Sender-Auth: dc8c1ea2d57b8816
Message-ID: <be7a9f3d0905301521q4b0f6581g4d3a655bd7e9880@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/2] tcpdump: fix mix of tabs and spaces in do_configure()
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
X-List-Received-Date: Sat, 30 May 2009 22:29:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen,

On Sat, May 30, 2009 at 6:15 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Ignore git-am "errors" about whitespace. If I add a patch to a recipe and do
> git format-patch in that commit (so you get a patch in a patch) git-am will
> scream bloody murder for something that has no actual whitespace errors.
> I suspect that the only time you can trust git output is when your name is
> Linus and work on kernel code.

Well, not 100% true.

Basically when you're adding patch files this is really possible to
have warnings that cannot be solved, mostly because the patch itself
also has context of the code on it. However, in case those warnings
come from your bb files, classes, conf, ini or whatever, it would be
nice to be checked and fixed before pushing it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


