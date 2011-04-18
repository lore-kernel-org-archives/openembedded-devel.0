Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QBxF3-0004AN-BI
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 00:48:26 +0200
Received: by pxi1 with SMTP id 1so3591023pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=xnMF6S5wuVxXu0e+gLKQJmsqLoGMow9bRn391WHvehE=;
	b=e0dQk02aHxRyFtebsJUMeHtNvTs1JMGcdZ3dTaUcu+xtFo+6KJTrrYzgjCIxdihJ0J
	stpU4NezwukyaGrXoKtDqxfAJGZc0Vr2FNGL9euMXq3YSRLzHcsAr/ZtBqIkUuKdcnya
	2ErrtxId/clawj+b7Ryq+Ppy8teDgAIJ0txPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MnvvZ2QiC+fXFnksrSINfTo8g+yV2RzcSssTZ4QDB+1zYMO71Z/qKCwd84NGOt8E5v
	jUx8kankoHLEJsVmZgw+01MlwzEHjG9YDQuf49p1Y0x1lFFc4Ec197Qrs02c3wDvTymX
	+lNpGVZCceFP2SIxTc9eVcsV3yl7Gpl8RkLVI=
MIME-Version: 1.0
Received: by 10.142.242.18 with SMTP id p18mr2987440wfh.98.1303166762812; Mon,
	18 Apr 2011 15:46:02 -0700 (PDT)
Received: by 10.142.223.2 with HTTP; Mon, 18 Apr 2011 15:46:02 -0700 (PDT)
In-Reply-To: <4DACB16C.6050303@eric-weiss.de>
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa>
	<4DACB16C.6050303@eric-weiss.de>
Date: Tue, 19 Apr 2011 00:46:02 +0200
Message-ID: <BANLkTikp04ZBA_s80vFhvDMH73_jzMZzAw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Mon, 18 Apr 2011 22:48:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 11:47 PM, eric weiss <eric@eric-weiss.de> wrote:
> Try to compile schroedinger_1.0.9 with orc_0.4.10 =A0instead of orc_0.4.1=
2
> seems that the int[8,16,32]_t definitions are gone int orc_0.4.12.
>
> h
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


I compiled it just hacking the orc-stdint.h header like this

http://code.google.com/p/ossbuild/source/browse/trunk/Shared/Build/Windows/=
Win32/include/orc-0.4/orc/orc-stdint.h?r=3D857

Andrea


