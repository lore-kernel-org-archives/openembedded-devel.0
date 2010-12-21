Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PUu8X-0004w6-3b
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 05:47:45 +0100
Received: by pxi9 with SMTP id 9so1154094pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 20:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=noGkOjkTKA1JARXvxOpMNR/ETAq2nRk1dKFmZWyszLk=;
	b=Neo4hzUjod54ID6XDPd3FQZ5sYv4/r7wXfu/x0jxw4qi6N3jLGWd86B4G8wwoqruA/
	4DGanmPWXd/gb4mXZ9Y5kGLZIFXaV/vjcSDKgKJ7nP8t9pOnYt8F4Afa/N1+o5oZ3p6t
	p/UjXmlyxc4KXfugFBiL10fyzEwT6342SuN1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Z8YoFrVz4rtb+CU0wIQRv56Kg5KyROPtxxvLNnAy9MLe2PsRuXY6JqP/FAzBpkLgLe
	tdvtDV6HtP+oCTkgzK2rYcY7Ax2qnkHjhDK0/64SgnKnS3/9qnxObTHXRX2zZJZVpWRf
	h4NmY1+VvtEJK5bavlTVy7d0em2Ftb1ZhSLZU=
Received: by 10.142.43.2 with SMTP id q2mr3152695wfq.170.1292906854008;
	Mon, 20 Dec 2010 20:47:34 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w22sm6916465wfd.19.2010.12.20.20.47.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 20:47:31 -0800 (PST)
Message-ID: <4D10315D.5020707@gmail.com>
Date: Tue, 21 Dec 2010 15:17:25 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: uclibc - which virtual/libintl?
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
X-List-Received-Date: Tue, 21 Dec 2010 04:47:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


grg@eye7:/mnt/oe/openembedded$ grep virtual/libintl conf/distro/include/*uclibc.inc 
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_PROVIDER_virtual/libintl      = "proxy-libintl"
conf/distro/include/uclibc.inc:PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
conf/distro/include/uclibc.inc:PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"

Is there any pressing reason to use one over the other?

-Graham


