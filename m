Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PUlfZ-0002cs-Bu
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 20:45:17 +0100
Received: by wwi18 with SMTP id 18so3275937wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/e9jULbya2N+BB4Ia1LUJdJJCANzorKu5yX22mLa00Y=;
	b=rS2PSFAV4dSj5HuSsVQLx0fHdFDoOnr+yqQph9mr9o+9Of0rlxSpWzdYcp4YiJ+Lt4
	s9A5Q19ndwc2xmfVnpgm1L0XF+o30R73yxZWPZqd0moWP/E/8vev8n86afQlQd6nfDho
	TdOeS1E03qe1B6tXkBZboRxgsMk5i0wFB7ip0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=UvS5n1U7X+Ph9dUHH7PoYnVX6scSZnWZU5PhDB2lXD7opFjkicjgcK9SlhOuY1nEk2
	HLj+pHBKIBYA/3gYHD0rmqDuhBF18Imsh1G+r/CvYb01Jl8hsxEPOslR77IcrQOe2AXr
	5rnTgwiy9cdC+0Wkmf6MjQzkPOr0PQPUuCNzY=
Received: by 10.227.69.11 with SMTP id x11mr2836864wbi.57.1292874311607;
	Mon, 20 Dec 2010 11:45:11 -0800 (PST)
Received: from [192.168.1.103] (243.204-242-81.adsl-dyn.isp.belgacom.be
	[81.242.204.243])
	by mx.google.com with ESMTPS id 11sm2982641wbi.12.2010.12.20.11.45.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 11:45:10 -0800 (PST)
Message-ID: <4D0FB245.90008@gmail.com>
Date: Mon, 20 Dec 2010 20:45:09 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101213 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Mon, 20 Dec 2010 19:45:17 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

After hacking the problem with openssl-native, the following happens for
qemu-native.
I found a reference describing the same problem with the new gold linker.
Any advice?

|   LINK  alpha-linux-user/qemu-alpha
| /usr/bin/ld: error: address of section '.tbss' moves backward from
0x6018e440 to 0x6018e260
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-alpha] Error 1
| make: *** [subdir-alpha-linux-user] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package qemu-native-0.13.0-r2: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb do_compile
failed
ERROR: Task 947
(virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb,
do_compile) failed with 256



