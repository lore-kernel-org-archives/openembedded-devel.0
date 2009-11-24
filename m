Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1ND0Ju-00069F-4n
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 19:41:01 +0100
Received: by fxm8 with SMTP id 8so7190392fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=1wSw7xfhJUaEtcDej1RLJ3QpJZsUPeQVSCQaiZnlIb4=;
	b=lQJf9agm3rwKh6vf7gsV88/2HWjdP1mNKhRpeNPJXa9yFaa3dntv87IUjlwok39Y1T
	BnkMLEMaIc6D2/PQY0V3mcfVzB7li7w8MdtaKdgRL83LHJ+Vl7B2OMZnlcaO0FULWS0Z
	ST1h51oVMcpEdB4z2tk7sR+u3Bv073CspJpHc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ELRrgM9Ed11iEXv9X+pR/Zw4lN/b7DM0OeyCHWx2OdN+el0Ls5CHBR0Ej4DVk7Ly0M
	l5ApMCUjbNKNfb3Lkec4paFstGnSFCxGfAR6cbIqlvRvtgusYbXHFY5C+AsuHgVIiAT9
	PAcNTtTnjFnUPogXcmHgkokLekAZEzidhIn6w=
Received: by 10.86.186.19 with SMTP id j19mr3128054fgf.68.1259087969260;
	Tue, 24 Nov 2009 10:39:29 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.8.192])
	by mx.google.com with ESMTPS id d8sm13963475fga.28.2009.11.24.10.39.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Nov 2009 10:39:28 -0800 (PST)
Message-ID: <4B0C2825.2070001@gmail.com>
Date: Tue, 24 Nov 2009 23:38:29 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: opkg-sdk_svn build failure
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
X-List-Received-Date: Tue, 24 Nov 2009 18:41:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to build QTE SDK according to OE manual chapter "Creating and 
Using a Qt Embedded SDK". Command "bitbake meta-toolchain-qte" fails with:
---------------------------------------
ERROR: function do_compile failed
ERROR: see log in 
/home/raydan/work/oe/build/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/opkg-sdk-0.1.6+svnr363-r16/temp/log.do_compile.19556
---------------------------------------

Tail of log contains following lines:
---------------------------------------
cc1: warnings being treated as errors
hash_table.c: In function 'hash_print_stats':
hash_table.c:81: error: format '%d' expects type 'int', but argument 3 
has type 'long unsigned int'
---------------------------------------

Ready to provide any additional information, if needed.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



