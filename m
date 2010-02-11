Received: from c.e4ward.com ([207.192.69.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <28440@gmail.com.bounce.e4ward.com>)
	id 1NfieR-00044T-Fz for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 00:40:54 +0100
Received: from localhost ([127.0.0.1] helo=c.e4ward.com)
	by c.e4ward.com with esmtp (Exim 4.69) id 1Nfi4d-0007Ol-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 18:03:51 -0500
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.211.193]) by c.e4ward.com;
	Thu, 11 Feb 2010 18:03:51 -0500 (EST)
Received: by ywh31 with SMTP id 31so1767597ywh.27 for
	<openembedded--devel-lists.openembedded.org-openembedded-status.e4ward.com-100211-a2df-5@reply.e4ward.com>;
	Thu, 11 Feb 2010 15:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Zjz5hnbmc3CU15UyV8X9vrLdX/6egR/Vn0cmneci9os=;
	b=esv0cBiKKu9iBy+mqr5gRJYGgxy4gk4VsejAXdopUaxdd7IY3QyM+gKXnRe07uyJUa
	NqC+68/W3M46S6X9s2DrSnaXthgiZNbrFdNCC3wYPJLpKVa8tmd01GDzabkzgjz4qJte
	UjO21+lTeDAICKY4S4AlCuegrlk0+5Qs3VoX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dYOCayEOagVCsyUUzTg+jT9M/U3smtSRuzOq3ncwlAuhlyu/Jleu9JQGhHdo+SZL5i
	vNJntWA/84VEZza5VCOkiSS2BNUsF/dDNhDSo8IsSArbyCSgf9dm2GX7Cf/SdFa3qyNP
	iWrIoKZn46vaPfBoqsS5bc00/UcYufm/Aijcg=
MIME-Version: 1.0
Received: by 10.151.89.20 with SMTP id r20mr1210869ybl.311.1265929403474; Thu, 
	11 Feb 2010 15:03:23 -0800 (PST)
Date: Thu, 11 Feb 2010 15:03:23 -0800
Message-ID: <f4e6dc971002111503m1d0be8v46d23ff0a1e796b2@mail.gmail.com>
From: <openembedded@status.e4ward.com>
To: openembedded-devel@lists.openembedded.org
X-e4ward-RCPT: openembedded--devel-lists.openembedded.org-openembedded-status.e4ward.com-100211-a2df-5@reply.e4ward.com
X-SA-Exim-Connect-IP: 207.192.69.154
X-SA-Exim-Mail-From: 28440@gmail.com.bounce.e4ward.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Recent update to modphp segfaults
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
X-List-Received-Date: Thu, 11 Feb 2010 23:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all.

I am using OpenEmbedded with my Gumstix Overo. I am attempting to put
Apache2 and PHP on there. I tried to build Apache2-2.2.14, and it
broke on the configure step saying that some checks can't be done
while cross compiling. Rather than figure that out, I was pressed for
time and simply used Apache2-2.2.3 instead. That worked fine.

I recently pulled new updates, and I tried Apache-2.2.14 again. It
built! I was happy about that, but then when I tried to get it working
with modphp, the Apache2 error log had a bunch of lines like "[notice]
child pid xxxx exit signal Segmentation fault (11)". So I decided to
try Apache2-2.2.3 again (just in case) and I have the same problem. So
my only conclusion is that, although the package version and release
version of modphp remained the same, it was updated (when I had it
working correctly there was no /etc/apache2/modules.d/ directory; now
there is). Is it now broken? I'm not quite sure what the issue is; any
advice would be welcome!

    Thanks!

         Kyle Fazzari


