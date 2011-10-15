Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RF6SQ-0007Y6-Mt for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 17:47:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RF6Mr-0002I3-Bi for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 17:41:45 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 17:41:45 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 17:41:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 15 Oct 2011 17:41:29 +0200
Message-ID: <j7c9jd$lkh$1@dough.gmane.org>
References: <1318690583-15073-1-git-send-email-koen@dominion.thruhere.net>
	<201110151710.21987.schnitzeltony@gmx.de>
	<j7c8p8$fp9$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <j7c8p8$fp9$1@dough.gmane.org>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-xfce] xfce4-settings 4.8.2: change default icon theme to 'gnome'
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
X-List-Received-Date: Sat, 15 Oct 2011 15:47:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-10-11 17:27, Koen Kooi schreef:
> Op 15-10-11 17:10, Andreas Müller schreef:
>> On Saturday, October 15, 2011 04:56:23 PM Koen Kooi wrote:
>>> 'task-xfce4-base' doesn't install the 'Rodent' theme leading to
>>> missing icons. With this patch all icons show up.
>>> 
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ---
> 
> [..]
> 
>>> 
>> One further step to a system working 'out of the box' and saving me
>> time setting up a new image - thanks!
> 
> AFAICS the only further tweak needed is to debug the xfwm4 crash we have 
> been discussing off-list. I'm warming up strace to have a look when I
> get some time :)

It always crashes after the shortcuts:

poll([{fd=5, events=POLLIN}], 1, 25000) = 1 ([{fd=5, revents=POLLIN}])
recvmsg(5, {msg_name(0)=NULL,
msg_iov(1)=[{"l\2\1\1\t\0\0\0\3\0\0\0=\0\0\0\6\1s\0\5\0\0\0:1.17\0\0\0"...,
2048}], msg_controllen=0, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 169
recvmsg(5, 0xbef8d3d4, MSG_CMSG_CLOEXEC) = -1 EAGAIN (Resource temporarily
unavailable)
clock_gettime(CLOCK_MONOTONIC, {4590, 354766862}) = 0
sendmsg(5, {msg_name(0)=NULL,
msg_iov(2)=[{"l\1\0\1&\0\0\0\6\0\0\0x\0\0\0\1\1o\0\20\0\0\0/org/xfc"...,
136}, {"\30\0\0\0xfce4-keyboard-shortcuts\0\0\0\0"..., 38}],
msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = 174
clock_gettime(CLOCK_MONOTONIC, {4590, 370483414}) = 0
poll([{fd=5, events=POLLIN}], 1, 25000) = 1 ([{fd=5, revents=POLLIN}])
recvmsg(5, {msg_name(0)=NULL,
msg_iov(1)=[{"l\2\1\1\231\16\0\0\245\0\0\0005\0\0\0\6\1s\0\5\0\0\0:1.17\0\0\0"...,
2048}], msg_controllen=0, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 2048
recvmsg(5, {msg_name(0)=NULL,
msg_iov(1)=[{"\0\0\0\0\33\0\0\0move_window_workspace_2_"..., 2048}],
msg_controllen=0, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 1761
clock_gettime(CLOCK_MONOTONIC, {4590, 559967057}) = 0
sendmsg(5, {msg_name(0)=NULL,
msg_iov(2)=[{"l\1\0\1V\0\0\0\7\0\0\0q\0\0\0\1\1o\0\20\0\0\0/org/xfc"...,
136}, {"\30\0\0\0xfce4-keyboard-shortcuts\0\0\0\0"..., 86}],
msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = 222
- --- SIGSEGV (Segmentation fault) @ 0 (0) ---
- --- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

But running it a second time always works, so I wonder if it's missing for
file/dir the first time.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOmampMkyGM64RGpERAnLGAJ9G7GtsQIXEQlAz/UnRcG07YWtcNACffRvc
2m+/OaxOFnmVFnMPqvLsNio=
=E/go
-----END PGP SIGNATURE-----



