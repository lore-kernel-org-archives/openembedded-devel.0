Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SX8L8-0001uh-Mi
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 11:58:46 +0200
Received: by bkcjm2 with SMTP id jm2so6188810bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 02:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Z0EUX6XYrMYe+a2wtLEHoocIdOYzedXJ9+6zNP0x+OU=;
	b=hDV28h7Oo4xxZrtU4t7yx8GEcRt7MKMomxHcHSlsloBjS2h0afOwzesygXlgmW4UfD
	VLcWPGu3gof3ZI5f/LZUdh95r9DOyU1tz6D9CvHdB3Vdp829/Yu3lnrtxrGZrzyNVyRa
	OvisiK8kCiryrGAVDRC+wrs+WsxswbjCIYHqwS5SRNs0EMCHaXGMpe0NAg+F1nMPS9ho
	nQuHcme2/o6GkpUE52CxceWTHd8BdIWlC0B1wHOee1Y4m1oqJrctkVnswUv6EXVaNxqX
	z8ywMo/TrNa4A0IUzBzrtnTuVCA75nJro4E1N6cRdC+UJuSAXt6g09IEUENynYJIRVDn
	+VDQ==
Received: by 10.204.128.200 with SMTP id l8mr11503476bks.94.1337766516941;
	Wed, 23 May 2012 02:48:36 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id 9sm36013831bku.9.2012.05.23.02.48.34
	(version=SSLv3 cipher=OTHER); Wed, 23 May 2012 02:48:35 -0700 (PDT)
Message-ID: <4FBCB272.8050906@dresearch-fe.de>
Date: Wed, 23 May 2012 11:48:34 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Monk, Roger" <r-monk@ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
	<CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
In-Reply-To: <CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQnU/ik8oNqGMtqy/xRGGVmaTBfDBvnESdIps0d1B1iV/0tMFGODgMSc4YxJNeyp4xwwkPTq
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ti] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Wed, 23 May 2012 09:58:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roger!

On 18.05.2012 16:55, Thilo Fromm wrote:
>>>>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>>>>>>>> this affects both projects one way or the other.
>>>>>>>>
>>>>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>>>>>>>> This means with oe-core + meta-oe you now can choose between
>>>>>>>> gcc-4.6 and gcc-4.7.
>>>>>>>> However, both compilers break the kernel we're using
>>>>>>>> (ti81xx-psp-linux-2.6.37).
>>>>>>>
>>>> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>>>> a C674x DSP.
>>>
>>> So a centaurus family SoC.
>>
>> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to print the list objects, in particular the mbox->name?
> 
> What are you trying to do? printk-debugging? Via E-Mail? Are you
> serious? I provided a simple procedure to reproduce the issue. Please
> reproduce and fix the problem.

Ping!

Could you reproduce the bug?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


