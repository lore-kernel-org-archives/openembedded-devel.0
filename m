Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M29tg-00036I-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 22:08:48 +0200
Received: by ewy20 with SMTP id 20so1371611ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 13:02:37 -0700 (PDT)
Received: by 10.210.128.10 with SMTP id a10mr3511054ebd.8.1241726557058;
	Thu, 07 May 2009 13:02:37 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm98591eyb.45.2009.05.07.13.02.34
	(version=SSLv3 cipher=RC4-MD5); Thu, 07 May 2009 13:02:36 -0700 (PDT)
Message-ID: <4A033E54.4040905@xora.org.uk>
Date: Thu, 07 May 2009 21:02:28 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A03277B.1090402@cbnco.com>	<1241720835-17998-1-git-send-email-msmith@cbnco.com>	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
In-Reply-To: <c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 20:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello,
>
> On Thu, May 7, 2009 at 8:27 PM, Michael Smith <msmith@cbnco.com> wrote:
>   
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>>
>>  do_install_append() {
>>         install -d ${D}/boot/
>> -       ln -sf ../usr/lib/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
>> +       ln -sf ..${libdir}/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
>>
>>     
>
> Why do we install menu.cfg in ${libdir} anyway?
>
> All desktop distro's I have seen have the menu.lst in /boot/grub/ on the rootfs.
>
> Is this a FHS thing?
>
>   
/boot is on most distros a seperate partition from /. This is to allow
encrypted/lvm based / partitions and the like.

Graeme



