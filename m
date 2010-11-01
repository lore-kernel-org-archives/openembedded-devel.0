Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCyJU-0001ZB-Un
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 18:37:29 +0100
Received: by gxk26 with SMTP id 26so2029831gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XPXG6LsMmblFpTHMvLNFIolhqfXPOuMX+4ypviF02Yo=;
	b=U2ZPSj+nblsdv2GEP0XxsVOXGGxKV1rWgwQflJVtW7a54eDyYIDtnvvhDJRnP4sPjJ
	pDVWyT/GchkoQ+w12PaUSeD6cI7FBq6wYvG+Vo+T0gUFLl4i9e0WIC67H9upxy1fGyZH
	oizZxySMdk31dc0OahRK58cYb7x259rpa5PJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tiPZkrN+iTQzdgLYVxx1ivEfx4GpA06tAEjbdnT6zOiXM5Otdexn5o6m/kjKNNKcnb
	PwObV6vg1Q5AMZxx0WoL6YTh0DqVQDdhuU8Q5dQ3CQslE0TeGvLIhvmVcLcRVa8KBjss
	0tMVfdNdYxZQkjCDWslCg2+acUo28pJfTejtQ=
Received: by 10.90.5.4 with SMTP id 4mr25217age.155.1288632967367; Mon, 01 Nov
	2010 10:36:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 10:35:44 -0700 (PDT)
In-Reply-To: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 10:35:44 -0700
Message-ID: <AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Mon, 01 Nov 2010 17:37:31 -0000
X-List-Received-Date: Mon, 01 Nov 2010 17:37:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 10:03 AM, Zach Frey <zach@znfrey.com> wrote:
> Hi everyone,
>
> I'm trying to build angstrom-gnome-image with latest for omapzoom2 (on
> Ubuntu 8.04) and I'm getting the following error:

Are you using angstrom-2010 ? in that case you might want to
regenerate configure
as well as libtool scripts.

>
> | Making all in services
> | make[2]: Entering directory
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/syste=
m-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/services'
> | cd .. && \
> | =C2=A0 =C2=A0 =C2=A0 /bin/sh
> /home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system=
-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/missing
> --run automake-1.7 --gnu =C2=A0services/Makefile
> | configure.in:8: version mismatch. =C2=A0This is Automake 1.7.9,
> | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> | configure.in:8: comes from Automake 1.11.1. =C2=A0You should recreate
> | configure.in:8: aclocal.m4 with aclocal and run automake again.
> | make[2]: *** [Makefile.in] Error 1
> | make[2]: Leaving directory
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/syste=
m-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/services'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/syste=
m-tools-backends-2.10.1-r0/system-tools-backends-2.10.1'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package system-tools-backends-2.10.1-r0: task do_compile: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/PHOENIX/frey/OE/openembedded/recipes/gnome/
> system-tools-backends_2.10.1.bb do_compile failed
> ERROR: Task 2237 (/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
> system-tools-backends_2.10.1.bb, do_compile) failed with 256
> ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
> system-tools-backends_2.10.1.bb' failed
> ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
> system-tools-backends_2.10.1.bb' failed
>
>
> Ideas?
>
> Thanks,
> Zach Frey
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


