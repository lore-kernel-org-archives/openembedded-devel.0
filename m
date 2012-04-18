Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SKNdC-00048S-Dv
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 07:40:42 +0200
Received: by lagw12 with SMTP id w12so5074449lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 22:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=g/70Pdn9MHIbKLfTz4i2SZrXLOhWlJloL//mCaqUTa8=;
	b=rCJT9UQZx8VuxpsP2JrT+dm49asaBNSBpfQQd4fFRJ6dT/KXDQFuaU7VRcRzyFqhSb
	B9KTQ984pTM9YHF1qifR8pEoailoVY+G2xRRk4W7+bbhxxEp3uIFjUd3/xJL3VLedsuj
	0KP7/0z1pUWwFteXE2entmOdx49VxsuPVn1zJZ5tAqcQwU6Y6yT7ESVuRW6VjJBb7ZSk
	Kl23PfrZblwlB1zTBkVI7w6GGUUJkZiFctDAmU1bGJ5VC+TUAXoVfCgrg1MOIv6Fu9hQ
	ZVWSPoQsuMe1oEooVryJUyyg+W/zR8y0z+Xst6fgCwQoBcMCu3gNCENfzMNEvPiST++j
	gYEQ==
Received: by 10.112.103.202 with SMTP id fy10mr397733lbb.43.1334727075350;
	Tue, 17 Apr 2012 22:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Tue, 17 Apr 2012 22:30:45 -0700 (PDT)
In-Reply-To: <4F8E0CDF.6040401@gmail.com>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com>
	<4F8DCFC4.9010508@gmail.com> <4F8DDDB7.5010605@gmail.com>
	<4F8E0CDF.6040401@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Apr 2012 22:30:45 -0700
Message-ID: <CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Wed, 18 Apr 2012 05:40:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 17, 2012 at 5:37 PM, j <vwyodapink@gmail.com> wrote:
> Well finally caught what I think is the package the segfault kicks on expat.
> Though not sure what I should look for to be able to sort it out but will
> see where I get.
>
> Though I still get the gcc and bash messages in the QA log. If anyone is
> willing to share some info on what or how I can figure out how to find what
> causes the segfault in the recipe or if I am even catching the correct one.
>

you are not giving out enough information. Looking at dmesg is not
going to give much info
if ld segfaults which I assume is cross ld here then the corresponding
recipe should fail
and then you should look in the build of that package and the commands
causing the segfaults
should be in log.do_compile or log.do_install.

Thanks
-Khem


