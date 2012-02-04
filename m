Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtVRQ-0001A8-9i
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:33:28 +0100
Received: by daln34 with SMTP id n34so658930dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=I3fenQAeMMmzXzHFpWeB7jCrXZsLvQJDeaD/NpYwFIU=;
	b=Qior4kFb9XQn+U0Td12BvdlTfCLXm2BcOIuzEc1+dV3/hUDZTlGgkOrgKe/WRvyGdV
	/AQzVcsXqBZ6I252m7XJG8a4z3CgVOinb426cASUeOXJjsYy0C9u5N6jW7E7jfx+K7n5
	m2p7SCypBGsPcSB0QX1VCiTxuOc3FBaKlsc3k=
Received: by 10.68.232.202 with SMTP id tq10mr22907177pbc.68.1328322329048;
	Fri, 03 Feb 2012 18:25:29 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d1sm354576pbg.13.2012.02.03.18.25.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 18:25:27 -0800 (PST)
Date: Fri, 3 Feb 2012 18:25:23 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120204022523.GE26306@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
	<CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
	<CAPOJ94NwJJYeTm5w-W84u2VL3=Qk0O6X864z5irbR-XGA0fvOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPOJ94NwJJYeTm5w-W84u2VL3=Qk0O6X864z5irbR-XGA0fvOg@mail.gmail.com>
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
X-List-Received-Date: Sat, 04 Feb 2012 02:33:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (03/02/12 20:15), Peter Bigot wrote:
> On Fri, Feb 3, 2012 at 8:00 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
> >>> Which recipes really depend on systemd during build? I know about
> >>> polkit, something else?
> >
> > udisks [1]
> 
> Yeah, but that might be a consequence of udisks depending on polkit.
> It was a libsystemd-login reference in a polkit .la file dependency
> that made me install that patch so I could get udisks to build.


polkit should also become a distro feature FWIW


