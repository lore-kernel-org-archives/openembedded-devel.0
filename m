Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1L0agH-00033t-QN
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 12:48:13 +0100
Received: (qmail invoked by alias); 13 Nov 2008 11:46:09 -0000
Received: from p57BB7BEA.dip.t-dialin.net (EHLO [192.168.2.3]) [87.187.123.234]
	by mail.gmx.net (mp026) with SMTP; 13 Nov 2008 12:46:09 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX18t9LZaFK4t/DKfziLbItH1WRy/Iz0fwcN43dSAWj
	t3WPSudSZ2kPAe
Message-ID: <491C1379.2090404@gmx.de>
Date: Thu, 13 Nov 2008 12:46:01 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
In-Reply-To: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: Issues with the system startup when the IMAGE_TYPE is squashfs
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
X-List-Received-Date: Thu, 13 Nov 2008 11:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Christian Pössinger schrieb:
> Hello,
>
> I'm currently building a rootfs that will be stored in a squashfs
> container. The file is properly created by OpenEmbedded, but I noticed
> some issues:
>
> First of all, when I boot an OE generated rootfs for the first time, a
> file called /etc/volatile.cache will be generated. As of the fact that
> squashfs is read-only this file can't be created.
>
> The second issue comes with the kernel modules. Again, the first system
> startup will create the modules.dep file inside the /lib/modules/$(uname
> -a) directory. But as stated before, this is not possible on a read-only
> filesystem.
>
>   
I did this some time ago: http://bugs.openembedded.net/show_bug.cgi?id=3714
I guess you can do something like this with /etc/volatile.cache too.
> Is there any way within OpenEmbedded to create those files before the
> actual rootfs image is packed?
>
>
> Best regards,
>
> Christian Pössinger
> Software Development
>
> Mixed Mode GmbH
> Lochhamer Schlag 17
> D-82166 Gräfelfing/München
> Tel.        +49 / 89 / 89 86 8-200
> Fax        +49 / 89 / 89 86 8-222
> Mobil        +49 / 172 /
> http://www.mixed-mode.de
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



