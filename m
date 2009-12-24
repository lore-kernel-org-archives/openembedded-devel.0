Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNbsQ-0006DJ-Ga
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 01:48:29 +0100
Received: by yxe5 with SMTP id 5so3494981yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 16:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Q2Ino+4bNMGnPsZpUtr2CwJ6quA5czTPS5nVCO8xaBY=;
	b=B5u/nluUP+OtiRLa0Oj7zJ/9Iap8boK4exhQUdTczLStWHvj96NxRoKQ7b9NqVwvZ8
	DFmdk6Gp+NYHqf1THtLXp1sM1roIpHhG8aEno0im5ld6+9cxSznEGTE7t1D7eigN+Mr3
	p3as9AxhuwcOBfKx77upnHnrZuITI4jl+sjOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=yBRpRr/73Vrfq/tuUaLW6m0zjdsZQDcR+VzCW70d4pDIZeyU+6LXnzW2UD2nYKo79d
	slkGIrJSF8TG3c41P2XAbX5lASkuYF0kD1be8SoDs3Z7pBRAythHEFXiq8GV0elNCAbq
	saBifHqULRasgAH2SuAtFCBfBy1Q0tITZGzNQ=
Received: by 10.100.200.16 with SMTP id x16mr13443290anf.103.1261615592634;
	Wed, 23 Dec 2009 16:46:32 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 22sm6753451iwn.8.2009.12.23.16.46.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 16:46:31 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
	<c384c5ea0912230552o1d62883bte754fcc5da4b8d69@mail.gmail.com>
Date: Thu, 24 Dec 2009 08:46:25 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5e23ndnmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <c384c5ea0912230552o1d62883bte754fcc5da4b8d69@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Modify distro/minimal.conf to use glibc and add an eglibc-based minimal distribution
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
X-List-Received-Date: Thu, 24 Dec 2009 00:48:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I reviewed the minimal-uclibc.conf. So I added the minimal-eglibc.conf. =
 =

No, it is not a must.

=E5=9C=A8 Wed, 23 Dec 2009 21:52:23 +0800=EF=BC=8CLeon Woestenberg  =

<leon.woestenberg@gmail.com> =E5=86=99=E9=81=93:

> Hello,
>
> On Tue, Dec 22, 2009 at 3:24 AM, Guo Hongruan <camelguo@gmail.com> wro=
te:
>> 1. conf/distro/minimal-eglibc.conf: add minimal distribution based on=
  =

>> eglibc.
>> 2. conf/distro/minimal.conf: use glibc instead of eglibc
>
> NAK.
>
> OE is not supposed to have a different distribution file name for each=

> for the variants.
>
> Regards,


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


