Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1Jtkio-0001kA-OW
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 16:34:18 +0200
Received: by ug-out-1314.google.com with SMTP id c2so236127ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=5KztarZd0pnOupB4ONNXk0mIp4S+Ez2ir0jGLH7Yws4=;
	b=XMTmOB/L+HXxnkAsuzt4UhAjikVJ28rIflYs09Hkj6V229Wf7/XmVsJw0SLL4MDLBkr4SwWJ9fQCfmLjRvUknubrwmrQtXXp9rBt75WKHLyvSviH1dyUKCeRjA5+4Ae6sTRtCeMr964HUcIjC40mh6B9apW0c3eWH62TR4IAjTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=rfXk6OtrA2sZubBv49rM/pN+3+ybvIY5l1qjFmOZxaDRPxqVh/9/h0XUoSnLDV67WRDDq6ZMJYaZX2pxWC9EMpc6hclOmSfV48/GQlX6Ejq5vkQLc/D8d2EHvCD6tjoyYoXVT9XXYgWGmo+TFHb0EQ7E3Kde4h0D9FIJP44G5BE=
Received: by 10.78.203.20 with SMTP id a20mr587677hug.99.1210170821516;
	Wed, 07 May 2008 07:33:41 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Wed, 7 May 2008 07:33:41 -0700 (PDT)
Message-ID: <35a670560805070733s30f077dcu92729e5f2356f0c1@mail.gmail.com>
Date: Wed, 7 May 2008 16:33:41 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 14:34:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I'm trying to get an ARM EABI build based on gcc 4.3 working. I'm not
having much luck with that so-far.

The build fails at glibc-internal (tried both 2.6.1 and 2.7) with an
internal compiler error:
../iconv/skeleton.c: In function '__gconv_transform_ucs4_internal':
../iconv/skeleton.c:801: internal compiler error: Segmentation fault

Am I missing something? Any ideas?

Regards,

Matthijs van de Water


