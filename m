Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OciWv-0001oz-KH
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 19:28:58 +0200
Received: by bwz10 with SMTP id 10so2343090bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=AFGTkWoz3+jVlpuYePAIWUcaBm0TlD2ZMmFYNUHWBgQ=;
	b=Cf4Ujyd6XImuULA+GCZiqHNmmmttqiMFjcPKiPEdwN55puQg8dbNFOLluiPzMXITgo
	Ljs2e451ddI0sf+7SjRvCTAKTHeWFQwgFS0L2UaW3r3VPGK7RBsGTgpeBExp3OnC5BEd
	dpeI/ATClgItDG8knZ+ToxzewDtD2QBCZb6AE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gIm4wMa8RenGwXUqZlXTVwWl0btGc8WskNwy5qafa3m1vVlRPaLYArKKlpnDOwqsPB
	IaSUH866Pf0XaQ8XW3uhx9YHyfBd8P5PIOnJ79T6ZfFu1usUS+2x5W1oH7CQ8bHUyBFB
	v1FCUi4DYWscUz/srd3941uJPi97mI9AccBNQ=
MIME-Version: 1.0
Received: by 10.204.21.135 with SMTP id j7mr3452066bkb.198.1279992525641; Sat, 
	24 Jul 2010 10:28:45 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 24 Jul 2010 10:28:45 -0700 (PDT)
Date: Sat, 24 Jul 2010 19:28:45 +0200
Message-ID: <AANLkTinADxGHsKKSmZQ6TXq=mk1SmsipHNyjLhHNxC1P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: perl 5.8.8 issue
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
X-List-Received-Date: Sat, 24 Jul 2010 17:28:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

While trying to get perl running with new style staging I bumped upon the
following issue:

/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include/stdbool.h:36:1:
warning: this is the location of the previous definition
In file included from
/home/frans/oe/tmp_angstrom/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/perl/5.8.8/CORE/op.h:497,
                 from
/home/frans/oe/tmp_angstrom/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/perl/5.8.8/CORE/perl.h:2754,
                 from Curses.c:46:
/home/frans/oe/tmp_angstrom/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/perl/5.8.8/CORE/reentr.h:612:
error: field '_crypt_struct' has incomplete type

This happens when building
virtual:native:/home/frans/oe/openembedded/recipes/perl/
libcurses-perl_1.28.bb
as it is with a native recipe I suspect this is a perl issue not related to
my staging changes.

reentrt 612 looks like

#ifdef HAS_CRYPT_R
#if CRYPT_R_PROTO == REENTRANT_PROTO_B_CCD
        CRYPTD* _crypt_data;
#else
        struct crypt_data _crypt_struct;
#endif
#endif /* HAS_CRYPT_R */

where line 612 is the struct crypt_data line.
This struct lives in crypt.h but apparently this one is not included (or the
typedef is commented out)


I've found I have this issue with a few more perl recipes.

Anyone seen this before?

Frans

