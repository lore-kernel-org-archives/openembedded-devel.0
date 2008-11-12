Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1L03pq-0008Bj-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 01:43:54 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id EAAB8401A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2008 20:42:42 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 4402DC1F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2008 22:41:53 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 6F65661005E; Tue, 11 Nov 2008 22:38:03 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <1226054458.7175.3.camel@aquilonia>
	<87mygarid7.fsf@neumann.lab.ossystems.com.br>
	<1226256825.6785.0.camel@aquilonia>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 11 Nov 2008 22:38:03 -0200
In-Reply-To: <1226256825.6785.0.camel@aquilonia> (Graeme Gregory's message of
	"Sun\, 09 Nov 2008 18\:53\:45 +0000")
Message-ID: <874p2d93tg.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 12 Nov 2008 00:43:55 -0000
Content-Type: text/plain; charset=us-ascii

Graeme Gregory <dp@xora.org.uk> writes:

> On Sat, 2008-11-08 at 01:45 -0200, Otavio Salvador wrote:
>
>> I've gave it a try and xserver fails to build here with:
>> 
>> | checking for XLIB... yes
>> | checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
>> | 
>> | No package 'gl' found
>> | 
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> | 
>> | Alternatively, you may set the environment variables GL_CFLAGS
>> | and GL_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> | 
>> | FATAL: oe_runconf failed
>> NOTE: Task failed: /home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/xserver-xorg-1_1.5.1-r0/temp/log.do_configure.21623
>> NOTE: package xserver-xorg-1_1.5.1-r0: task do_configure: failed
>> ERROR: TaskFailed event exception, aborting
>> NOTE: package xserver-xorg-1.5.1: failed
>> 
> Hi, I tried a build from scatch of xserver-xorg, found 2 missing
> dependencies in the tree, but I am unable to repeat this problem.

I fixed it in the branch. It now builds fine in x86. I'd be OK with
the merging of it if noone objects.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


