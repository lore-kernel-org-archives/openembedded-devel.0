Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1P0F3c-0002Xe-KA
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:51:57 +0200
Received: by fxm8 with SMTP id 8so3088448fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=gpFeS1iLECDWGgnc/CvVYAzLGumuFsowluA0/L963uQ=;
	b=ZQEy972TH2eqpocF2Y0zsq1CUdwMj5IeVwfhkG0paHVy1GkGeXjVBLPsQQkR0JCnG8
	mcTZz1RoRwhqdXJg48X/KMbhpDYK3tUWuoEDwmGm+mHGDM6m0CLdie4lP+4SKGFoLjxl
	qQNaVwoZpg3OEPdk168lyGMJ+wyniklrdInVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=bRmq7uxdCkEkgV2EW53F5yTehavAL1rmWhd4esPRBI87fBiviQ1x4ChUlhbTkZfYmJ
	xwiFh+Ddur0olGpIVxil6wNHNb5eTFEVw0QHAR7wURY0Zpdjp7RUe1tGOrCIsa8OYwAb
	WLxNeRHZNg68FEBYq5JKkOGcp5g2BgNzGhwSk=
MIME-Version: 1.0
Received: by 10.204.98.198 with SMTP id r6mr5437237bkn.51.1285599103212; Mon,
	27 Sep 2010 07:51:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.118.1 with HTTP; Mon, 27 Sep 2010 07:51:43 -0700 (PDT)
In-Reply-To: <201009270739.40204.kwong@wurldtech.com>
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
	<1285434426-17736-2-git-send-email-kwong@wurldtech.com>
	<AANLkTikE+Kqa4OqE50p+_2W1548a1ko40Gb9h8s-NASB@mail.gmail.com>
	<201009270739.40204.kwong@wurldtech.com>
Date: Mon, 27 Sep 2010 11:51:43 -0300
X-Google-Sender-Auth: K7VMt-9AHto3LVshRoLnzjctP-Q
Message-ID: <AANLkTim-horV=L7_EgWHOvXhM0K0bsYKA-wyqrv7rkd2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kelvie Wong <kwong@wurldtech.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/3] initramfs-module-udev: New module
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
X-List-Received-Date: Mon, 27 Sep 2010 14:51:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 27, 2010 at 11:39 AM, Kelvie Wong <kwong@wurldtech.com> wrote:
> This was to let the rest of the boot process start udev, if it wants to.

Right.

> All I need udev for is to populate /dev (specifically, the nodes in /dev/=
disk
> to set the root partition by label, e.g. for USB disk partitions); I don'=
t
> want to leave processes running when doing the chroot, either.

For systems that are going to _use_ udev this looks like wasting CPU
time and IO.

I see your point but I believe it might be an optional behaviour.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 http://projetos.ossystems.com.br


