Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2saK-0008Id-SE
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 23:28:37 +0200
Received: by pvg6 with SMTP id 6so1431480pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 14:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=fVrtGCE9whYROGTMG4JUarVK871SX38/09Dpik1Bh7k=;
	b=NY1QMH+fp4V0/gmylnfjNmSRArp/f7Vgb8vEBqvuFqWk5P+JO1SvRd1yJleZLISKkQ
	Ij1oxHPZDu0cknT6a8MLrcZnB5D0g1hbx279wH9OYwv4dU7/B0qVnGaUlGgqs3kEMgf7
	UInU2qJGfTUAWadD/l1j+U/uxRsTNcuxTBUuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qUDRFbl9/fFcP6+BBEGbCmP/4t+stP2bnZoD4buFnWsADYqL/VJlOO4bvUaYhOKnIu
	Fe1sBN8znJIP/Qqqrnf0pILCm+hImnM8UT+ognK8ke2NFqt1/ONA6vHSHTkB3SRodeox
	9vhJr0WX1Uyi757QrC0A2pfiITSyahtwzbCMk=
MIME-Version: 1.0
Received: by 10.142.60.11 with SMTP id i11mr9308531wfa.97.1286227697572; Mon,
	04 Oct 2010 14:28:17 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 14:28:17 -0700 (PDT)
Date: Mon, 4 Oct 2010 14:28:17 -0700
Message-ID: <AANLkTi=7CfOcg=8odi3k95kbMM5qxjNfunqLnLTBxKzs@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Question about check data file clashes
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
X-List-Received-Date: Mon, 04 Oct 2010 21:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am trying to get my image to build and running into a check data
file clash and not sure why or how to fix. It says two packages are
trying to install the same file, so how do you make this get through
and still have both packages installed? Here is the error I got:

| Collected errors:
|  * check_data_file_clashes: Package linux-libc-headers-dev wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/qEnlightDesktop/usr/include/scsi/scsi.h
| 	But that file is already provided by package  * libc6-dev

Thanks for any help on this.

JL


