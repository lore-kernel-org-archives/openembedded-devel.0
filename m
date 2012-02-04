Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtVKW-0000sh-Tp
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:26:23 +0100
Received: by pbbb4 with SMTP id b4so3015511pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=rL7KB979Tca/hFb1ucEZvhCv+TbFCyn3a9HXRnYQsFQ=;
	b=qXgyFwQNX7uONxRUGz9lAsBQjzljhyqvHKrhx1pNWjclWn/At7Yz7QN21LeI8Yh6vx
	Ebupp/vhLREFU3MTW7mXsncHQXyrSz9CiSWr45tzH0bQQx/Vxd88P2MWGp+IImAzEL29
	ePQbr+cNzBL27HSGe2eGGKFxlkuCGKsHCE6o0=
Received: by 10.68.73.103 with SMTP id k7mr21953514pbv.132.1328321902268;
	Fri, 03 Feb 2012 18:18:22 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id w4sm17312729pbf.4.2012.02.03.18.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 18:18:21 -0800 (PST)
Date: Fri, 3 Feb 2012 18:18:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120204021817.GB26306@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
	<CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 02:26:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (04/02/12 03:00), Andreas Müller wrote:
> >> Which recipes really depend on systemd during build? I know about
> >> polkit, something else?

why not make it a globally selectable ?
so we can make sure that autoconf does not try to guess
but we tell it if systemd features should {en|dis}abled
explicitly and something like virtual/init-manager or something
since I think it has to coexist with sysvinit or upstart
whatever one chooses.


