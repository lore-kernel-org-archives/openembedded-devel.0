Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UPX8b-0008Hh-7u
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 13:55:03 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Tue, 9 Apr 2013
	13:37:37 +0200
X-TM-IMSS-Message-ID: <63e519320004bb3b@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 63e519320004bb3b ;
	Tue, 9 Apr 2013 13:37:40 +0200
Message-ID: <5163FD80.7050807@nedap.com>
Date: Tue, 9 Apr 2013 13:37:36 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5163CC3F.7060009@nedap.com>
In-Reply-To: <5163CC3F.7060009@nedap.com>
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Tue, 09 Apr 2013 11:55:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

adding

angstrom-packagegroup-boot

caused the trouble.


On 04/09/2013 10:07 AM, Jaap de Jong wrote:
> I have this problem that do_rootfs finds.
> Any ideas?
> Thanks!
> Jaap
>
> //
> log_check: There were error messages in the logfile
> log_check: Matched keyword: [Collected errors]
>
> Configuring angstrom-packagegroup-boot.
> Configuring util-linux-losetup.
> Configuring util-linux.
> Configuring sysvinit.
> Collected errors:
>    * extract_archive: Cannot create symlink from ./var/log to
> 'volatile/log': File exists.
>    * extract_archive: Cannot create symlink from ./var/run to
> 'volatile/run': File exists.
> + '[' '!' -z '' ']'
> + package_tryout_install_multilib_ipk
> + multilib_tryout_dirs=
> //
>
> My image.bb contains:
>
> inherit core-image
>
> IMAGE_LOGIN_MANAGER = "tinylogin shadow"
> IMAGE_DEV_MANAGER = ""
> IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
> IMAGE_INITSCRIPTS = "initscripts"
>
> export IMAGE_BASENAME = "${PN}"
>
> IMAGE_FEATURES += " \
>       package-management \
>       debug-tweaks \
> "
>
> IMAGE_INSTALL += " \
>       angstrom-packagegroup-boot \
>       initscripts \
>       busybox-mdev \
>       ca-certificates \
>       dropbear \
>       e2fsprogs-e2fsck \
>       ntp \
>       ntpdate \
>       openssl \
>       rsync \
>       screen \
>       shadow \
>       mtd-utils \
>       util-linux \
>       watchdog \
>       "
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



