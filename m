Return-Path: <ashcharles@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA5F175CFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 18:25:23 +0000 (UTC)
Received: by ieru20 with SMTP id u20so17995490ier.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QQqF8pdsNdZlBiuxLi75Zss9nL3wlcnMbNwz5ME/5jk=;
	b=C2e2FZ/vWdsESHhExzqHfk6gvZhELvdU73DycVM1Y9nxf/lq7bKCFkVY9mCnkYWFoK
	md5Exdad9vnuEmk56zV4nZfo4KVMiC69uqs2ikweFibZmBWXq6BvAHXQE7hjDuuhK5K2
	Hrvs0lb12tfgELdAtYeYcKRo7PW8rk2l8NpNhB4uA5rsqSZVLVs6PSrEctLaI5gqNhL4
	29fdUOSW/Y81CpCWvMGwfjwut0gQiuQn4maET3s1aCfgjVTOqAPrjkM+In2V4Svxt+qD
	pk0HIiLPe6VL3mrpG/fdMy3YR/O+qZHQXx27eQX4poA0mBaEtwmBE4Uj/9+ifwFraVaI
	gluw==
X-Received: by 10.50.17.104 with SMTP id n8mr7032493igd.21.1436379923293; Wed,
	08 Jul 2015 11:25:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Wed, 8 Jul 2015 11:24:53 -0700 (PDT)
In-Reply-To: <CAK8F28mfvDH4DGRMPkN3f4M5R_B8+9sxxxoUJe-=2rY9rpJLOw@mail.gmail.com>
References: <CAK8F28m5vLYeFR1icyRiYfdX4uzvrLZ8V-s6=5hZEcMWCMBrBA@mail.gmail.com>
	<CAK8F28mfvDH4DGRMPkN3f4M5R_B8+9sxxxoUJe-=2rY9rpJLOw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 8 Jul 2015 11:24:53 -0700
Message-ID: <CAK8F28=Lo_yOSgrj6Ntszrh0KgR0bn7tPgSxiXv2BkcyC6NDcQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Jul 2015 18:25:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi

To follow up with one more piece of the puzzle: c_rehash.

With the suggested install_append in-place, openssl can find
certificates but they aren't indexed/hashed so aren't usable---the
c_rehash utility (from the openssl-misc package) needs to be called.
It looks like this would normally be done by the
update-ca-certificates script as part of the do_install step for the
ca-certificates package but it has been disabled by the
"0001-update-ca-certificates-remove-c-rehash.patch".  By disabling
this patch, c_rehash (albeit the host's version) runs and openssl is
able to verify correctly.

It looks like this patch has a long history [1,2, 3] from before 2009
when it was part of meta-shr (I think?) but I can't find the original
reason.  Anyone familiar with this?

Second: am I doing something wrong in my usage of OpenSSl? I started
debugging because the smart package manager couldn't use a package
repository at a https:// endpoint---a perhaps unusual use-case.  As
I've gone down the debugging rabbit hole though, it seems like SSL
basically shouldn't be working for any application relying on openssl
which makes me think either a) others are running into this or, more
likely, b) I'm doing something silly.

[1] https://git.congatec.com/yocto/meta-openembedded/blob/89500c583e0f1dc1b4ffdf72914e08e505e427e0/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
[2] http://lists.openembedded.org/pipermail/openembedded-devel/2011-April/077006.html
[3] https://github.com/openembedded/oe-core/blob/master/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch

--Ash

On Tue, Jul 7, 2015 at 5:37 PM, Ash Charles <ashcharles@gmail.com> wrote:
> Hi,
>
> I did a little more digging---the issue is not so much related to
> python as it is a difference in configuration between the
> ca-certificates and openssl packages.
>
> SSL certificates provided by the ca-certificates package are installed
> to /usr/share/ca-certificates/mozilla and then symlinked to the
> standard /etc/ssl/certs (controlled by ETCCERTSDIR) as a post-install.
>
> OpenSSL gets built expecting that certificates will be stored at
> /usr/lib/ssl/certs (check the 'openssldir' compiled in using 'openssl
> version -d')---a standard but empty directory.  This means we get
> verification failures for anything using openssl that doesn't
> explicitly provide a set of valid certificates.  In my case, this is
> breaking the Smart package manager when using a repository at a
> 'https' URL (the certificate is valid).
>
> Debian solves this by symlinking the whole /usr/lib/ssl to /etc/ssl/
> as a postinstall step on the openssl package.  I added this in a
> similar fashion in a bbappend for testing:
> do_install_append() {
>     rm -r ${D}${libdir}/ssl/certs
>     ln -sf /etc/ssl/certs ${D}${libdir}/ssl/certs
> }
>
> Does this seem like a reasonable approach?  Another approach could be
> setting the SSL_CERT_DIR to /etc/ssl/certs in .profile (or similar).
>
> --Ash
>
> On Mon, Jul 6, 2015 at 5:16 PM, Ash Charles <ashcharles@gmail.com> wrote:
>> Hi,
>>
>> With the move from python 2.7.3 (dizzy) to 2.7.9 (fido), Python
>> actually validates SSL-transport for https URLs [1].  Python, by
>> default (i.e. no environment variable SSL_CERT_DIR set), looks for
>> certificates at '/usr/lib/ssl/certs'.  I tested this in a Python
>> shell:
>> import ssl
>> ssl.get_default_verify_paths()
>>
>> The ca-certificates recipe seems to be installing certificates to
>> ${D}${sysconfdir}/ssl/certs or /usr/share/ca-certificates/mozilla/
>> instead.  I think that Python will need a way to find the system's
>> certificates.  I can create a patch to do this but this seems to
>> couple the configuration in the ca-certificates and python recipes.
>>
>> Has anyone stumbled across this issue?  Is there a standard way of
>> looking up where a system is storing its certificates?
>>
>> [1] https://www.python.org/dev/peps/pep-0476/
>>
>> Thanks for any insights---I'm learning much more about SSL
>> certificates than I expected today ;-).
>>
>> --Ash

