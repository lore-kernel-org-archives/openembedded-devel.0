Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1LowsP-0005Ua-4B
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 11:36:57 +0200
Received: by fxm20 with SMTP id 20so2711250fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=G9snp6vNz/oTZKCpojxvpBl9PUATSWEJC5mVScXa/uw=;
	b=RIEle4YSh80HpsSFcUBhYwNSzn0MAZCI5h6S/4DfgH32T93gb5SC5/tNaVG6mLG9eI
	ad3vKQTSzgZaIeTRhalpdDswu4n7BmLtW3Z/vrZKAfhtwwRTASUpJE7DoZNSLHjpEU1V
	8GIC4r+U6Iu8HmwMS3JOJFyQSMIlB0KcE4CDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=NDyLZxP1VTr77lDBDOGLEnpLHsZGLOaumGKRXhPZvnqd6LR2LYZCL2Eu7MqXPJup7W
	wlOvWfYWRolfOTG3dD6y+HbYfo8Tt9TN8AtRujA9DgHKC7Bah6dw/+vEkXBQp0bKV3go
	CbvTIWeefJfcm19C35PJN+G4qIBQmnERvLbok=
Received: by 10.86.65.9 with SMTP id n9mr5878493fga.61.1238578473428;
	Wed, 01 Apr 2009 02:34:33 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-42-124.t2.dsl.vodafone.it
	[93.144.42.124])
	by mx.google.com with ESMTPS id l12sm1397368fgb.16.2009.04.01.02.34.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Apr 2009 02:34:32 -0700 (PDT)
Message-ID: <49D33527.6050102@gmail.com>
Date: Wed, 01 Apr 2009 11:34:31 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Re: qt4-tools-native_4.4.3.bb failed
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
X-List-Received-Date: Wed, 01 Apr 2009 09:36:59 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

> Could you please post that log?

http://lists.linuxtogo.org/pipermail/openembedded-devel/attachments/20090401/62fe5532/attachment.asc

> Enrico,
> 
> It looks like g++ is not picking up libz from native staging:
> 
> g++ -fno-exceptions -Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr/lib
> -Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr/lib -o ../../../bin/uic
> [snip]
> .obj/release-static-emb-x86/qfsfileengine_iterator_unix.o     -lz -ldl
> /usr/bin/ld: cannot find -lz
> 
> This is very odd as qt4-tools-native DEPENDS on zlib-native, so libz should be available.
> Could you please post the output of:
> 
> ls -l /home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.*
> 
> Cheers,
> -- 
> Jeremy LAINE
> Bolloré telecom | 11bis, rue Scribe | F-75009 Paris
> 

The output is:

-rw-r--r-- 1 enrico enrico 78752 2009-03-27 12:36 /home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.a
-rwxr-xr-x 1 enrico enrico   978 2009-03-27 12:36 /home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.la
lrwxrwxrwx 1 enrico enrico    13 2009-03-27 12:36 
/home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.so -> libz.so.1.2.3
lrwxrwxrwx 1 enrico enrico    13 2009-03-27 12:36 
/home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.so.1 -> libz.so.1.2.3
-rwxr-xr-x 1 enrico enrico 79084 2009-03-27 12:36 
/home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.so.1.2.3

Regards

Enrico


