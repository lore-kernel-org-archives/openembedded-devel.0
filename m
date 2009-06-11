Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MEoVX-0003xi-Ey
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 19:56:11 +0200
Received: by gxk2 with SMTP id 2so2295973gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hNb1MLB+H31BU756PNXLFDL6hlfsvSPi87URKTGwA5k=;
	b=HKd1ZyqOLZ5yJtURS9s31nWySYxkufQXQ5Q+KDWfCR35j3YaZYoEBmKVZzIEgvD8oS
	CU2rAPYZAXiutegAbSxpZY2AXN0wBkeJmjCoLwcTGKks2bgJTVpC1VONZRZCXmS9S2KP
	yz9+uQyPvIj/1I5dXAalCtr2k88bkGAdccWK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wwRrws+M4PA5e7sXORGQdzDqPBhjVPS+RuoWuGp0KGhxdSNmWJY2Xv96xicwsjUpOf
	wWhnqwfYt1fnqQLWQNdB8M8EyPkUnuGbEcHLFvWylbPSY3BEjyuenYuS+u5xbBQDeBrA
	KYMu53L/TFpqWee4Mccaj44lonlyhn9h5eNhI=
MIME-Version: 1.0
Received: by 10.231.11.141 with SMTP id t13mr1318813ibt.28.1244742379040; Thu, 
	11 Jun 2009 10:46:19 -0700 (PDT)
In-Reply-To: <ac9c93b10906110722g77626187m50f92b8f20c9579c@mail.gmail.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
	<CEB81C4F-48EC-4D42-84C2-F7779D133565@mac.com>
	<ac9c93b10906110722g77626187m50f92b8f20c9579c@mail.gmail.com>
Date: Thu, 11 Jun 2009 19:46:19 +0200
Message-ID: <c384c5ea0906111046y378a58c6xe6db8fd54af4aeda@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Thu, 11 Jun 2009 17:56:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Jun 11, 2009 at 4:22 PM, Frans
Meulenbroeks<fransmeulenbroeks@gmail.com> wrote:
> After that the problem mysteriously disappeared.(for me)
>
If it's a race condition, you just could have been lucky this time.

Given the number of reports (and people "fixing" it by doing a new
run) I think a race condition is likely.

If indeed it's fixed, we should at least find out what fixed it.

Regards,
-- 
Leon


