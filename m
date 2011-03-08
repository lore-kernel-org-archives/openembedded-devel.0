Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anand.sinha85@gmail.com>) id 1Px19u-0006zk-NX
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 18:57:32 +0100
Received: by vws4 with SMTP id 4so5008036vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 09:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KWiYOnvmKuadwV84K01DvXbIknirRwCc2atRourR09k=;
	b=jyGHX7KobMMqZPCmXCK9Pzjjgq4R9eVROgQTCFMgqcQAdjZ2V976KgwqUY02Lqzh9x
	/Gi+P4/jMkdVzTwHmyn2n/IrZXL0iCaFgv2qKtyNChaTC9tHQ0xVk5odXv8fYbWsOQZl
	9cic43VmlW+UL7fKQ4JT95kn024q0u+905zkU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=ob5zQnrRnEU7uJb3eBGaKfu4DpcRjHfk73PTEw096wwoZts/qAM5zCXBpmmdUNaikI
	XCdlqZAITGLPD6nUS2MHsNl5W1l64jIHPsApq5nQRJ6ZKIJBjCedKoA4cBaZyXYxQL0/
	qhCBAx/s7ueYXYoCFBEdWPEdKJWfuVQLUbvo4=
MIME-Version: 1.0
Received: by 10.52.93.166 with SMTP id cv6mr7807328vdb.217.1299606806763; Tue,
	08 Mar 2011 09:53:26 -0800 (PST)
Received: by 10.220.179.141 with HTTP; Tue, 8 Mar 2011 09:53:26 -0800 (PST)
In-Reply-To: <4D766639.4060004@mentor.com>
References: <1299524617-7212-1-git-send-email-tom_rini@mentor.com>
	<AANLkTikS8xArUAz6mGf=uF=aCffOU78AQ07+iB=90N9p@mail.gmail.com>
	<4D766639.4060004@mentor.com>
Date: Tue, 8 Mar 2011 23:23:26 +0530
Message-ID: <AANLkTi=BDha45SShUUGH47YLCcJ5ke8HgcVGKJLN_NsK@mail.gmail.com>
From: Anand Anand <anand.sinha85@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] gettext.bbclass: Drop target gettext from DEPENDS.
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
X-List-Received-Date: Tue, 08 Mar 2011 17:57:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I needed Help in some Openembedded Stuff.Dont know if this is the correct
way to go ahead.Today I was trying to build two kernels for the same
base-image.I took the original recipe image and made a copy of it and made a
few changes like applying patches etc.I also provided the name of the bb
file from the bb file itself.
I also declared the file through a variable virtual/kernel_xyz but bitbake
wont go ahead with it.It fails in the initial steps itself.but if i use the
variable virtual/kernel itself to point to the file everything works fine
but my original kernel wont compile in this case.

Please suggest how to go about it as I want to get both the kernel
images(one being the original and the other patched version).

Thanks and Regards,
Anand

