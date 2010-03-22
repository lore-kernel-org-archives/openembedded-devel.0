Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1NtnxO-0002QU-3Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 21:10:39 +0100
Received: by wyb28 with SMTP id 28so2622937wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=yt2WHU9kacL+D1xEpcYG6JkzQXHR2I7jKRRqDa3JBh0=;
	b=wXAjztFRwSJd8ClgF9ikLQU+IpZnecW64BO8hv4jcHjJNJAJJqN46unIvlo9CHjtvU
	QBhBqxzdiaktXM6XwwvfZvm4GZJz/7t0t+1LIl9gddhSIDq+0D4h7kWwEqFh1bMosjxy
	CaiY0swESROJnRlHnLwf6IdDMFgIfQL5Ub+O8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EosmLFur3NpLFXh16E47iHe5lgIP4jycNE+8XY8AnECot40kDn7QrPDEZ6Rb3+qYVe
	2yTQMDQlrykiUB5aijAKAD8YtRpvIycGZ/aQaanYsUk1stem2WucPTEz5RdpLEjP2wHl
	xKjP2GEp2a02IIhUD4y4+agP1hTdPPPoBFMW8=
MIME-Version: 1.0
Received: by 10.216.88.5 with SMTP id z5mr4181579wee.192.1269288449087; Mon, 
	22 Mar 2010 13:07:29 -0700 (PDT)
Date: Mon, 22 Mar 2010 23:07:29 +0300
Message-ID: <48239d391003221307u298b392m76fc618cec2c44c0@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: sysklogd vs busybox
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
X-List-Received-Date: Mon, 22 Mar 2010 20:10:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

For some of my images I need to have normal syslogd/klogd instead
of ones provided by busybox. I don;t want to have special version of
busybox for these images,
but it RRECOMMENDS busybox-syslog which contains config files and init script.

A problem is that these files are incompatble with normal syslogd/klogd pair.
when I set RCONFLICTS = "busybox-syslog", sysklogd never appears in image.
How could I force it in (and busybox-syslog out) without too much changes
in complex busybox recipes (which I don't want to touch since that
could preak something
for somebody)?

All the best,
S.


