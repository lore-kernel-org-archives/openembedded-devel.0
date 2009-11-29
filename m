Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gregoiregentil@gmail.com>) id 1NEkop-0007ek-JR
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 15:32:10 +0100
Received: by pzk30 with SMTP id 30so1874835pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2009 06:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:subject:from:reply-to
	:to:in-reply-to:references:content-type:organization:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	bh=mmW0wWaDORqpsWQM7z1FtKMBoqaovIIuCiACVg3mVAg=;
	b=hwdKGBJWn+dmtPBX6lZC9wKsHw9S9rfP3oD2SfjfaLCAql7QlSYrUAkUnobOxWeNJ4
	CEobbnyvf8WZZpVrz6utjiXa7iZnSzCHMygsufvA4FddIS5FmDZQtKMrNXtig/tVXzil
	+YWpRbAMMVDjPXRkKDdFZvCwy8Ctzwd8bFXd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:subject:from:reply-to:to:in-reply-to:references:content-type
	:organization:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=nGFlLSePV7Su98aHTZEP8xkSeIjN+IscF3vDCN9FLxpvlsHXsnRkQw6gDHmzYB1pol
	JPKm1wTGZjMxODN35F8NfxFdVtPEdE1NBejY+jPjRAuQggt8c/LjtZ8CKprN+07Dbgs8
	ePVjWo7S51ba8+IvjbnmCpMcuzTYBk7QQl8Vg=
Received: by 10.114.188.31 with SMTP id l31mr2402227waf.201.1259505033753;
	Sun, 29 Nov 2009 06:30:33 -0800 (PST)
Received: from ?116.6.23.151? ([116.6.23.151])
	by mx.google.com with ESMTPS id 23sm2293477pzk.0.2009.11.29.06.30.32
	(version=SSLv3 cipher=RC4-MD5); Sun, 29 Nov 2009 06:30:33 -0800 (PST)
Sender: Gregoire Gentil <gregoiregentil@gmail.com>
From: Gregoire Gentil <gregoire@gentil.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
Organization: Gregoire Gentil
Date: Sun, 29 Nov 2009 22:30:30 +0800
Message-ID: <1259505030.24812.8.camel@gregoire-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: gregoiregentil@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Initramfs and kernel
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
X-List-Received-Date: Sun, 29 Nov 2009 14:32:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello,

I'm building an initramfs image for a beagleboard-like platform. I
managed to make it work but I have a kind of circular dependency,
meaning:

I build initramfs (which depends kernel), I add to the .config of kernel
the path of the initramfs.cpio.gz, then I need to rebuild the kernel to
have the initramfs inside the uImage...

I obviously don't do it right. How is initramfs supposed to work in OE?

Grégoire





