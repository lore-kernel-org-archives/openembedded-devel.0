Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marc.reilly@gmail.com>) id 1Ns0D8-0007hK-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 21:51:31 +0100
Received: by fg-out-1718.google.com with SMTP id d23so59746fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:reply-to:from:to
	:references:in-reply-to:subject:date:organization:message-id
	:mime-version:content-type:content-transfer-encoding:x-mailer
	:thread-index:content-language;
	bh=Nuc0XleDKZ3IwRJaTubf/pAtOjb5NE8QD0NfqilISNc=;
	b=R6aebb9tfzN6aKSKL2UroPAQ+3Lwn0V4ol7Zt4XHaYUWAjIAtj+91xIQaOv1VWy1F2
	e169nO6WCTm4c53P5+U5zbCZNnAXuVdAAzZA3XrJ+DYcf/mpmDnKro6EzB5yaIekEX1Y
	KyrDvYWFHrhpHx2dD5aK3CMcmrTiWt6feJ8lQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:reply-to:from:to:references:in-reply-to:subject:date
	:organization:message-id:mime-version:content-type
	:content-transfer-encoding:x-mailer:thread-index:content-language;
	b=Wlrg2QDCaXOWHPIXL+knOlDFmHf1dDe6TRmEJvkXGPMLz/FHxMmUX6ibclzQzOEcZX
	YfKKRLgW30WaxcZ4t2lxXb231105VyW0cMhLyu5rM4hVoDU3CQMkZPptmT7G4xAoPiNg
	G24ZC3+GSxf+b+yT0SZhZbWfNPbIR1hitQjio=
Received: by 10.86.22.31 with SMTP id 31mr7765489fgv.19.1268858904943;
	Wed, 17 Mar 2010 13:48:24 -0700 (PDT)
Received: from MARCVAIO (220-244-174-13.static.tpgi.com.au [220.244.174.13])
	by mx.google.com with ESMTPS id l12sm2947182fgb.17.2010.03.17.13.48.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Mar 2010 13:48:23 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: "Marc Reilly" <marc@cpdesign.com.au>
To: <openembedded-devel@lists.openembedded.org>
References: <loom.20100317T150947-575@post.gmane.org>
In-Reply-To: <loom.20100317T150947-575@post.gmane.org>
Date: Thu, 18 Mar 2010 07:48:18 +1100
Organization: Creative Products Design
Message-ID: <010601cac613$30983480$91c89d80$@cpdesign.com.au>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQI6bH/JIICv5HXi3LFf8PqgpGk/nAKgZMDK
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: marc.reilly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openembedded to cross compile QT4 to FriendlyArm mini2440
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
X-List-Received-Date: Wed, 17 Mar 2010 20:51:31 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-au


> a) dowload bitbake from:
> http://download.berlios.de/bitbake/bitbake-1.8.8.tar.gz

Try using a later version, eg 1.8.18
(See "Version Information" =
http://wiki.openembedded.net/index.php/BitBake_%28user%29 )

> Traceback (most recent call last):
>   File "/usr/bin/bitbake", line 143, in <module>
>     main()
>   File "/usr/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()

Check that there is not a bitbake in your /usr/bin

Cheers
Marc



