Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTEqe-0008E2-H6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 14:25:55 +0100
Received: by fxm4 with SMTP id 4so16096928fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=IM5NBTHU93/9gdhmPbJ2RmO2kf8JT9rRBATef44n+qs=;
	b=rWWZ361RJgU0Nhn8zFJo8HBzx6uSN1jAthRUU5qEmcm6QIrbhnUgtQvHVhPuULmeDl
	45DgA+/ampDMUkfOx3T8aV1GOwg1gnBEO7dvRjyzwVAupmXWSUQv+hUucSSKPsmjaDWo
	YFpDXBLN8KUscbUW5VipcqQhQtg69L5+RiDCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=uA1aqcO7RmujrVS84PCowXN7t3b2puJz5TjQFGnTTXJIk2ZdqPPZU7KBuFcnhXLOrH
	NcjO10uezq/oeIUJkKMuuDyte+s5h22EYOdBbS8hsz0+AepC1Q00uoMNTvCBjKyTBQNE
	zgHzd+enTc75Ugj/UIwU3fXnu2aClxryHw/TM=
Received: by 10.223.94.200 with SMTP id a8mr2744041fan.77.1262957026711;
	Fri, 08 Jan 2010 05:23:46 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm8241485fxm.6.2010.01.08.05.23.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 05:23:45 -0800 (PST)
Date: Fri, 8 Jan 2010 14:23:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100108132344.GB2156@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: update-alternatives broken badly (by me :()
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
X-List-Received-Date: Fri, 08 Jan 2010 13:25:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After this change
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=9b641bbfed07c075ae5cbe84082a85f1ba703447

most distributions use opkg-native as u-a provider for building their
images, but I haven't noticed that 

update-alternatives-cworth use alternatives from
/usr/lib/ipkg/alternatives

opkg use
/usr/lib/opkg/alternatives

So image prepared with opkg-native cannot ship with
update-alternatives-cworth installed, but it does, because task-boot
DEPENDS on "update-alternatives" which could be fixed with 
DISTRO_UPDATE_ALTERNATIVES and using DISTRO_UPDATE_ALTERNATIVES for
PREFERRED_PROVIDER_virtual/update-alternatives
PREFERRED_PROVIDER_virtual/update-alternatives-native
and here in task-boot.

But this won't fix already installed/built images :/.

How to fix this properly? I guess that right combination of RCONFLICTS
and good postinst scipt can fix that.. but its quite difficult to test
it and it can break things even more :/. Please advise..

Sort of nasty workaround now is
opkg remove update-alternatives-cworth
opkg reinstall busybox

Here is info I just sent to SHR mailing list

In last opkg upgrade there is bump to busybox package, which triggers
old bug in our images :(.

There are 2 scripts providing update-alternatives in our images, one is
part of opkg itself installed in
/usr/bin/update-alternatives (it was added to opkg later)

and older update-alternatives-cworth installed in
/usr/sbin/update-alternatives and used by default

But with busybox upgrade all symlinks are updated with knowledge only
from /usr/lib/ipkg/alternatives because of that -cworth which shouldn't
be part of image! (I'll push -cworth blacklist to our shr.conf but its
too late for those who upgraded busybox yesterday).

Hopefully working work-around (haven't tested because I'm at work)

opkg remove update-alternatives-cworth
opkg reinstall busybox

Please also check
diff -rq /usr/lib/opkg/alternatives /usr/lib/ipkg/alternatives
if there is some major difference, if yes reinstall packages where the
alternatives provided by them are different in those 2 dirs.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


