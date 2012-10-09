Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TLZEk-0000Yi-Ti
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:48:39 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so3129394eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 05:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9hs13kgEmWpZxMJYPETIRzpk0Div+9Gj3rGFac9AwqA=;
	b=WXmyGdTdZfI2Xt1UbVhpBBSc3Y8kfOhGyL8hRc6uZDOy/gsqGRDxKdUktSpkkjIFj+
	GEt1jpM9nzOsG7cwXL8MJmhu+X03P7Y5qz12cegynMEKrDM36wCPoJCsSN6rRLbd+alo
	bTZlL9v22eonN+wIABzKWsgS78bw4CPwrIOmZk30jt8q67YqG1a5QbjqYN8gd9pn3+bP
	OGC7XFzuTP6BgWxb5GQJQ5TiCzWcRUzn37WeQNR+CKxmtWjFUUDgOO1Iuy6t+Rr1qtes
	fpCok41YnEb84RjhPQ18wcBu//P7DCPzt3FpR3Gz6lFwGOC6qpBdEX0fQqYCQgq964qs
	VcGg==
Received: by 10.14.223.199 with SMTP id v47mr568846eep.45.1349786131397;
	Tue, 09 Oct 2012 05:35:31 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id x8sm13536526een.13.2012.10.09.05.35.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 05:35:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2982314.ddUisfMeTu@helios>
Date: Tue, 9 Oct 2012 14:35:25 +0200
Message-Id: <43479E7D-B727-4070-A602-53B79EB5683F@dominion.thruhere.net>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
	<438b1be4a4a437a034365729a873964b7e44d0e8.1349608252.git.paul.eggleton@linux.intel.com>
	<k51502$he4$1@ger.gmane.org> <2982314.ddUisfMeTu@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQlQ9afVVE2sg8x3FnODxc2LnFZsc754FzyX440yd7fMpmgVb4z9mL1wkLd5XUmVoEiWkoq1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 1/3] apache2: fix configuration
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
X-List-Received-Date: Tue, 09 Oct 2012 12:48:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 okt. 2012, om 14:30 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Tuesday 09 October 2012 14:23:43 Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> Op 07-10-12 13:13, Paul Eggleton schreef:
>>> * Include conf files in /etc/apache2/modules.d and conf.d * Add -D =
PHP5
>>> to options so that PHP is enabled if installed * Fix "reload" action =
in
>>> initscript
>>>=20
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>=20
>> This is more likely related to your previous patch, but:
>> | /bin/sh:
>> =
/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-=
li
>> =
nux-gnueabi/apr-1.4.6-r1/apr-1.4.6/arm-angstrom-linux-gnueabi-libtool: =
No
>> such file or directory
>>=20
>> | make[3]: *** [unixd.lo] Error 127
>> | make[3]: Leaving directory
>>=20
>> =
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom=
-l
>> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory
>>=20
>> =
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom=
-l
>> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>>=20
>> =
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom=
-l
>> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os'
>> | make: *** [all-recursive] Error 1
>> | ERROR: oe_runmake failed
>> | ERROR: Function failed: do_compile (see
>>=20
>> =
/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-=
li
>> nux-gnueabi/apache2-2.4.2-r1/temp/log.do_compile.591 for further
>> information)
>> ERROR: Task 6
>> =
(/OE/tentacle/sources/meta-openembedded/meta-webserver/recipes-httpd/apach=
e2
>> /apache2_2.4.2.bb, do_compile) failed with exit code '1'
>=20
> I'm guessing you are using rm_work? Obviously it's not supposed to be=20=

> referring to anything in the WORKDIR for another recipe, but it would =
at least=20
> explain why I did not see that failure here.

I am indeed using rm_work.=


