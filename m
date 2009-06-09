Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MDwMY-0002dG-0c
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 10:07:19 +0200
Received: by ewy20 with SMTP id 20so5157849ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NZSnfr049mhVEI+5JBDZjuts+u4F12safW9BoCQV5nM=;
	b=hTyP13dJ7EzrP3/m23vmuUzsFjxrlTwnfVYfHe414pXEPv0frnszhfZhkfjHM5af4g
	YZwkbNyMwk7GaGcGQC5BpgVQ7jMS+toLwg/8aajwkkpCgUOBQtRu5FNodvXp2yYdsEvO
	kkZAbFynIXYvCMab56IEPXbtUIqhnU7AlHaJA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z6uXjUmNsrnrMyfG1uaIMAm/1SA4YkfoE6cRsxaszRmBEEIy7BXeL3sx95/+vBZGGF
	b18NT0FlcipbKSAQAqt6Gx3TF8OLU/n97rcq9cNvD47x6isNWgcsw/U/Dgsdk/blEX/m
	+8EZOpZqgcuS7f5Z216TUi6MC3SnFaEQoLuw4=
MIME-Version: 1.0
Received: by 10.216.1.69 with SMTP id 47mr2624530wec.224.1244534262390; Tue, 
	09 Jun 2009 00:57:42 -0700 (PDT)
In-Reply-To: <1244533534.4151.46.camel@lenovo.internal.reciva.com>
References: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
	<1244533534.4151.46.camel@lenovo.internal.reciva.com>
Date: Tue, 9 Jun 2009 09:57:42 +0200
Message-ID: <d1b08f940906090057n12d4dab0q1a5a0799a102a737@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk.bbclass: use force-defaults (Bug 5133)
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
X-List-Received-Date: Tue, 09 Jun 2009 08:07:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I suppose is the missing PREFERRED_PROVIDER.

In my case angstrom-opie-image installs bluez4 in rootfs but opkc-cl
is waiting input about bluez3 upgrade...

http://tinderbox.openembedded.net/public/logs/5832846.txt

After 30 mins I killed the process but don't have here the stdout...


Andrea


