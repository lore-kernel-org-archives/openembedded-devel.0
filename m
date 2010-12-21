Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PV5d0-0001Op-MZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:03:58 +0100
Received: by fxm11 with SMTP id 11so4023888fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 09:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=tj9rpyUxpX04BaurAS//nUN9/OCxD9HQf7hNgjnWBvw=;
	b=eEp44mqG5bBSSXMJ0gP7wwkFkF8zDT+LGlOz+9bo9AYvwlkmZnhkwaUGLcLUZVlznf
	LqscuezEvhBy222fFzEkSiAqnqlm40zarHa/uYGYsDjL+URIq6ny9T27MecCnmUPZTy7
	+0SJgpvbfCbMpMlrGBG0Ir//QRINrw5Bx45HU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BFab+Lr5Q2Dug9wko3vIgLcEn4XzC1ATETcDMsMXiKksp1fc7op9JQKGa6BwtyymUN
	Cw+fViPDJXV+IQGbGNaELF8DUJXycPBn8PCeSj4XFiC///9egXtVf4IoqEy8UYFJ3+6N
	Cr4rx88PiTe9nr5gGCkhXVcOH2zd15yV2gmFQ=
Received: by 10.223.96.200 with SMTP id i8mr3537681fan.76.1292951028944;
	Tue, 21 Dec 2010 09:03:48 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id k6sm1399118faa.6.2010.12.21.09.03.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 09:03:47 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PV5cn-0004qO-GA; Tue, 21 Dec 2010 18:03:45 +0100
Date: Tue, 21 Dec 2010 18:03:45 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20101221170345.GA25803@mx.loc>
References: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
	<1291230954-31990-3-git-send-email-rep.dot.nop@gmail.com>
	<4D10ADEF.7070009@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D10ADEF.7070009@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] e2fsprogs: fix alternatives of non-packaged native sysroot
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
X-List-Received-Date: Tue, 21 Dec 2010 17:03:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 21, 2010 at 02:38:55PM +0100, Andreas Oberritter wrote:
>Hello Bernhard,
>
>On 12/01/2010 08:15 PM, Bernhard Reutner-Fischer wrote:
>> +do_install_append_pn-e2fsprogs () {
>> +	for f in e2fsck mke2fs; do
>> +		mv ${D}${base_sbindir}/$f ${D}${base_sbindir}/$f.${PN}
>> +	done
>> +	for f in chattr; do
>> +		mv ${D}${bindir}/$f ${D}${bindir}/$f.${PN}
>> +	done
>> +	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
>> +	for e in $fsck;do
>> +		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
>
>this doesn't work with dash. I had to split it into two seperate lines:
>
>rm ${D}${base_sbindir}/fsck$e
>rm ${D}${base_sbindir}/mkfs$e
>
>> +		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
>> +		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
>
>These two symlinks don't seem to make sense to me. I think this would be
>right:
>
>ln -sf e2fsck.${PN} ${D}${base_sbindir}/fsck$e.${PN}
>ln -sf mke2fs.${PN} ${D}${base_sbindir}/mkfs$e.${PN}
>
>Do you agree?

drats, not sure how i managed to goof that!
You are absolutely right, of course, let me double-check a build with
these fixed.


