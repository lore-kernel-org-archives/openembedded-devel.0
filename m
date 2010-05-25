Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel.xntian@gmail.com>) id 1OGrXu-0007mD-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 12:39:38 +0200
Received: by vws20 with SMTP id 20so2986133vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tYnYljEN5qVZ+0T6IhVNPC/C0VG1bJljg1tRFsF/EN4=;
	b=emeUWHdTlmqk6k3mnrlx3+UlGT5j5qGFumwm8nqTUQ4aMEp/ZQPDrAQcUY6j60kASA
	eGMOo2+IZCeeBsTNv3+I2K8NY1S9MYHN67zsUt2UJwNKmLjGFIg/1d8uMHQd4M1+Hlls
	M+gZShm7tK9siO3llR/jUliaLa5HV4NyWS3fA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gnh3Ew+2i37uSo/qzGBE3480+mu6u4uqpZ5Kc5i1jqM/56+L2/f+s8Vl9dJj7TH4ZC
	fHQiLpq+LT+hld57ybHkbhUlViQreBdEV6Xie9lvdHYLlPjDv2A6wRY6aHheMFgjznfR
	vLNk0//5EceMUJ79ZkTnHNR+euUj4bjp7wL+s=
MIME-Version: 1.0
Received: by 10.220.60.136 with SMTP id p8mr4819231vch.270.1274783730531; Tue, 
	25 May 2010 03:35:30 -0700 (PDT)
Received: by 10.220.100.140 with HTTP; Tue, 25 May 2010 03:35:30 -0700 (PDT)
In-Reply-To: <AANLkTin63ATwjRTZm8tEbFXlhCxuUVGCN58hNhoHTKLD@mail.gmail.com>
References: <AANLkTin63ATwjRTZm8tEbFXlhCxuUVGCN58hNhoHTKLD@mail.gmail.com>
Date: Tue, 25 May 2010 18:35:30 +0800
Message-ID: <AANLkTilAmc5ep8oz5DElMuUJXkeclTzGetGmWeaZ5e4n@mail.gmail.com>
From: daniel tian <daniel.xntian@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: daniel.xntian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libglib conflict with other lib packages
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
X-List-Received-Date: Tue, 25 May 2010 10:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi, guys:
=A0 =A0I wanna port ebook reader "fbreader" from OpenEmbedded to poky,
but when installing fbreader package(in my board), several packages
missed. So I copy the libgio-2.0-0, libgobject, libgthread ipk files
to my board. But there are some files has already installed by
libglib. The install processing is not allowed. When i write
--force-overwrite, the rootfs can not be bring up again.
=A0 Here is the error message when install libgthread:

Installing libgthread-2.0-0 (2.24.0-r4.5) to root...
Collected errors:
=A0* check_data_file_clashes: Package libgthread-2.0-0 wants to install
file /usr/lib/libgthread-2.0.so.0
=A0 =A0 =A0 =A0But that file is already provided by package =A0*
check_data_file_clashes: libglib-2.0-0
=A0* opkg_install_cmd: Cannot install package libgthread-2.0-0.

I just wonder whether somebody has already ported the fbreader to
poky, or it is conflicted with other packages, so it's forbidding
area.

Please give some advice, anything is appreciated.
thank you very much.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0daniel


