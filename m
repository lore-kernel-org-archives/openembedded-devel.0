Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTumO-0006Wc-EG
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 12:16:48 +0100
Received: by iwn8 with SMTP id 8so1732753iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 03:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=rdTBxea/yOWSGqk5iP6Ou4I2JwK8mx46zNNNKxe2MHE=;
	b=MQkS2/wOnty43VF0BYi3ejZ3oFbkmpUIcaw1TWFHAjo9naxVO38osBVO8nrvxa564U
	QcOS0FYjOUxDbuEjPuN+Gy6/dPF+GfjM81oReVbHHmSKsFX320JOEyhiNkD7Zm/hKY8Y
	ZAjrEQh4gO9x6dib8z356ENVRbzMuHAwZtwV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=m2YZSsEnUbxT69hIAKMpNgUebPi2Wjvxv6Fj/iK5X729hI2tYMlG+60hjVNTA3h5i8
	zGKDI+7B7987fwkyUAuR4HTLIEww2begoLiJ1DjO04B0f5B3tAS51oPmaNYxngeT/1+D
	ytG7pZgDrKRW4e1TLr8MLspRSq4uuR3xH23aM=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr1884843ibv.32.1292671003559; Sat,
	18 Dec 2010 03:16:43 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 03:16:43 -0800 (PST)
Date: Sat, 18 Dec 2010 12:16:43 +0100
Message-ID: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: bitbake-dev@lists.berlios.de
Cc: openembedded-devel@lists.openembedded.org
Subject: bitbake git head issue
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
X-List-Received-Date: Sat, 18 Dec 2010 11:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

If I use bitbake git head I get:

frans@linux-suse:~/oe/openembedded> bitbake james-image
Process ProcessServer-1:
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in _bootstrap
    self.run()
  File "/home/frans/oe/bitbake/lib/bb/server/process.py", line 95, in run
    [NULL, NULL, NULL]):
  File "/usr/lib/python2.6/contextlib.py", line 16, in __enter__
    return self.gen.next()
  File "/home/frans/oe/bitbake/lib/bb/utils.py", line 805, in redirected_fds
    old_fds.append(os.dup(fd))
OSError: [Errno 9] Bad file descriptor

I did not fully bisect it but rev
144887553097a288a76b8de78f71548d5ef9a350 still works fine with me.
The problem seems to be introduced in one of the next 5 or so commits
after that one.

Frans.


