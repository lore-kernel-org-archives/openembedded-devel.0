Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RtVaN-0001NU-LP
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:42:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2012 18:34:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="106186702"
Received: from unknown (HELO [10.255.14.217]) ([10.255.14.217])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2012 18:34:44 -0800
Message-ID: <4F2C9944.9050402@linux.intel.com>
Date: Fri, 03 Feb 2012 18:34:44 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
	<CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
	<20120204021817.GB26306@sakrah.homelinux.org>
In-Reply-To: <20120204021817.GB26306@sakrah.homelinux.org>
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
X-List-Received-Date: Sat, 04 Feb 2012 02:42:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/02/12 18:18, Khem Raj wrote:
> On (04/02/12 03:00), Andreas Müller wrote:
>>>> Which recipes really depend on systemd during build? I know about
>>>> polkit, something else?
>
> why not make it a globally selectable ?
> so we can make sure that autoconf does not try to guess
> but we tell it if systemd features should {en|dis}abled
> explicitly and something like virtual/init-manager or something
> since I think it has to coexist with sysvinit or upstart
> whatever one chooses.

We should definitely do this, I've not had enough time to figure out. I 
think it's going to have to be a distro level thing as so far as I can 
tell we need to be able to:
o set the init system
o include certain packages
o potentially enable/disable configure flags

I've not had much opportunity to look into this yet but we need to be 
certain whichever mechanism we enable works for systemd, sysvinit, 
upstart, s6, whatever.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


