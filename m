Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M7yCt-0004Rr-AD
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 22:52:39 +0200
Received: by bwz19 with SMTP id 19so2340778bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2009 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=+7kn4wU/QdYAITjxE21UCSELOyRTYKI7+cQEmuQdSVY=;
	b=sOcrs/Q5V6t5HdUuurStUXebhTrArc7HPFgyDYPTivqFTeQzvDYMn8uJGnhgNr3lA9
	1cJFNjjt5Sm6wbkIv/szdCsfdO/ErtqaJbLnqLOIlL/I5VtAVup1k7Cu8Ixd1AVquyEG
	YLbGf82YkgLFbkuo00I0oHpqXpMRtWxUwX010=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=nNsTBC2pFNA27FgeduXJu10C8aPeBmCBA5vg3UifWN/UhhvK4vWrhzGb5cgVlOteJP
	vew0/+vyV+gAAYjHE3qj9y/SLn7NkTibtSLrpAspmgEOTw1bEf0a2vd9GDdVKP8Yu+Kr
	ZLiOg/nFBAV5QN7sCst+xrXaGL84AfT1oYXpI=
MIME-Version: 1.0
Received: by 10.102.247.10 with SMTP id u10mr2720077muh.76.1243111487934; Sat, 
	23 May 2009 13:44:47 -0700 (PDT)
Date: Sat, 23 May 2009 23:44:47 +0300
Message-ID: <fce2a370905231344i3eced2bci5e1997d520be705e@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org, koen@openembedded.org
Subject: e2fsprogs-libs is unbuildable for .dev
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
X-List-Received-Date: Sat, 23 May 2009 20:52:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For org.openembedded.dev branch I get the following error when trying
to compile console-image for BeagleBoard. The problem is reproducable
with fully cleaned tmp/

ERROR: Error in executing:
/home/booxter/projects/oe.devel//openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such
file or directory:
'/home/booxter/projects/oe.devel//tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.15-r2/install/e2fsprogs-libs-dbg'


