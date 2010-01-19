Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NXHEO-0003nu-OQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 17:47:07 +0100
Received: by mail-bw0-f226.google.com with SMTP id 26so2910639bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=tmqsQJ5h/ZlRp8bxl8yhjwApMvidO+LK0JRrhwEcaGo=;
	b=MLEvGUdC3BxeMg9Q2b5jL4VcD1N6LL9ZSb4qBTTr1bUUNC1k+IE4XG4s0tr1xB2HWk
	LQf0P/FoFNHsmvQfnYZQ4sH3ssjQSC2CZmkMsY7FUDXhqBEtVEBZVO5tfgp3jGxhkl82
	oGvgrxhDDPzXI/FzKBMlmxeNIAb61IwOB8ANo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=sIv20tPe2hFniflGfKIsYBm0e9ho3l4yz09KqwpISPJ2sHiq2tleaiNHy3UhvUKO0s
	dWLdEH+SU6G1pN8JQ2RvY+wploXMXB6hYhFH/h8rC8DDjOGY4CpxKgcgE8t73IA/mGqB
	7EXC6stpU4I6aLgISl8AG7AYzTKfuugHElqHw=
Received: by 10.204.36.214 with SMTP id u22mr676630bkd.76.1263919491780;
	Tue, 19 Jan 2010 08:44:51 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.150.233])
	by mx.google.com with ESMTPS id 16sm1138090bwz.15.2010.01.19.08.44.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Jan 2010 08:44:51 -0800 (PST)
Message-ID: <4B55E183.3090408@gmail.com>
Date: Tue, 19 Jan 2010 21:44:51 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to choose locales?
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
X-List-Received-Date: Tue, 19 Jan 2010 16:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

How can I choose locales, generated to /usr/lib/locale? Tried to set:
ENABLE_BINARY_LOCALE_GENERATION = "1"
GLIBC_GENERATE_LOCALES = "en_US.ISO_646.BASIC"

but still de_DE,  en_GB,  fr_FR in locales dir of image tarball. 
'bitbake -e' says that vars are exactly as I set it.

Am I setting right variables?

Thanks

-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



