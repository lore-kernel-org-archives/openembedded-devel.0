Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1MuUo2-00017Y-K5
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2009 19:23:37 +0200
Received: by fxm3 with SMTP id 3so2279322fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2009 10:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=kk9Zxnnbg4oSDQ79sS4DaCkLefER0WP8ylDe+giBJJQ=;
	b=GOJu6ZOXQOdMQakEL4nEDstm0nWGrHjL8za3oGg53w0lIYb63iOCA84aaPoka8tCwS
	Lzz0MzvfN9uaQ+HwpegK/BCQW+NLusUjJTXXbNPGSvM65HoSA2sqcO+7TfsKE3O/qlR7
	rRtVoT8yyrbdzKIsjcP1TOjcm2H1J/6BQ5Eb4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=mJ6iNhLMBUsWSCTcRAVnr4iO4A2H3kHZRKLoJZNdd3nrJbdiGvzTR+ti6fyxDlKdQv
	CDs8Lf7uAPDJ3HjdIDWRE3+5giqjaxX6SJQcqbV7cAV39dCD/n6YlifHCKs7sxnPcHNf
	IUYBafP7j2TtFfFpGsjQix+iGW/AfSB1paM3I=
Received: by 10.204.24.81 with SMTP id u17mr3160882bkb.202.1254676966161;
	Sun, 04 Oct 2009 10:22:46 -0700 (PDT)
Received: from ?192.168.1.2? (d86-32-77-106.cust.tele2.at [86.32.77.106])
	by mx.google.com with ESMTPS id g28sm2674443fkg.15.2009.10.04.10.22.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Oct 2009 10:22:45 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910031214.22067.holger+oe@freyther.de>
References: <fd72b8f50910020840r55927655h94deabff2e4da7cb@mail.gmail.com>
	<200910031214.22067.holger+oe@freyther.de>
Date: Sun, 04 Oct 2009 19:22:51 +0200
Message-Id: <1254676971.16851.0.camel@leeloo.somedomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libmikmod_3.2.0-beta2, build error
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
X-List-Received-Date: Sun, 04 Oct 2009 17:23:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Should be as easy as the following git diff. Correct me if I am wrong.

Regards,
Michael

diff --git a/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
b/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
index 07e3af9..fd23568 100644
--- a/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
+++ b/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
@@ -3,8 +3,12 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "LGPL"

+PR="r1"
+
 DEFAULT_PREFERENCE = "-1"

+TARGET_CC_ARCH += "${LDFLAGS}"
+
 SRC_URI = "\
   http://mikmod.raphnet.net/files/libmikmod-${PV}.tar.gz \
   file://m4.patch;patch=1 \


Am Samstag, den 03.10.2009, 12:14 +0200 schrieb Holger Hans Peter
Freyther:
> On Friday 02 October 2009 17:40:53 mail mail wrote:
> > Log file here:
> > NOTE: Running task 1371 of 2265 (ID: 1561,
> > /home/derek/mini2440/oe/openembedded/recipes/libmikmod/
> > libmikmod_3.2.0-beta2.bb, do_package)
> > ERROR: QA Issue with libmikmod: No GNU_HASH in the elf binary:
> > '/home/derek/mini2440/oe/tmp/work/armv4t-angstrom-linux-gnueabi/libmikmod-3
> > .2.0-beta2-r0/install/libmikmod/usr/lib/libmikmod.so.3.0.0' ERROR: QA run
> >  found fatal errors. Please consider fixing them.
> 
> 
> Did you consider doing the above? The libmikmod buildsystem is ignoring the OE 
> LDFLAGS...
> 
> z.




