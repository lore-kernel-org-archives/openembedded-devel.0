Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KyeqB-00032c-4A
	for openembedded-devel@openembedded.org; Sat, 08 Nov 2008 04:50:27 +0100
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 8354F337DC6;
	Sat,  8 Nov 2008 01:48:43 -0200 (BRST)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id C96A2337DC4;
	Sat,  8 Nov 2008 01:48:42 -0200 (BRST)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 8 Nov 2008 01:48:41 -0200
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 2374D8E5F5D;
	Sat,  8 Nov 2008 01:48:48 -0200 (BRST)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id DEA488BA7FC;
	Sat,  8 Nov 2008 01:48:47 -0200 (BRST)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 8 Nov 2008 01:48:47 -0200
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 664BAC329;
	Sat,  8 Nov 2008 01:48:44 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4396A610058; Sat,  8 Nov 2008 01:45:08 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <1226054458.7175.3.camel@aquilonia>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sat, 08 Nov 2008 01:45:08 -0200
In-Reply-To: <1226054458.7175.3.camel@aquilonia> (Graeme Gregory's message of
	"Fri\, 07 Nov 2008 10\:40\:58 +0000")
Message-ID: <87mygarid7.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Xorg X11R7.4 updates
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
X-List-Received-Date: Sat, 08 Nov 2008 03:50:27 -0000
Content-Type: text/plain; charset=us-ascii

Graeme Gregory <dp@xora.org.uk> writes:

> So I would like people with an interest to please review the changes on
> the shared/xorg-7.4-update branch. Especially x86 guys who can actually
> use some of the drivers. Id like to get any problems ironed out now
> ready for merging into OE mainline.

Hello,

I've gave it a try and xserver fails to build here with:

| checking for XLIB... yes
| checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
| 
| No package 'gl' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables GL_CFLAGS
| and GL_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| 
| FATAL: oe_runconf failed
NOTE: Task failed: /home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/xserver-xorg-1_1.5.1-r0/temp/log.do_configure.21623
NOTE: package xserver-xorg-1_1.5.1-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package xserver-xorg-1.5.1: failed

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


