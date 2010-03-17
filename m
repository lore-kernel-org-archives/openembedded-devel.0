Received: from mail-px0-f195.google.com ([209.85.216.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nrv2y-0004gP-4l
	for openembedded-devel@openembedded.org; Wed, 17 Mar 2010 16:20:40 +0100
Received: by pxi33 with SMTP id 33so742301pxi.12
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Mar 2010 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Ov8SfeYR88oLIn3rpIn50GFVWdQlRrus18gRSur3xDI=;
	b=X95OSQsanNphCrA8A956S2atOJ2lI9BNHu3J0tMBWTQMY9ym0ulV6ai5ZWvtyyH2VU
	pFHJ90xTlXziGFIyiY0XzsfpYLtEOL9OLy6mjymoMmFlh1CvY9R7vQeD36dzVb+zckmU
	tOHMWQbfFmTr6Thfl+G0iMqL4nbO7pY7ma8mc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=xesvMAxETctD+1luPqi8oT6W56icoF9CKY/KudPhz4vV4lxDKeDKlsu93otkgWr2/a
	3Hk/b2gRcy8Cm+vy5gu/y/1lq/ueZykjUwhSFPriF93u+w8XE7sUfyKWFZsUeQUOW5DA
	arv21jEsMcuS70qfe+SnYKVJCGIs7WgSJUrDQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.6.34 with SMTP id 34mr881788waf.42.1268839051509; Wed, 17 
	Mar 2010 08:17:31 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 17 Mar 2010 08:17:10 -0700
X-Google-Sender-Auth: 2e9fdd217493ab4c
Message-ID: <b6ebd0a51003170817y1f81a222kc691f85c50dd312@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: do_unpack
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
X-List-Received-Date: Wed, 17 Mar 2010 15:20:40 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

The other day I threw together a proof of concept of do_unpack using the
python modules for the archives.. sadly, the performance is such that we
should likely stick to our current method, though it results in a lot of
extra dependencies.  See
http://github.com/kergoth/OpenEmbedded/commits/kergoth/unpack.  In the
process, however, I did do a bit of cleanup / reorg that I think we may want
to pull in.
http://github.com/kergoth/OpenEmbedded/commit/3def3ba3d4860983f2d8f082eb528c4b84f83b50
I think it's an improvement, though I admit that the way I pass in the
parm
and env is lame.  I wanted to avoid passing in the datastore or url
directly, limiting oe_unpack_file's knowledge to the source, destination,
and options.  Thoughts?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

