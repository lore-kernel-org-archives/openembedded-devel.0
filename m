Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <npavel@mini-box.com>) id 1R6Hcz-0005pY-Vi
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:53:58 +0200
Received: by wyg36 with SMTP id 36so1304424wyg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 00:48:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.229.223 with SMTP id h73mr450091weq.46.1316591319643; Wed,
	21 Sep 2011 00:48:39 -0700 (PDT)
Sender: npavel@mini-box.com
Received: by 10.216.87.141 with HTTP; Wed, 21 Sep 2011 00:48:39 -0700 (PDT)
In-Reply-To: <1316079316.4523.32.camel@mattotaupa>
References: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
	<1316077931-7737-2-git-send-email-npavel@mini-box.com>
	<1316079316.4523.32.camel@mattotaupa>
Date: Wed, 21 Sep 2011 10:48:39 +0300
X-Google-Sender-Auth: lMyeI1hjkQy-NbtlqngDFJ-ncec
Message-ID: <CAL9MRrmhntOUxEK70kewUrLrazazmC5f_51NsMCHOnLzCymWag@mail.gmail.com>
From: Nicu Pavel <npavel@ituner.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] Add linux kernel recipe for picoSAM9G45 board
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
X-List-Received-Date: Wed, 21 Sep 2011 07:53:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

>> +CMDLINE = "mem=128M@0x20000000 mem=128M@0x70000000 console=ttyS0,115200 root=/dev/mmcblk0p2 rw init=/init rootdelay=1 rootwait=1 loglevel=7 androidboot.hardware=picopc"
>
> Is the increased(?) loglevel needed?

Yes we don't get the kernel messages on atmel DBGU serial port console
otherwise.

Thanks,
Nicu Pavel


