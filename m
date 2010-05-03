Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O8tz9-0006VM-QM
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 13:38:55 +0200
Received: by fxm11 with SMTP id 11so1918531fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=pRSVHrO6Y+FTHt8fsrV4qr1uYQIV4LdzgGmzbG+dpO4=;
	b=wXZq0CgCJW2gEoMl6dTrWKNzLhKCRPy/mMXFuy2a8e/byMj5NjPfQL8e6z/6xjQV6k
	i3f9bYZOujLlme+98eXALqNHDlrC6rlZ9MzVtD2GZhu2rxiaFfSy/wgChGg46x115g83
	VJmTx9zpIPS4MnkV3TcbLtkgSxNELGRUIcCT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=APeOfAlNdFMWMy+BLk2A/xwLVsigz8wRJj1uXJIaHGgFyUsP+yL1czKN86PTHnwgt3
	90eoj7wtyBUGdJEdd2UIeoGTPAMY5C5vWXkPB/RJUEdO/Uq0ksjd1YpKJ7Iu8fnXBdgh
	oxPMRaDtu/OZK9rrXUHPfvZ1uVKh7qeeWpYBA=
Received: by 10.223.45.200 with SMTP id g8mr3263752faf.67.1272886505809;
	Mon, 03 May 2010 04:35:05 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p9sm8623022fkb.33.2010.05.03.04.35.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 May 2010 04:35:05 -0700 (PDT)
Date: Mon, 3 May 2010 13:35:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100503113525.GO7123@jama>
References: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
	<4BDE9E9D.9020003@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4BDE9E9D.9020003@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: cleanup all version
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
X-List-Received-Date: Mon, 03 May 2010 11:38:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 03, 2010 at 11:59:57AM +0200, Eric Bénard wrote:
> Hi Martin,

Hi Erir,

> Le 03/05/2010 11:40, Martin Jansa a écrit :
> >* I've prepared 1.5.18, but needs more love as few patches doesn't apply and I would like to
> >   convert all to new staging (don't know how to install to cross with native install).
> >   And please comment about Kbuild/all_headers staging and include/asm link.

> I sent updated patches for 1.5.17 :
> http://patchwork.openembedded.org/patch/1968/

Ah great, sorry that I didn't notice it before, looks good and compiles
fine here, but do_stage fails, probably because 1.5.17 doesn't use staging.patch,
can you please check why you removed that?

ERROR: Logfile of failure stored in: /OE/tmpdir-dev/work/spitz-angstrom-linux-gnueabi/klibc-1.5.17-r14.0/temp/log.do_stage.17079
Log data follows:
| NOTE: make KLIBCARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- KLIBCKERNELSRC=/OE/tmpdir-dev/staging/spitz-angstrom-linux-gnueabi/kernel install
|   INSTALL headers + man pages to /usr/lib/klibc
| mkdir: cannot create directory `/usr/man': Permission denied
| make[1]: *** [header] Error 1
| make: *** [install] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_stage failed
NOTE: package klibc-1.5.17-r14.0: task do_populate_staging: Failed

I've updated it to new "layout" and added klibc-utils-static, I'll send updated patch.

> >* 1.5.15+1.5.16:
> >   #still needs Kbuild files and all headers (ie include/drm, include/mtd were missing)
> >   #work-arround by hand (just to show what needs to be solved):
> 
> this patch should solve this problem :
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b2f6d8d0200974b8b98f1bb9b10d46fb06e14b15

This is also great, I've rebuilt my kernel to get this new staging and
1.5.15+1.5.16 compiles fine without any workarround.

Thanks!

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


