Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RtMaz-00036Q-Se; Fri, 03 Feb 2012 18:06:45 +0100
Received: by lahc1 with SMTP id c1so1922967lah.6
	for <multiple recipients>; Fri, 03 Feb 2012 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FIeiLq5Gig+E4npv5yjpYusnYXXK7vYPcSvWT5OxGog=;
	b=eppqKq+BMlaN5aw5XED/4UMkDm6sepVEcTGpFCU6IvBizw7ZT58Xk83ALBWUnnEtPO
	MUeAgmeDzHcHr6Fakc0921fwHuvJt/xyXw7cHhTHq3We1aCA1Oii6WUBk88APywDiC6E
	nLdlWla5dGmjSxxZWtc6QEwxB6aduvZxZh6kM=
MIME-Version: 1.0
Received: by 10.152.114.169 with SMTP id jh9mr4099095lab.20.1328288328093;
	Fri, 03 Feb 2012 08:58:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Fri, 3 Feb 2012 08:58:48 -0800 (PST)
In-Reply-To: <20120203154742.GM3893@jama.jama.net>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
Date: Fri, 3 Feb 2012 14:58:48 -0200
X-Google-Sender-Auth: EikuEX7KZ_sL8EdMgUd8RnsFtX8
Message-ID: <CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Fri, 03 Feb 2012 17:06:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 3, 2012 at 13:47, Martin Jansa <martin.jansa@gmail.com> wrote:

> > I understand your use case but it seems in this case you ought to
> override
> > it in a bbappend. It doesn't seems right as this is the exception, not
> the
> > rule. If we don't depends on it, we can end with the binaries being not
> > available in case a rootfs generation.
>
> Which recipes really depend on systemd during build? I know about
> polkit, something else?


At this moment I know about polkit, I didn't check newer udev but I think
it ought to depends on it as well.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

