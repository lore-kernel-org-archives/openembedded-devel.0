Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oys8i-0003w5-Iz
	for openembedded-devel@openembedded.org; Thu, 23 Sep 2010 22:11:33 +0200
Received: by iwn2 with SMTP id 2so1725360iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Sep 2010 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=EtZt0zRPvoDb/XEt17VaoZAGxcO4k5URB7EJBCKjVh0=;
	b=Dpo/ueVU8+FtLggJq7o196UoGL+oqzT3i+hDvW4TTstCcxz7IeDVnpHyLcszJbnDaG
	qCj8814MQa1i2r+DVQParwfmw9UqLDLTu7l/hCmwAEb2YKcG5INaqHWlncJ0hiKhGFZV
	T1kDpcf0gLrrSiDnctkjT5m5Zv5/zu9JWFZK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qYp6nOFgoGxLsNStWJg2wUHOPJptWq9rjjKl16nrKF/sxXQjlBWfXD0JBp/OyVibP6
	zPpKUKeNXJHSiSk5MXu7X5SLHvxLGEO1QgN8d+hY5CnOl56eTFlqXvfRWMh9I/hnYDL2
	0VeJm54jMwLfbb/sePFSgqFOmdJKYvfIhFRxM=
MIME-Version: 1.0
Received: by 10.231.11.8 with SMTP id r8mr2356349ibr.135.1285272687033; Thu,
	23 Sep 2010 13:11:27 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 23 Sep 2010 13:11:26 -0700 (PDT)
Date: Thu, 23 Sep 2010 22:11:26 +0200
Message-ID: <AANLkTinzRQGe9CLG_n5g0sFG0NDdZBdU2RSL9KjgzokP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: git error ?
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
X-List-Received-Date: Thu, 23 Sep 2010 20:11:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hm,

On my latest git push I got:

frans@linux-suse:~/oe/openembedded> git push
Counting objects: 13, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 649 bytes, done.
Total 8 (delta 6), reused 0 (delta 0)
error: unable to create temporary sha1 filename : Read-only file system

fatal: failed to write object
error: unpack failed: unpack-objects abnormal exit
To git@git.openembedded.org:openembedded
 ! [remote rejected] org.openembedded.dev -> org.openembedded.dev (n/a
(unpacker error))
error: failed to push some refs to 'git@git.openembedded.org:openembedded'


No idea what is going on here, guess it is at the git side. My fs is not r/o

Frans


