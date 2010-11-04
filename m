Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDudG-00070S-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:53:14 +0100
Received: by gyf3 with SMTP id 3so1221726gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 00:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=BIldo9IqAmgrg7NQY4ho/07xOEIWlTNT1+3DnhyhWe8=;
	b=oM3L/AI3Jf+xykYupjIGf1RYE5pzD5iAtGhg8Og951Wp7Y0F2DcJW9giFNCvLOMxwp
	2RUnyKHeHVq34XR/wAc6M+YbWNNR4whhX4iQDzBvw2K7deq8Zdp9xqbhiYHG9xB62mFY
	8I4iOJrCkHH9CeJkkEHPrRXnXoPE1LwZ36x4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=sFbUIbmmH5yEXbsi9i4Mk7RvI9xci8wsdU7iRaXwaMzR3rwkpYLgci6+aqDLa+cg5B
	UfyTvhTB6qju9CizRR3cinV3Qt/swSRt4xRhEDHMMc3nbtBr3jaZ2N1OoOoREP+PYoqL
	tXqE3CxYPi37LzBGgoEee4XQnte96WDn8bWB0=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr117234icj.201.1288857140918; Thu,
	04 Nov 2010 00:52:20 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 00:52:20 -0700 (PDT)
Date: Thu, 4 Nov 2010 08:52:20 +0100
Message-ID: <AANLkTinM20gDzarHTf1DpNEXxtF+9b1itgDyrkXQHw=X@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: dangling symlinks
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
X-List-Received-Date: Thu, 04 Nov 2010 07:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Wrt messages like this in do_package:
NOTE: sysvinit-utils contains dangling symlink to /usr/bin/last
NOTE: sysvinit contains dangling symlink to /sbin/halt
NOTE: sysvinit contains dangling symlink to /sbin/init
NOTE: sysvinit contains dangling symlink to /sbin/halt

I know that the link will (most likely) be resolved when installing the package.

I would expect do_package to detect if the symlink src actually exists
and if so it could be silent.
But if the link is not there, I guess I would raise this to at least a
WARN and maybe even to an ERROR.

No idea how to fix this though.

Frans


