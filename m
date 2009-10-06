Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MvBtY-0002yh-14
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 17:24:11 +0200
Received: by fxm3 with SMTP id 3so3900952fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2009 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=LZv9l+uzkBmhRvk4F8cjBdxdS/W0raH359VJ9fsgLWM=;
	b=YzVAKjM09rqjo9bliAdgLhqDwP53JUX06JNbCPQl2O6MSK74mjKTW9VvLuEswGjoZ8
	iAHWXORU8FbHEp0pFIatTYS0F7gc08Yk5pMkwAl/SBXZDoxVjYs8Jb36LyPLQZ8a9pSP
	x5b6E1LQ4BR59+rqLYVNv+e9bzsKR4HR0G4iE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=XYXhWqOzgSHmTNUAQmabFcjGn1TcR9vnqm8f0wL3bfwWfrYraPE+kyfjlAFG153aI5
	Q0YOGjDyUWG34DaHYVE95Ew7OvhKt1rmZ+IRasEuxOyzituE1VAVmsDSSzFovYI9tsFL
	w31mKRN5UDBGNmUxtNaXpbSaWGwbAOeGV15r0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.166 with SMTP id k38mr141590hbe.63.1254842598959; Tue, 
	06 Oct 2009 08:23:18 -0700 (PDT)
In-Reply-To: <20091006034646.GA22854@denix.org>
References: <20091006034646.GA22854@denix.org>
Date: Tue, 6 Oct 2009 12:23:18 -0300
X-Google-Sender-Auth: ea0b78d8b9ec699f
Message-ID: <be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Version sorting in BitBake
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
X-List-Received-Date: Tue, 06 Oct 2009 15:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Denys,

On Tue, Oct 6, 2009 at 12:46 AM, Denys Dmytriyenko <denis@denix.org> wrote:
[...]
> PV1 = "2.6.29-${PR}+gitr${SRCREV}"
> PV2 = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"
> PV3 = "2.6.30-${PR}+gitr${SRCREV}"
>
> That still works with opkg, as ipkg-compare-versions sorts above PVs as
> expected - PV1 < PV2 < PV3
>
> But BitBake now has this flaw and sorts like this: PV2 < PV1 < PV3
[...]

Please send the patch for people to review and would be nice to have
it commited since many of us could have been using non-required
overrides.

Thanks by founding and _fixing_ it :-D

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


