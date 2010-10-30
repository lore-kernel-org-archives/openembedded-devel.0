Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PCKlx-0000Hh-52
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 01:23:45 +0200
Received: by bwz10 with SMTP id 10so3507729bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 16:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=qxwS9wfSB+5KDzsYGc6VquFbn1Vo8FDOUccuW1bNhzo=;
	b=WGoCrVb9x5yK5n3VbTKIyP6vNsVfT8NJRfEU2U5WCw3dFF+1+jWg0wvjck6ya/1EPx
	o5EJoAiI84yFiKcTiM282A30zlB2ZHJ5PKIW0JdidPu8bIHcmfzTyKu8NgOKJE3WPjA4
	V6w1uOjFSX1D7c9xlrM/xk2e1MNk8W/X5f0/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fO/zpe0I2TqOeqodReUYmoz15H7Md8AILGqUO4tOaeymE4YEUbcLS+kUju8XDx3P0j
	BdJkYfc2gkkFJmK2jMXESIm4VZYn/nsEcZTlKp3gQ3F/psX5PYZKvbZl2dUX7hPmTPXj
	R62UkAQ0Kc6P8903s2vt+z3G+w7/HqjZ00LqU=
Received: by 10.204.53.9 with SMTP id k9mr8088478bkg.102.1288480953891;
	Sat, 30 Oct 2010 16:22:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p34sm2109103bkf.3.2010.10.30.16.22.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Oct 2010 16:22:33 -0700 (PDT)
Date: Sun, 31 Oct 2010 01:22:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030232227.GC6312@jama>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1288395329-10474-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: curl-nativesdk as default libcurl provider?
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
X-List-Received-Date: Sat, 30 Oct 2010 23:23:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, 

nativesdk support was added to curl with 7.21.1 version in 
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=893ec9283c23b2aa7bbfd615cc5012ef68c9d1b0

since then
recipes/accelges/accelges_svn.bb
was pulling
virtual:nativesdk:curl_7.21.1.bb
to task-shr-feed build

it is because libcurl is in accelges's RDEPENDS (which is not really
correct and I'll remove it)
RDEPENDS_${PN} = "dbus dbus-glib libxrandr libnotify notification-daemon libcurl gtk+"

and libcurl in PACKAGES in curl-target.inc
PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"

but isn't it supposed to work better by default?

If I remove it from RDEPENDS it works OK, because libcurl4 (I'm
using debian naming) is picked right

Version: 1:0.2+svnr206-r3.6
Depends: update-rc.d, libdbus-glib-1-2, libdbus-1-3, libgobject-2.0-0,
libgthread-2.0-0, libc6, libglib-2.0-0, bluez4, libglade-2.0-0, gtk+,
libatk-1.0-0, libgio-2.0-0, pango, libstdc++6, libcairo2, libpixman-1-0,
libpng12-0, libxrender1, libx11-6, libxcb1, libpthread-stubs0, libxau6,
libxdmcp6, libfontconfig1, libfreetype6, libexpat1, libgmodule-2.0-0,
libcurl4, libgnutls26, libz1, libgcrypt11, libgpg-error0

for accelges fixed in:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=ef297b9febd05766242d0b6cb5dae14024456d41
but maybe other recipes have same problem..

Whole curl package seems strage..
ie sdk builddir doesn't start with curl-sdk- as normal for other sdk
tmp/work/x86_64-armv7a-sdk-oe-linux-gnueabi/curl-7.21.1-r4.1/

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


