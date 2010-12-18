Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1PTxce-0006kX-OZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 15:18:57 +0100
Received: by qwg5 with SMTP id 5so1505810qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 06:18:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.87.13 with SMTP id u13mr1893095qcl.55.1292681932929; Sat,
	18 Dec 2010 06:18:52 -0800 (PST)
Received: by 10.220.178.72 with HTTP; Sat, 18 Dec 2010 06:18:52 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <AANLkTi=ptFSTuWbvkEAg+5EsLgyeBzWsrPYvr5TLf=PR@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTikT2Y14XM+-iKGpesPDfX4KDMz5B=4z7PCKXSya@mail.gmail.com>
	<AANLkTi=ptFSTuWbvkEAg+5EsLgyeBzWsrPYvr5TLf=PR@mail.gmail.com>
Date: Sat, 18 Dec 2010 09:18:52 -0500
Message-ID: <AANLkTinBWptJBBgLtsae9_80CdxwWTEP-L-hiCFzFWLC@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake git head issue
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
X-List-Received-Date: Sat, 18 Dec 2010 14:18:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 18, 2010 at 8:54 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/12/18 Robert Foerster <robert@erafx.com>:
> > On Sat, Dec 18, 2010 at 6:16 AM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> >> Hi,
> >>
> >> If I use bitbake git head I get:
> >>
> >> frans@linux-suse:~/oe/openembedded> bitbake james-image
> >> Process ProcessServer-1:
> >> Traceback (most recent call last):
> >>  File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in
> >> _bootstrap
> >>    self.run()
> >>  File "/home/frans/oe/bitbake/lib/bb/server/process.py", line 95, in run
> >>    [NULL, NULL, NULL]):
> >>  File "/usr/lib/python2.6/contextlib.py", line 16, in __enter__
> >>    return self.gen.next()
> >>  File "/home/frans/oe/bitbake/lib/bb/utils.py", line 805, in
> redirected_fds
> >>    old_fds.append(os.dup(fd))
> >> OSError: [Errno 9] Bad file descriptor
> >>
> >>
> > What's the status of /dev/null on your system?  ls -l /dev/null ?
> >
> > Bob
>
> crw-rw-rw- 1 root root 1, 3 Oct 24  2009 /dev/null
>
> Seems quite OK to me
>
>
Yea, that appears ok.  I've heard of various issues with dup when /dev/null
was read or write only, which isn't the case here.

