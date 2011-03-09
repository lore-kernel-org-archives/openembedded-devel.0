Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxDEN-00032N-Qq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 07:50:48 +0100
Received: by pvc30 with SMTP id 30so37966pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 22:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HuMOY89yvX550AlUIiq2Ui1qjX+qttdDOCVgYc4T0O0=;
	b=vEjqECPGUFT1fU6LV3bodmbemzapBxeAXq+gQwzxEPbCl7V6V2iMBGVubNyJSdO1L4
	ON1BDzq1C6Q+qN1wem9Jc4XaFxqN9QZlj0KCh7u22FK0ma3IQQkxlU6EILnTXwWOWgVp
	7zov1XfZPba3eLVrb5B++Df+uxNmrqVqsHbvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=R1xwzBf/yQInG/DHZAjl/HRAbX0eRVsWX5EsHes/c3JmBs+C9Y/mfqZIG+mcMJLWfy
	VWqzTGTRlVmf2MAXu37N+gHycAH7NU4B5tkGAWNSVfrXHuLAbco6TyeJr8iKmTomWvJC
	c0HEAMCbSlaQiRXzQGBTSgJcYOAU31K90nAM4=
Received: by 10.142.63.6 with SMTP id l6mr3720827wfa.178.1299652884993;
	Tue, 08 Mar 2011 22:41:24 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p40sm2009807wfc.5.2011.03.08.22.41.22
	(version=SSLv3 cipher=OTHER); Tue, 08 Mar 2011 22:41:23 -0800 (PST)
Message-ID: <4D77210E.8040602@gmail.com>
Date: Tue, 08 Mar 2011 22:41:18 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D756D6B.9020108@mlbassoc.com>
In-Reply-To: <4D756D6B.9020108@mlbassoc.com>
Subject: Re: Can't build gstreamer-ti
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
X-List-Received-Date: Wed, 09 Mar 2011 06:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> | arm-angstrom-linux-gnueabi-libtool: link: warning: library
> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgstbase-0.10.la'
> was moved.
> | /bin/grep:
> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
> No such file or directory
> | /bin/sed: can't read
> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
> No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link:
> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la'
> is not a valid libtool archive
>
> Any ideas how to fix this?

seems libtool is looking in machine sysroot where as it should be 
looking in arch sysroot

could you try adding EXTRA_OECONF += 
"--with-libtool-sysroot=${STAGING_DIR_TARGET}" to corresponding recipe 
and see if that helps ?

-Khem


