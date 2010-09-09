Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sladedals@gmail.com>) id 1OtiYf-0005w1-3e
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:57:02 +0200
Received: by pwi10 with SMTP id 10so130434pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YcqH+jBXfMbHv8gtdhSU2m5GZ3yka9fJeEI1K/Q78ck=;
	b=RLZtpBktj5Jtz/8dPDk0baNbK51mGkNqtofw59yaimh0UfQrvvJFjAXpTiy6zMjhKV
	HVedfizuEmbGxf1ZusMBE4yCXXMTv9v3csXthLymV97doC35VpA4/kbHcBklG3aR6ag0
	6K7G1s106usuVoUxkg3U4RC6xMy5k+l9chwOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=FuV9NF3XeSt1lItl2aJcPpacj77wIM/ebyeKep9Wl8oBr+NOCpT7MyaKOBLWF3Rd5b
	+3pSRU9e3C5WKfqEyb92qZYoqqTtT392Uyw99/rPqFUBjlxldu7/UC11o6KUell8aCWD
	48apW4wz5ukVa9ggMxcErKwN6sdtLIY8KAaPg=
Received: by 10.114.109.8 with SMTP id h8mr64498wac.135.1284044170625; Thu, 09
	Sep 2010 07:56:10 -0700 (PDT)
MIME-Version: 1.0
Sender: sladedals@gmail.com
Received: by 10.42.6.68 with HTTP; Thu, 9 Sep 2010 07:55:50 -0700 (PDT)
In-Reply-To: <1283903199-24538-2-git-send-email-eric@eukrea.com>
References: <1283903199-24538-1-git-send-email-eric@eukrea.com>
	<1283903199-24538-2-git-send-email-eric@eukrea.com>
From: cdric julien <c.dricjulien@gmail.com>
Date: Thu, 9 Sep 2010 16:55:50 +0200
X-Google-Sender-Auth: z0wmddFmOXjYuuEhJ68unDFtZiM
Message-ID: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: sladedals@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] python-2.6: remove python-distutils from python-modules
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
X-List-Received-Date: Thu, 09 Sep 2010 14:57:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Be careful, this module is needed to install python modules on target via
the "python setup.py install" method. If removed, some python packages won'=
t
install anymore...
If you want to gain space on target, there are a few wininst*.exe in
distutils/command directory that could be removed and the "config" director=
y
which contains libpython2.6.a (2.1Mo) is really useless.


2010/9/8 Eric B=E9nard <eric@eukrea.com>

> this module seems only needed for development. No installing it with
> python-modules saves 6MB on the image.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes/python/python-2.6-manifest.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/python/python-2.6-manifest.inc
> b/recipes/python/python-2.6-manifest.inc
> index eec9f22..ff54d36 100644
> --- a/recipes/python/python-2.6-manifest.inc
> +++ b/recipes/python/python-2.6-manifest.inc
> @@ -266,7 +266,7 @@ RDEPENDS_python-audio=3D"python-core"
>  FILES_python-audio=3D"${libdir}/python2.6/wave.* ${libdir}/python2.6/chu=
nk.*
> ${libdir}/python2.6/sndhdr.* ${libdir}/python2.6/lib-dynload/ossaudiodev.=
so
> ${libdir}/python2.6/lib-dynload/audioop.so "
>
>  DESCRIPTION_python-modules=3D"All Python modules"
> -RDEPENDS_python-modules=3D"python-profile python-threading python-distut=
ils
> python-doctest python-stringold python-codecs python-ctypes python-pickle
> python-datetime python-core python-io python-compiler python-compression
> python-re python-xmlrpc python-terminal python-email python-image
> python-tests python-resource python-json python-difflib python-math
> python-syslog python-hotshot python-unixadmin python-textutils
> python-tkinter python-gdbm python-elementtree python-fcntl python-netclie=
nt
> python-pprint python-netserver python-curses python-smtpd python-html
> python-readline python-subprocess python-pydoc python-logging python-mail=
box
> python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittes=
t
> python-multiprocessing python-robotparser python-compile python-debugger
> python-pkgutil python-shell python-bsddb python-numbers python-mmap
> python-zlib python-db python-crypt python-idle python-lang python-audio  =
"
> +RDEPENDS_python-modules=3D"python-profile python-threading python-doctes=
t
> python-stringold python-codecs python-ctypes python-pickle python-datetim=
e
> python-core python-io python-compiler python-compression python-re
> python-xmlrpc python-terminal python-email python-image python-tests
> python-resource python-json python-difflib python-math python-syslog
> python-hotshot python-unixadmin python-textutils python-tkinter python-gd=
bm
> python-elementtree python-fcntl python-netclient python-pprint
> python-netserver python-curses python-smtpd python-html python-readline
> python-subprocess python-pydoc python-logging python-mailbox python-xml
> python-mime python-sqlite3 python-sqlite3-tests python-unittest
> python-multiprocessing python-robotparser python-compile python-debugger
> python-pkgutil python-shell python-bsddb python-numbers python-mmap
> python-zlib python-db python-crypt python-idle python-lang python-audio  =
"
>  ALLOW_EMPTY_python-modules =3D "1"
>
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
C.dric JULIEN
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Always code as if the guy who ends up maintaining your code will be a
violent psychopath who knows where you live

