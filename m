Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 300A0737F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 00:37:55 +0000 (UTC)
Received: by igau2 with SMTP id u2so50597237iga.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=CmGSBbSKfuUkn68jXsWC1ZROkP+hLpBZlkcxs2hQYTs=;
	b=JNya0EACPJm4tuHYHtXsfBgsbrDFCRnGSxCQzjmqFucx1g5OyvOTmAya+iM3hGxJvP
	ctLrZNAWZC0rLUrkzbGH09nhRhrDdi4FLeTnF7ZoS3ZC75NSYMIpgPI7/QeBBu8Yz8Ww
	/005SAWA0aEsKVhAo+3btptGnj9iB0j0CPYPcYIKH8dsyI5m6MLnjqJB0GgzaRzUHHCS
	mLml7gjVFcVxtjan7yO4pukwqN1nANqqVohQN59R8bLvAiW/5ZyczGweCDXLpC0R7wmq
	bTKTuK/ynb91M4Tb2n6bRboWsOftIERRRDxA/a68S1Jw1BNXk0MV9i8/j9PwVDkuVrbj
	u0RQ==
X-Received: by 10.50.87.38 with SMTP id u6mr83652531igz.39.1436315875438; Tue,
	07 Jul 2015 17:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Tue, 7 Jul 2015 17:37:25 -0700 (PDT)
In-Reply-To: <CAK8F28m5vLYeFR1icyRiYfdX4uzvrLZ8V-s6=5hZEcMWCMBrBA@mail.gmail.com>
References: <CAK8F28m5vLYeFR1icyRiYfdX4uzvrLZ8V-s6=5hZEcMWCMBrBA@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 7 Jul 2015 17:37:25 -0700
Message-ID: <CAK8F28mfvDH4DGRMPkN3f4M5R_B8+9sxxxoUJe-=2rY9rpJLOw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: SSL Certificate Path for Python
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jul 2015 00:37:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I did a little more digging---the issue is not so much related to
python as it is a difference in configuration between the
ca-certificates and openssl packages.

SSL certificates provided by the ca-certificates package are installed
to /usr/share/ca-certificates/mozilla and then symlinked to the
standard /etc/ssl/certs (controlled by ETCCERTSDIR) as a post-install.

OpenSSL gets built expecting that certificates will be stored at
/usr/lib/ssl/certs (check the 'openssldir' compiled in using 'openssl
version -d')---a standard but empty directory.  This means we get
verification failures for anything using openssl that doesn't
explicitly provide a set of valid certificates.  In my case, this is
breaking the Smart package manager when using a repository at a
'https' URL (the certificate is valid).

Debian solves this by symlinking the whole /usr/lib/ssl to /etc/ssl/
as a postinstall step on the openssl package.  I added this in a
similar fashion in a bbappend for testing:
do_install_append() {
    rm -r ${D}${libdir}/ssl/certs
    ln -sf /etc/ssl/certs ${D}${libdir}/ssl/certs
}

Does this seem like a reasonable approach?  Another approach could be
setting the SSL_CERT_DIR to /etc/ssl/certs in .profile (or similar).

--Ash

On Mon, Jul 6, 2015 at 5:16 PM, Ash Charles <ashcharles@gmail.com> wrote:
> Hi,
>
> With the move from python 2.7.3 (dizzy) to 2.7.9 (fido), Python
> actually validates SSL-transport for https URLs [1].  Python, by
> default (i.e. no environment variable SSL_CERT_DIR set), looks for
> certificates at '/usr/lib/ssl/certs'.  I tested this in a Python
> shell:
> import ssl
> ssl.get_default_verify_paths()
>
> The ca-certificates recipe seems to be installing certificates to
> ${D}${sysconfdir}/ssl/certs or /usr/share/ca-certificates/mozilla/
> instead.  I think that Python will need a way to find the system's
> certificates.  I can create a patch to do this but this seems to
> couple the configuration in the ca-certificates and python recipes.
>
> Has anyone stumbled across this issue?  Is there a standard way of
> looking up where a system is storing its certificates?
>
> [1] https://www.python.org/dev/peps/pep-0476/
>
> Thanks for any insights---I'm learning much more about SSL
> certificates than I expected today ;-).
>
> --Ash

