Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O5ifG-0001CK-7w
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 18:57:10 +0200
Received: by qyk33 with SMTP id 33so8912341qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=yN+upxavWMiprR6Aksp/4bKUebs5SRhBy5nUfPp0jxk=;
	b=ZqWOpYMQSPW8KBRmclPLQSTKzB3NhQed0fYTgH0RexdnQFQhLBBmI6UMT5OqD66LSX
	PplLyQAQRg1/tMPLi/xmVdtCLghB34Af2REVlCaWbzDgjGcfk3w8f+Rp5phc3cwiGEaz
	4yKbujskGkHXccWQIMbZSqruBQzuXUx23v91c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=vy8lMq7AS+sh0KR5TPXC2JYfBflNniTDmSXQ5MkjQ3TPXj/7NZ2cDkjrQ6BkPIIsVV
	/0o54GcV4J1wLIlTCHC+Sn6knP+ewCtJWdciWuOJlXVxwsqfQemTLV3Cns2y1x7glf3M
	pzTgFkYQkWK6qizSDG8NOQ0/2cBmvD7T9goWQ=
Received: by 10.229.191.18 with SMTP id dk18mr1989602qcb.9.1272128012162; Sat, 
	24 Apr 2010 09:53:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Sat, 24 Apr 2010 09:53:12 -0700 (PDT)
In-Reply-To: <1272127041.19634.21.camel@andromeda>
References: <20100424111805.GA2555@xora-desktop.xora.org.uk> 
	<1272127041.19634.21.camel@andromeda>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 24 Apr 2010 09:53:12 -0700
X-Google-Sender-Auth: 77b4226390db69d0
Message-ID: <q2yb6ebd0a51004240953m7eacfd88qe6b87e0b638074de@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: do_unpack broken
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
X-List-Received-Date: Sat, 24 Apr 2010 16:57:11 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 24, 2010 at 9:37 AM, Michael 'Mickey' Lauer <
mickey@vanille-media.de> wrote:

> Same here. Chris, please revert or fix that.


Fixed.  Apparently my git-fu was weak last night, screwed up a conflict
resolution.  Sorry about that.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

