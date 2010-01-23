Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NYfpi-0001J3-7o
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 14:15:25 +0100
Received: by ewy4 with SMTP id 4so2431213ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OUONzltD9iRemv3dQKtUaCAumuCZFEpJLoDM1toxxpM=;
	b=KO8pnisZH1Z/HISflEFqpAAWYMFEmUd7iZtlNCKuYs0a6llEd2tr0o0Tqp1b20EZ3D
	M1CWYlp7drMcM3Co1btV/hAvq+drW3LsVmUa9zpIdAmM24PS4bltZntNJjuSuriYisgV
	8YSDhfk4KNUHxZOtB1Uh6JRKEwTiaXcOUCqhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=e6jl32NCnA3D4Y46AQqzVN/DZ4De5smDznJuT4bVsZTB8Hl4eT5fbZJILKEXywwggY
	JfK53BQJJYiyXpFuEjLveTw8nPffup8eKjaXMBE4Bk4fmZTe+Hi2DBrPlgsNCoosphwN
	S6f3zFL5pXStOuoYoPnbKkt7argpD8XcXPoiY=
MIME-Version: 1.0
Received: by 10.213.106.199 with SMTP id y7mr2721525ebo.55.1264252383423; Sat, 
	23 Jan 2010 05:13:03 -0800 (PST)
In-Reply-To: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
References: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
Date: Sat, 23 Jan 2010 14:13:03 +0100
Message-ID: <d1b08f941001230513j5c017493s19838533588f33bc@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging fails in do_deploy for kernel
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
X-List-Received-Date: Sat, 23 Jan 2010 13:15:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> I set the DEPLOY_DIR_PSTAGE to outside tmp. (packaged-staging is
> already inherited by default in Angstrom).
Then you incurr in that infamous issue:
http://blog.denix.org/2008/09/getting-even-more-dangerous-with-pstage.html


> Not really an idea how to fix this. Any expert with an opinion?
See above link.

> =A0* Package staging-strace-armv7a-angstrom-linux-gnueabi version
> 4.5.14-r9 has no architecture specified, defaulting to i686-linux.
> which also seem odd to me.
Yes, this leads to subsequent failures during rebuild from pstage.
See e.g. udev and machine-specific staging-packages have wrong arch too.

> That is where I gave up. Suggestions are welcome!
The good news are that RP, kergoth and Tartarus are aware of the issue :)
Still, it seems this is a low-priority task...

Regards

Andrea


