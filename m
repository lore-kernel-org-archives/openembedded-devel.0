Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NDXJW-0006BP-4g
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 06:54:49 +0100
Received: by pzk30 with SMTP id 30so320180pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 21:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Vw/6MC6/Mb8c7Z4C0zH72wwzHa4WYxN/GM/U5RIsmhU=;
	b=Fh4rRwhJ4CCrA3N+8pd9UVj5KwfU7W+0tHgfXGKKeDFL0kCBwMMYKh6rstRqZrljKo
	AGGnAWVVO/MpZ9aKxg9KAnp6GQVuUN0oNhitBASOtJQLefI/+oM+icH/eWMKnBCBEeba
	obD3ZmMGJxdtfW3ZKo5nK+xG+gOKDdFGoh3x4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZBEuBFb2Wo4NeIeItvWGYyZ2qRnvbuBNuVwL2nnL2/ECslkkK7EaqqimZjovqwZK1P
	IlbMlRx0AwF2mIpzhB+sPXGQ3YQiN7hCJaqxNdRYUZ+9Ila6zPHPO/NkyC+eQo7ITaeL
	Qt+w+MeiO7b6jWO3W12EJaiG2Uw4nE7FRQ0Lo=
MIME-Version: 1.0
Received: by 10.141.28.16 with SMTP id f16mr488404rvj.109.1259214795050; Wed, 
	25 Nov 2009 21:53:15 -0800 (PST)
In-Reply-To: <1258973177.23826.231.camel@mill.internal.reciva.com>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
	<1258973177.23826.231.camel@mill.internal.reciva.com>
Date: Thu, 26 Nov 2009 11:23:15 +0530
Message-ID: <ec1f3d400911252153n2cdcd3f5vb9bc29d3760bd623@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Thu, 26 Nov 2009 05:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
>
> The version you select here needs to match ${PV} from one of the
> available recipes in order to have any useful effect.  It looks like the
> magic string for 2008q1 (see gcc-csl-arm-2008q1.inc) would be:
>
> PREFERRED_VERSION_gcc-cross-initial = "4.2.3+csl-arm-2008q1-126"
>
> and likewise for the others.  As things stand, it appears that you are
> getting the regular gcc 4.2.4 selected and this one doesn't understand
> cortex-a9.
>
> If you wanted to try 2008q3 then that would be 4.3.2+csl-arm-2008q3-39.
>
>

Thanks Phil. My conf now reads like this -

PREFERRED_VERSION_gcc                    = "4.2.3+csl-arm-2008q1-126"
PREFERRED_VERSION_gcc-cross              = "4.2.3+csl-arm-2008q1-126"
PREFERRED_VERSION_gcc-cross-initial      = "4.2.3+csl-arm-2008q1-126"
PREFERRED_VERSION_gcc-cross-intermediate = "4.2.3+csl-arm-2008q1-126"
When i do a clean build , it fails at gcc-cross-initial do_compile task.
This is the log-

********************************************
| + cd
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.3+csl-arm-2008q1-126-r5/gcc-4.2/build.i686-linux.arm-angstrom-linux-gnueabi
| + do_compile
| + ln -sf
'/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib/crt*.o'
/home/raghu/opendistro/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/lib/
| ln: target
`/home/raghu/opendistro/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/lib/'
is not a directory: No such file or directory
NOTE: Task failed:
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.3+csl-arm-2008q1-126-r5/temp/log.do_compile.8147
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/raghu/opendistro/openembedded/recipes/gcc/
gcc-cross-initial_csl-arm-2008q1.bb do_compile failed
ERROR: Task 2484 (/home/raghu/opendistro/openembedded/recipes/gcc/
gcc-cross-initial_csl-arm-2008q1.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 262 tasks of which 0 didn't need to be rerun
and 1 failed.
ERROR: '/home/raghu/opendistro/openembedded/recipes/gcc/
gcc-cross-initial_csl-arm-2008q1.bb' failed
********************************************

OE is trying to make a link but the directory is missing. Any ideas ? My
binutils was built fine with version 2.18.50.0.7

--RK

