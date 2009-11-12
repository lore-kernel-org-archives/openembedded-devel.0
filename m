Received: from [209.85.222.192] (helo=mail-pz0-f192.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1N8XRd-0001qI-S1
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 12:02:33 +0100
Received: by pzk30 with SMTP id 30so1450103pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=DbUztEqmICgyOwIfZoFlBXgDhb6O5T+C3IM16f4JuSc=;
	b=BB1BVrbJVEhUJJx4zFYXiucSlJj+XCKB5YbvqI8U4TpXyQKy8yOZKiFeo+Hjrmn5Ub
	+JFvD4pUg56ZvsEvxyoYjh5EevEdgZuvnS8UUlPka269lPCrmvjBZWn2+DBGqMYtXGc9
	9Q66QUDXKAVMwwpVVx2bEVsz99qBMKGJa7gm8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Tgn1ZcTWFJ5LuI600XLvCRPuX7GxNE0q8HBPlwqOy26W2nMVWHys9xsRrWtHq9eafV
	EKXX2VwXO17QQSJeRybzpTYgMPUwK5gtsQQZGOwWIubZx9kRQmREXFFWCXXLI9LqzQ2R
	rKiscZDAoWXWRxx5XED8hdxYFzOiSdSW0eF0o=
MIME-Version: 1.0
Received: by 10.114.215.8 with SMTP id n8mr1052589wag.78.1258023299423; Thu, 
	12 Nov 2009 02:54:59 -0800 (PST)
Date: Thu, 12 Nov 2009 15:54:59 +0500
Message-ID: <818ccfc40911120254r2d28eb0ct897d7bfbedd9dae3@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How LIBC_PKGS varaible is initilaized
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
X-List-Received-Date: Thu, 12 Nov 2009 11:02:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am using open embedded to build my development system. i changed it to
build it for baremetal by chaging TARGET_OS to none-eabi. i am

RDEPENDS/PRECOMMENDS or otherwise require runtime entry ${LIBC_PKGS} but it
wasnt found any package or rproviders variables.

i search this varaible in whole package but i cant see where and how this
varaible is initialized. it works fine when I set  the target_os to
linux-gnueabi. please tell me how LIBC_PKGS varaible is initialized.

thanks.

regards
Khawaka

