Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLpVU-0007z8-Cw
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 08:11:00 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so216662pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 22:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=jcuHjTxSDVACGruWS03sVoOa30Oocau3ApEcvk79vAY=;
	b=DdIbVnHjEzsNqmeZOS4o1/b/HZK//ZNtOdDpzjDVhVi6mfBWB8wEIR3NVJTlS4kgvb
	swYH3LzBrY6x3wmfHQamutYNEpEBSTh7AUDrPPavCZBPBuDc/vFGI3CByc/M1rmw/PWu
	cqWRRjdRCb8uOo1Ul6tENLqZd3eYzw8FwVrhw5veOt3+KLBAj4MOa8nDE/V96e1WezWk
	xt3PpqxyRQ6ANUMRFnlOxXH7RQIFS64J/7OxpZ929eH8z6pN1jAWOrK3BQJVYfN7zq47
	SAzxLzZxL+MqMc24xSG6KP2d91KSK3RoGL6PwpZ6nrt+EUz0hHNIS5/ch+igZWor0SeO
	Co6w==
Received: by 10.66.77.199 with SMTP id u7mr47172521paw.7.1349848671326;
	Tue, 09 Oct 2012 22:57:51 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id it6sm504872pbc.14.2012.10.09.22.57.49
	(version=SSLv3 cipher=OTHER); Tue, 09 Oct 2012 22:57:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1349848283-31455-1-git-send-email-mertsas@cisco.com>
Date: Tue, 9 Oct 2012 22:57:35 -0700
Message-Id: <9AFFE1F9-4F16-47D4-B1F9-E791926CA9FE@gmail.com>
References: <1349848283-31455-1-git-send-email-mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: [meta-oe][PATCH v2] libftid: Change to use GPLv2 intead of GPLv2-RLE.
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
X-List-Received-Date: Wed, 10 Oct 2012 06:11:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 9, 2012, at 10:51 PM, Martin Ertsaas <mertsas@cisco.com> wrote:

>=20
> -LICENSE =3D "LGPLv2.1 GPLv2-RLE"
> +PR =3D "r0"
> +
> +LICENSE =3D "LGPLv2.1 GPLv2"
> LIC_FILES_CHKSUM=3D =
"file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa882bbe \
>                    =
file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129cb671ed \
>                   "


thats in effect same you need to say PR =3D "r1" since when you don't =
use PR at all PR =3D "r0" is default
so you need to specify > r0 for feeds to catch it.=


