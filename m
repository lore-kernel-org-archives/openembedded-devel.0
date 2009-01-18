Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LOV1Q-0001qB-CF
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 11:36:52 +0100
Received: by bwz8 with SMTP id 8so5950540bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OvZRvoMDTD17vt+IuWaMSRbUwBNF6+yItGv9bkXw7mw=;
	b=j1Bn7jFEzjM99P+x41avvnTAbdIHhl+QRn1hwhfgASWeUTV+RBw4EZ7EFUg2XMfXmN
	XXtCurOvwXYqILxId3D5jhGRt7d033IuKYZb3TQtRyyfQVGIKUx3IOR+JFhafu+1POp2
	l2NxgE5nuXUVRTDclut/iwpjdzVZE03p85Pkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p4PzNI/L9btq8WxFSf8qvpKQ+aKNXetG8Tkxi6LgerbSO6yLeIdfFewRI2lemBRBwH
	ekyDSdkDWJynKoYfyJtQwo0QT6TeVI7kAfRPXHP2aN2CmG/SJmjOwscQj0pBtJFt7Muu
	qWia3TFzSGKUoa9/Ra8ypkrkwWtBNlB4jeJi8=
MIME-Version: 1.0
Received: by 10.181.234.13 with SMTP id l13mr1611010bkr.123.1232274598277; 
	Sun, 18 Jan 2009 02:29:58 -0800 (PST)
In-Reply-To: <gkuqet$ncn$1@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<gkuqet$ncn$1@ger.gmane.org>
Date: Sun, 18 Jan 2009 11:29:58 +0100
Message-ID: <d1b08f940901180229o24ce3950l7011c2d98e5ae650@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/14] kexecboot: use custom device table with mmc and event0
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
X-List-Received-Date: Sun, 18 Jan 2009 10:36:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> NACK

I did not want to bloat device_table-minimal too much...
Users were asking for boot from logical partitions so I have to add
the device somehow.
Initially I wanted to add 10 but then I found out:

http://wiki.openmoko.org/wiki/Booting_from_SD

* The device nodes numbering schema provides minor numbers from 1 to 7
(/dev/mmcblk0p1 ... /dev/mmcblk0p7). Minor number 8 is the next
physical device (/dev/mmcblk1). So we're restricted to a maximum of 7
accessible partitions.

Discussing with Yuri we already found an alternative, at least for
kexecboot: parsing '/proc/partitions' in kexecboot code and
dinamically creating the nodes...probably in the next version...

Regards

Andrea


