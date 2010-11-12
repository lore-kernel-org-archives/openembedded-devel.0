Received: from mail-qy0-f169.google.com ([209.85.216.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PGy1B-0003nI-C5
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 19:06:40 +0100
Received: by qyk1 with SMTP id 1so186849qyk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 10:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=a5JldGlas+RkmRByniKNS0Kvk01JRXosQYBaesmSP/I=;
	b=bIRnKGi1hVt3Q1gmvgfVi6KFZaExD9hXFI8JfNQ0gXGmn++XQ4Ixenj4nAHknjbr5Z
	rL50ImQju9ww5whFW/xSOdBX5QljHZZgX3AeRzkkUWKdz1l6XCGh80eS4JBqAYrEYaRR
	LDAGVc3PXNvGNVaJstkces6mVyH1K6yQgJY4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=vFlfYKRbtafy3ozY7YzkWDBcotxXXxQMedcRj3R1AOe7jNE9p7gkhmWMi8M3KnUn+r
	ij3xE2SNBAhtHzq64OWE6rvplE/btdqSyaaddJFZOuhMb9ntqtylDfpU7+gv/J09dfBt
	rJHme0IRjZlfiJ+ymtmJ86f7qRtFO9WtxQ62E=
MIME-Version: 1.0
Received: by 10.224.174.12 with SMTP id r12mr2218771qaz.109.1289585126947;
	Fri, 12 Nov 2010 10:05:26 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Fri, 12 Nov 2010 10:05:19 -0800 (PST)
Date: Fri, 12 Nov 2010 18:05:19 +0000
X-Google-Sender-Auth: Cw5RxV0cAbxISDk7xIQy84r0J04
Message-ID: <AANLkTikm572dcjPRTvF7nGnuVY3uuPryRRGbyyDBS+eg@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.169
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: multiple virtual/gail on reviving gtk+-directfb
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
X-List-Received-Date: Fri, 12 Nov 2010 18:06:40 -0000
Content-Type: text/plain; charset=UTF-8

[hi please cc me direct because i am subscribed with nomail, thx]

folks, hi,

i have a requirement to bring gtk+-directfb up-to-date [and also do
python-pygtk-directfb, which is gonna be interesting on a 400mhz
ARM9... :) have to see how that goes...]

i've taken a copy of gtk+_2.14.bb and created gtk+-2.20.1.bb with the
following, as might be expected:

RCONFLICTS_${PN} = "gtk+"
RPROVIDES_${PN} ="gtk+-directfb"
DEPENDS = "glib-2.0 pango-directfb atk jpeg libpng gtk-doc libgcrypt cups \
       cairo-directfb jasper gtk+-native"

however, err.. i'm getting this:

ERROR: Multiple .bb files are due to be built which each provide
virtual/gail (/home/lkcl/oe/openembedded/recipes/gtk+/gtk+-directfb_2.20.1.bb
/home/lkcl/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
python-pygtk2 (/home/lkcl/oe/openembedded/recipes/python/python-pygtk-directfb_2.16.0.bb
/home/lkcl/oe/openembedded/recipes/python/python-pygtk_2.16.0.bb).
 This usually means one provides something the other doesn't and should.

at the bottom is these:

PROVIDES = "virtual/gail"
RPROVIDES_${PN} = "libgailutil18"
RCONFLICTS_${PN} = "libgailutil18"
RREPLACES_${PN} = "libgailutil18"

should i be modifying these to:

PROVIDES = "virtual/gail-directfb"
RCONFLICTS = "virtual/gail-directfb"
RPROVIDES_${PN} = "libgailutil18-directfb"
RCONFLICTS_${PN} = "libgailutil18"
RREPLACES_${PN} = "libgailutil18"
etc. etc.

tia.

l.


