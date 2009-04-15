Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lu5ID-0006tm-05
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 15:36:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 02B02140972D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:34:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7C2QGISIFuv
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:34:39 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id CEE361416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:34:39 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1239800506.21612.79.camel@hammer.suse.cz>
References: <200904151633.49146.khimov@altell.ru>
	<1239800506.21612.79.camel@hammer.suse.cz>
Date: Wed, 15 Apr 2009 15:32:56 +0200
Message-Id: <1239802376.21612.91.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 13:36:47 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Stanislav Brabec wrote:

> >Next thing is 'libexec' dir. I propose to set it to point to libdir an=
d be=20
> >done with that

This is bad, because it forces duplicating of all libexec binaries in
the system.

Imagine that you have a library libfoo for both archs:
/usr/lib/libfoo.so.0 (32 bit)
/usr/lib64/libfoo.so.0 (64 bit)

Now your library needs to call binary ${libexecdir}/libfoo-helper.

If you set libexec to libdir, then you are forced to package libfoo
helper twice. Both do _exactly_ the same:
/usr/lib/libfoo-helper (32 bit instance for 32 bit library)
/usr/lib64/libfoo-helper (64 bit instance for 64 bit library)

libexecdir pointing to prefix/lib is much better:
/usr/lib/libfoo-helper (64 bit instance for both libraries)

Both 32 bit and 64 bit libfoo will use this helper.

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



