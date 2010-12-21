Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PV2O1-00086l-9F
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 14:36:17 +0100
Received: by fxm11 with SMTP id 11so3802937fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 05:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=RGQXxFC/ejq5KY9dk+bY4ZBR/bV2+XP0sq191wnrR14=;
	b=jNV6pBGSqjlB57wUbnssNcsTN9C/IwgOUBDL0M/s+UkKTG4fHF9JG2rb/29eoy69br
	Uf95MuqCu68HnQcMZVvwCg06bhkzJC0ywy4f5soHTCDW0RLzTTDBUcCBrRap9oBg2Igw
	omar4eR9PS4KPZVk5rmMSStcBFquebP4JOsjE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=aSEg6Gf0JL5TPnPp77bPoGaDdVZ7TH+Slo2k7jX0qrS+i+YQ3Q2ye3u+R6dPlcwr+X
	jjRgHarl31oXAVcnSg2xzCZlqaipJgIvTrViMtG4sTL9h2BKFvwCBU+dXeS3JHJfXWG9
	Uygc4oB2yTYu0KUEE9djIULRjyIiLEWurDgek=
Received: by 10.223.83.138 with SMTP id f10mr4107254fal.1.1292938568559;
	Tue, 21 Dec 2010 05:36:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm1321892fav.17.2010.12.21.05.36.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 05:36:07 -0800 (PST)
Date: Tue, 21 Dec 2010 14:35:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221133550.GI3282@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: nail@nslu2-linux.org, tim.ellis@foonas.org
Subject: mesa depending on samba or samba depending on extern talloc?
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
X-List-Received-Date: Tue, 21 Dec 2010 13:36:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2010-10-20 I've pushed newer mesa-7.9
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=30a3ea891d4511059a51882674f33aff2dddb96e
which depends on talloc
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fabce288e40037d28c70f0f034185176f85e8664
and separate talloc recipe (because building whole samba just to provide talloc for mesa seems wrong
and samba produced ICE before khem's fix) 
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=afce52663d6b5b79c097136fa794dd3f76a4afff

Today I noticed, that usr/lib/pkgconfig/talloc.pc from talloc recipe was enough for mesa to compile, 
but because there was no libtalloc.so link it wasn't used in the end (as ldd confirms).

so talloc stages:
bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
-rwxr-xr-x 1 bitbake bitbake  32K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.a
-rwxr-xr-x 1 bitbake bitbake  73K Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.2.0.1
bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc
-rw-r--r-- 1 bitbake bitbake 251 Dec 21 13:30 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/pkgconfig/talloc.pc

samba adds:
bitbake@jama ~ $ ll tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.*
lrwxrwxrwx 1 bitbake bitbake   14 Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so -> libtalloc.so.1
-rwxr-xr-x 1 bitbake bitbake 123K Dec 14 13:33 tmpdir-shr/sysroots/armv4t-oe-linux-gnueabi/usr/lib/libtalloc.so.1

now for sure I don't want to install whole samba on target (just for libtalloc) so I have few options

1) fix talloc to install libtalloc.so -> libtalloc.so.2.0.1 (conflicts with samba in sysroot)
2a) move libtalloc to separate package in samba recipe and make mesa depending on samba
2b) move libtalloc to separate package in samba recipe in case someone builds 
    it before mesa, but still depend only on fixed talloc
3) fix talloc + force samba build to use already installed libtalloc instead of building own version

Option 3) looks best, but I'm not sure how tightly samba depends on talloc 
and don't have time to test all samba versions we currently have
(3.0.23c, 3.0.34, 3.2.15, 3.3.0, 3.3.9, 3.5.6), so 2b) looks as easier fix.

CCed 2 samba maintainers (wrt MAINTAINERS file) or if there is someone who cares about samba
recipes: can you clean recipes/samba a bit and provide some feedback on talloc issue?

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


