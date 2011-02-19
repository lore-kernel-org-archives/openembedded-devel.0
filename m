Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PqjOw-0006XZ-4X
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 10:46:54 +0100
Received: by iwn10 with SMTP id 10so425810iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 01:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bc1hQBfWNHwv8SCtKxG1AnAn4U/vkwJXmwfk0cd85hk=;
	b=YASPvw59GE2gNAt3EHk0m9VUSpqDXfqXrY8Y38MLcLeOhszT99ETyuPFBwzp2vRjOC
	zkZGpX+0Wsh4qRImRNBNVjTL5xpRl9EID/Pb4BIl4dAw79ZvzEPrh3NrRrK8A/vFjsIk
	lMrkdRMYLLf5C/+eg6h6f/IBCR4mjo5vhFdwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nr7V5U3x1NFHQPM9ys2TUw+wehfu2+K8xFjN5M0414I8oKBi2LVgLBUB1Lj4OT+wqB
	XhsqiE4VNyofbt7ia17GvEZ9NJs4JGIgJVov9j1anPorpPFvATE1Fbecrioh/GlZHmNr
	myil1JHSC6nR+b39n62u+SQL1sHj9v+f55lbc=
MIME-Version: 1.0
Received: by 10.42.7.129 with SMTP id e1mr2049515ice.500.1298108738888; Sat,
	19 Feb 2011 01:45:38 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sat, 19 Feb 2011 01:45:38 -0800 (PST)
In-Reply-To: <4D5ED835.7040800@eukrea.com>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ED835.7040800@eukrea.com>
Date: Sat, 19 Feb 2011 10:45:38 +0100
Message-ID: <AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sat, 19 Feb 2011 09:46:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am fine with the patch, but perhaps a better solution would be to
introduce a var to decide whether it is a fatal or not.
That way people distro's that use libtool 2.4 can decide to make it a
fatal. (or individual users in their local.conf)

Frans


