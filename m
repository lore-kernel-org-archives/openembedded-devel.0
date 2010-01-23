Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NYiMf-0002K4-Ak
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 16:57:37 +0100
Received: by bwz9 with SMTP id 9so1668339bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=9wzh3bk2FXTl4lNTzALnfRQZR7SQxLiYGRQcW2JAP20=;
	b=h0awSMNUQ32NuNy7WihfgiKfeZfCtEQdxqBy8Y0PoZ/hlpWGA0Sn/WO24a3RuPb0qh
	Ts9SBBZEs01pqv+XygJpYUWIWgNPb/WS1ks7cmrXip0wak4Ezi1IkioW8Kg7/DzABrFZ
	NWsqS9RUFtz0Mu6MCQFPJKlvcw53JSPlanIV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=lg+uo1x1qaeNzLdMPT9LdsG2JR/aqm0kazg5gMUdXMz2tRXPG/U2Z3qUU5WsXiO5W+
	+ZioRhdk+YxZ/0OMGBdenC1SOpnhnq9HZJRp+jkKAsXZon3a9aUjlkzKIHrM59EIdMwE
	puBQvflpSDk1tdkqTHnu8VAniurIBEdQidSpI=
Received: by 10.204.20.207 with SMTP id g15mr2307670bkb.213.1264262114515;
	Sat, 23 Jan 2010 07:55:14 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.154.251])
	by mx.google.com with ESMTPS id 16sm1463348bwz.7.2010.01.23.07.55.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 07:55:13 -0800 (PST)
Message-ID: <4B5B1BDB.7050100@gmail.com>
Date: Sat, 23 Jan 2010 20:55:07 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Wrong content of /dev directory
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
X-List-Received-Date: Sat, 23 Jan 2010 15:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I work on non-udev image (IMAGE_DEV_MANAGER = ""), device table is set 
via IMAGE_DEVICE_TABLES = 
"recipes/images/cgv-image/device_table_phy3250-cgv.txt".

Result rootfs image got all needed files, but when I run board, /dev dir 
is absolutely different, I can't see my files there, but many 
unnecessary. Seems like some dev manager worked.

Could anybody explain this thing? It's really strange and unexpected.

Thanks

-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



